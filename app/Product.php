<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\BarangMovement;

class Product extends Model
{
    protected $fillable = [
        'kode_barang',
        'jenis_barang',
        'nama_barang',
        'foto',
        'berat_barang',
        'merek',
        'stok',
        'harga',
        'keterangan',
    ];

    public function barangMovements()
    {
        return $this->hasMany(BarangMovement::class, 'kode_barang', 'kode_barang');
    }
}
