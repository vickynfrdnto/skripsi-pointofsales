@extends('templates/main')
@section('css')
<link rel="stylesheet" href="{{ asset('css/manage_product/product/style.css') }}">
@endsection
@section('content')
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<div class="row page-title-header">
  <div class="col-12">
    <div class="page-header d-flex justify-content-between align-items-center">
      <h4 class="page-title">Daftar Pelanggan</h4>
      <div class="d-flex justify-content-start">
      	{{-- <div class="dropdown">
	        <button class="btn btn-icons btn-inverse-primary btn-filter shadow-sm" type="button" id="dropdownMenuIconButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          <i class="mdi mdi-filter-variant"></i>
	        </button>
	        <div class="dropdown-menu" aria-labelledby="dropdownMenuIconButton1">
	          <h6 class="dropdown-header">Urut Berdasarkan :</h6>
	          <div class="dropdown-divider"></div>
	          <a href="#" class="dropdown-item filter-btn" data-filter="nama">Nama</a>
            <a href="#" class="dropdown-item filter-btn" data-filter="email">Email</a>
            <a href="#" class="dropdown-item filter-btn" data-filter="role">Posisi</a>
	        </div>
	      </div> --}}
        <div class="dropdown dropdown-search">
          <button class="btn btn-icons btn-inverse-primary btn-filter shadow-sm ml-2" type="button" id="dropdownMenuIconButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="mdi mdi-magnify"></i>
          </button>
          <div class="dropdown-menu search-dropdown" aria-labelledby="dropdownMenuIconButton1">
            <div class="row">
              <div class="col-11">
                <input type="text" class="form-control" name="search" placeholder="Cari Pelanggan">
              </div>
            </div>
          </div>
        </div>
	      <a href="{{ url('/pelanggan/new') }}" class="btn btn-icons btn-inverse-primary btn-new ml-2">
	      	<i class="mdi mdi-plus"></i>
	      </a>
      </div>
    </div>
  </div>
</div>
<div class="row modal-group">
  <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <form action="{{ url('/pelanggan/update') }}" method="post" name="update_form" enctype="multipart/form-data">
          <div class="modal-header">
            <h5 class="modal-title" id="editModalLabel">Edit Pelanggan</h5>
            <button type="button" class="close close-btn" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body" id="edit-modal-body">
              @csrf
              <div class="row" hidden="">
                <div class="col-12">
                  <input type="text" name="id">
                </div>
              </div>
              <div class="form-group row">
                <label class="col-lg-3 col-md-3 col-sm-12 col-form-label font-weight-bold">Nama Pelanggan</label>
                <div class="col-lg-9 col-md-9 col-sm-12 col-12">
                  <input type="text" class="form-control" name="nama">
                </div>
              </div>
              <div class="form-group row">
                <label class="col-lg-3 col-md-3 col-sm-12 col-form-label font-weight-bold">Email Pelanggan</label>
                <div class="col-lg-9 col-md-9 col-sm-12">
                  <input type="text" class="form-control" name="email">
                </div>
              </div>
              <div class="form-group row">
                <label class="col-lg-3 col-md-3 col-sm-12 col-form-label font-weight-bold">No Telp Pelanggan</label>
                <div class="col-lg-9 col-md-9 col-sm-12">
                  <input type="text" class="form-control" name="notel">
                </div>
              </div>
              <div class="form-group row">
                <label class="col-lg-3 col-md-3 col-sm-12 col-form-label font-weight-bold">Alamat Pelanggan</label>
                <div class="col-lg-9 col-md-9 col-sm-12">
                  <input type="text" class="form-control" name="alamat">
                </div>
              </div>
          </div>
          <div class="modal-footer" id="edit-modal-footer">
            <button type="submit" class="btn btn-update"><i class="mdi mdi-content-save"></i> Simpan</button>
          </div>
          <div class="modal-footer" id="scan-modal-footer" hidden="">
            <button type="button" class="btn btn-primary btn-sm font-weight-bold rounded-0 btn-continue">Lanjutkan</button>
            <button type="button" class="btn btn-outline-secondary btn-sm font-weight-bold rounded-0 btn-repeat">Ulangi</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-12 grid-margin">
    <div class="card card-noborder b-radius">
      <div class="card-body">
        <div class="row">
        	<div class="col-12 table-responsive">
        		<table class="table table-custom">
              <thead>
                <tr>
                  <th>Nama</th>
                  <th>Email</th>
                  <th>No Telp</th>
                  <th>Alamat</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                @foreach($pelanggans as $pelanggan)
              	<tr>
                  <td>{{ $pelanggan->nama }}</td>
                  <td>{{ $pelanggan->email }}</td>
                  <td>{{ $pelanggan->notel }}</td>
                  <td>{{ $pelanggan->alamat }}</td>
                  <td>
                    <button type="button" class="btn btn-edit btn-icons btn-rounded btn-secondary" data-toggle="modal" data-target="#editModal" data-edit="{{ $pelanggan->id }}">
                        <i class="fa-solid fa-pen-nib"></i>
                    </button>
                    <button type="button" class="btn btn-icons btn-rounded btn-secondary ml-1 btn-delete" data-delete="{{ $pelanggan->id }}" data-nama="{{ $pelanggan->nama }}">
                        <i class="fa-solid fa-trash"></i>
                    </button>
                  </td>
                </tr>
                @endforeach
              </tbody>
            </table>
        	</div>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection
