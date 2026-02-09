<?php

namespace App\Http\Controllers\Admin;

use App\Models\Area;
use App\Models\User;
use App\Models\CoaSetup;
use App\Models\Customer;
use App\Models\TrialBalance;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\DB;
use App\Models\AccountTransaction;
use App\DataTables\CoaListDataTable;
use App\Http\Controllers\Controller;
use App\Models\CustomerBookings;
use App\Models\CustomerDeliveries;
use App\Models\CustomerCollections;
use Yajra\DataTables\Facades\DataTables;
use App\DataTables\voucherListDataTable;
use App\DataTables\InvestReportDataTable;
use App\DataTables\CollectionSheetDataTable;
use App\DataTables\CustomerOutstandingDataTable;
use App\DataTables\AreaWiseOrderStatementDataTable;
use App\DataTables\CustomerWiseOrderStatementDataTable;
use App\Models\Delivery;
use App\Models\Investor;
use App\Models\InvestMonth;
use App\Models\DeliveryList;
use App\Models\Wallet;
use Carbon\Carbon;
use Carbon\CarbonPeriod;
use DateInterval;
use DatePeriod;
use DateTime;
use Illuminate\Support\Facades\Auth;

class ReportController extends Controller
{
    public function monthlySummary(Request $request)
    {
        if ($request->ajax() && $request->has('get_customers')) {
            $customers = Customer::whereHas('assign', function ($query) use ($request) {
                $query->where('user_id', $request->user_id);
            })->where('status', 1)->orderBy('name', 'asc')->get();
            return response()->json(['status' => 'success', 'customers' => $customers]);
        }

        if ($request->ajax()) {
            $model = Customer::with(['assign', 'viewDeliveries']);
            if ($request->user_id) {
                $model->whereHas('assign', function ($q) use ($request) {
                    $q->where('user_id', $request->user_id);
                });
            }
            if ($request->customer_id) {
                $model->whereIn('id', $request->customer_id);
            }
            $model->where('status', 1)->orderBy('name', 'asc');

            $year = request('year') ?? date('Y');
            $month = request('month') ?? date('m');

            return DataTables::eloquent($model)
                ->addIndexColumn()
                ->addColumn('total', function ($row) use ($year, $month) {
                    $start_date = date('Y-m-d', strtotime($year . '-' . $month . '-01'));
                    $end_date = date('Y-m-t', strtotime($year . '-' . $month));
                    $total = $row->viewDeliveries->where('date', '>=', $start_date)->where('date', '<=', $end_date)->sum('qty');
                    return $total > 0 ? $total : '-';
                })
                ->addColumn('due_qty', function ($row) use ($year, $month) {
                    $start_date = date('Y-m-d', strtotime($year . '-' . $month . '-01'));
                    $end_date = date('Y-m-t', strtotime($year . '-' . $month));
                    $total = $row->viewDeliveries->where('collected', 0)->where('date', '>=', $start_date)->where('date', '<=', $end_date)->sum('qty');
                    return $total > 0 ? $total : '-';
                })
                ->addColumn('due_amount', function ($row) use ($year, $month) {
                    $start_date = date('Y-m-d', strtotime($year . '-' . $month . '-01'));
                    $end_date = date('Y-m-t', strtotime($year . '-' . $month));
                    $total = $row->viewDeliveries->where('collected', 0)->where('date', '>=', $start_date)->where('date', '<=', $end_date)->sum('subtotal');
                    return $total > 0 ? $total : '-';
                })
                ->addColumn('day_1', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-01';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_2', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-02';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_3', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-03';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_4', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-04';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_5', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-05';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_6', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-06';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_7', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-07';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_8', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-08';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_9', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-09';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_10', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-10';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_11', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-11';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_12', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-12';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_13', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-13';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_14', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-14';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_15', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-15';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_16', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-16';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_17', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-17';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_17', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-17';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_18', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-18';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_19', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-19';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_20', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-20';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_21', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-21';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_22', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-22';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_23', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-23';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_24', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-24';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_25', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-25';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_26', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-26';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_27', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-27';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_28', function ($row) use ($year, $month) {
                    $string = '<div class="day_wrap">';
                    $date = $year . '-' . $month . '-28';
                    $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-warning">' . $total . '</span>' : '<span class="bg-warning">-</span>';

                    $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-success">' . $total . '</span>' : '<span class="bg-success">-</span>';

                    $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                    $string .= $total > 0 ? '<span class="bg-danger">' . $total . '</span>' : '<span class="bg-danger">-</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_29', function ($row) use ($year, $month) {
                    $date = date('Y-m-d', strtotime($year . '-' . $month . '-29'));
                    $string = '<div class="day_wrap">';
                    if ($date == $year . '-' . $month . '-29') {
                        $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                        $total = $total > 0 ? $total : '-';
                    } else {
                        $total = '-';
                    }
                    $string .= '<span class="bg-warning">' . $total . '</span>';

                    if ($date == $year . '-' . $month . '-29') {
                        $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                        $total = $total > 0 ? $total : '-';
                    } else {
                        $total = '-';
                    }
                    $string .= '<span class="bg-success">' . $total . '</span>';

                    if ($date == $year . '-' . $month . '-29') {
                        $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                        $total = $total > 0 ? $total : '-';
                    } else {
                        $total = '-';
                    }
                    $string .= '<span class="bg-danger">' . $total . '</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_30', function ($row) use ($year, $month) {
                    $date = date('Y-m-d', strtotime($year . '-' . $month . '-30'));
                    $string = '<div class="day_wrap">';
                    if ($date == $year . '-' . $month . '-30') {
                        $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                        $total = $total > 0 ? $total : '-';
                    } else {
                        $total = '-';
                    }
                    $string .= '<span class="bg-warning">' . $total . '</span>';

                    if ($date == $year . '-' . $month . '-30') {
                        $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                        $total = $total > 0 ? $total : '-';
                    } else {
                        $total = '-';
                    }
                    $string .= '<span class="bg-success">' . $total . '</span>';

                    if ($date == $year . '-' . $month . '-30') {
                        $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                        $total = $total > 0 ? $total : '-';
                    } else {
                        $total = '-';
                    }
                    $string .= '<span class="bg-danger">' . $total . '</span>';
                    return $string .= '</div>';
                })
                ->addColumn('day_31', function ($row) use ($year, $month) {
                    $date = date('Y-m-d', strtotime($year . '-' . $month . '-31'));
                    $string = '<div class="day_wrap">';
                    if ($date == $year . '-' . $month . '-31') {
                        $total = $row->viewDeliveries->where('date', $date)->sum('qty');
                        $total = $total > 0 ? $total : '-';
                    } else {
                        $total = '-';
                    }
                    $string .= '<span class="bg-warning">' . $total . '</span>';

                    if ($date == $year . '-' . $month . '-31') {
                        $total = $row->viewDeliveries->where('collected', 1)->where('date', $date)->sum('qty');
                        $total = $total > 0 ? $total : '-';
                    } else {
                        $total = '-';
                    }
                    $string .= '<span class="bg-success">' . $total . '</span>';

                    if ($date == $year . '-' . $month . '-31') {
                        $total = $row->viewDeliveries->where('collected', 0)->where('date', $date)->sum('qty');
                        $total = $total > 0 ? $total : '-';
                    } else {
                        $total = '-';
                    }
                    $string .= '<span class="bg-danger">' . $total . '</span>';
                    return $string .= '</div>';
                })
                ->rawColumns(['day_1', 'day_2', 'day_3', 'day_4', 'day_5', 'day_6', 'day_7', 'day_8', 'day_9', 'day_10', 'day_11', 'day_12', 'day_13', 'day_14', 'day_15', 'day_16', 'day_17', 'day_18', 'day_19', 'day_20', 'day_21', 'day_22', 'day_23', 'day_24', 'day_25', 'day_26', 'day_27', 'day_28', 'day_29', 'day_30', 'day_31'])
                ->make(true);
        }

        $title = 'Monthly Summary';
        $staffs = User::where('role', 1)->whereHas('roles', function ($q) {
            $q->where('name', 'Staff');
        })->orderBy('name', 'asc')->get();
        return view('admin.reports.monthly_summary.index', compact('title', 'staffs'));
    }

    public function monthlyStatement(Request $request)
    {
        $end_date = date('Y-m-t', strtotime(request('year') ?? date('Y') . '-' . (request('month') ?? date('m'))));
        $query = CustomerBookings::where('date', '<=', $end_date);
        if ($request->customer_id) {
            $query->where('customer_id', $request->customer_id);
        }
        $bookings = $query->get();
        $query = CustomerDeliveries::where('date', '<=', $end_date);
        if ($request->customer_id) {
            $query->where('customer_id', $request->customer_id);
        }
        $deliveries = $query->get();
        if (!is_null($request->print)) {
            $report_title = 'Monthly Statement Of <br> <span class="text-sm">' . date('F', strtotime(request('year') ?? date('Y') . '-' . request('month') ?? date('m'))) . ' Month ' . (request('year') ?? date('Y')) . ' Year</span>';
            $pdf = Pdf::loadView('admin.reports.monthly_statement.print', compact('report_title', 'bookings', 'deliveries'));
            $pdf->setPaper('A4', 'potrait');
            return $pdf->stream('monthly_statement_' . date('d_m_Y_h_i_s') . '.pdf');
        }
        $title = 'Monthly Statement';
        $customers = Customer::where('status', 1)->orderBy('name', 'asc')->get();
        return view('admin.reports.monthly_statement.index', compact('title', 'bookings', 'deliveries', 'customers'));
    }

    public function areaWiseOrderStatement(Request $request, AreaWiseOrderStatementDataTable $dataTable)
    {
        if (!is_null($request->print)) {
            $query = Area::query();
            if (request('area_id')) {
                $query->whereIn('id', request('area_id'));
            }
            $data = $query->where('status', 1)->orderBy('name', 'asc')->get();
            $report_title = 'Area Wise Order Statement <br> <span class="text-sm">Month - ' . date('F', strtotime(request('year') . '-' . request('month') . '-01')) . ', Year - ' . date('Y', strtotime(request('year'))) . '</span>';
            $pdf = Pdf::loadView('admin.reports.area_wise_order_statement.print', compact('report_title', 'data'));
            $pdf->setPaper('A2', 'potrait');
            return $pdf->stream('area_wise_order_statement_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Area Wise Order Statement';
        $areas = Area::where('status', 1)->orderBy('name', 'asc')->get();
        return $dataTable->render('admin.reports.area_wise_order_statement.index', compact('title', 'areas'));
    }

    public function customerWiseOrderStatement(Request $request, CustomerWiseOrderStatementDataTable $dataTable)
    {
        if (!is_null($request->print)) {
            $query = Customer::query();
            if (request('customer_id')) {
                $query->whereIn('id', request('customer_id'));
            }
            $data = $query->where('status', 1)->orderBy('name', 'asc')->get();
            $report_title = 'Customer Wise Order Statement <br> <span class="text-sm">Month - ' . date('F', strtotime(request('year') . '-' . request('month') . '-01')) . ', Year - ' . date('Y', strtotime(request('year'))) . '</span>';
            $pdf = Pdf::loadView('admin.reports.customer_wise_order_statement.print', compact('report_title', 'data'));
            $pdf->setPaper('A2', 'potrait');
            return $pdf->stream('customer_wise_order_statement_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Customer Wise Order Statement';
        $customers = Customer::where('status', 1)->orderBy('name', 'asc')->get();
        return $dataTable->render('admin.reports.customer_wise_order_statement.index', compact('title', 'customers'));
    }

    public function customerOutstanding(Request $request, CustomerOutstandingDataTable $dataTable)
    {
        $start_date = date('Y-m-d', strtotime(request('year') ?? date('Y') . '-' . (request('month') ?? date('m')) . '-01'));
        $end_date = date('Y-m-t', strtotime(request('year') ?? date('Y') . '-' . (request('month') ?? date('m'))));
        if (!is_null($request->print)) {
            $query = Customer::with('area')->whereHas('viewDeliveries', function ($q) {
                $month = request('month') ?? date('m');
                $year = request('year') ?? $year = date('Y');
                $end_date = date('Y-m-t', strtotime($year . '-' . $month . '-28'));
                $q->where('collected', 0)->where('date', '<=', $end_date);
            });
            if (request('customer_id')) {
                $query->whereIn('id', request('customer_id'));
            }
            $data = $query->where('status', 1)->orderBy('name', 'asc')->get();
            $report_title = 'Customer Outstanding <br> <span class="text-sm">Month - ' . date('F', strtotime(request('year') . '-' . request('month') . '-01')) . ', Year - ' . date('Y', strtotime(request('year'))) . '</span>';
            $pdf = Pdf::loadView('admin.reports.customer_outstanding.print', compact('report_title', 'data'));
            $pdf->setPaper('A2', 'potrait');
            return $pdf->stream('customer_outstanding_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Monthly Summary';
        $customers = Customer::where('status', 1)->orderBy('name', 'asc')->get();
        return $dataTable->render('admin.reports.customer_outstanding.index', compact('title', 'customers'));
    }

    public function collectionSheet(Request $request, CollectionSheetDataTable $dataTable)
    {
        $start_date = date('Y-m-d', strtotime(request('year') ?? date('Y') . '-' . (request('month') ?? date('m')) . '-01'));
        $end_date = date('Y-m-t', strtotime(request('year') ?? date('Y') . '-' . (request('month') ?? date('m'))));
        if (!is_null($request->print)) {
            $query = CustomerCollections::with('area');
            $month = request('month') ?? date('m');
            $year = request('year') ?? $year = date('Y');
            $start_date = date('Y-m-d', strtotime($year . '-' . $month . '-01'));
            $end_date = date('Y-m-t', strtotime($year . '-' . $month));
            $query->where('date', '>=', $start_date)->where('date', '<=', $end_date);
            $data = $query->where('status', 1)->orderBy('name', 'asc')->get();

            $report_title = 'Monthly Collection Sheet <br> <span class="text-sm">Month - ' . date('F', strtotime(request('year') . '-' . request('month') . '-01')) . ', Year - ' . date('Y', strtotime(request('year'))) . '</span>';
            $pdf = Pdf::loadView('admin.reports.collection_sheet.print', compact('report_title', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('collection_sheet_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Monthly Collection Sheet';
        return $dataTable->render('admin.reports.collection_sheet.index', compact('title'));
    }

    public function investorStatement(Request $request)
    {
        $previous_balance = 0;
        $data = [];
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');

        if ($request->has('filter')) {
            $previous_balance = Wallet::where('investor_id', $request->investor_id)->where('date', '<', $start_date)->sum(DB::raw('amount_in - amount_out'));
            $data = Wallet::where('investor_id', $request->investor_id)->where('date', '>=', $start_date)->where('date', '<=', $end_date)->where('approved', 1)->get();
        }

        if (!is_null($request->print)) {
            $investor = Investor::findOrFail($request->investor_id);
            $report_title = 'Investor Statement of - ' . $investor->name;
            $pdf = Pdf::loadView('admin.reports.investor_statement.print', compact('report_title', 'previous_balance', 'data'));
            return $pdf->stream('investor_statement_' . date('d_m_Y_H_i_s') . '.pdf');
        }

        $title = 'Investor Statement';
        $filter_link = Route('admin.investor-statement.index');
        if (Auth::user()->hasRole('Investor')) {
            $investors = Investor::where('id', Auth::user()->investor->id)->where('status', 1)->get();
        } else {
            $investors = Investor::where('status', 1)->get();
        }
        return view('admin.reports.investor_statement.index', compact('title', 'filter_link', 'start_date', 'end_date', 'investors', 'previous_balance', 'data'));
    }

    public function businessFlow(Request $request)
    {
        $data = [];
        $start_date = date('Y-m-d', strtotime(Delivery::orderBy('date', 'asc')->first()->date));
        $end_date = date('Y-m-d', strtotime(Delivery::orderBy('date', 'desc')->first()->date));

        $start = new DateTime($start_date);
        $end = new DateTime($end_date);
        $interval = new DateInterval('P1M');
        $period = new DatePeriod($start, $interval, $end);

        $prev_data = NULL;
        foreach ($period as $date) {
            $total_sales = DeliveryList::whereHas('delivery', function ($query) use ($date) {
                $query->where('date', '>=', $date->format('Y-m-01'))->where('date', '<=', $date->format('Y-m-t'));
            })->get();

            $sales_qty = $total_sales->sum('qty');
            $income_amount = $total_sales->sum('subtotal');
            $expense_amount = AccountTransaction::whereHas('coa.parent', function ($query) {
                $query->whereIn('head_code', [401, 402, 403, 404]);
            })->where('voucher_date', '>=', $date->format('Y-m-01'))->where('voucher_date', '<=', $date->format('Y-m-t'))->sum('debit_amount');

            $profit_amount = $income_amount - $expense_amount;
            $total_share = InvestMonth::where('invest_month', $date->format('Y-m-01'))->sum('qty');

            $investor_profit = 0;
            $investor_avg_profit = 0;
            if ($profit_amount > 0 && $total_share > 0) {
                $investor_profit = ($profit_amount / 100) * 40;
                $investor_avg_profit = $investor_profit / $total_share;
            }


            // $income_amount = $total_sales->sum('income_amount');
            // $expense_amount = $total_sales->sum('expense_amount');
            // $profit_amount = $total_sales->sum('profit_amount');
            // $investor_contribution = $total_sales->whereNotNull('investor_id')->count();
            // $investor_profit = round((40 / 100) * $total_sales->whereNotNull('investor_id')->sum('profit_amount'));
            // $investor_avg_profit = $investor_profit > 0 && $investor_contribution > 0 ? round($investor_profit / $investor_contribution) : 0;

            $improve_percentage = 0;
            if (is_null($prev_data)) {
                $status = 0;
            } elseif ($prev_data < $profit_amount) {
                $increase = $profit_amount - $prev_data;
                $improve_percentage = round(($increase / $profit_amount) * 100);
                $status = 1;
            } else {
                $decrease =  $prev_data - $profit_amount;
                $improve_percentage = round(($decrease / $profit_amount) * 100);
                $status = -1;
            }

            $data[] = [
                'year' => $date->format('Y'),
                'month' => $date->format('F'),
                'sales_qty' => $sales_qty,
                'income_amount' => $income_amount,
                'expense_amount' => $expense_amount,
                'profit_amount' => $profit_amount,
                'avarage_profit' => $investor_avg_profit,
                'investor_profit' => $investor_profit,
                'total_share' => $total_share,
                'status' => $status,
                'improve_percentage' => $improve_percentage,
            ];
            $prev_data = $profit_amount;
        }

        $title = 'Monthly Business Flow';
        $filter_form = '';
        return view('admin.reports.business_flow.index', compact('title', 'filter_form', 'data'));
    }

    public function investReport(Request $request, InvestReportDataTable $dataTable)
    {
        if (!is_null($request->print)) {
            $query = InvestMonth::with(['investor']);
            $month = $request->month ?? date('F');
            $year = $request->year ?? date('Y');
            if (request('investor_id')) {
                $query->where('investor_id', request('investor_id'));
            }

            $data = $query->select('investor_id', DB::raw('SUM(qty) as sum_qty'), DB::raw('SUM(amount) as sum_amount'))->where('month', $month)->where('year', $year)->groupBy('investor_id')->orderByDesc('sum_amount')->get();

            $report_title = 'Monthly Investor Report <br> <span class="text-sm">' . $month . ', ' . $year . '</span>';
            $pdf = Pdf::loadView('admin.reports.invest_report.print', compact('report_title', 'data'));
            return $pdf->stream('invest_report_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Monthly Investor Report';
        $current_time = Carbon::now();
        return $dataTable->render('admin.reports.invest_report.index', compact('title', 'current_time'));
    }

    public function dailyTransaction(Request $request)
    {
        $statements = [];

        $date_range = explode('to', $request->date_range);
        $start_date = $request->date_range ? date('Y-m-d', strtotime(trim($date_range[0]))) : date('Y-m-01');
        $end_date = $request->date_range ? date('Y-m-d', strtotime(trim($date_range[1]))) : date('Y-m-t');

        $dateRange = CarbonPeriod::create($start_date, $end_date);
        foreach ($dateRange as $date) {
            $d = $date->format('Y-m-d');
            $sales = Delivery::with('list')->whereDate('date', $d)->get();

            foreach ($sales as $item) {
                $statements[] = [
                    'date'            => $date->format('d-m-Y'),
                    'narration'       => 'Daily Food Delivery by delivery no - ' . $item->delivery_no,
                    'meal_qty'        => $item->total_qty,
                    'meal_value'      => $item->total_amount,
                    'food_exp'        => 0,
                    'operational_exp' => 0,
                    'fixed_exp'       => 0,
                    'marketing_exp'   => 0,
                ];
            }

            $expenses = AccountTransaction::with('coa.parent')
                ->whereHas('coa.parent', fn($q) => $q->whereIn('head_code', [401, 402, 403, 404]))
                ->whereDate('voucher_date', $d)
                ->get();

            foreach ($expenses as $item) {
                $headCode = $item->coa->parent->head_code ?? null;

                $row = [
                    'date'            => $date->format('d-m-Y'),
                    'narration'       => 'Daily Expense by transaction no - ' . $item->voucher_no,
                    'meal_qty'        => 0,
                    'meal_value'      => 0,
                    'food_exp'        => $headCode == 401 ? $item->debit_amount : 0,
                    'operational_exp' => $headCode == 402 ? $item->debit_amount : 0,
                    'fixed_exp'       => $headCode == 403 ? $item->debit_amount : 0,
                    'marketing_exp'   => $headCode == 404 ? $item->debit_amount : 0,
                ];

                $statements[] = $row;
            }
        }

        $title = 'Daily Transaction';

        // ✅ Use HEREDOC syntax to store HTML safely
        $filter_form = <<<HTML
            <form action="{$request->url()}" method="GET">
                <div class="d-flex">
                    <input type="hidden" name="print" value="">
                    <input type="hidden" name="filter" value="1">
                    <input
                        type="text"
                        class="form-control date-range input-sm me-2"
                        name="date_range"
                        id="date_range"
                        placeholder="Select Date Range"
                        data-time-picker="true"
                        data-format="DD-MM-Y"
                        data-separator=" to "
                        autocomplete="off"
                        value="{$this->formatDateRange($start_date,$end_date)}"
                        style="max-width: 170px;"
                        required
                    >
                    <button type="submit" class="btn btn-sm btn-primary flex-shrink-0">Search</button>
                </div>
            </form>
        HTML;

        return view('admin.reports.daily-transaction.index', compact('title', 'filter_form', 'start_date', 'end_date', 'statements'));
    }

    // Helper method for cleaner formatting
    private function formatDateRange($start_date, $end_date)
    {
        return date('d-m-Y', strtotime($start_date)) . ' to ' . date('d-m-Y', strtotime($end_date));
    }

    public function coaList(Request $request, CoaListDataTable $dataTable)
    {
        if ($request->ajax() && $request->has('getHeads')) {
            $value = $request->head_type;
            if ($value == 'gl') {
                $heads = CoaSetup::where('general', 1)->orderBy('head_name', 'asc')->get();
            } else {
                $heads = CoaSetup::whereNull('parent_id')->orderBy('head_name', 'asc')->get();
            }
            return response()->json(['status' => 'success', 'heads' => $heads]);
        }

        if (!is_null($request->print)) {
            $query = CoaSetup::query();
            $parent_head = $request->parent_head;
            if ($parent_head) {
                $query->where('head_code', 'LIKE', $parent_head . '%')->where('transaction', 1);
            }
            $data = $query->orderBy('head_name', 'asc')->get();

            $report_title = 'Chart of Accounts';
            $pdf = Pdf::loadView('admin.reports.coa_list.print', compact('report_title', 'data'));
            $pdf->setPaper('A4');
            return $pdf->stream('coa_list_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Chart of Accounts';
        return $dataTable->render('admin.reports.coa_list.index', compact('title'));
    }

    public function voucherList(Request $request, voucherListDataTable $dataTable)
    {
        if ($request->ajax() && $request->has('getHeads')) {
            $value = $request->head_type;
            if ($value == 'gl') {
                $heads = CoaSetup::where('general', 1)->orderBy('head_name', 'asc')->get();
            } else {
                $heads = CoaSetup::whereNull('parent_id')->orderBy('head_name', 'asc')->get();
            }
            return response()->json(['status' => 'success', 'heads' => $heads]);
        }

        if (!is_null($request->print)) {
            $query = AccountTransaction::query();
            $voucher_type = $request->voucher_type;
            $date_range = explode('to', $request->date_range);
            $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
            $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
            if (!is_null($voucher_type)) {
                $query->where('voucher_type', $voucher_type);
            }
            if (!is_null($start_date) && !is_null($end_date)) {
                $query->where('voucher_date', '>=', $start_date)->where('voucher_date', '<=', $end_date);
            }

            $data = $query->select('*', DB::raw('SUM(debit_amount) as amount'))->orderBY('id', 'desc')
                ->orderBY('voucher_date', 'desc')
                ->groupBy('voucher_no')->get();

            $report_title = 'Voucher List';
            $pdf = Pdf::loadView('admin.reports.voucher_list.print', compact('report_title', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('voucher_list_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Voucher List';
        $voucher_types = AccountTransaction::groupBy('voucher_type')->orderBy('voucher_type', 'asc')->get();
        return $dataTable->render('admin.reports.voucher_list.index', compact('title', 'voucher_types'));
    }

    public function cashBook(Request $request)
    {
        $previousBalance = 0;
        $data = array();
        $coa_setup_id = $request->coa_setup_id;
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        if ($request->has('filter')) {
            if (!is_null($request->coa_setup_id)) {
                $previousBalance = AccountTransaction::where('coa_setup_id', $request->coa_setup_id)->where('voucher_date', '<', $start_date)->sum(DB::raw('debit_amount - credit_amount'));
                $data = AccountTransaction::where('coa_setup_id', $request->coa_setup_id)->where('voucher_date', '>=', $start_date)->where('voucher_date', '<=', $end_date)->orderBy('voucher_date', 'asc')->get();
            }
        }

        if (!is_null($request->print)) {
            $report_title = 'Cash book Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            $pdf = Pdf::loadView('admin.reports.cash_book.print', compact('report_title', 'previousBalance', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('cash_book_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Cash Book';
        $coas = CoaSetup::where('transaction', 1)->where('head_code', 'LIKE', '10102%')->orderBy('head_name', 'asc')->get();
        return view('admin.reports.cash_book.index', compact('title', 'coas', 'coa_setup_id', 'start_date', 'end_date', 'previousBalance', 'data'));
    }

    public function bankBook(Request $request)
    {
        $previousBalance = 0;
        $data = array();
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        if ($request->has('filter')) {
            if (!is_null($request->coa_setup_id)) {
                $previousBalance = AccountTransaction::where('coa_setup_id', $request->coa_setup_id)->where('voucher_date', '<', $start_date)->sum(DB::raw('debit_amount - credit_amount'));
                $data = AccountTransaction::where('coa_setup_id', $request->coa_setup_id)->where('voucher_date', '>=', $start_date)->where('voucher_date', '<=', $end_date)->orderBy('voucher_date', 'asc')->get();
            }
        }

        if (!is_null($request->print)) {
            $report_title = 'Bank book Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            $pdf = Pdf::loadView('admin.reports.bank_book.print', compact('report_title', 'previousBalance', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('bank_book_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Bank Book';
        $coas = CoaSetup::where('transaction', 1)->where('head_code', 'LIKE', '10103%')->orderBy('head_name', 'asc')->get();
        return view('admin.reports.bank_book.index', compact('title', 'coas', 'start_date', 'end_date', 'previousBalance', 'data'));
    }

    public function transactionLedger(Request $request)
    {
        $previousBalance = 0;
        $data = array();
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        if ($request->has('filter')) {
            if (!is_null($request->coa_setup_id)) {
                $previousBalance = AccountTransaction::where('coa_setup_id', $request->coa_setup_id)->where('voucher_date', '<', $start_date)->sum(DB::raw('debit_amount - credit_amount'));
                $data = AccountTransaction::where('coa_setup_id', $request->coa_setup_id)->where('voucher_date', '>=', $start_date)->where('voucher_date', '<=', $end_date)->orderBy('voucher_date', 'desc')->get();
            }
        }

        if (!is_null($request->print)) {
            $report_title = 'Transaction Ledger Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            $pdf = Pdf::loadView('admin.reports.transaction_ledger.print', compact('report_title', 'previousBalance', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('transaction_ledger_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Transaction Ledger';
        $coas = CoaSetup::where('transaction', 1)->orderBy('head_name', 'asc')->get();
        return view('admin.reports.transaction_ledger.index', compact('title', 'coas', 'start_date', 'end_date', 'previousBalance', 'data'));
    }

    public function cashFlowStatement(Request $request)
    {
        $data = array();
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        $generalLedgerHeadCash = 10102;
        $generalLedgerHeadBank = 10103;

        if ($request->has('filter')) {
            $data = AccountTransaction::where('voucher_date', '>=', $start_date)->where('voucher_date', '<=', $end_date)->groupBy('voucher_date')->orderBy('voucher_date', 'desc')->get('voucher_date');
        }

        if (!is_null($request->print)) {
            $report_title = 'Cash Flow Statement <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';;
            $pdf = Pdf::loadView('admin.reports.cash_flow_statement.print', compact('report_title', 'data', 'generalLedgerHeadCash', 'generalLedgerHeadBank'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('cash_flow_statement_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Cash Flow Statement';
        return view('admin.reports.cash_flow_statement.index', compact('title', 'start_date', 'end_date', 'data', 'generalLedgerHeadCash', 'generalLedgerHeadBank'));
    }

    public function generalLedger(Request $request)
    {
        $previousBalance = 0;
        $data = array();
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        if ($request->has('filter')) {
            if (!is_null($request->coa_head_code)) {
                $previousBalance = AccountTransaction::where('coa_head_code', 'LIKE', $request->coa_head_code . '%')->where('voucher_date', '<', $start_date)->sum(DB::raw('debit_amount - credit_amount'));
                $data = AccountTransaction::where('coa_head_code', 'LIKE', $request->coa_head_code . '%')->where('voucher_date', '>=', $start_date)->where('voucher_date', '<=', $end_date)->orderBy('voucher_date', 'desc')->get();
            }
        }

        if (!is_null($request->print)) {
            $report_title = 'General Ledger Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            $pdf = Pdf::loadView('admin.reports.general_ledger.print', compact('report_title', 'previousBalance', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('general_ledger_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'General Ledger';
        $coas = CoaSetup::where('general', 1)->orderBy('head_name', 'asc')->get();
        return view('admin.reports.general_ledger.index', compact('title', 'coas', 'start_date', 'end_date', 'previousBalance', 'data'));
    }

    public function incomeStatement(Request $request)
    {
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');

        $incomes = array();
        $expenses = array();
        if ($request->has('filter')) {
            $incomes = AccountTransaction::with('coa')
                ->where('voucher_date', '>=', $start_date)
                ->where('voucher_date', '<=', $end_date)
                ->whereHas('coa', function ($query) {
                    $query->where('head_type', 'I');
                })
                ->groupBy('coa_setup_id')
                ->select('coa_head_code', 'coa_setup_id', DB::raw('SUM(debit_amount) as debit_amount'), DB::raw('SUM(credit_amount) as credit_amount'))
                ->get();

            $expenses = AccountTransaction::with('coa')->select('*', DB::raw('SUM(debit_amount - credit_amount) as amount'))
                ->where('voucher_date', '>=', $start_date)
                ->where('voucher_date', '<=', $end_date)
                ->whereHas('coa', function ($query) {
                    $query->where('head_type', 'E')->where('transaction', 1);
                })
                ->groupBy('coa_setup_id')
                ->get();
        }

        if (!is_null($request->print)) {
            $report_title = 'Income Statement Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            $pdf = Pdf::loadView('admin.reports.income_statement.print', compact('report_title', 'incomes', 'expenses'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('income_statement_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Income Statement';
        $print_buttons = '<button type="button" class="btn btn-sm btn-primary text-uppercase getPdf">Print</button>';
        return view('admin.reports.income_statement.index', compact('title', 'start_date', 'end_date', 'incomes', 'expenses', 'print_buttons'));
    }

    public function trialBalance(Request $request)
    {
        $coaLists = array();
        $coaLists1 = array();
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        if ($request->has('filter')) {
            $coaLists = TrialBalance::with('coa_setup')->where('voucher_date', '>=', $start_date)->where('voucher_date', '<=', $end_date)->where('transaction', 1)->where('general', 1)->groupBy('coa_setup_id')->select('*', DB::raw('SUM(debit_amount) as debit_amount'), DB::raw('SUM(credit_amount) as credit_amount'))->get();
            $coaLists1 = TrialBalance::with('parent_head')->where('voucher_date', '>=', $start_date)->where('voucher_date', '<=', $end_date)->where('transaction', 1)->where('general', 0)->groupBy('parent_id')->select('*', DB::raw('SUM(debit_amount) as debit_amount'), DB::raw('SUM(credit_amount) as credit_amount'))->get();
        }

        if (!is_null($request->print)) {
            $report_title = 'Trial Balance <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            $pdf = Pdf::loadView('admin.reports.trial_balance.print', compact('report_title', 'coaLists', 'coaLists1'));
            return $pdf->stream('trial_balance_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Trial Balance';
        return view('admin.reports.trial_balance.index', compact('title', 'start_date', 'end_date', 'coaLists', 'coaLists1'));
    }

    public function balanceSheet(Request $request)
    {
        $assets = $this->assets('Assets');
        $liabilities = $this->assets('Liabilities');
        $currentPFL = $this->profitLoss();
        $data = [
            'assets' => $assets,
            'liabilities' => $liabilities,
            'currentPFL' => $currentPFL,
        ];

        if (!is_null($request->print)) {
            $report_title = 'Balance Sheet';
            $pdf = Pdf::loadView('admin.reports.balance_sheet.print', compact('report_title', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('balance_sheet_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Balance Sheet';
        $coas = CoaSetup::where('general', 1)->orderBy('head_name', 'asc')->get();
        return view('admin.reports.balance_sheet.index', compact('title', 'coas', 'data'));
    }

    public function headDetails(Request $request)
    {
        if ($request->has('income_statement')) {
            $title = 'Head Transactions';
            $data = AccountTransaction::with('coa')
                ->where('voucher_date', '>=', $request->start_date)
                ->where('voucher_date', '<=', $request->end_date)
                ->where('coa_setup_id', $request->coa_setup_id)
                ->get();

            if ($request->has('details_print')) {
                $report_title = 'Head Transactions Details <br> <span class="text-sm">' . date('d-m-Y', strtotime($request->start_date)) . ' To ' . date('d-m-Y', strtotime($request->end_date)) . '</span>';
                $pdf = Pdf::loadView('admin.reports.income_statement.details_print', compact('report_title', 'data'));
                return $pdf->stream('transaction_details' . date('d_m_Y_h_i_s') . '.pdf');
            }
            return view('admin.reports.income_statement.details', compact('title', 'data'));
        }

        if ($request->has('balance_sheet')) {
            $title = 'Head Transactions';
            $data = AccountTransaction::with('coa')
                ->where('coa_setup_id', $request->coa_setup_id)
                ->orderBy('id', 'desc')
                ->get();

            if ($request->has('details_print')) {
                $report_title = 'Head Transactions Details <br> <span class="text-sm">' . date('d-m-Y', strtotime($request->start_date)) . ' To ' . date('d-m-Y', strtotime($request->end_date)) . '</span>';
                $pdf = Pdf::loadView('admin.reports.income_statement.details_print', compact('report_title', 'data'));
                return $pdf->stream('transaction_details' . date('d_m_Y_h_i_s') . '.pdf');
            }
            return view('admin.reports.income_statement.details', compact('title', 'data'));
        }

        $title = 'Head Transactions';
        $coa_ids = CoaSetup::where('parent_id', $request->id)->pluck('id')->toArray();
        $child_coa_ids = CoaSetup::whereIn('parent_id', $coa_ids)->pluck('id')->toArray();
        $coa_ids = array_merge($coa_ids, $child_coa_ids);
        $data = AccountTransaction::with('coa')->select('*', DB::raw('SUM(debit_amount) as debit_amount'), DB::raw('SUM(credit_amount) as credit_amount'))
            ->whereIn('coa_setup_id', $coa_ids)
            ->groupBy('coa_setup_id')
            ->get();

        if ($request->has('details_print')) {
            $report_title = 'Head Transactions Details';
            $pdf = Pdf::loadView('admin.reports.balance_sheet.details_print', compact('report_title', 'data'));
            return $pdf->stream('transaction_details' . date('d_m_Y_h_i_s') . '.pdf');
        }
        return view('admin.reports.balance_sheet.details', compact('title', 'data'));
    }

    public function viewVoucher(string $id)
    {
        $title = "View Voucher";
        $transaction = AccountTransaction::findOrFail($id);
        $transactions = AccountTransaction::where('voucher_no', $transaction->voucher_no)
            ->where('voucher_type', $transaction->voucher_type)->get();
        return view('admin.reports.income_statement.view')->with(compact('title', 'transaction', 'transactions'));
    }

    public function getAmount($headCode)
    {
        $balance = 0;
        $headReports = TrialBalance::select('*')
            ->where('coa_head_code', 'LIKE', $headCode . '%')
            ->get();

        foreach ($headReports as $headReport) {
            if ($headReport->head_type == 'I' || $headReport->head_type == 'L') {
                $balance += $headReport->credit_amount - $headReport->debit_amount;
            } else {
                $balance += $headReport->debit_amount - $headReport->credit_amount;
            }
        }
        return $balance;
    }

    public function assets($parent_head)
    {
        $parents = CoaSetup::with('parent')->whereHas('parent', function ($query) use ($parent_head) {
            $query->where('head_name', $parent_head);
        })->orderBy('head_name', 'asc')->get();

        $info = [];
        foreach ($parents as $parent) {
            $childs = CoaSetup::select('head_name', 'head_code', 'id')
                ->where('parent_id', $parent->id)
                ->get();
            $childInfo = [];
            foreach ($childs as $child) {
                $childInfo[] = [
                    'id' => $child->id,
                    'headCode' => $child->head_code,
                    'headName' => $parent->head_name,
                    'name' => $child->head_name,
                    'amount' => $this->getAmount($child->head_code)
                ];
            }

            $info[] = [
                'id' => $parent->id,
                'headCode' => $parent->head_code,
                'head' => $parent->head_name,
                'childs' => $childInfo
            ];
        }
        return $info;
    }

    private function profitLoss()
    {
        $totalIncome = trialBalance::where('head_type', 'I')->sum(DB::raw('credit_amount - debit_amount'));
        $totalExpanse = trialBalance::where('head_type', 'E')->sum(DB::raw('debit_amount - credit_amount'));
        return $totalIncome - $totalExpanse;
    }
}
