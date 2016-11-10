@extends('coba')

@section('content')
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h2 class="panel-title" align='center'>Laporan Simpanan Pokok</h2>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
								<table class="table table-bordered table-hover" >
									<thead>
										<tr>
											<th style="text-align:center;" rowspan="2">No</th>
											<th width="10%" style="text-align:center;" rowspan="2">No Anggota</th>
											<th width="30%" style="text-align:center;" rowspan="2">Nama Anggota</th>
											<th colspan="12" style="text-align:center;">Bulan</th>
											
										</tr>
										<tr>
											<th style="text-align:center;">Januari</th>
											<th style="text-align:center;">Februari</th>
											<th style="text-align:center;">Maret</th>
											<th style="text-align:center;">April</th>
											<th style="text-align:center;">Mei</th>
											<th style="text-align:center;">Juni</th>
											<th style="text-align:center;">Juli</th>
											<th style="text-align:center;">Agustus</th>
											<th style="text-align:center;">September</th>
											<th style="text-align:center;">Oktober</th>
											<th style="text-align:center;">November</th>
											<th style="text-align:center;">Desember</th>
										</tr>
									</thead>
									<tbody>
										<?php $no = 1; ?>
										@forelse($anggota as $a)
											<tr>
												<td align="center">{{$no++}}</td>
												<td align="center">{{$a->noanggota}}</td>
												<td>{{$a->nama}}</td>
												<td align="center">{!!is_null($a->januari) ? '<span class="glyphicon glyphicon-remove danger"></span>': '<span class="glyphicon glyphicon-ok"></span>'!!}</td>
												<td align="center">{!!is_null($a->februari) ? '<span class="glyphicon glyphicon-remove"></span>': '<span class="glyphicon glyphicon-ok"></span>'!!}</td>
												<td align="center">{!!is_null($a->maret) ? '<span class="glyphicon glyphicon-remove"></span>': '<span class="glyphicon glyphicon-ok"></span>'!!}</td>
												<td align="center">{!!is_null($a->april) ? '<span class="glyphicon glyphicon-remove"></span>': '<span class="glyphicon glyphicon-ok"></span>'!!}</td>
												<td align="center">{!!is_null($a->mei) ? '<span class="glyphicon glyphicon-remove"></span>': '<span class="glyphicon glyphicon-ok"></span>'!!}</td>
												<td align="center">{!!is_null($a->juni) ? '<span class="glyphicon glyphicon-remove"></span>': '<span class="glyphicon glyphicon-ok"></span>'!!}</td>
												<td align="center">{!!is_null($a->juli) ? '<span class="glyphicon glyphicon-remove"></span>': '<span class="glyphicon glyphicon-ok"></span>'!!}</td>
												<td align="center">{!!is_null($a->agustus) ? '<span class="glyphicon glyphicon-remove"></span>': '<span class="glyphicon glyphicon-ok"></span>'!!}</td>
												<td align="center">{!!is_null($a->september) ? '<span class="glyphicon glyphicon-remove"></span>': '<span class="glyphicon glyphicon-ok"></span>'!!}</td>
												<td align="center">{!!is_null($a->oktober) ? '<span class="glyphicon glyphicon-remove"></span>': '<span class="glyphicon glyphicon-ok"></span>'!!}</td>
												<td align="center">{!!is_null($a->november) ? '<span class="glyphicon glyphicon-remove"></span>': '<span class="glyphicon glyphicon-ok"></span>'!!}</td>
												<td align="center">{!!is_null($a->desember) ? '<span class="glyphicon glyphicon-remove"></span>': '<span class="glyphicon glyphicon-ok"></span>'!!}</td>

											</tr>
										@empty

										@endforelse
									</tbody>
								</table>	

								
							</div>
							<div align="center">{{ $anggota->render() }}</div>
						</div>
					</div>
					<style type="text/css">
						canvas{
					        -moz-user-select: none;
					        -webkit-user-select: none;
					        -ms-user-select: none;
					    }
					</style>
					<div class="row">
						<div class="col-md-6">
							<section class="panel panel-primary">
								<div class="panel-heading">
									<h2 class="panel-title " align="center">
										Graph Perkembangan Simpanan Pokok
									</h2>
								</div>
								<div class="panel-body">
									<canvas id="chart-penerimaan"></canvas>
								</div>
							</section>
						</div>
					</div>
					<script type="text/javascript">
						var randomColorFactor = function(){
							return Math.round(Math.random * 255);
						};

						var randomColor = function(opacity){
							return 'rgba('+randomColorFactor()+','+randomColorFactor()+','+randomColorFactor()+','+(opacity || '.3')+')';			
						};

						var config = {
							type : 'line',
							data : {
								labels : ["Januari", 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'],
								datasets : [{
									label : 'Pendapatan Dari Simpanan Pokok',
									data : [
										{{$tabungan[0]->januari}},
										{{$tabungan[0]->februari}},
										{{$tabungan[0]->maret}},
										{{$tabungan[0]->april}},
										{{$tabungan[0]->mei}},
										{{$tabungan[0]->juni}},
										{{$tabungan[0]->juli}},
										{{$tabungan[0]->agustus}},
										{{$tabungan[0]->september}},
										{{$tabungan[0]->oktober}},
										{{$tabungan[0]->november}},
										{{$tabungan[0]->desember}},

										],
								}]
							},

							options : {
								responsive : true,
								title : {
									display : false,
									text : 'Grafik Pendapatan Dari Simpanan Pokok'
								},

								tooltips : {
									mode : 'label',
									callbacks : {

									}
								},
								hover : {
									mode : 'dataset'
								},
								scales : {
									xAxes : [{
										display : true,
										scaleLabel : {
											display : true,
											labelString : 'Bulan'
										}
									}],
									yAxes : [{
										display : true,
										scaleLabel :{
											display: true,
											labelString : 'Pendapatan'
										},
										ticks:{
											suggestedMin : -10,
											suggestedMax : 250
										}
									}]
								}

							}
						};

						window.onload = function(){
							var ctx = document.getElementById("chart-penerimaan").getContext('2d');
							window.LineCP = new Chart(ctx, config);
						}

					</script>
				</div>
			</div>
		</div>
	</div>
@endsection