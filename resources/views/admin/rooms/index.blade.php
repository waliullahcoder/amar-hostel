@extends('layouts.admin.app')

@section('content')

{{-- SUCCESS ALERT --}}
@if(session('success'))
<div class="alert alert-success alert-dismissible fade show">
    {{ session('success') }}
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
@endif

@if(session('error'))
<div class="alert alert-danger alert-dismissible fade show">
    {{ session('error') }}
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
@endif
<div class="d-flex justify-content-between align-items-center mb-4">
    <h4 class="fw-bold mb-0">Room Management</h4>
    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#roomModal" onclick="resetRoomForm()">
        + Add Room
    </button>
</div>

<div class="card shadow-sm">
    <div class="card-body table-responsive">
        <table class="table table-bordered table-hover align-middle mb-0">
            <thead class="table-light">
                <tr>
                    <th>#</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Capacity</th>
                    <th>Status</th>
                    <th width="130">Action</th>
                </tr>
            </thead>
            <tbody>
                @forelse($rooms as $room)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>
                        @if($room->image)
                            <img src="{{ asset('storage/'.$room->image) }}" width="60" class="rounded">
                        @else
                            <span class="text-muted">No Image</span>
                        @endif
                    </td>
                    <td>{{ $room->name }}</td>
                    <td>৳ {{ number_format($room->price) }}</td>
                    <td>{{ $room->capacity }}</td>
                    <td>
                        <span class="badge bg-success">Active</span>
                    </td>
                    <td>
                        <button
                            class="btn btn-sm btn-info editRoom"
                            data-id="{{ $room->id }}"
                            data-name="{{ $room->name }}"
                            data-price="{{ $room->price }}"
                            data-capacity="{{ $room->capacity }}"
                            data-description="{{ $room->description }}"
                            data-meta_title="{{ $room->meta_title }}"
                            data-meta_keywords="{{ $room->meta_keywords }}"
                            data-meta_description="{{ $room->meta_description }}"
                            data-bs-toggle="modal"
                            data-bs-target="#roomModal">
                            Edit
                        </button>
                        <button class="btn btn-sm btn-success" onclick='viewRoom(@json($room))'>
                            View
                        </button>
                         <form action="{{ route('admin.rooms.destroy', $room->id) }}" method="POST" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this room?');">
                            @csrf
                            @method('DELETE')
                            <button class="btn btn-sm btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="7" class="text-center text-muted">No rooms found</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>

{{-- ================= MODAL ================= --}}
<div class="modal fade" id="roomModal">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
        <div class="modal-content">

            <form method="POST"
                  action="{{ route('admin.rooms.store') }}"
                  enctype="multipart/form-data"
                  id="roomForm">
                @csrf
                <input type="hidden" name="_method" id="form_method" value="POST">
                <input type="hidden" name="id" id="room_id">

                <div class="modal-header">
                    <h5 class="modal-title">Room Information</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">

                    {{-- Tabs --}}
                    <nav class="nav__wrapper mb-3">
                        <div class="nav nav-tabs">
                            <button type="button" class="nav-link active" data-bs-toggle="tab" data-bs-target="#general">
                                General
                            </button>
                            <button type="button" class="nav-link" data-bs-toggle="tab" data-bs-target="#price">
                                Price & Capacity
                            </button>
                            <button type="button" class="nav-link" data-bs-toggle="tab" data-bs-target="#seo">
                                SEO
                            </button>
                        </div>
                    </nav>

                    <div class="tab-content">

                        {{-- GENERAL --}}
                        <div class="tab-pane fade show active" id="general">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Room Name</label>
                                    <input type="text" name="name" id="room_name" class="form-control" required>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Room Image</label>
                                    <input type="file" name="image" class="form-control">
                                </div>

                                <div class="col-12">
                                    <label class="form-label fw-bold">Description</label>
                                    <textarea name="description" id="room_description" class="form-control" rows="4"></textarea>
                                </div>
                            </div>
                        </div>

                        {{-- PRICE --}}
                        <div class="tab-pane fade" id="price">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Price</label>
                                    <input type="number" name="price" id="room_price" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Capacity</label>
                                    <input type="number" name="capacity" id="room_capacity" class="form-control" required>
                                </div>
                            </div>
                        </div>

                        {{-- SEO --}}
                        <div class="tab-pane fade" id="seo">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Meta Title</label>
                                    <input type="text" name="meta_title" id="meta_title" class="form-control">
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Meta Keywords</label>
                                    <input type="text" name="meta_keywords" id="meta_keywords" class="form-control">
                                </div>

                                <div class="col-12">
                                    <label class="form-label fw-bold">Meta Description</label>
                                    <textarea name="meta_description" id="meta_description" class="form-control" rows="3"></textarea>
                                </div>

                                <div class="col-12">
                                    <label class="form-label fw-bold">Meta Image</label>
                                    <input type="file" name="meta_image" class="form-control">
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-success">Save</button>
                </div>

            </form>
        </div>
    </div>