@section('script')
<script src="{{ asset('plugins/js/quagga.min.js') }}"></script>
<script src="{{ asset('js/manage_product/pelanggan/script.js') }}"></script>
<script type="text/javascript">
  @if ($message = Session::get('create_success'))
    swal(
        "Berhasil!",
        "{{ $message }}",
        "success"
    );
  @endif

  @if ($message = Session::get('update_success'))
    swal(
        "Berhasil!",
        "{{ $message }}",
        "success"
    );
  @endif

  @if ($message = Session::get('delete_success'))
    swal(
        "Berhasil!",
        "{{ $message }}",
        "success"
    );
  @endif  

  @if ($message = Session::get('import_success'))
    swal(
        "Berhasil!",
        "{{ $message }}",
        "success"
    );
  @endif

  @if ($message = Session::get('update_failed'))
    swal(
        "",
        "{{ $message }}",
        "error"
    );
  @endif

  @if ($message = Session::get('supply_system_status'))
    swal(
        "",
        "{{ $message }}",
        "success"
    );
  @endif

  $(document).on('click', '.filter-btn', function(e){
    e.preventDefault();
    var data_filter = $(this).attr('data-filter');
    $.ajax({
      method: "GET",
      url: "{{ url('/pelanggan/filter') }}/" + data_filter,
      success:function(data)
      {
        $('tbody').html(data);
      }
    });
  });

  $(document).on('click', '.btn-edit', function(){
    var data_edit = $(this).attr('data-edit');
    $.ajax({
      method: "GET",
      url: "{{ url('/pelanggan/edit') }}/" + data_edit,
      success:function(response)
      {
        $('input[name=id]').val(response.pelanggan.id);
        $('input[name=nama]').val(response.pelanggan.nama);
        $('input[name=email]').val(response.pelanggan.email);
        $('input[name=notel]').val(response.pelanggan.notel);
        $('input[name=alamat]').val(response.pelanggan.alamat);
        validator.resetForm();
      }
    });
  });

  $(document).on('click', '.btn-delete', function(e){
    e.preventDefault();
    var data_delete = $(this).attr('data-delete');
    var nama = $(this).attr('data-nama');
    swal({
      title: "Apa Anda Yakin?",
      text: "Pelanggan dengan Nama "+nama+" akan terhapus, klik oke untuk melanjutkan",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        window.open("{{ url('/pelanggan/delete') }}/" + data_delete, "_self");
      }
    });
  });

  $(document).on('click', '.btn-delete-img', function(){
    $(".img-edit").attr("src", "{{ asset('pictures') }}/barang.jpg");
    $('input[name=nama_foto]').val('barang.jpg');
  });
</script>


<script>

	function ambilRupiah(e) {
	var hiddenInput = document.getElementById(e.id + "_value");
	hiddenInput.value = hiddenInput.value.replace(/[^0-9]*/g, '');
	hiddenInput.value = e.value.match(/\d/g).join("");
	e.value = formatRupiah(e, e.value);
	}
</script>

<script type="text/javascript">
	function fileValidation(){
		let fi = document.getElementsByClassName('validateImage');
		fi = fi[0];
		// Check if any file is selected.
		if (fi.files.length > 0) {
			for (let i = 0; i <= fi.files.length - 1; i++) {

				const fsize = fi.files.item(i).size;
				const fname = fi.files.item(i).name;
				const file = Math.round((fsize / 1024));
				// The size of the file.
				if (file >= 2048) {
					alert(
					"File "+fname+" too Big, please select a file less than 2mb !");
					fi.value = '';
				}
			}
		}
	}

	$(function(){
		$(".numbers").number(true,0);
	});

	$('.numberValidation').keyup(function () {
			this.value = this.value.replace(/[^0-9\.]/g,'');
		});
		$('.thousandSeperator').keyup(function () {
			var cek = parseInt(this.value);
			if(isNaN(cek)){
				this.value = "";
			}else{
				var hiddenInput = document.getElementById(this.id + "_input");
				hiddenInput.value = hiddenInput.value.replace(/[^0-9]*/g, '');
				hiddenInput.value = this.value.match(/\d/g).join("");
				this.value = formatRibuanTyping(this, this.value);
			}
		});

	/* Fungsi formatRupiah */
	function formatRibuanTyping(rupiah, angka, prefix) {
		var number_string = angka.replace(/[^0-9]*/g, '').toString(),
			split = number_string.split(','),
			sisa = split[0].length % 3,
			rupiah = split[0].substr(0, sisa),
			ribuan = split[0].substr(sisa).match(/\d{3}/gi);
		// tambahkan titik jika yang di input sudah menjadi angka ribuan
		if (ribuan) {
			separator = sisa ? '.' : '';
			rupiah += separator + ribuan.join('.');
		}
		rupiah = split[1] != undefined ? rupiah + ',' + split[1] : rupiah;
		return prefix == undefined ? rupiah : (rupiah ? rupiah : '');
	}
	//END

</script>
@endsection