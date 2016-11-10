@extends('coba')
@section('content')
<style>
  .ui-autocomplete {
    max-height: 100px;
    overflow-y: auto;
    /* prevent horizontal scrollbar */
    overflow-x: hidden;
  }
  /* IE 6 doesn't support max-height
   * we use height instead, but this forces the menu to always be this tall
   */
  * html .ui-autocomplete {
    height: 100px;
  }
  </style>
<div class="row">
	<div class="col-filter" >
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h2 class="panel-title">Spesifikasi Data</h2>
				</div>
				<div class="panel-body">

					<div class="row">
						<form id="form-filter" class="form-horizontal">
							{{csrf_field()}}
							<div class="col-sm-3">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="tanggaldari">Dari</label>
									<div class="col-sm-9">
										<input type="date" id="tanggaldari" name="tanggaldari" class="form-control">
									</div>	
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="tanggalsampai">Sampai</label>
									<div class="col-sm-9">
										<input type="date" id="tanggalsampai" name="tanggalsampai" class="form-control">
									</div>	
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label for="akun" class="col-sm-3 control-label">Akun</label>
									<div class="col-sm-9">
										<input id="input-akun" type="text" name="akun" class="form-control" placeholder="Ketikan Nama Akun">
									</div>
								</div>
							</div>
							<div class="col-sm-2"><input type="submit" class="btn btn-primary btn-sm" name="Submit" value="Tampil"></div>
							
						</form>
					</div>
					<br />
					
					
				</div>
			</div>

			<div id="hasil_filter" class="row" style="padding-top: 20px;">
				@include('jurnal.tabel_jurnal_umum')
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

	$(document).ready(function(){
		$.ajaxSetup({
		    headers: {
		        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
		    }
		});
		$(window).on('hashchange', function() {
	        if (window.location.hash) {
	            var page = window.location.hash.replace('#', '');
	            if (page == Number.NaN || page <= 0) {
	                return false;
	            } else {
	                getPosts(page);
	            }
	        }
	    });
		function getPosts(page) {
	        $.ajax({
	            url : 'jurnal_umum/submit',
	            type : 'post',
	            data : {page : page, akun:$('#input-akun').attr('value'),tanggal_dari:$('#tanggaldari').val(),tanggal_sampai:$('#tanggalsampai').val()},
	            dataType: 'json',
	        }).done(function (data) {
	            $('#hasil_filter').html(data);
	        }).fail(function (xhr) {
	            alert('Posts could not be loaded.'+xhr);
	        });
	    }
		$('#hasil_filter').hide();
		var kosongkanData = function(){
			$('#tabel_jurnal tbody tr').remove();
		};

		$('#removeRow').on('click', function(){
			kosongkanData();
		});
		$('form#form-filter').submit(function(evt){
			evt.preventDefault();
			$.ajax({
				url : "jurnal_umum/submit",
				type : "post",
				data : {akun:$('#input-akun').attr('value'), tanggal_dari: $('#tanggaldari').val(), tanggal_sampai: $('#tanggalsampai').val()},
				typeData : 'html',
				success : function(data){
					$('#hasil_filter').html(data);
					$('#hasil_filter').show(100);
					// kosongkanData();
					// var parsed = JSON.parse(data);
					// $('#title_hasil').html("");
					// parsed.forEach(function(e){
					// 	$('#tabel_jurnal > tbody:last-child').append('<tr><td align="center">'
					// 		+e.tanggal+'</td><td>'
					// 		+e.keterangan+'</td><td align="center">'
					// 		+e.id+" | "+e.nama+'</td><td align="center">'
					// 		+e.debet+'</td><td align="center">'
					// 		+e.kredit+'</td></tr>');
					// });
					// $('#hasil_filter').show(100);
					// console.log(data);
				}
			});			
			// console.log($('#tanggaldari').val());
		});
		
        $(document).on('click', '.pagination a', function (e) {
        	var page = $(this).attr('href').split('page=')[1];
        	console.log(page);
            getPosts(page);
            e.preventDefault();
        });

		$('input#input-akun').autocomplete({
			source : function(request, response){
				$.ajax({
					url : 'cari_akun',
					method : 'post',
					datatype : 'jsonp',
					data : {term : request.term},
					success : function(data){
						var parsed = JSON.parse(data);
		                var newArray = new Array(parsed.length);
		                var i = 0;

		                parsed.forEach(function (entry) {
		                    var newObject = {
		                    	id : entry.id,
		                        label: entry.id+' | '+entry.nama
		                    };
		                    newArray[i] = newObject;
		                    i++;
		                });

		                response(newArray);
					}

				});
			},

			select : function(evt, ui){
				$("#input-akun").attr('value', ui.item.id);
			}

		});
	});
</script>
@endsection