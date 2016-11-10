<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
class Akun extends Model
{
    static function getAllAkunWhereName($name){
    	$hasil = DB::table('accgrup')
    		->where('nama', 'like', "%".$name."%")
    		->select('id', 'nama')
    		->get();
    	return $hasil;
    }
    static function getJurnalByAkun($akun, $tanggaldari, $tanggalsampai){
    	// $debit = DB::table('accjurnal')
    	// 	->leftJoin('accjurnaldetail', 'accjurnal.id', '=', 'accjurnaldetail.id')
    	// 	->select(DB::raw('SUM(accjurnaldetail.debet) as debet'))
    	// 	->where('accjurnaldetail.accountid', '=', 'account.id');

    	// $kredit = DB::table('accjurnal')
    	// 	->leftJoin('accjurnaldetail', 'accjurnal.id', '=', 'accjurnaldetail.id')
    	// 	->select(DB::raw('SUM(accjurnaldetail.kredit) as kredit'))
    	// 	->where('accjurnaldetail.accountid', '=', 'account.id');
    	

    	$hasil = DB::table('accjurnal')    		
    			->join('accjurnaldetail', 'accjurnal.id', '=', 'accjurnaldetail.id')
    			->join('account', 'accjurnaldetail.accountid', '=', 'account.id')
    			->whereBetween('accjurnal.tanggal', [$tanggaldari, $tanggalsampai])
    			->whereIn('accjurnaldetail.id', function($query) use ($akun){

    				$query->select('accjurnaldetail.id')
    					->from('accgrup')
    					->leftJoin('accheader', 'accgrup.id','=', 'accheader.grupid')
    					->leftJoin('account', 'accheader.id', '=', 'account.headerid')
    					->leftJoin('accjurnaldetail', 'account.id', '=', 'accjurnaldetail.accountid')
    					->where('accgrup.id','=', $akun);
    			})
    			->orderBy('accjurnal.id', 'asc')
    			->select('accjurnal.id','accjurnal.tanggal', 'accjurnal.keterangan', 'account.id as akunid','account.nama as namaakun','accjurnaldetail.debet', 'accjurnaldetail.kredit');


    	// DB::select("select aj.tanggal, aj.keterangan, a.id, a.nama, ajd.debet, ajd.kredit from accjurnal aj left join accjurnaldetail ajd on aj.id = ajd.id left join account a on ajd.accountid = a.id right join accheader ah on a.headerid = ah.id where ah.id = '".$akun."' and aj.tanggal between '".$tanggaldari."' and '".$tanggalsampai."'  order by aj.id asc");

    	return $hasil;
    }
}
