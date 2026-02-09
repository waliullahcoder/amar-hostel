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
            <label for="area_id" class="form-label"><b>Area</b></label>
            <select name="area_id[]" id="area_id" class="select form-select" data-placeholder="Select Area.." multiple>
                <option value=""></option>
                @foreach ($areas as $item)
                    <option value="{{ $item->id }}"
                        {{ is_array(request('area_id')) && in_array($item->id, request('area_id')) ? 'selected' : '' }}>
                        {{ $item->name }}
                    </option>
                @endforeach
            </select>
        </div>
    </div>
@endsection

@section('content')
    {!! $dataTable->table(['class' => 'dataTable table align-middle table-bordered'], true) !!}
@endsection

@push('js')
    <script type="text/javascript" src="{{ asset('vendor/datatables/buttons.server-side.js') }}"></script>
    {!! $dataTable->scripts() !!}

    <script type="text/javascript">
        $(document).ready(function() {
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
