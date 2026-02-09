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
                    <th>Image2</th>
                    <th>Image3</th>
                    <th>Image4</th>
                    <th>Name</th>
                    <th>Type</th>
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
                    <td>
                        @if($room->image2)
                            <img src="{{ asset('storage/'.$room->image2) }}" width="60" class="rounded">
                        @else
                            <span class="text-muted">No Image</span>
                        @endif
                    </td>
                    <td>
                        @if($room->image3)
                            <img src="{{ asset('storage/'.$room->image3) }}" width="60" class="rounded">
                        @else
                            <span class="text-muted">No Image</span>
                        @endif
                    </td>

                    <td>
                        @if($room->image4)
                            <img src="{{ asset('storage/'.$room->image4) }}" width="60" class="rounded">
                        @else
                            <span class="text-muted">No Image</span>
                        @endif
                    </td>
                    <td>{{ $room->name }}</td>
                    <td>{{ $room->category->name?? 'N/A' }}</td>
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
                            data-category_id="{{ $room->category_id }}"
                            data-image="{{ $room->image }}"
                            data-image="{{ $room->image2 }}"
                            data-image="{{ $room->image3 }}"
                            data-image="{{ $room->image4 }}"
                            data-meta_image="{{ $room->meta_image }}"
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

{{-- ================= Add/EDIT MODAL ================= --}}
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
                                <div class="col-md-4">
                                    <label class="form-label fw-bold">Room Name</label>
                                    <input type="text" name="name" id="room_name" class="form-control" required>
                                </div>
                              <div class="col-md-4">
                                    <label class="form-label fw-bold">Room Type</label>
                                    <select name="category_id" id="room_category_id" class="form-select" required>
                                        <option value="">Select Type</option>
                                        @foreach($categories as $category)
                                            <option value="{{ $category->id }}">{{ $category->name }}</option>
                                        @endforeach
                                    </select>
                                </div>


                               
                                 <div class="col-md-4">
                                    <label class="form-label fw-bold">Room Image</label>
                                    <input type="file" name="image" class="form-control">
                                    {{-- Existing Image Preview --}}
                                    <div class="mt-2" id="existing_room_image">
                                        <span class="text-muted">No Image</span>
                                    </div>
                                </div>
                                 <div class="col-md-4">
                                    <label class="form-label fw-bold">Room Image2</label>
                                    <input type="file" name="image2" class="form-control">
                                    {{-- Existing Image Preview --}}
                                    <div class="mt-2" id="existing_room_image2">
                                        <span class="text-muted">No Image</span>
                                    </div>
                                </div>
                                 <div class="col-md-4">
                                    <label class="form-label fw-bold">Room Image3</label>
                                    <input type="file" name="image3" class="form-control">
                                    {{-- Existing Image Preview --}}
                                    <div class="mt-2" id="existing_room_image3">
                                        <span class="text-muted">No Image</span>
                                    </div>
                                </div>
                                 <div class="col-md-4">
                                    <label class="form-label fw-bold">Room Image4</label>
                                    <input type="file" name="image4" class="form-control">
                                    {{-- Existing Image Preview --}}
                                    <div class="mt-2" id="existing_room_image4">
                                        <span class="text-muted">No Image</span>
                                    </div>
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
                                    {{-- Existing Meta Image Preview --}}
                                    <div class="mt-2" id="existing_meta_image">
                                        <span class="text-muted">No Image</span>
                                    </div>
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
                    <div class="col-12 text-center mb-3">
                        <img id="view_room_image2" src="" alt="Room Image2" class="img-fluid rounded" style="max-height:250px;">
                    </div>
                    <div class="col-12 text-center mb-3">
                        <img id="view_room_image3" src="" alt="Room Image3" class="img-fluid rounded" style="max-height:250px;">
                    </div>
                    <div class="col-12 text-center mb-3">
                        <img id="view_room_image4" src="" alt="Room Image4" class="img-fluid rounded" style="max-height:250px;">
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




{{-- ================= Add/Edit SCRIPT ================= --}}
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
        room_category_id.value = this.dataset.category_id;
        // Show existing image
        if(this.dataset.image) {
            existing_room_image.innerHTML = `<img src="/storage/${this.dataset.image}" class="img-fluid rounded" width="120">`;
        } else {
            existing_room_image.innerHTML = '<span class="text-muted">No Image</span>';
        }
        if(this.dataset.image2) {
            existing_room_image2.innerHTML = `<img src="/storage/${this.dataset.image2}" class="img-fluid rounded" width="120">`;
        } else {
            existing_room_image2.innerHTML = '<span class="text-muted">No Image</span>';
        }
        if(this.dataset.image3) {
            existing_room_image3.innerHTML = `<img src="/storage/${this.dataset.image3}" class="img-fluid rounded" width="120">`;
        } else {
            existing_room_image3.innerHTML = '<span class="text-muted">No Image</span>';
        }
        if(this.dataset.image4) {
            existing_room_image4.innerHTML = `<img src="/storage/${this.dataset.image4}" class="img-fluid rounded" width="120">`;
        } else {
            existing_room_image4.innerHTML = '<span class="text-muted">No Image</span>';
        }
        if(this.dataset.meta_image) {
            existing_meta_image.innerHTML = `<img src="/storage/${this.dataset.meta_image}" class="img-fluid rounded" width="120">`;
        } else {
            existing_meta_image.innerHTML = '<span class="text-muted">No Image</span>';
        }

        // Change submit button text to "Update"
        roomForm.querySelector('button[type="submit"]').textContent = "Update";


        // Update form action and method
        roomForm.action = "/admin/rooms/" + this.dataset.id;
        document.getElementById('form_method').value = "PUT";
    });
});
</script>

{{-- =================VIEW SCRIPT TO FILL MODAL ================= --}}
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
     document.getElementById('view_room_image2').src = room.image2 ? '/storage/' + room.image2 : '/no-image.png';
      document.getElementById('view_room_image3').src = room.image3 ? '/storage/' + room.image3 : '/no-image.png';
       document.getElementById('view_room_image4').src = room.image ? '/storage/' + room.image4 : '/no-image.png';
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

@endsection
