<?php namespace App\Http\Controllers;
use App\Akun;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
class JurnalController extends Controller 
{
	public function jurnal_umum(Request $request)
	{
		$id_akun = '';
		$date_from = '';
		$date_to = '';
		$tanggal_dari = date('Y-m-d', strtotime($date_from));
		$tanggal_sampai = date('Y-m-d', strtotime($date_to));
		$data = Akun::getJurnalByAkun($id_akun, $tanggal_dari, $tanggal_sampai);
		$data = $data->paginate('9');
		return view('jurnal.umum', ['data'=>$data]);
	}

	public function cari_akun(Request $request)
	{ 
		if($request->ajax()){

			$nama = $request->input('term');
			$hasil = Akun::getAllAkunWhereName($nama);
			$nilai = array();
			foreach ($hasil as $h) {
				array_push($nilai, $h);
			}
			echo json_encode($nilai);

		}

		
	}

	public function tampil_jurnal(Request $request, Response $response)
	{
		$id_akun = $request->input('akun');
		$date_from = $request->input('tanggal_dari');
		$date_to = $request->input('tanggal_sampai');
		$tanggal_dari = date('Y-m-d', strtotime($date_from));
		$tanggal_sampai = date('Y-m-d', strtotime($date_to));
		$data = Akun::getJurnalByAkun($id_akun, $tanggal_dari, $tanggal_sampai);
		$data = $data->paginate('9');
		if($request->ajax()){		
			return response()->json(view()->make('jurnal.tabel_jurnal_umum', ['data'=>$data])->render());
		}

		return view()->make('jurnal.tabel_jurnal_umum', ['data'=>$data]);
	}
}