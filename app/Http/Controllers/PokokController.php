<?php namespace App\Http\Controllers;

use App\Anggota;
use App\Tabungan;

class PokokController extends Controller{
	public function index()
	{
		$anggota = Anggota::getListAngsuranPokokAnggota();

		$anggota = $anggota->paginate('6');

		$tabungan = Tabungan::getTotalPendapatanPerBulan();
		// dd($anggota);
		return view('simpanan.pokok', ['anggota'=>$anggota, 'tabungan'=>$tabungan]);
	}
}