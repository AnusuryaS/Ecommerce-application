<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ecommerce extends Model
{
    use HasFactory;
    protected $table = 'ecommerces';
    protected $primaryKey = 'id';
    protected $fillable = ['Product_name', 'Product_desc', 'Price', 'Product_quantity'];
}
