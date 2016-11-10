<?php namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Anggota;
use Validator;
use Response;
use Illuminate\Support\Facades\Input;

class LaporanController extends Controller{
	public function index($page = ''){
		$bulan = '';

		if(isset($_GET['bulan'])){
			$bulan = (int) $_GET['bulan'];
		}

		$anggota = '';

		if($bulan != ''){
			$anggota = Anggota::getListPinjamanAnggotaByBulan($bulan);	
				
		}else{
			$anggota= Anggota::getListPinjamanAnggota();
			
		}

		$anggota = $anggota->paginate('9');

		return view('tampil.index', ['anggota'=>$anggota, 'valbulan'=>$bulan]);
	}

	
}
