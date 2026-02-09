<?php

namespace App\Http\Controllers\Admin;

use Carbon\Carbon;
use App\HelperClass;
use App\Models\Wallet;
use App\Models\Invest;
use App\Models\CoaSetup;
use App\Models\Investor;
use App\Models\InvestMonth;
use Illuminate\Http\Request;
use App\Models\InvestRenewList;
use Illuminate\Support\Facades\DB;
use App\Models\AccountTransaction;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\AccountTransactionAuto;
use Yajra\DataTables\Facades\DataTables;
use App\Services\ActionButtons\ActionButtons;

class InvestController extends Controller
{
    public $path;
    public $title;
    public $create_title;
    public $edit_title;
    public $model;
    public function __construct()
    {
        $this->path = 'invest';
        $this->title = 'Invest Process';
        $this->create_title = 'Add invest';
        $this->edit_title = 'Update invest';
        $this->model = Invest::class;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $query = $this->model::with(['investor'])->orderBy('id', 'desc');

            if (request()->has('customFilter')) {
                if (request('customFilter') == 'Closed') {
                    $query->where('sattled', true);
                } else {
                    $query->where('sattled', false);
                }
            }

            $sumQuery = (clone $query);
            $type = request('type');
            if (!empty($type) && $type === 'trash') {
                $sumQuery->onlyTrashed();
            }

            if (request()->filled('search.value')) {
                $search = request()->input('search.value');

                $sumQuery->where(function ($q) use ($search) {
                    // Search in investor.name relation
                    $q->orWhereHas('investor', function ($q2) use ($search) {
                        $q2->where('name', 'like', "%{$search}%");
                    });

                    // Search in payment_type column
                    $q->orWhere('invest_no', 'like', "%{$search}%");

                    // Search in qty column (numeric, so cast to string for like search)
                    $q->orWhere('qty', 'like', "%{$search}%");

                    // Search in amount column (numeric, cast to string for like search)
                    $q->orWhere('amount', 'like', "%{$search}%");
                });
            }

            $totalQty = $sumQuery->sum('qty');
            $totalAmount = $sumQuery->sum('amount');

            $addition_btns = [[
                'parameter' => true,
                'target' => '_self',
                'title' => 'View Invest',
                'route' => "admin.{$this->path}.show",
                'icon' => '<i class="fas fa-eye"></i>',
                'class' => 'btn btn-sm btn-primary mw-fit',
            ]];

            // Get JSON from HelperClass
            $response = HelperClass::resourceDataView($query, null, $addition_btns, $this->path, $this->title, ['sattlements', 'transactions'], 'conditional');

            // Decode, merge totals, then return
            $data = $response->getData(true);
            $data['totalQty'] = $totalQty;
            $data['totalAmount'] = $totalAmount;

            return response()->json($data);
        }

