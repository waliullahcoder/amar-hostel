@extends('layouts.admin.print_app')
@section('content')
    <table class="table table-bordered table-condensed table-striped align-middle">
        <thead class="text-nowrap">
            <tr>
                <th width="80">Date</th>
                <th class="text-center">Order</th>
                <th class="text-center">Delivery</th>
                <th class="text-center">Previous Due</th>
                <th class="text-center">Bill Amount</th>
                <th class="text-center">Collection Amount</th>
                <th class="text-center">Due Amount</th>
            </tr>
        </thead>
        <tbody>
            @php
                $total_1 = 0;
                $total_2 = 0;
                $total_4 = 0;
                $total_5 = 0;
                $total_6 = 0;
                $previous_dues = 0;
            @endphp
            @for ($i = 1; $i <= 31; $i++)
                @php
                    $year = request('year') ?? date('Y');
                    $month = request('month') ?? date('m');
                    if (Str::length($month) == 1) {
                        $month = '0' . $month;
                    }
                    if (Str::length($i) == 1) {
                        $i = '0' . $i;
                    }
                    $date = date('Y-m-d', strtotime($year . '-' . $month . '-' . $i));
                    if ($date != $year . '-' . $month . '-' . $i) {
                        continue;
                    }
                    $previous_dues = $deliveries->where('date', '<', $date)->where('collected', 0)->sum('subtotal');
                    $total_1 += $bookings->where('date', $date)->sum('qty');
                    $total_2 += $deliveries->where('date', $date)->sum('qty');
                    $total_4 += $deliveries->where('date', $date)->sum('subtotal');
                    $total_5 += $deliveries->where('date', $date)->where('collected', 1)->sum('subtotal');
                    $total_6 += $deliveries->where('date', $date)->where('collected', 0)->sum('subtotal');
                @endphp
                <tr class="text-nowrap">
                    <td>Date - {{ $i }}</td>
                    <td class="text-center">
                        {{ $bookings->where('date', $date)->sum('qty') > 0 ? number_format($bookings->where('date', $date)->sum('qty')) : '-' }}
                    </td>
                    <td class="text-center">
                        {{ $deliveries->where('date', $date)->sum('qty') > 0 ? number_format($deliveries->where('date', $date)->sum('qty')) : '-' }}
                    </td>
                    <td class="text-center">
                        {{ $previous_dues > 0 ? number_format($previous_dues) : '-' }}</td>
                    <td class="text-center">
                        {{ $deliveries->where('date', $date)->sum('subtotal') > 0 ? number_format($deliveries->where('date', $date)->sum('subtotal')) : '-' }}
                    </td>
                    <td class="text-center">
                        {{ $deliveries->where('date', $date)->where('collected', 1)->sum('subtotal') > 0 ? number_format($deliveries->where('date', $date)->where('collected', 1)->sum('subtotal')) : '-' }}
                    </td>
                    <td class="text-center">
                        {{ $deliveries->where('date', $date)->where('collected', 0)->sum('subtotal') > 0 ? number_format($deliveries->where('date', $date)->where('collected', 0)->sum('subtotal')) : '-' }}
                    </td>
                </tr>
            @endfor
        </tbody>
        <tfoot>
            <tr>
                <th class="text-right text-nowrap">Total Summary</th>
                <th class="text-center">{{ number_format($total_1) }}</th>
                <th class="text-center">{{ number_format($total_2) }}</th>
                <th class="text-center"></th>
                <th class="text-center">{{ number_format($total_4) }}</th>
                <th class="text-center">{{ number_format($total_5) }}</th>
                <th class="text-center">{{ number_format($total_6) }}</th>
            </tr>
        </tfoot>
    </table>
    <div style="padding-top: 10px;">Print Date & Time : {{ date('d-m-Y h:i:s A') }}</div>
@endsection
