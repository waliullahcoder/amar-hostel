@extends('layouts.admin.print_app')
@section('content')
    <table class="table table-bordered table-condensed table-striped align-middle">
        <thead class="text-nowrap">
            <tr>
                <th class="text-center" width="30">SL#</th>
                <th>Date</th>
                <th>Customer Name</th>
                <th>Phone</th>
                <th>Area</th>
                <th>Address</th>
                <th class="text-right">Amount</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($data as $row)
                <tr class="text-nowrap">
                    <th class="text-center">{{ $loop->iteration }}</th>
                    <td>{{ date('d-m-Y', strtotime($row->date)) }}</td>
                    <td>{{ $row->name }}</td>
                    <td>{{ $row->phone }}</td>
                    <td>{{ @$row->area->name }}</td>
                    <td>{{ $row->address }}</td>
                    <td class="text-right">{{ number_format($row->amount) }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
    <div style="padding-top: 10px;">Print Date & Time : {{ date('d-m-Y h:i:s A') }}</div>
@endsection