        return view("admin.{$this->path}.index", ['title' => $this->title]);
    }

    public function invoice()
    {
        $first = date('Y-m-01');
        $last = new Carbon('last day of this month');
        $data = $this->model::select(['invest_no'])->where('created_at', '>=', $first)->where('created_at', '<=', $last)->orderBy('id', 'desc')->first();
        if ($data) {
            $trim = str_replace("FDI", '', $data->invest_no);
            $dataPrefix = (int)$trim + 1;
            $invoice = "FDI" . $dataPrefix;
        } else {
            $invoice = "FDI" . date('y') . date('m') . '000001';
        }
        return $invoice;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $title = $this->create_title;
        $invest_no = $this->invoice();
        $cash_heads = CoaSetup::with('parent')->whereHas('parent', function ($query) {
            $query->where('head_name', 'Cash In Hand')->orWhere('head_name', 'Cash In Bank');
        })->get();
        $investors = Investor::where('status', 1)->get();
        return view("admin.{$this->path}.create", compact('title', 'invest_no', 'cash_heads', 'investors'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'investor_id'   => 'required',
            'coa_setup_id'  => 'required',
            'date'  => 'required',
            'qty'   => 'required',
            'amount' => 'required'
        ]);

        DB::transaction(function () use ($request) {
            $invest_no = $this->invoice();
            $data = $this->model::create([
                'investor_id' => $request->investor_id,
                'date' => date('Y-m-d', strtotime($request->date)),
                'invest_no' => $invest_no,
                'qty' => $request->qty,
                'amount' => $request->amount,
                'coa_setup_id' => $request->coa_setup_id,
                'calculate' => $request->calculate,
                'status' => 'Approved',
                'approved' => 1,
                'created_by' => Auth::user()->id,
            ]);

            InvestMonth::create([
                'invest_id' => $data->id,
                'investor_id' => $request->investor_id,
                'date' => date('Y-m-d', strtotime($request->date)),
                'invest_month' => date('Y-m-01', strtotime($request->date)),
                'month' => date('F', strtotime($request->date)),
                'year' => date('Y', strtotime($request->date)),
                'qty' => $request->qty,
                'type' => 'Invest',
                'amount' => $request->amount
            ]);

            Wallet::create([
                'investor_id' => $request->investor_id,
                'invest_id' => $data->id,
                'date' => date('Y-m-d', strtotime($request->date)),
                'amount_in' => $request->amount,
                'type' => 'Invest',
                'approved' => 1,
                'created_by' => Auth::user()->id,
            ]);

            $investor = Investor::findOrFail($request->investor_id);
            if (@$investor->coa) {
                $cash_head = CoaSetup::findOrFail($request->coa_setup_id);
                $headCode = collect([
                    '0' => $cash_head->head_code,
                    '1' => $investor->coa->head_code,
                ]);
                $countHead = count($headCode);

                $debit_amount = collect([
                    '0' => $request->amount,
                    '1' => 0.00
                ]);

                $credit_amount = collect([
                    '0' => 0.00,
                    '1' => $request->amount,
                ]);

                $postData = [];
                for ($i = 0; $i < $countHead; $i++) {
                    $coa = CoaSetup::where('head_code', $headCode[$i])->first();
                    $postData[] = [
                        'voucher_no' => $invest_no,
                        'voucher_type' => "Invest",
                        'voucher_date' => date('Y-m-d', strtotime($request->date)),
                        'coa_setup_id' => $coa->id,
                        'coa_head_code' => $headCode[$i],
                        'narration' => 'Invest against Invest No - ' . $invest_no,
                        'debit_amount' => $debit_amount[$i],
                        'credit_amount' => $credit_amount[$i],
                        'created_by' => Auth::user()->id,
                        'created_at' => Carbon::now(),
                        'updated_at' => Carbon::now()
                    ];
                }
                AccountTransactionAuto::insert($postData);
            }
        });

        return redirect()->route("admin.{$this->path}.index")->withSuccessMessage('Created Successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $data = $this->model::findOrFail($id);
        $title = 'View Invest';
        return view("admin.{$this->path}.view", compact('data', 'title'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $additionalData = [
            'cash_heads' => CoaSetup::with('parent')->whereHas('parent', function ($query) {
                $query->where('head_name', 'Cash In Hand')->orWhere('head_name', 'Cash In Bank');
            })->get(),
            'investors' => Investor::where('status', 1)->get(),
        ];

        return HelperClass::resourceDataEdit($this->model, $id, $this->path, $this->edit_title, $additionalData);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'investor_id' => 'required',
            'coa_setup_id' => 'required',
            'date' => 'required',
            'qty' => 'required',
            'amount' => 'required'
        ]);

        DB::transaction(function () use ($request, $id) {
            $data = $this->model::findOrFail($id);
            $data->update([
                'investor_id' => $request->investor_id,
                'date' => date('Y-m-d', strtotime($request->date)),
                'qty' => $request->qty,
                'amount' => $request->amount,
                'coa_setup_id' => $request->coa_setup_id,
                'calculate' => $request->calculate,
                'created_by' => Auth::user()->id,
            ]);

            $investMonth = InvestMonth::where('invest_id', $id)->first();
            $investMonth->update([
                'investor_id' => $request->investor_id,
                'date' => date('Y-m-d', strtotime($request->date)),
                'invest_month' => date('Y-m-01', strtotime($request->date)),
                'month' => date('F', strtotime($request->date)),
                'year' => date('Y', strtotime($request->date)),
                'qty' => $request->qty,
                'amount' => $request->amount
            ]);

            $wallet = Wallet::where('invest_id', $id)->first();
            if ($wallet) {
                $wallet->update([
                    'investor_id' => $request->investor_id,
                    'date' => date('Y-m-d', strtotime($request->date)),
                    'amount_in' => $request->amount,
                    'updated_by' => Auth::user()->id,
                ]);
            }

            AccountTransactionAuto::where('voucher_type', 'Invest')->where('voucher_no', $data->invest_no)->forceDelete();
            $investor = Investor::findOrFail($request->investor_id);
            if (@$investor->coa) {
                $cash_head = CoaSetup::findOrFail($request->coa_setup_id);
                $headCode = collect([
                    '0' => $cash_head->head_code,
                    '1' => $investor->coa->head_code,
                ]);
                $countHead = count($headCode);

                $debit_amount = collect([
                    '0' => $request->amount,
                    '1' => 0.00
                ]);

                $credit_amount = collect([
                    '0' => 0.00,
                    '1' => $request->amount,
                ]);

                $postData = [];
                for ($i = 0; $i < $countHead; $i++) {
                    $coa = CoaSetup::where('head_code', $headCode[$i])->first();
                    $postData[] = [
                        'voucher_no' => $data->invest_no,
                        'voucher_type' => "Invest",
                        'voucher_date' => date('Y-m-d', strtotime($request->date)),
                        'coa_setup_id' => $coa->id,
                        'coa_head_code' => $headCode[$i],
                        'narration' => 'Invest against Invest No - ' . $data->invest_no,
                        'debit_amount' => $debit_amount[$i],
                        'credit_amount' => $credit_amount[$i],
                        'created_by' => Auth::user()->id,
                        'created_at' => Carbon::now(),
                        'updated_at' => Carbon::now()
                    ];
                }
                AccountTransactionAuto::insert($postData);
            }
        });

        return redirect()->route("admin.{$this->path}.index")->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // Recovery Deleted Data
        if (request()->has('recovery') && request('recovery') == 'true') {
            $data = $this->model::onlyTrashed()->findOrFail($id);
            $wallet = Wallet::onlyTrashed()->where('invest_id', $id)->first();
            if ($wallet) {
                $wallet->restore();
            }
            AccountTransactionAuto::where('voucher_no', $data->invest_no)->where('voucher_type', 'Invest')->restore();
            $data->restore();
            return response()->json(['status' => 'success']);
        }

        // Delete Single Item Permanent
        if (request()->has('parmanent') && request('parmanent') == 'true') {
            $data = $this->model::onlyTrashed()->findOrFail($id);
            $wallet = Wallet::onlyTrashed()->where('invest_id', $id)->first();
            if ($wallet) {
                $wallet->forceDelete();
            }
            AccountTransactionAuto::where('voucher_no', $data->invest_no)->where('voucher_type', 'Invest')->forceDelete();
            $data->forceDelete();
            return response()->json(['status' => 'success']);
        }

        // Delete Single Item
        $data = $this->model::findOrFail($id);
        $wallet = Wallet::where('invest_id', $id)->first();
        if ($wallet) {
            $wallet->update(['deleted_by' => Auth::user()->id]);
            $wallet->delete();
        }
        AccountTransactionAuto::where('voucher_no', $data->invest_no)->where('voucher_type', 'Invest')->delete();
        $data->update(['deleted_by' => Auth::user()->id]);
        $data->delete();

        return response()->json(['status' => 'success']);
    }
}
