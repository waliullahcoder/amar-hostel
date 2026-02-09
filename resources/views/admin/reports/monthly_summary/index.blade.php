@extends('layouts.admin.report_app')

@push('css')
    <style>
        .day_wrap {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            display: flex;
            color: var(--bs-white);
        }

        .day_wrap>span {
            width: 33.33%;
            padding: 0.3rem;
        }

        .fixed_width {
            min-width: 4rem;
        }
    </style>
@endpush

@section('form')
    <div class="row g-3">
        <div class="col-lg-3 col-sm-6">
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
        <div class="col-lg-3 col-sm-6">
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
        <div class="col-lg-3 col-sm-6">
            <label for="user_id" class="form-label"><b>Staff</b></label>
            <select name="user_id" id="user_id" class="form-select select" data-placeholder="Select Staff">
                <option value=""></option>
                @foreach ($staffs as $item)
                    <option value="{{ $item->id }}" {{ request('user_id') == $item->id ? 'selected' : '' }}>
                        {{ $item->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="col-lg-3 col-sm-6">
            <label for="customer_id" class="form-label"><b>Customer</b></label>
            <select name="customer_id[]" id="customer_id" class="form-select select" data-placeholder="Select Customer"
                multiple>
                <option value=""></option>
                @php
                    $customers = [];
                    if (request('user_id')) {
                        $customers = \App\Modays\Customer::whereHas('assign', function ($query) {
                            $query->where('user_id', request('user_id'));
                        })
                            ->where('status', 1)
                            ->orderBy('name', 'asc')
                            ->get();
                    }
                @endphp
                @foreach ($customers as $item)
                    <option value="{{ $item->id }}"
                        {{ is_array(request('customer_id')) && in_array($item->id, request('customer_id')) ? 'selected' : '' }}>
                        {{ $item->name }}</option>
                @endforeach
            </select>
        </div>
    </div>
@endsection

@section('content')
    <table id="dataTable" class="table table-bordered">
        <thead>
            <tr>
                <th>SL#</th>
                <th>Customer Name</th>
                <th>Code</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Total</th>
                <th>Due</th>
                <th>Due ৳</th>
                <th class="text-center">1</th>
                <th class="text-center">2</th>
                <th class="text-center">3</th>
                <th class="text-center">4</th>
                <th class="text-center">5</th>
                <th class="text-center">6</th>
                <th class="text-center">7</th>
                <th class="text-center">8</th>
                <th class="text-center">9</th>
                <th class="text-center">10</th>
                <th class="text-center">11</th>
                <th class="text-center">12</th>
                <th class="text-center">13</th>
                <th class="text-center">14</th>
                <th class="text-center">15</th>
                <th class="text-center">16</th>
                <th class="text-center">17</th>
                <th class="text-center">18</th>
                <th class="text-center">19</th>
                <th class="text-center">20</th>
                <th class="text-center">21</th>
                <th class="text-center">22</th>
                <th class="text-center">23</th>
                <th class="text-center">24</th>
                <th class="text-center">25</th>
                <th class="text-center">26</th>
                <th class="text-center">27</th>
                <th class="text-center">28</th>
                <th class="text-center">29</th>
                <th class="text-center">30</th>
                <th class="text-center">31</th>
            </tr>
        </thead>
    </table>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $('#dataTable').DataTable({
                processing: true,
                serverSide: true,
                scrollX: true,
                dom: 'Bfrtip',
                buttons: [
                    'csv', 'excel', 'pdf'
                ],
                ajax: '{{ url()->current() }}',
                columns: [{
                        data: 'DT_RowIndex',
                        name: 'DT_RowIndex',
                        orderable: false,
                        searchable: false,
                        width: '60',
                        class: 'text-center',
                    },
                    {
                        data: 'name',
                        name: 'name',
                        class: 'text-nowrap',
                    },
                    {
                        data: 'code',
                        name: 'code',
                    },
                    {
                        data: 'phone',
                        name: 'phone',
                    },
                    {
                        data: 'address',
                        name: 'address',
                        class: 'text-nowrap',
                    },
                    {
                        data: 'total',
                        name: 'total',
                        class: 'text-center',
                    },
                    {
                        data: 'due_qty',
                        name: 'due_qty',
                        class: 'text-center',
                    },
                    {
                        data: 'due_amount',
                        name: 'due_amount',
                        class: 'text-center',
                    },
                    {
                        data: 'day_1',
                        name: 'day_1',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_2',
                        name: 'day_2',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_3',
                        name: 'day_3',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_4',
                        name: 'day_4',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_5',
                        name: 'day_5',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_6',
                        name: 'day_6',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_7',
                        name: 'day_7',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_8',
                        name: 'day_8',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_9',
                        name: 'day_9',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_10',
                        name: 'day_10',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_11',
                        name: 'day_11',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_12',
                        name: 'day_12',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_13',
                        name: 'day_13',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_14',
                        name: 'day_14',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_15',
                        name: 'day_15',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_16',
                        name: 'day_16',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_17',
                        name: 'day_17',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_18',
                        name: 'day_18',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_19',
                        name: 'day_19',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_20',
                        name: 'day_20',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_21',
                        name: 'day_21',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_22',
                        name: 'day_22',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_23',
                        name: 'day_23',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_24',
                        name: 'day_24',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_25',
                        name: 'day_25',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_26',
                        name: 'day_26',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_27',
                        name: 'day_27',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_28',
                        name: 'day_28',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_29',
                        name: 'day_29',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_30',
                        name: 'day_30',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                    {
                        data: 'day_31',
                        name: 'day_31',
                        class: 'text-center position-relative fixed_width',
                        orderable: false,
                        searchable: false,
                        width: '60',
                    },
                ]
            });

            $(document).on('change', '#user_id', function(e) {
                var user_id = $(this).val();
                $('#customer_id option').remove();

                let url = "{{ url()->current() }}";
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        _method: 'GET',
                        user_id: user_id,
                        get_customers: true,
                    },
                    success: function(response) {
                        if (response.status == 'success') {
                            $('#customer_id').append('<option value=""></option>');
                            $.each(response.customers, function(key, value) {
                                var option =
                                    `<option value="${value.id}">${value.name}</option>`;
                                $('#customer_id').append(option);
                            });
                        }
                    }
                });
            });
        });
    </script>
@endpush
