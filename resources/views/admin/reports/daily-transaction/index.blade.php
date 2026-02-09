@extends('layouts.admin.report_app')

@section('content')
    <table class="dataTable table table-bordered w-100">
        <thead>
            <tr>
                <th class="text-center" width="40px">SL#</th>
                <th>Date</th>
                <th>Narration</th>
                <th class="text-end">Meal Qty</th>
                <th class="text-end">Meal Value</th>
                <th class="text-end">Food Expense</th>
                <th class="text-end">Operational Expense</th>
                <th class="text-end">Fixed Expense</th>
                <th class="text-end">Marketing Expense</th>
            </tr>
        </thead>
        <tbody>
            @php
                $meal_qty = 0;
                $meal_value = 0;
                $food_exp = 0;
                $operational_exp = 0;
                $fixed_exp = 0;
                $marketing_exp = 0;
            @endphp
            @foreach ($statements as $row)
                <tr class="text-nowrap">
                    <td class="text-center px-3">{{ $loop->iteration }}</td>
                    <td>{{ date('d-m-Y', strtotime($row['date'])) }}</td>
                    <td>{{ $row['narration'] }}</td>
                    <td class="text-end">{{ number_format($row['meal_qty']) }}</td>
                    <td class="text-end">{{ number_format($row['meal_value']) }}</td>
                    <td class="text-end">{{ number_format($row['food_exp']) }}</td>
                    <td class="text-end">{{ number_format($row['operational_exp']) }}</td>
                    <td class="text-end">{{ number_format($row['fixed_exp']) }}</td>
                    <td class="text-end">{{ number_format($row['marketing_exp']) }}</td>
                </tr>

                @php
                    $meal_qty += $row['meal_qty'];
                    $meal_value += $row['meal_value'];
                    $food_exp += $row['food_exp'];
                    $operational_exp += $row['operational_exp'];
                    $fixed_exp += $row['fixed_exp'];
                    $marketing_exp += $row['marketing_exp'];
                @endphp
            @endforeach
        </tbody>
        <tfoot>
            <tr class="bg-primary">
                <th class="text-end text-white" colspan="3">Total</th>
                <th class="text-end text-white">{{ number_format($meal_qty) }}</th>
                <th class="text-end text-white">{{ number_format($meal_value) }}</th>
                <th class="text-end text-white">{{ number_format($food_exp) }}</th>
                <th class="text-end text-white">{{ number_format($operational_exp) }}</th>
                <th class="text-end text-white">{{ number_format($fixed_exp) }}</th>
                <th class="text-end text-white">{{ number_format($marketing_exp) }}</th>
            </tr>
        </tfoot>
    </table>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $('.dataTable').DataTable({
                order: false,
                responsive: true,
                dom: "<'row g-2'<'col-sm-4'l><'col-sm-8 text-end'<'d-lg-flex justify-content-end'<'mb-2 mb-lg-0 me-1'f>B>>>t<'d-lg-flex align-items-center mt-2'<'me-auto mb-lg-0 mb-2'i><'mb-0'p>>",
                lengthMenu: [10, 20, 30, 40, 50],
                buttons: []
                //buttons: [{
                //        extend: 'excel',
                //        text: '<i class="fal fa-file-spreadsheet"></i> Excel'
                //    },
                //    {
                //        text: '<i class="fal fa-file-pdf"></i> Print',
                //        className: 'getPdf',
                //    }
                //]
            });

            $(document).on('click', '#filter_btn', function(e) {
                $('input[name="print"]').val('');
                $('.filter_form')[0].setAttribute("target", "_self");
            });
        });
    </script>
@endpush
