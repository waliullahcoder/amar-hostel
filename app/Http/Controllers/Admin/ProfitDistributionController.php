<?php

namespace App\Http\Controllers\Admin;

use Carbon\Carbon;
use App\Models\Wallet;
use App\Models\Investor;
use App\Models\InvestMonth;
use Illuminate\Http\Request;
use App\Models\DeliveryList;
use App\Models\InvestorProfit;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Models\AccountTransaction;
use Illuminate\Support\Facades\DB;
use App\Models\InvestorProfitList;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;
use App\Services\ActionButtons\ActionButtons;

class ProfitDistributionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if (!is_null($request->generate)) {
            $title = 'Generate Profit';
            $serial_no = $this->SerialNo();
            $data = [];

            $start_date = date('Y-m-01', strtotime($request->month . '-' . $request->year));
            $end_date = date('Y-m-t', strtotime($request->month . '-' . $request->year));

            $incomes = DeliveryList::whereHas('delivery', function ($q) use ($start_date, $end_date) {
                $q->where('date', '>=', $start_date)->where('date', '<=', $end_date);
            })->sum('subtotal');

            $expenses = AccountTransaction::with('coa')
                ->where('voucher_date', '>=', $start_date)
                ->where('voucher_date', '<=', $end_date)
                ->whereHas('coa.parent', function ($query) {
                    $query->whereIn('head_code', [401, 402, 403, 404]);
                })
                ->sum(DB::raw('debit_amount'));

            $total_profit = $incomes - $expenses;
            $investor_percentage = 40;
            $investor_part = round((($total_profit / 100) * 40));
            $total_share = InvestMonth::whereHas('invest', function ($row) {
                $row->where('calculate', true);
            })->where('invest_month', $start_date)->sum('qty');

