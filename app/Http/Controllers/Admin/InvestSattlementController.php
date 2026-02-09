<?php

namespace App\Http\Controllers\Admin;

use App\HelperClass;
use App\Http\Controllers\Controller;
use App\Models\AccountTransaction;
use App\Models\AccountTransactionAuto;
use App\Models\CoaSetup;
use App\Models\Invest;
use App\Models\Investor;
use App\Models\InvestSattlement;
use App\Models\InvestSattlementList;
use App\Models\Wallet;
use App\Services\ActionButtons\ActionButtons;
use Carbon\Carbon;
use DataTables;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class InvestSattlementController extends Controller
{
    public $path;
    public $title;
    public $create_title;
    public $edit_title;
    public $model;
    public function __construct()
    {
        $this->path = 'invest-sattlement';
        $this->title = 'Invest Sattlement';
        $this->create_title = 'Add Sattlement';
        $this->edit_title = 'Update Sattlement';
        $this->model = InvestSattlement::class;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $model = $this->model::with(['investor'])->orderBy('id', 'desc');
            $type = request('type');
            if (!empty($type) && $type == 'trash') {
                $model->onlyTrashed();
            }
            $sumValue = number_format($model->sum('amount'));
            return DataTables::eloquent($model)
                ->with('sumValue', $sumValue)
                ->addIndexColumn()
                ->addColumn('date', function ($row) {
                    return date('d-m-Y', strtotime($row->date));
                })
                ->addColumn('actions', function ($row) {
                    $type = request('type');
                    $data = [
                        'id' => $row->id,
                        'edit' => !empty($type) && $type == 'trash' ? false : true,
                    ];
                    $transaction  = AccountTransaction::where('voucher_no', $row->sattlement_no)
                        ->where('credit_amount', '>', 0)
                        ->where('voucher_type', 'Invest Sattlement')
                        ->first();
                    $addiotional_buttons = '<a class="btn btn-sm border-0 px-10px btn-primary mw-fit text-white tt" href="' . Route('admin.invest-sattlement.show', $row->id) . '" style="min-height: 28px;" data-bs-toggle="tooltip" data-bs-placement="top" title="View"><i class="fas fa-eye"></i></a>';
                    if (is_null($transaction)) {
                        return ActionButtons::actions($data, $addiotional_buttons);
                    }
                    return $addiotional_buttons;
                })
                ->rawColumns(['checkbox', 'actions'])
                ->make(true);
        }

        return view("admin.{$this->path}.index", ['title' => $this->title]);
    }

    public function sattlementNo()
    {
        $first = date('Y-m-01');
        $last = new Carbon('last day of this month');
        $data = $this->model::select(['sattlement_no'])->where('created_at', '>=', $first)->where('created_at', '<=', $last)->orderBy('id', 'desc')->first();
        if ($data) {
            $trim = str_replace("FDIS", '', $data->sattlement_no);
            $dataPrefix = (int)$trim + 1;
            $sattlement_no = "FDIS" . $dataPrefix;
        } else {
            $sattlement_no = "FDIS" . date('y') . date('m') . '001';
        }
        return $sattlement_no;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        if ($request->ajax()) {
            $invests = Invest::where('investor_id', $request->investor_id)->where('sattled', 0)->get();
            return response()->json(['status' => 'success', 'balance' => number_format($invests->sum('amount')), 'invests' => $invests]);
        }

        $title = $this->create_title;
        $sattlement_no = $this->sattlementNo();
        $cash_heads = CoaSetup::with('parent')->whereHas('parent', function ($query) {
            $query->where('head_name', 'Cash In Hand')->orWhere('head_name', 'Cash In Bank');
        })->get();
        $investors = Investor::whereHas('invests', function ($query) {
            $query->where('sattled', 0);
        })->where('status', 1)->get();
        return view("admin.{$this->path}.create", compact('title', 'sattlement_no', 'cash_heads', 'investors'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'investor_id' => 'required',
            'coa_setup_id' => 'required',
            'date' => 'required',
            'sattlement_no' => 'required',
            'invest_id' => 'required'
        ]);

        DB::transaction(function () use ($request) {
            $sattlement_no = $this->sattlementNo();
            $data = $this->model::create([
                'investor_id' => $request->investor_id,
                'sattlement_no' => $sattlement_no,
                'date' => date('Y-m-d', strtotime($request->date)),
                'qty' => array_sum($request->qty),
                'amount' => array_sum($request->amount),
                'payment_type' => $request->payment_type,
                'coa_setup_id' => $request->coa_setup_id,
                'remarks' => $request->remarks,
                'status' => 'Approved',
                'approved' => 1,
                'created_by' => Auth::user()->id,
            ]);

            Wallet::create([
                'investor_id' => $request->investor_id,
                'sattlement_id' => $data->id,
                'date' => date('Y-m-d', strtotime($request->date)),
                'amount_out' => array_sum($request->amount),
                'type' => 'Sattlement',
                'approved' => 1,
                'created_by' => Auth::user()->id,
            ]);

            foreach ($request->invest_id as $invest_id) {
                InvestSattlementList::create([
                    'invest_sattlement_id' => $data->id,
                    'invest_id' => $invest_id,
                    'qty' => $request->qty[$invest_id],
                    'amount' => $request->amount[$invest_id],
                ]);
                $invest = Invest::findOrFail($invest_id);
                $invest->update(['sattled' => 1]);
            }

            $investor = Investor::findOrFail($request->investor_id);
            if (@$investor->coa) {
                $cash_head = CoaSetup::findOrFail($request->coa_setup_id);
                $headCode = collect([
                    '0' => $investor->coa->head_code,
                    '1' => $cash_head->head_code,
                ]);
                $countHead = count($headCode);

                $debit_amount = collect([
                    '0' => array_sum($request->amount),
                    '1' => 0.00
                ]);

                $credit_amount = collect([
                    '0' => 0.00,
                    '1' => array_sum($request->amount),
                ]);

                $postData = [];
                for ($i = 0; $i < $countHead; $i++) {
                    $coa = CoaSetup::where('head_code', $headCode[$i])->first();
                    $postData[] = [
                        'voucher_no' => $sattlement_no,
                        'voucher_type' => "Invest Sattlement",
                        'voucher_date' => date('Y-m-d', strtotime($request->date)),
                        'coa_setup_id' => $coa->id,
                        'coa_head_code' => $headCode[$i],
                        'narration' => 'Invest Sattlement against Invest No - ' . $sattlement_no,
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
        $title = 'View Invest Sattlement';
        return view("admin.{$this->path}.view", compact('data', 'title'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, string $id)
    {
        if ($request->ajax()) {
            $data = $this->model::findOrFail($id);
            $old_ids = [];
            $query = Invest::where('investor_id', $request->investor_id)->where('sattled', 0);
            if ($data->investor_id == $request->investor_id) {
                $old_ids = $data->list->pluck('invest_id')->toArray();
                $query->orWhereIn('id', $data->list->pluck('invest_id')->toArray());
            }
            $invests = $query->get();
            return response()->json(['status' => 'success', 'balance' => number_format($invests->sum('amount')), 'invests' => $invests, 'old_ids' => $old_ids]);
        }

        $data = $this->model::findOrFail($id);
        $additionalData = [
            'cash_heads' => CoaSetup::with('parent')->whereHas('parent', function ($query) {
                $query->where('head_name', 'Cash In Hand')->orWhere('head_name', 'Cash In Bank');
            })->get(),
            'investors' => Investor::whereHas('invests', function ($query) use ($data) {
                $query->where('sattled', 0)->orWhere('investor_id', $data->investor_id);
            })->where('status', 1)->get(),
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
            'sattlement_no' => 'required',
            'invest_id' => 'required'
        ]);

        DB::transaction(function () use ($request, $id) {
            $data = $this->model::findOrFail($id);
            $data->update([
                'investor_id' => $request->investor_id,
                'date' => date('Y-m-d', strtotime($request->date)),
                'qty' => array_sum($request->qty),
                'amount' => array_sum($request->amount),
                'payment_type' => $request->payment_type,
                'coa_setup_id' => $request->coa_setup_id,
                'remarks' => $request->remarks,
                'status' => 'Approved',
                'approved' => 1,
                'created_by' => Auth::user()->id,
            ]);

            $wallet = Wallet::where('sattlement_id', $id)->first();
            if ($wallet) {
                $wallet->update([
                    'investor_id' => $request->investor_id,
                    'date' => date('Y-m-d', strtotime($request->date)),
                    'amount_out' => array_sum($request->amount),
                    'updated_by' => Auth::user()->id,
                ]);
            }

            Invest::whereIn('id', $data->list->pluck('invest_id')->toArray())->update(['sattled' => 0]);
            InvestSattlementList::where('invest_sattlement_id', $id)->delete();
            foreach ($request->invest_id as $invest_id) {
                InvestSattlementList::create([
                    'invest_sattlement_id' => $data->id,
                    'invest_id' => $invest_id,
                    'qty' => $request->qty[$invest_id],
                    'amount' => $request->amount[$invest_id],
                ]);
                $invest = Invest::findOrFail($invest_id);
                $invest->update(['sattled' => 1]);
            }

            AccountTransactionAuto::where('voucher_no', $data->sattlement_no)->where('voucher_type', 'Invest Sattlement')->forceDelete();
            $investor = Investor::findOrFail($request->investor_id);
            if (@$investor->coa) {
                $cash_head = CoaSetup::findOrFail($request->coa_setup_id);
                $headCode = collect([
                    '0' => $investor->coa->head_code,
                    '1' => $cash_head->head_code,
                ]);
                $countHead = count($headCode);

                $debit_amount = collect([
                    '0' => array_sum($request->amount),
                    '1' => 0.00
                ]);

                $credit_amount = collect([
                    '0' => 0.00,
                    '1' => array_sum($request->amount),
                ]);

                $postData = [];
                for ($i = 0; $i < $countHead; $i++) {
                    $coa = CoaSetup::where('head_code', $headCode[$i])->first();
                    $postData[] = [
                        'voucher_no' => $data->sattlement_no,
                        'voucher_type' => "Invest Sattlement",
                        'voucher_date' => date('Y-m-d', strtotime($request->date)),
                        'coa_setup_id' => $coa->id,
                        'coa_head_code' => $headCode[$i],
                        'narration' => 'Invest Sattlement against Invest No - ' . $data->sattlement_no,
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
        DB::transaction(function () use ($id) {
            $data = $this->model::findOrFail($id);
            Wallet::where('sattlement_id', $id)->forceDelete();
            Invest::whereIn('id', $data->list->pluck('invest_id')->toArray())->update(['sattled' => 0]);
            AccountTransactionAuto::where('voucher_no', $data->sattlement_no)->where('voucher_type', 'Invest Sattlement')->forceDelete();
            $data->forceDelete();
        });

        return response()->json(['status' => 'success']);
    }
}
