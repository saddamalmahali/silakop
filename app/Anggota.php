<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;


class Anggota extends Model
{
    protected $table = 'anggota';

    static function getListPinjamanAnggota(){
      $anggota = DB::table('anggota')
            ->join('pinjaman', 'anggota.id', '=', 'pinjaman.anggotaid')
            ->join('pinjtransaksi', 'pinjaman.id', '=', 'pinjtransaksi.pinjamanid')
            ->select('anggota.*', 'pinjaman.plafon', 'pinjtransaksi.debet', 'pinjtransaksi.tanggal');

      return $anggota;
    }

    static function getListPinjamanAnggotaByBulan($bulan){
      $anggota = DB::table('anggota')
            ->join('pinjaman', 'anggota.id', '=', 'pinjaman.anggotaid')
            ->join('pinjtransaksi', 'pinjaman.id', '=', 'pinjtransaksi.pinjamanid')
            ->select('anggota.*', 'pinjaman.plafon', 'pinjtransaksi.debet', 'pinjtransaksi.tanggal')
            ->where(DB::raw('MONTH(pinjtransaksi.tanggal)'), $bulan);

      return $anggota;
    }

    static function getListAngsuranPokokAnggota(){
      $pokok = DB::table('anggota');

      $pokok->select('noanggota','nama',
                      DB::raw("(select SUM(tt.kredit) from tabungan t
                              left join tabtransaksi tt on t.id = tt.tabunganid
                              where t.anggotaid = anggota.id and t.jenisid='TB20160504-103411' and MONTH(tt.tanggal) = '01') as 'januari'"),
                      DB::raw("(select SUM(tt.kredit) from tabungan t
                              left join tabtransaksi tt on t.id = tt.tabunganid
                              where t.anggotaid = anggota.id and t.jenisid='TB20160504-103411' and MONTH(tt.tanggal) = '02') as 'februari'"),
                      DB::raw("(select SUM(tt.kredit) from tabungan t
                              left join tabtransaksi tt on t.id = tt.tabunganid
                              where t.anggotaid = anggota.id and t.jenisid='TB20160504-103411' and MONTH(tt.tanggal) = '03') as 'maret'"),
                      DB::raw("(select SUM(tt.kredit) from tabungan t
                              left join tabtransaksi tt on t.id = tt.tabunganid
                              where t.anggotaid = anggota.id and t.jenisid='TB20160504-103411' and MONTH(tt.tanggal) = '04') as 'april'"),
                      DB::raw("(select SUM(tt.kredit) from tabungan t
                              left join tabtransaksi tt on t.id = tt.tabunganid
                              where t.anggotaid = anggota.id and t.jenisid='TB20160504-103411' and MONTH(tt.tanggal) = '05') as 'mei'"),
                      DB::raw("(select SUM(tt.kredit) from tabungan t
                              left join tabtransaksi tt on t.id = tt.tabunganid
                              where t.anggotaid = anggota.id and t.jenisid='TB20160504-103411' and MONTH(tt.tanggal) = '06') as 'juni'"),
                      DB::raw("(select SUM(tt.kredit) from tabungan t
                              left join tabtransaksi tt on t.id = tt.tabunganid
                              where t.anggotaid = anggota.id and t.jenisid='TB20160504-103411' and MONTH(tt.tanggal) = '07') as 'juli'"),
                      DB::raw("(select SUM(tt.kredit) from tabungan t
                              left join tabtransaksi tt on t.id = tt.tabunganid
                              where t.anggotaid = anggota.id and t.jenisid='TB20160504-103411' and MONTH(tt.tanggal) = '08') as 'agustus'"),
                      DB::raw("(select SUM(tt.kredit) from tabungan t
                              left join tabtransaksi tt on t.id = tt.tabunganid
                              where t.anggotaid = anggota.id and t.jenisid='TB20160504-103411' and MONTH(tt.tanggal) = '09') as 'september'"),
                      DB::raw("(select SUM(tt.kredit) from tabungan t
                              left join tabtransaksi tt on t.id = tt.tabunganid
                              where t.anggotaid = anggota.id and t.jenisid='TB20160504-103411' and MONTH(tt.tanggal) = '10') as 'oktober'"),
                      DB::raw("(select SUM(tt.kredit) from tabungan t
                              left join tabtransaksi tt on t.id = tt.tabunganid
                              where t.anggotaid = anggota.id and t.jenisid='TB20160504-103411' and MONTH(tt.tanggal) = '11') as 'november'"),
                      DB::raw("(select SUM(tt.kredit) from tabungan t
                              left join tabtransaksi tt on t.id = tt.tabunganid
                              where t.anggotaid = anggota.id and t.jenisid='TB20160504-103411' and MONTH(tt.tanggal) = '12W') as 'desember'"));
      $pokok->orderBy('nama', 'asc');

      return $pokok;
    }
}
