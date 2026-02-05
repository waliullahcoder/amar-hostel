<?php
// app/Models/Room.php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Room extends Model
{
    use HasFactory;

    protected $fillable = [
    'name',
    'slug',
    'description',
    'price',
    'capacity',
    'image',
    'available',
    'meta_title',
    'meta_description',
    'meta_keywords',
    'meta_image',
  ];
}
