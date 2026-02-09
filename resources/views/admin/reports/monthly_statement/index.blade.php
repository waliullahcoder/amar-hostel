@extends('layouts.admin.report_app')

@section('form')
    <input type="hidden" name="print" value="">
    <div class="row g-3">
        <div class="col-md-4 col-sm-6">
            <label for="month" class="form-label"><b>Month <span class="text-danger">*</span></b></label>
            <select name="month" id="month" class="select form-select" data-placeholder="Select Month.." required>
                @php
                    $months = [
                        '1' => 'January',
                        '2' => 'February',
                        '3' => 'March',
                        '4' => 'April',
                        '5' => 'May',
                        '6' => 'June',
                        '7' => 'July',
                        '8' => 'August',
                        '9' => 'September',
                        '10' => 'October',
                        '11' => 'November',
                        '12' => 'December',
                    ];
                @endphp
                @foreach ($months as $key => $value)
                    <option value="{{ $key }}"
                        {{ request('month') == $key ? 'selected' : (is_null(request('month')) && $key == date('m') ? 'selected' : '') }}>
                        {{ $value }}
                    </option>
                @endforeach
            </select>
        </div>
        <div class="col-md-4 col-sm-6">
            <label for="year" class="form-label"><b>Year <span class="text-danger">*</span></b></label>
            <select name="year" id="year" class="select form-select" data-placeholder="Select Year.." required>
                @for ($i = date('Y'); $i <= 2030; $i++)
                    <option value="{{ $i }}"
                        {{ request('year') == $i ? 'selected' : (is_null(request('year')) && $i == date('Y') ? 'selected' : '') }}>
                        {{ $i }}
                    </option>
                @endfor
            </select>
        </div>
        <div class="col-md-4 col-sm-6">
            <label for="customer_id" class="form-label"><b>Customer</b></label>
            <select name="customer_id" id="customer_id" class="form-select select" data-placeholder="Select Customer">
                <option value=""></option>
                @foreach ($customers as $item)
                    <option value="{{ $item->id }}" {{ $item->id == request('customer_id') ? 'selected' : '' }}>
                        {{ $item->name }}
                    </option>
                @endforeach
            </select>
        </div>
    </div>
@endsection

@section('content')
    <table id="dataTable" class="table table-bordered table-sm">
        <thead class="text-nowrap">
            <tr>
                <th class="px-3" width="80">Date</th>
                <th class="px-3 text-center">Order</th>
                <th class="px-3 text-center">Delivery</th>
                <th class="px-3 text-center">Previous Due</th>
                <th class="px-3 text-center">Bill Amount</th>
                <th class="px-3 text-center">Collection Amount</th>
                <th class="px-3 text-center">Due Amount</th>
            </tr>
        </thead>
        <tbody>
            @php
                $total_1 = 0;
                $total_2 = 0;
                $total_3 = 0;
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
                    <td class="px-3">Date - {{ $i }}</td>
                    <td class="px-3 text-center">
                        {{ $bookings->where('date', $date)->sum('qty') > 0 ? number_format($bookings->where('date', $date)->sum('qty')) : '-' }}
                    </td>
                    <td class="px-3 text-center">
                        {{ $deliveries->where('date', $date)->sum('qty') > 0 ? number_format($deliveries->where('date', $date)->sum('qty')) : '-' }}
                    </td>
                    <td class="px-3 text-center">
                        {{ $previous_dues > 0 ? number_format($previous_dues) : '-' }}</td>
                    <td class="px-3 text-center">
                        {{ $deliveries->where('date', $date)->sum('subtotal') > 0 ? number_format($deliveries->where('date', $date)->sum('subtotal')) : '-' }}
                    </td>
                    <td class="px-3 text-center">
                        {{ $deliveries->where('date', $date)->where('collected', 1)->sum('subtotal') > 0 ? number_format($deliveries->where('date', $date)->where('collected', 1)->sum('subtotal')) : '-' }}
                    </td>
                    <td class="px-3 text-center">
                        {{ $deliveries->where('date', $date)->where('collected', 0)->sum('subtotal') > 0 ? number_format($deliveries->where('date', $date)->where('collected', 0)->sum('subtotal')) : '-' }}
                    </td>
                </tr>
            @endfor
        </tbody>
        <tfoot>
            <tr>
                <th class="px-3 text-end text-nowrap" colspan="1">Total Summary</th>
                <th class="px-3 text-center">{{ number_format($total_1) }}</th>
                <th class="px-3 text-center">{{ number_format($total_2) }}</th>
                <th class="px-3 text-center"></th>
                <th class="px-3 text-center">{{ number_format($total_4) }}</th>
                <th class="px-3 text-center">{{ number_format($total_5) }}</th>
                <th class="px-3 text-center">{{ number_format($total_6) }}</th>
            </tr>
        </tfoot>
    </table>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $('#dataTable').DataTable({
                "order": false,
                dom: 'Bfrtip',
                'responsive': true,
                'pageLength': 31,
                buttons: [
                    'excelHtml5',
                    {
                        'text': '<i class="fal fa-file-pdf"></i> Print',
                        'className': 'getPdf',
                    },
                ]
            });

            $(document).on('click', '.getPdf', function(e) {
                $('input[name="print"]').val('true');
                $('.filter_form').attr('target', '_blank');
                $('.filter_form')[0].submit();
            });

            $(document).on('click', '#filter_btn', function(e) {
                $('input[name="print"]').val('');
                $('.filter_form').attr('target', '_self');
            });
        });
    </script>
@endpush
