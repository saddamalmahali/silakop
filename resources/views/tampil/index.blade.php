@extends('coba')

@section('content')
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h2 class="panel-title" align="center">Laporan Pemasukan Koperasi</h2>
				</div>
				
				<div class="panel-body">
					<div class="table-responsive col-md-8">
						<div class="row">
							<div class="col-md-8">
								<form action="" class="form-horizontal">
									<div class="form-group">
										<label class="control-label col-sm-3" for="bulan">Filter Nama</label>
										<div class="col-sm-6">
											<select name ="bulan" class="form-control">
												<option value="" @if($valbulan == '') selected='selected' @endif>Semua</option>
												<option value="1" @if($valbulan == '1') selected='selected' @endif>Januari</option>
												<option value="2" @if($valbulan == '2') selected='selected' @endif>Februari</option>
												<option value="3" @if($valbulan == '3') selected='selected' @endif>Maret</option>
												<option value="4" @if($valbulan == '4') selected='selected' @endif>April</option>
												<option value="5" @if($valbulan == '5') selected='selected' @endif>Mei</option>
												<option value="6" @if($valbulan == '6') selected='selected' @endif>Juni</option>
												<option value="7" @if($valbulan == '7') selected='selected' @endif>Juli</option>
												<option value="8" @if($valbulan == '8') selected='selected' @endif>Agustus</option>
												<option value="9" @if($valbulan == '9') selected='selected' @endif>September</option>
												<option value="10" @if($valbulan == '10') selected='selected' @endif>Oktober</option>
												<option value="11" @if($valbulan == '11') selected='selected' @endif>November</option>
												<option value="12" @if($valbulan == '12') selected='selected' @endif>Desember</option>
											</select>
										</div>
										<input type="submit" value="Pilih" class='control-label btn btn-primary btn-sm'>
									</div>
								</form>
							</div>
						</div>
						<table class="table table-bordered table-hovered">
							<thead>
								<tr>
									<td align="center">No</td>
									<td align="center">No Bukti</td>
									<td align="center">Tanggal</td>
									<td align="center">Anggota</td>
									<td align="center">Jumlah</td>
								</tr>
							</thead>
							<tbody>
								<?php $no = 1; ?>
								
								@forelse($anggota as $l)
									<tr>
										<td align="center">{{$no++}}</td>
										<td align="center">{{$l->noanggota}}</td>
										<td align="center">{{$l->tanggal}}</td>
										<td align="center">{{$l->nama}}</td>
										<td align="center">{{$l->plafon}}</td>
										
									</tr>
								@empty
									<tr>
										<td colspan="5" align="center">Tidak Ada Data</td>
									</tr>
								@endforelse
							</tbody>
						</table>
						
						<div align="center">{{ $anggota->appends(['bulan'=>$valbulan,'sort'=>'nama'])->render() }}</div>
					</div>
					<div class="col-md-4">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h2 class="panel-title">Grapik Daya Serap Penerimaan</h2>
							</div>
							<div class="panel-body">
								<canvas id="myChart" width="400" height="400"></canvas>
							</div>
						</div>
					</div>
					
					<script>
						var ctx = document.getElementById("myChart");
						var myChart = new Chart(ctx, {
						    type: 'bar',
						    data: {
						        labels: ["Membayar", "Belum Membayar"],
						        datasets: [{
						            label: '# of Votes',
						            data: [12, 19,],
						            backgroundColor: [
						                'rgba(255, 99, 132, 0.2)',
						                'rgba(54, 162, 235, 0.2)',
						                'rgba(255, 206, 86, 0.2)',
						                'rgba(75, 192, 192, 0.2)',
						                'rgba(153, 102, 255, 0.2)',
						                'rgba(255, 159, 64, 0.2)'
						            ],
						            borderColor: [
						                'rgba(255,99,132,1)',
						                'rgba(54, 162, 235, 1)',
						                'rgba(255, 206, 86, 1)',
						                'rgba(75, 192, 192, 1)',
						                'rgba(153, 102, 255, 1)',
						                'rgba(255, 159, 64, 1)'
						            ],
						            borderWidth: 1
						        }]
						    },
						    options: {
						        scales: {
						            yAxes: [{
						                ticks: {
						                    beginAtZero:true
						                }
						            }]
						        }
						    }
						});
					</script>

				</div>
			</div>
		</div>
	</div>
	
@endsection


