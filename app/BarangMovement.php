<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BarangMovement extends Model
{
    protected $fillable = [
        'kode_barang',
        'jumlah',
        'jenis_pergerakan', // misal: masuk/keluar
        'tanggal',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class, 'kode_barang', 'kode_barang');
    }
}
