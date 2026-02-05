@extends('layouts.admin.app')

@section('content')

{{-- Alert --}}
@if(session('success'))
<div class="alert alert-success">{{ session('success') }}</div>
@endif

<div class="d-flex justify-content-between mb-3">
    <h4 class="fw-bold">Room Management</h4>
    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#roomModal">
        + Add Room
    </button>
</div>

<table class="table table-bordered table-hover align-middle">
    <thead class="table-light">
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Price</th>
            <th>Capacity</th>
            <th>Status</th>
            <th width="120">Action</th>
        </tr>
    </thead>
    <tbody>
        @foreach($rooms as $room)
        <tr>
            <td>{{ $loop->iteration }}</td>
            <td>{{ $room->name }}</td>
            <td>{{ $room->price }}</td>
            <td>{{ $room->capacity }}</td>
            <td>
                <span class="badge bg-success">Active</span>
            </td>
            <td>
                <button class="btn btn-sm btn-info editRoom"
                    data-id="{{ $room->id }}"
                    data-name="{{ $room->name }}"
                    data-price="{{ $room->price }}"
                    data-capacity="{{ $room->capacity }}"
                    data-description="{{ $room->description }}"
                    data-bs-toggle="modal"
                    data-bs-target="#roomModal">
                    Edit
                </button>
            </td>
        </tr>
        @endforeach
    </tbody>
</table>

{{-- MODAL --}}
<div class="modal fade" id="roomModal">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
        <div class="modal-content">

            <form method="POST" action="{{ route('admin.rooms.store') }}">
                @csrf
                <input type="hidden" name="id" id="room_id">

                <div class="modal-header">
                    <h5 class="modal-title">Room Information</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">

                    {{-- Tabs --}}
                    <nav class="nav__wrapper mb-3">
                    <div class="nav nav-tabs">
                        <button type="button" class="nav-link active"
                            data-bs-toggle="tab"
                            data-bs-target="#general">
                            General
                        </button>

                        <button type="button" class="nav-link"
                            data-bs-toggle="tab"
                            data-bs-target="#price">
                            Price & Capacity
                        </button>

                        <button type="button" class="nav-link"
                            data-bs-toggle="tab"
                            data-bs-target="#seo">
                            SEO
                        </button>
                    </div>
                </nav>


                    <div class="tab-content">

                        {{-- GENERAL --}}
                        <div class="tab-pane fade show active" id="general">
                            <div class="row g-3">
                                <div class="col-sm-6">
                                    <label class="form-label"><b>Room Name</b></label>
                                    <input type="text" name="name" id="room_name" class="form-control" required>
                                </div>

                                <div class="col-sm-6">
                                    <label class="form-label"><b>Status</b></label>
                                    <select class="form-control">
                                        <option>Available</option>
                                        <option>Unavailable</option>
                                    </select>
                                </div>

                                <div class="col-12">
                                    <label class="form-label"><b>Description</b></label>
                                    <textarea name="description" id="room_description"
                                        class="form-control" rows="4"></textarea>
                                </div>
                            </div>
                        </div>

                        {{-- PRICE --}}
                        <div class="tab-pane fade" id="price">
                            <div class="row g-3">
                                <div class="col-sm-6">
                                    <label class="form-label"><b>Price</b></label>
                                    <input type="number" name="price" id="room_price"
                                        class="form-control" required>
                                </div>

                                <div class="col-sm-6">
                                    <label class="form-label"><b>Capacity</b></label>
                                    <input type="number" name="capacity" id="room_capacity"
                                        class="form-control" required>
                                </div>
                            </div>
                        </div>

                        {{-- SEO --}}
                        <div class="tab-pane fade" id="seo">
                            <div class="row g-3">
                                <div class="col-sm-6">
                                    <label class="form-label"><b>Meta Title</b></label>
                                    <input type="text" class="form-control">
                                </div>
                                <div class="col-12">
                                    <label class="form-label"><b>Meta Description</b></label>
                                    <textarea class="form-control" rows="3"></textarea>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button class="btn btn-success">Save</button>
                </div>

            </form>
        </div>
    </div>
</div>
<script>
document.querySelectorAll('.editRoom').forEach(btn => {
    btn.addEventListener('click', function () {
        document.getElementById('room_id').value = this.dataset.id;
        document.getElementById('room_name').value = this.dataset.name;
        document.getElementById('room_price').value = this.dataset.price;
        document.getElementById('room_capacity').value = this.dataset.capacity;
        document.getElementById('room_description').value = this.dataset.description;
    });
});
</script>

@endsection
