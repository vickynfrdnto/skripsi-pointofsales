<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    // Initialize
    protected $fillable = [
        'kode_transaksi', 'kode_barang', 'foto', 'nama_barang', 'merek', 'harga', 'jumlah', 'total_barang', 'subtotal', 'diskon', 'total', 'bayar', 'kembali', 'id_kasir', 'kasir', 'jenis',
    ];


}