            $check_data = InvestorProfit::where('year', $request->year)->where('month', $request->month)->first();
            if (is_null($check_data) && $total_profit > 0 && $total_share > 0) {
                $investors = InvestMonth::with(['investor'])->whereHas('invest', function ($row) {
                    $row->where('calculate', true);
                })->where('month', date('F', strtotime($request->month)))->where('year', $request->year)
                    ->groupBy('investor_id')
                    ->select('*', DB::raw('SUM(qty) as qty'), DB::raw('SUM(amount) as amount'))
                    ->get();
                $per_share_profit = round((($total_profit / 100) * 40) / $total_share);

                foreach ($investors as $investor) {
                    $data[] = [
                        'investor' => $investor->investor,
                        'total_share' => $total_share,
                        'share_qty' => $investor->qty,
                        'profit' => $per_share_profit * $investor->qty,
                    ];
                }
            } else {
                $total_profit = '';
                $investor_percentage = '';
                $investor_part = '';
                $total_share = '';
            }
            return view('admin.profit_distribution.create', compact('title', 'serial_no', 'total_profit', 'investor_percentage', 'investor_part', 'total_share', 'data'));
        }

        if (request()->ajax()) {
            $model = InvestorProfit::with(['list'])->orderBy('id', 'desc');
            $type = request('type');
            if (!empty($type) && $type == 'trash') {
                $model->onlyTrashed();
            }
            $sumValue = number_format($model->sum('amount'));
            return DataTables::eloquent($model)
                ->with('sumValue', $sumValue)
                ->addIndexColumn()
                ->addColumn('checkbox', function ($row) {
                    $checkbox = '<div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input ' . (!empty(request('type')) && request('type') == "trash" ? 'trash_multi_checkbox' : 'multi_checkbox') . '" id="' . $row->id . '" name="multi_checkbox[]" value="' . $row->id . '"><label for="' . $row->id . '" class="custom-control-label"></label></div>';
                    return $checkbox;
                })
                ->addColumn('investors', function ($row) {
                    $investor_ids = $row->list->pluck('investor_id')->toArray();
                    return Investor::whereIn('id', $investor_ids)->pluck('name')->toArray();
                })
                ->addColumn('date', function ($row) {
                    return date('d-m-Y', strtotime(@$row->date));
                })
                ->addColumn('actions', function ($row) {
                    $type = request('type');
                    $data = [
                        'id' => $row->id,
                        'edit' => !empty($type) && $type == 'trash' ? false : true,
                    ];
                    $additionalBtn = '';
                    if (Auth::user()->can('admin.profit-distribute.show')) {
                        $additionalBtn .= '<a class="btn btn-sm border-0 px-10px fs-15 text-white tt btn-print-1" href="' . Route('admin.profit-distribute.show', $row->id) . '" data-bs-toggle="tooltip" data-bs-placement="top" title="View"><i class="fas fa-eye"></i></a>';
                    }
                    if (Auth::user()->can('admin.profit-distribute.print')) {
                        $additionalBtn .= '<a class="btn btn-sm border-0 px-10px fs-15 text-white tt btn-print-2" href="' . Route('admin.profit-distribute.print', $row->id) . '" data-bs-toggle="tooltip" data-bs-placement="top" title="Print"><i class="fas fa-print"></i></a>';
                    }
                    $diposited = $row->list->where('deposited_amount', '>', 0);
                    if (count($diposited) > 0) {
                        return '<div class="btn-group">' . $additionalBtn . '</div>';
                    } else {
                        return ActionButtons::actions($data, $additionalBtn);
                    }
                })
                ->rawColumns(['checkbox', 'actions'])
                ->make(true);
        }

        $title = "Profit Distributions";
        return view('admin.profit_distribution.index', compact('title'));
    }

    public function SerialNo()
    {
        $data = InvestorProfit::withTrashed()->select(['serial_no'])->whereDate('created_at', '>=', date('Y-m-d'))->whereDate('created_at', '<=', date('Y-m-t'))->orderBy('id', 'desc')->first();
        if ($data) {
            $trim = str_replace("PD", '', $data->serial_no);
            $dataPrefix = (int)$trim + 1;
            $SerialNo = "PD" . $dataPrefix;
        } else {
            $SerialNo = "PD" . date('y') . date('m') . '000001';
        }
        return $SerialNo;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        $title = 'Generate Profit';
        $current_time = Carbon::now();
        $serial_no = $this->SerialNo();
        $data = [];
        return view('admin.profit_distribution.create', compact('title', 'current_time', 'serial_no', 'data'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'year' => 'required',
            'month' => 'required',
            'date' => 'required',
            'serial_no' => 'required',
            'investor_id' => 'required',
            'amount' => 'required',
        ]);

        DB::transaction(function () use ($request) {
            $serial_no = $this->SerialNo();
            $data = InvestorProfit::create([
                'serial_no' => $serial_no,
                'year' => $request->year,
                'month' => $request->month,
                'date' =>  date('Y-m-d', strtotime($request->date)),
                'total_profit' => $request->total_profit,
                'investor_percentage' => $request->investor_percentage,
                'total_share' => $request->total_share,
                'amount' => array_sum($request->amount),
                'created_by' => Auth::user()->id,
            ]);

            InvestMonth::whereHas('invest', function ($row) {
                $row->where('calculate', true);
            })->where('invest_month', date('Y-m-01', strtotime($request->month . '-' . $request->year)))->update(['distributed' => 1]);

            foreach ($request->investor_id as $investor_id) {
                InvestorProfitList::create([
                    'investor_profit_id' => $data->id,
                    'investor_id' => $investor_id,
                    'share_qty' => $request->share_qty[$investor_id],
                    'amount' => $request->amount[$investor_id],
                ]);

                Wallet::create([
                    'investor_id' => $investor_id,
                    'investor_profit_id' => $data->id,
                    'date' => date('Y-m-d', strtotime($request->date)),
                    'amount_in' => $request->amount[$investor_id],
                    'type' => 'Profit',
                    'approved' => 1,
                    'created_by' => Auth::user()->id,
                ]);
            }
        });

        return redirect()->route('admin.profit-distribute.index')->withSuccessMessage('Added Successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request, string $id)
    {
        if (!is_null($request->generate)) {
            $generated_data = [];
            $start_date = date('Y-m-01', strtotime($request->month . '-' . $request->year));
            $end_date = date('Y-m-t', strtotime($request->month . '-' . $request->year));

            $incomes = DeliveryList::whereHas('delivery', function ($q) use ($start_date, $end_date) {
                $q->where('date', '>=', $start_date)->where('date', '<=', $end_date);
            })->sum('subtotal');

            $expenses = AccountTransaction::with('coa')
                ->where('voucher_date', '>=', $start_date)
                ->where('voucher_date', '<=', $end_date)
                ->whereHas('coa.parent', function ($query) {
                    $query->whereIn('head_code', [401, 402, 403, 404]);
                })
                ->sum(DB::raw('debit_amount'));

            $total_profit = $incomes - $expenses;
            $investor_percentage = 40;
            $investor_part = round((($total_profit / 100) * 40));
            $total_share = InvestMonth::whereHas('invest', function ($row) {
                $row->where('calculate', true);
            })->where('invest_month', $start_date)->sum('qty');

            $check_data = InvestorProfit::whereNotIn('id', [$id])->where('year', $request->year)->where('month', $request->month)->first();
            if (is_null($check_data) && $total_profit > 0 && $total_share > 0) {
                $investors = InvestMonth::whereHas('invest', function ($row) {
                    $row->where('calculate', true);
                })->with(['investor'])->where('month', date('F', strtotime($request->month)))->where('year', $request->year)
                    ->groupBy('investor_id')
                    ->select('*', DB::raw('SUM(qty) as qty'), DB::raw('SUM(amount) as amount'))
                    ->get();

                $per_share_profit = round((($total_profit / 100) * 40) / $total_share);

                foreach ($investors as $investor) {
                    $data[] = [
                        'investor' => $investor->investor,
                        'total_share' => $total_share,
                        'share_qty' => $investor->qty,
                        'profit' => $per_share_profit * $investor->qty,
                    ];
                }
            } else {
                $total_profit = '';
                $investor_percentage = '';
                $investor_part = '';
                $total_share = '';
            }

            $title = 'Update Profit Distribution';
            $data = InvestorProfit::findOrFail($id);
            return view('admin.profit_distribution.edit', compact('title', 'total_profit', 'investor_percentage', 'investor_part', 'total_share', 'data', 'generated_data'));
        }

        $title = 'View Profit Distribution';
        $data = InvestorProfit::findOrFail($id);
        return view('admin.profit_distribution.view', compact('title', 'data'));
    }

    public function print(Request $request, string $id)
    {
        $data = InvestorProfit::findOrFail($id);
        $report_title = 'Profit Distribution <br> <span class="text-sm">' . $data->month . '-' . $data->year . '</span>';
        // return view('admin.profit_distribution.print', compact('report_title', 'data'));
        $pdf = Pdf::loadView('admin.profit_distribution.print', compact('report_title', 'data'));
        $pdf->setPaper('A4', 'landscape');
        return $pdf->stream('schedule_report_' . date('d_m_Y_h_i_s') . '.pdf');;
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $title = 'Update Profit Distribution';
        $data = InvestorProfit::findOrFail($id);
        $link = Route('admin.profit-distribute.update', $id);
        $generated_data = [];
        return view('admin.profit_distribution.edit', compact('title', 'data', 'link', 'generated_data'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'year' => 'required',
            'month' => 'required',
            'date' => 'required',
            'serial_no' => 'required',
            'investor_id' => 'required',
            'amount' => 'required',
        ]);

        DB::transaction(function () use ($request, $id) {
            $data = InvestorProfit::findOrFail($id);
            InvestMonth::whereHas('invest', function ($row) {
                $row->where('calculate', true);
            })->where('invest_month', date('Y-m-01', strtotime($data->month . '-' . $data->year)))->update(['distributed' => 0]);
            $data->update([
                'year' => $request->year,
                'month' => $request->month,
                'date' =>  date('Y-m-d', strtotime($request->date)),
                'total_profit' => $request->total_profit,
                'investor_percentage' => $request->investor_percentage,
                'total_share' => $request->total_share,
                'amount' => array_sum($request->amount),
                'updated_by' => Auth::user()->id,
            ]);

            InvestMonth::whereHas('invest', function ($row) {
                $row->where('calculate', true);
            })->where('invest_month', date('Y-m-01', strtotime($request->month . '-' . $request->year)))->update(['distributed' => 1]);

            InvestorProfitList::where('investor_profit_id', $id)->delete();
            Wallet::where('investor_profit_id', $id)->forceDelete();
            foreach ($request->investor_id as $investor_id) {
                InvestorProfitList::create([
                    'investor_profit_id' => $id,
                    'investor_id' => $investor_id,
                    'share_qty' => $request->share_qty[$investor_id],
                    'amount' => $request->amount[$investor_id],
                ]);

                Wallet::create([
                    'investor_id' => $investor_id,
                    'investor_profit_id' => $data->id,
                    'date' => date('Y-m-d', strtotime($request->date)),
                    'amount_in' => $request->amount[$investor_id],
                    'type' => 'Profit',
                    'approved' => 1,
                    'created_by' => $data->created_by,
                    'updated_by' => Auth::user()->id,
                ]);
            }
        });

        return redirect()->route('admin.profit-distribute.index')->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // Recovery Deleted Data
        if (request()->has('recovery') && request('recovery') == 'true') {
            $data = InvestorProfit::withTrashed()->findOrFail($id);
            Wallet::withTrashed()->where('investor_profit_id', $id)->restore();
            $data->restore();
            return response()->json(['status' => 'success']);
        }

        if (request()->has('parmanent') && request('parmanent') == 'true') {
            $data = InvestorProfit::withTrashed()->findOrFail($id);
            Wallet::where('investor_profit_id', $id)->forceDelete();
            $data->forceDelete();
            return response()->json(['status' => 'success']);
        }

        $data = InvestorProfit::withTrashed()->findOrFail($id);
        $data->update(['deleted_by' => Auth::user()->id]);
        Wallet::where('investor_profit_id', $id)->update(['deleted_by' => Auth::user()->id]);
        Wallet::where('investor_profit_id', $id)->forceDelete();
        InvestMonth::whereHas('invest', function ($row) {
            $row->where('calculate', true);
        })->where('invest_month', date('Y-m-01', strtotime($data->month . '-' . $data->year)))->update(['distributed' => 0]);
        $data->forceDelete();
        return response()->json(['status' => 'success']);
    }
}