</div>


{{-- ================= VIEW MODAL ================= --}}
{{-- ================= VIEW ROOM INFO MODAL ================= --}}
<div class="modal fade" id="viewRoomModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">

            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title">Room Information</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">

                <div class="row g-3">

                    {{-- Room Image --}}
                    <div class="col-12 text-center mb-3">
                        <img id="view_room_image" src="" alt="Room Image" class="img-fluid rounded" style="max-height:250px;">
                    </div>

                    {{-- Room Name --}}
                    <div class="col-md-6">
                        <label class="fw-bold">Room Name</label>
                        <p id="view_room_name"></p>
                    </div>

                    {{-- Price --}}
                    <div class="col-md-6">
                        <label class="fw-bold">Price</label>
                        <p id="view_room_price"></p>
                    </div>

                    {{-- Capacity --}}
                    <div class="col-md-6">
                        <label class="fw-bold">Capacity</label>
                        <p id="view_room_capacity"></p>
                    </div>

                    {{-- Status --}}
                    <div class="col-md-6">
                        <label class="fw-bold">Status</label>
                        <p id="view_room_status"></p>
                    </div>

                    {{-- Description --}}
                    <div class="col-12">
                        <label class="fw-bold">Description</label>
                        <p id="view_room_description"></p>
                    </div>

                    {{-- SEO Fields --}}
                    <div class="col-12">
                        <hr>
                        <h6 class="fw-bold">SEO Information</h6>
                    </div>

                    <div class="col-md-6">
                        <label class="fw-bold">Meta Title</label>
                        <p id="view_meta_title"></p>
                    </div>

                    <div class="col-md-6">
                        <label class="fw-bold">Meta Keywords</label>
                        <p id="view_meta_keywords"></p>
                    </div>

                    <div class="col-12">
                        <label class="fw-bold">Meta Description</label>
                        <p id="view_meta_description"></p>
                    </div>

                    <div class="col-12 text-center">
                        <label class="fw-bold">Meta Image</label>
                        <div>
                            <img id="view_meta_image" src="" alt="Meta Image" class="img-fluid rounded" style="max-height:150px;">
                        </div>
                    </div>

                </div>

            </div>

            <div class="modal-footer">
                <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>

{{-- ================= SCRIPT TO FILL MODAL ================= --}}
<script>
function viewRoom(room) {
    // Room info
    document.getElementById('view_room_name').textContent = room.name;
    document.getElementById('view_room_price').textContent = '৳ ' + Number(room.price).toLocaleString();
    document.getElementById('view_room_capacity').textContent = room.capacity;
    document.getElementById('view_room_status').textContent = room.available ? 'Available' : 'Unavailable';
    document.getElementById('view_room_description').textContent = room.description ?? 'N/A';
    
    // Images
    document.getElementById('view_room_image').src = room.image ? '/storage/' + room.image : '/no-image.png';
    document.getElementById('view_meta_image').src = room.meta_image ? '/storage/' + room.meta_image : '/no-image.png';

    // SEO
    document.getElementById('view_meta_title').textContent = room.meta_title ?? 'N/A';
    document.getElementById('view_meta_keywords').textContent = room.meta_keywords ?? 'N/A';
    document.getElementById('view_meta_description').textContent = room.meta_description ?? 'N/A';

    // Show modal
    var modal = new bootstrap.Modal(document.getElementById('viewRoomModal'));
    modal.show();
}
</script>



{{-- ================= SCRIPT ================= --}}
<script>
function resetRoomForm() {
    const form = document.getElementById('roomForm');
    form.reset();
    form.action = "{{ route('admin.rooms.store') }}";
    document.getElementById('form_method').value = "POST";
    document.getElementById('room_id').value = "";
}

document.querySelectorAll('.editRoom').forEach(btn => {
    btn.addEventListener('click', function () {
        // Fill form fields
        room_id.value = this.dataset.id;
        room_name.value = this.dataset.name;
        room_price.value = this.dataset.price;
        room_capacity.value = this.dataset.capacity;
        room_description.value = this.dataset.description;
        meta_title.value = this.dataset.meta_title ?? '';
        meta_keywords.value = this.dataset.meta_keywords ?? '';
        meta_description.value = this.dataset.meta_description ?? '';

        // Update form action and method
        roomForm.action = "/admin/rooms/" + this.dataset.id;
        document.getElementById('form_method').value = "PUT";
    });
});
</script>

@endsection
