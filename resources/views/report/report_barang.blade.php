@extends('templates/main')
@section('css')
<link rel="stylesheet" href="{{ asset('css/report/report_transaction/style.css') }}">
<link rel="stylesheet" href="{{ asset('plugins/css/datedropper.css') }}">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
@endsection
@section('content')
<div class="container-fluid mt-4">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h4 class="mb-0">Laporan Transaksi</h4>
    {{-- <div class="dropdown">
      <button class="btn btn-outline-primary dropdown-toggle" type="button" data-toggle="dropdown">
        <i class="mdi mdi-export"></i> Export Laporan
      </button>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Export ke Excel</a>
        <a class="dropdown-item" href="#">Export ke PDF</a>
      </div> --}}
    </div>
  </div>

  <form method="GET" action="{{ route('report.barang') }}" class="bg-white p-3 rounded shadow-sm mb-4">
    <div class="form-row align-items-end">
      {{-- <div class="form-group col-md-4">
        <label for="search">Cari Transaksi</label>
        <input type="text" name="search" class="form-control" placeholder="Masukkan nama produk">
      </div> --}}
      <div class="form-group col-md-3">
        <label for="tanggal">Tanggal</label>
        <select name="tanggal" class="form-control">
          <option value="">Semua</option>
          @foreach ($dates as $date)
            <option value="{{ $date }}" {{ $tanggal == $date ? 'selected' : '' }}>
              {{ \Carbon\Carbon::parse($date)->format('d-m-Y') }}
            </option>
          @endforeach
        </select>
      </div>
      <div class="form-group col-md-2">
        <button type="submit" class="btn btn-primary btn-block">Filter</button>
      </div>
    </div>
  </form>

  <div class="table-responsive shadow-sm bg-white rounded">
    <table class="table table-bordered mb-0">
      <thead class="thead-light">
        <tr>
          <th>Tanggal</th>
          <th>Nama Produk</th>
          <th>Jenis Barang</th>
        </tr>
      </thead>
      <tbody>
        @forelse ($filteredData as $transaction)
          <tr>
            <td>{{ $transaction->created_at->format('d-m-Y') }}</td>
            <td>{{ $transaction->nama_barang }}</td>
            <td>{{ $transaction->jenis }}</td>
          </tr>
        @empty
          <tr>
            <td colspan="3" class="text-center">Tidak ada data.</td>
          </tr>
        @endforelse
      </tbody>
    </table>
  </div>
</div>

@endsection
@section('script')
<script src="{{ asset('plugins/js/datedropper.js') }}"></script>
<script src="{{ asset('js/report/report_transaction/script.js') }}"></script>
<script type="text/javascript">
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: [
        @if(count($incomes) != 0)
        @foreach($incomes as $income)
        "{{ date('d M, Y', strtotime($income)) }}",
        @endforeach
        @endif
        ],
        datasets: [{
            label: '',
            data: [
            @if(count($incomes) != 0)
            @foreach($incomes as $income)
            @php
            $total = \App\Transaction::whereDate('created_at', $income)
            ->sum('total');
            @endphp
            "{{ $total }}",
            @endforeach
            @endif
            ],
            backgroundColor: 'RGB(211, 234, 252)',
            borderColor: 'RGB(44, 77, 240)',
            borderWidth: 3
        }]
    },
    options: {
        title: {
            display: false,
            text: ''
        },
        scales: {
            yAxes: [{
              ticks: {
                  beginAtZero: false,
                  callback: function(value, index, values) {
                    if (parseInt(value) >= 1000) {
                       return 'Rp. ' + value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    } else {
                       return 'Rp. ' + value;
                    }
                 }
              }
          }]
        },
        legend: {
            display: false
        },
        tooltips: {
            callbacks: {
               label: function(tooltipItem) {
                      return tooltipItem.yLabel;
               }
            }
        }
    }
});

function changeData(chart, label_array, data_array){
  chart.data = {
      labels: label_array,
      datasets: [{
          label: '',
          data: data_array,
          backgroundColor: 'RGB(211, 234, 252)',
          borderColor: 'RGB(44, 77, 240)',
          borderWidth: 3
      }]
  }
  chart.update();
}

$(document).on('submit', 'form[name=filter_form]', function(e){
  e.preventDefault();
  var request = new FormData(this);
  $.ajax({
      url: "{{ url('/report/transaction/filter') }}",
      method: "POST",
      data: request,
      contentType: false,
      cache: false,
      processData: false,
      success:function(data){
        $('.list-date').html(data);
      }
  });
});

$(document).on('click', '.chart-filter', function(e){
  e.preventDefault();
  var data_filter = $(this).attr('data-filter');
  if(data_filter == 'minggu'){
    $('.btn-filter-chart').html('1 Minggu Terakhir');
  }else if(data_filter == 'bulan'){
    $('.btn-filter-chart').html('1 Bulan Terakhir');
  }else if(data_filter == 'tahun'){
    $('.btn-filter-chart').html('1 Tahun Terakhir');
  }
  $.ajax({
    url: "{{ url('/report/transaction/chart') }}/" + data_filter,
    method: "GET",
    success:function(response){
      if(response.incomes.length != 0){
        changeData(myChart, response.incomes, response.total);
      }
    }
  });
});
</script>

<script>
  document.getElementById('export-button').addEventListener('click', function() {
    document.getElementById('export-form').submit();
  });
</script>
<script type="text/javascript">
  @if ($message = Session::get('import_failed'))
    swal(
        "",
        "{{ $message }}",
        "error"
    );
  @endif
</script>
@endsection
