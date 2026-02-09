@extends('layouts.admin.print_app')
@section('content')
    <table class="table table-bordered table-condensed table-striped align-middle">
        <thead class="text-nowrap">
            <tr>
                <th class="text-center" width="30">SL#</th>
                <th>Customer Name</th>
                <th>Customer Phone</th>
                <th>Area</th>
                <th>Address</th>
                <th class="text-right">Previous Outstanding</th>
                <th class="text-right">Current Outstanding</th>
                <th class="text-right">Total Outstanding</th>
            </tr>
        </thead>
        <tbody>
            @php
                $total_prev = 0;
                $total_curr = 0;
                $total_outstanding = 0;
                $month = request('month') ?? date('m');
                $year = request('year') ?? ($year = date('Y'));
                $start_date = date('Y-m-d', strtotime($year . '-' . $month . '-01'));
                $end_date = date('Y-m-t', strtotime($year . '-' . $month));
            @endphp
            @foreach ($data as $row)
                <tr class="text-nowrap">
                    <th class="text-center">{{ $loop->iteration }}</th>
                    <td>{{ $row->name }}</td>
                    <td>{{ $row->phone }}</td>
                    <td>{{ @$row->area->name }}</td>
                    <td>{{ $row->address }}</td>
                    <td class="text-right">
                        @php
                            $total = \App\Models\CustomerDeliveries::where('date', '<', $start_date)
                                ->where('customer_id', $row->id)
                                ->where('collected', 0)
                                ->sum('subtotal');
                            $total_prev += $total;
                            echo number_format($total);
                        @endphp
                    </td>
                    <td class="text-right">
                        @php
                            $total = \App\Models\CustomerDeliveries::where('date', '>=', $start_date)
                                ->where('date', '<=', $end_date)
                                ->where('customer_id', $row->id)
                                ->where('collected', 0)
                                ->sum('subtotal');
                            $total_curr += $total;
                            echo number_format($total);
                        @endphp
                    </td>
                    <td class="text-right">
                        @php
                            $total = \App\Models\CustomerDeliveries::where('date', '<', $end_date)
                                ->where('customer_id', $row->id)
                                ->where('collected', 0)
                                ->sum('subtotal');
                            $total_outstanding += $total;
                            echo number_format($total);
                        @endphp
                    </td>
                </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <th class="text-right text-nowrap" colspan="5">Total Summary</th>
                <th class="text-right">{{ number_format($total_prev) }}</th>
                <th class="text-right">{{ number_format($total_curr) }}</th>
                <th class="text-right">{{ number_format($total_outstanding) }}</th>
            </tr>
        </tfoot>
    </table>
    <div style="padding-top: 10px;">Print Date & Time : {{ date('d-m-Y h:i:s A') }}</div>
@endsection
