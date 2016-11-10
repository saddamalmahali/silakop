<div class="col-md-12">
	<div class="panel panel-success">
		<div class="panel-heading">
			<h2 class="panel-title" align="center">Data Jurnal Umum</h2>
		</div>
		<div class="panel-body">
			<h3 id="title_hasil"></h3>
			<table id="tabel_jurnal" class="table table-bordered">
				<thead>
					<tr>
						<th width="15%" style="text-align:center;">Tanggal</th>
						<th width="30%" style="text-align:center;">Uraian</th>
						<th width="20%" style="text-align:center;">Akun</th>
						<th style="text-align:center;">Debit</th>
						<th style="text-align:center;">Kredit</th>
					</tr>
				</thead>
				<tbody>
					<?php 
						$cek = '';
						

					 ?>
					@forelse($data as $jurnal)
						<?php $waktu = date('d-m-Y', strtotime($jurnal->tanggal)) ?>
						<tr>
							<td align="center">{{$cek === $jurnal->id ? '' : $waktu}}</td>
							<td>{{$cek === $jurnal->id ? '' :$jurnal->keterangan}}</td>
							<td align="center">{{$jurnal->akunid." | ".$jurnal->namaakun}}</td>
							<td align="center">{{$jurnal->debet}}</td>
							<td align="center">{{$jurnal->kredit}}</td>
						</tr>
						@if($cek != $jurnal->id)
							<?php $cek = $jurnal->id ?>
						@endif
						
					@empty
						<tr>
							<td colspan="5" align="center">Tidak Ditemukan Data</td>
						</tr>
					@endforelse
				</tbody>

			</table>
			<div align="center">{{$data->links()}}</div>
		</div>
	</div>
</div>