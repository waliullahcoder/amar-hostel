@extends('layouts.admin.print_app')
@section('content')
    <table class="table table-bordered table-condensed table-striped align-middle">
        <thead>
            <th class="text-center" width="20">Sl#</th>
            <th>Investor</th>
            <th class="text-right">Invest Qty</th>
            <th class="text-right">Invest Amount</th>
        </thead>
        <tbody>
            @foreach ($data as $row)
                <tr>
                    <td class="text-center">{{ $loop->iteration }}</td>
                    <td>{{ $row->investor->name ?? '' }}</td>
                    <td class="text-right">{{ number_format($row->sum_qty) }}</td>
                    <td class="text-right">{{ number_format($row->sum_amount) }}</td>
                </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <th colspan="2" class="text-right">Total</th>
                <th class="text-right">{{ number_format($data->sum('sum_qty')) }}</th>
                <th class="text-right">{{ number_format($data->sum('sum_amount')) }}</th>
            </tr>
        </tfoot>
    </table>
    <div style="padding-top: 10px;">Print Date & Time : {{ date('d-m-Y h:i:s A') }}</div>
@endsection
