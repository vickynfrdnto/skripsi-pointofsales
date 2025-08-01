<?php

namespace App\Http\Controllers;

use Auth;
use Session;
use App\Pelanggan;
use App\Acces;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;

class PelangganController extends Controller
{
    // Show View Account
    public function viewPelanggan()
    {
        $id_account = Auth::id();
        $check_access = Acces::where('user', $id_account)
        ->first();
        if($check_access->kelola_akun == 1){
            $pelanggans = Pelanggan::all();

            return view('manage_pelanggan.pelanggan', compact('pelanggans'));    
        }else{
            return back();
        }
    }

    // Show View New Account
    public function viewNewPelanggan()
    {
        $id_account = Auth::id();
        $check_access = Acces::where('user', $id_account)
        ->first();
        if($check_access->kelola_akun == 1){
        	return view('manage_pelanggan.new_pelanggan');
        }else{
            return back();
        }
    }

    // Filter Account Table
    public function filterTable($id)
    {
        $id_account = Auth::id();
        $check_access = Acces::where('user', $id_account)
        ->first();
        if($check_access->kelola_akun == 1){
        	$pelanggans = Pelanggan::orderBy($id, 'asc')
            ->get();

        	return view('manage_pelanggan.filter_table.table_view', compact('pelanggans'));
        }else{
            return back();
        }
    }

    // Create New Account
    public function createPelanggan(Request $req)
    {
        $id_account = Auth::id();
        $check_access = Acces::where('user', $id_account)
        ->first();
        $check_email = Pelanggan::all()
        	->where('email', $req->email)
        	->count();
        if($check_access->kelola_akun == 1){
            if($check_email != 0){
                Session::flash('email_error', 'Email telah digunakan, silakan coba lagi');
        		return back();
            } else {
                $pelanggans = new Pelanggan;
                $pelanggans->nama = $req->nama;
                $pelanggans->email = $req->email;
                $pelanggans->notel = $req->notel;
                $pelanggans->alamat = $req->alamat;
                $pelanggans->save();
    
                Session::flash('create_success', 'Pelanggan baru berhasil dibuat');
                return redirect('/pelanggan');
            }
        }else{
            return back();
        }
    }

    // Edit Account
    public function editPelanggan($id)
    {
        $id_account = Auth::id();
        $check_access = Acces::where('user', $id_account)
        ->first();
        if($check_access->kelola_akun == 1){
            $pelanggan = Pelanggan::find($id);

            return response()->json(['pelanggan' => $pelanggan]);
        }else{
            return back();
        }
    }

    // Update Account
    public function updatePelanggan(Request $req)
    {
        $id_account = Auth::id();
        $check_access = Acces::where('user', $id_account)
        ->first();
        $check_email = Pelanggan::all()
                ->where('email', $req->email)
                ->count();
        if($check_access->kelola_akun == 1){
            if($check_email != 0){
                Session::flash('email_error', 'Email telah digunakan, silakan coba lagi');
                
        		return back();
            } else {
                $pelanggans = Pelanggan::find($req->id);
                $pelanggans->nama = $req->nama;
                $pelanggans->email = $req->email;
                $pelanggans->notel = $req->notel;
                $pelanggans->alamat = $req->alamat;
                $pelanggans->save();
    
                Session::flash('update_success', 'Pelanggan baru berhasil dibuat');
                return redirect('/pelanggan');
            }
        }else{
            return back();
        }
    }

    // Delete Account
    public function deletePelanggan($id)
    {
        $id_account = Auth::id();
        $check_access = Acces::where('user', $id_account)
        ->first();
        if($check_access->kelola_akun == 1){
            Pelanggan::destroy($id);
            Acces::where('user', $id)->delete();

            Session::flash('delete_success', 'Pelanggan berhasil dihapus');

            return back();
        }else{
            return back();
        }
    }
}
