@extends('layouts.admin.report_app')

@section('content')
    <table class="dataTable table table-bordered w-100">
        <thead>
            <tr>
                <th class="text-center" width="20">Sl#</th>
                <th>Year</th>
                <th>Monty</th>
                <th class="text-center">Sales Qty</th>
                <th class="text-center">Income Amount</th>
                <th class="text-center">Expense Amount</th>
                <th class="text-center">Profit Amount</th>
                <th class="text-center">Per Share Profit (Avg)</th>
                <th class="text-center">Status</th>
            </tr>
        </thead>
        <tbody>
            @php
                $sales_qty = 0;
                $income_amount = 0;
                $expense_amount = 0;
                $profit_amount = 0;
                $investor_profit = 0;
                $total_share = 0;
            @endphp
            @foreach (array_reverse($data) as $row)
                <tr class="text-nowrap">
                    <td class="text-center px-3">{{ $loop->iteration }}</td>
                    <td>{{ $row['year'] }}</td>
                    <td>{{ $row['month'] }}</td>
                    <td class="text-center">{{ number_format($row['sales_qty']) }}</td>
                    <td class="text-center">{{ number_format($row['income_amount']) }}</td>
                    <td class="text-center">{{ number_format($row['expense_amount']) }}</td>
                    <td class="text-center">{{ number_format($row['profit_amount']) }}</td>
                    <td class="text-center">{{ number_format($row['avarage_profit']) }}</td>
                    <td class="text-center">
                        {{ $row['improve_percentage'] }}%
                        @if ($row['status'] == 0)
                            <i class="fas fa-pause fa-rotate-90 text-muted fa-2x"></i>
                        @elseif ($row['status'] == 1)
                            <i class="fas fa-arrow-alt-up text-success fa-2x"></i>
                        @else
                            <i class="fas fa-arrow-alt-down text-danger fa-2x"></i>
                        @endif
                    </td>
                </tr>
                @php
                    $sales_qty += $row['sales_qty'];
                    $income_amount += $row['income_amount'];
                    $expense_amount += $row['expense_amount'];
                    $profit_amount += $row['profit_amount'];
                    $investor_profit += $row['investor_profit'];
                    $total_share += $row['total_share'];
                @endphp
            @endforeach
        </tbody>
        <tfoot class="bg-primary">
            @php
                $avarage_profit = $investor_profit > 0 && $total_share > 0 ? round($investor_profit / $total_share) : 0;
            @endphp
            <tr>
                <th class="text-end text-white" colspan="3">Total Summary</th>
                <th class="text-center text-white">{{ $sales_qty }}</th>
                <th class="text-center text-white">{{ $income_amount }}</th>
                <th class="text-center text-white">{{ $expense_amount }}</th>
                <th class="text-center text-white">{{ $profit_amount }}</th>
                <th class="text-center text-white">{{ $avarage_profit }}</th>
                <th></th>
            </tr>
        </tfoot>
    </table>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $('.dataTable').DataTable({
                "order": false,
                'scrollX': true
            });
        });
    </script>
@endpush
