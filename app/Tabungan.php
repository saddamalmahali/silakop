<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
class Tabungan extends Model
{
    static function getTotalPendapatanPerBulan(){
    	$tabungan = DB::select(
    		DB::raw("select 
    			(select SUM(tt.kredit) from tabtransaksi tt inner join tabungan t on tt.tabunganid=t.id where MONTH(tt.tanggal)='01' and t.jenisid='TB20160504-103411') as 'januari', 
    			(select SUM(tt.kredit) from tabtransaksi tt inner join tabungan t on tt.tabunganid=t.id where MONTH(tt.tanggal)='02' and t.jenisid='TB20160504-103411') as 'februari', 
    			(select SUM(tt.kredit) from tabtransaksi tt inner join tabungan t on tt.tabunganid=t.id where MONTH(tt.tanggal)='03' and t.jenisid='TB20160504-103411') as 'maret',
    			(select SUM(tt.kredit) from tabtransaksi tt inner join tabungan t on tt.tabunganid=t.id where MONTH(tt.tanggal)='04' and t.jenisid='TB20160504-103411') as 'april',
    			(select SUM(tt.kredit) from tabtransaksi tt inner join tabungan t on tt.tabunganid=t.id where MONTH(tt.tanggal)='05' and t.jenisid='TB20160504-103411') as 'mei',
    			(select SUM(tt.kredit) from tabtransaksi tt inner join tabungan t on tt.tabunganid=t.id where MONTH(tt.tanggal)='06' and t.jenisid='TB20160504-103411') as 'juni',
    			(select SUM(tt.kredit) from tabtransaksi tt inner join tabungan t on tt.tabunganid=t.id where MONTH(tt.tanggal)='07' and t.jenisid='TB20160504-103411') as 'juli',
    			(select SUM(tt.kredit) from tabtransaksi tt inner join tabungan t on tt.tabunganid=t.id where MONTH(tt.tanggal)='08' and t.jenisid='TB20160504-103411') as 'agustus',
    			(select SUM(tt.kredit) from tabtransaksi tt inner join tabungan t on tt.tabunganid=t.id where MONTH(tt.tanggal)='09' and t.jenisid='TB20160504-103411') as 'september',
    			(select SUM(tt.kredit) from tabtransaksi tt inner join tabungan t on tt.tabunganid=t.id where MONTH(tt.tanggal)='10' and t.jenisid='TB20160504-103411') as 'oktober',
    			(select SUM(tt.kredit) from tabtransaksi tt inner join tabungan t on tt.tabunganid=t.id where MONTH(tt.tanggal)='11' and t.jenisid='TB20160504-103411') as 'november',
    			(select SUM(tt.kredit) from tabtransaksi tt inner join tabungan t on tt.tabunganid=t.id where MONTH(tt.tanggal)='12' and t.jenisid='TB20160504-103411') as 'desember'
    			")
    		// DB::raw("select (select SUM(tt.kredit) from tabtransaksi tt where MONTH(tt.tanggal)='02') as 'februari'")
    		// DB::raw("select (select SUM(tt.kredit) from tabtransaksi tt where MONTH(tt.tanggal)='03') as 'maret'"),
    		// DB::raw("select (select SUM(tt.kredit) from tabtransaksi tt where MONTH(tt.tanggal)='04') as 'april'"),
    		// DB::raw("select (select SUM(tt.kredit) from tabtransaksi tt where MONTH(tt.tanggal)='05') as 'mei'"),
    		// DB::raw("select (select SUM(tt.kredit) from tabtransaksi tt where MONTH(tt.tanggal)='06') as 'juni'"),
    		// DB::raw("select (select SUM(tt.kredit) from tabtransaksi tt where MONTH(tt.tanggal)='07') as 'juli'"),
    		// DB::raw("select (select SUM(tt.kredit) from tabtransaksi tt where MONTH(tt.tanggal)='08') as 'agustus'"),
    		// DB::raw("select (select SUM(tt.kredit) from tabtransaksi tt where MONTH(tt.tanggal)='09') as 'september'"),
    		// DB::raw("select (select SUM(tt.kredit) from tabtransaksi tt where MONTH(tt.tanggal)='10') as 'oktober'"),
    		// DB::raw("select (select SUM(tt.kredit) from tabtransaksi tt where MONTH(tt.tanggal)='11') as 'november'"),
    		// DB::raw("select (select SUM(tt.kredit) from tabtransaksi tt where MONTH(tt.tanggal)='12') as 'desember'")
    		);

    	return $tabungan;
    }
}
