<?php

namespace App\Http\Controllers;

use Session;
use Carbon\Carbon;
use App\Market;
use App\Transaction;
use Illuminate\Http\Request;

class ViewManageController extends Controller
{
    // Show View Dashboard
    public function viewDashboard()
    {
    	$kd_transaction = Transaction::select('kode_transaksi')
    	->latest()
    	->distinct()
    	->take(5)
    	->get();
        $transactions = Transaction::all();
        $array = array();
        foreach ($transactions as $no => $transaction) {
            array_push($array, $transactions[$no]->created_at->toDateString());
        }
        $dates = array_unique($array);
        rsort($dates);

        $arr_ammount = count($dates);
        $incomes_data = array();
        if($arr_ammount > 7){
            for ($i = 0; $i < 7; $i++) { 
                array_push($incomes_data, $dates[$i]);  
            }
        }elseif($arr_ammount > 0){
            for ($i = 0; $i < $arr_ammount; $i++) { 
                array_push($incomes_data, $dates[$i]);
            }
        }
        $incomes = array_reverse($incomes_data);
        $kode_transaksi_dis = Transaction::select('kode_transaksi')
        ->distinct()
        ->get();
        $kode_transaksi_dis_daily = Transaction::whereDate('created_at', Carbon::now())
        ->select('kode_transaksi')
        ->distinct()
        ->get();
        $all_incomes = 0;
        $incomes_daily = 0;
        foreach ($kode_transaksi_dis as $kode) {
            $transaksi = Transaction::where('kode_transaksi', $kode->kode_transaksi)->first();
            $all_incomes += $transaksi->total;
        }
        foreach ($kode_transaksi_dis_daily as $kode) {
            $transaksi_daily = Transaction::where('kode_transaksi', $kode->kode_transaksi)->first();
            $incomes_daily += $transaksi_daily->total;
        }
        $customers_daily = count($kode_transaksi_dis_daily);
        $min_date = Transaction::min('created_at');
        $max_date = Transaction::max('created_at');
        $market = Market::first();

    	return view('dashboard', compact('kd_transaction', 'incomes', 'incomes_daily', 'customers_daily', 'all_incomes', 'min_date', 'max_date', 'market'));
    }

    // Filter Chart Dashboard
    public function filterChartDashboard($filter)
    {
        if ($filter == 'pemasukan') {
            $startDate = now()->subWeek()->startOfDay(); // Menghitung tanggal mulai satu minggu yang lalu
            $endDate = now()->endOfDay(); // Menghitung tanggal sekarang
            
            $transactions = Transaction::whereBetween('created_at', [$startDate, $endDate])
                ->distinct('kode_transaksi')
                ->get(['created_at', 'total']);
        
            $incomes = array();
            $total = array();
        
            foreach ($transactions as $transaction) {
                $date = date('d F Y', strtotime($transaction->created_at));
        
                if (!in_array($date, $incomes)) {
                    array_push($incomes, $date);
                }
        
                $total_amount = isset($total[$date]) ? $total[$date] : 0;
                $total[$date] = $total_amount + $transaction->total;
            }
        
            return response()->json([
                'incomes' => $incomes,
                'total' => array_values($total)
            ]);
        }
        
        
         else {
            $supplies = Transaction::all();
            $array = array();
            foreach ($supplies as $no => $supply) {
                array_push($array, $supplies[$no]->created_at->toDateString());
            }
            $dates = array_unique($array);
            rsort($dates);
            $arr_amount = count($dates);
            $customers_data = array();
            if ($arr_amount > 7) {
                for ($i = 0; $i < 7; $i++) {
                    array_push($customers_data, $dates[$i]);
                }
            } elseif ($arr_amount > 0) {
                for ($i = 0; $i < $arr_amount; $i++) {
                    array_push($customers_data, $dates[$i]);
                }
            }
            $customers = array_reverse($customers_data);
            $jumlah = array();
            foreach ($customers as $no => $customer) {
                $count = Transaction::whereDate('created_at', $customer)->distinct('kode_transaksi')->count('kode_transaksi');
                array_push($jumlah, $count);
            }
        
            return response()->json([
                'customers' => $customers,
                'jumlah' => $jumlah
            ]);
        }       
    }

    // Update Market
    public function updateMarket(Request $req)
    {
        $market = Market::first();
        $market->nama_toko = $req->nama_toko;
        $market->no_telp = $req->no_telp;
        $market->alamat = $req->alamat;
        $market->save();

        Session::flash('update_success', 'Pengaturan berhasil diubah');

        return back();
    }
}