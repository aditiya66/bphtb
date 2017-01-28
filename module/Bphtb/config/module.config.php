<?php

return array(
    'controllers' => array(
        'invokables' => array(
            'BPHTBINDEX' => 'Bphtb\Controller\MainController',
            'LoginAccess' => 'Bphtb\Controller\LoginAccess',
            //Modul Setting
            'SettingPemda' => 'Bphtb\Controller\Setting\SettingPemda',
            'SettingKecamatan'=> 'Bphtb\Controller\Setting\SettingKecamatan',
            'SettingKelurahan'=> 'Bphtb\Controller\Setting\SettingKelurahan',
            'SettingPejabat'=> 'Bphtb\Controller\Setting\SettingPejabat',
            'SettingNotaris'=> 'Bphtb\Controller\Setting\SettingNotaris',
            'SettingJenisTransaksi'=> 'Bphtb\Controller\Setting\SettingJenisTransaksi',
            'SettingTarifNpotkp'=> 'Bphtb\Controller\Setting\SettingTarifNpotkp',
            'SettingHakTanah'=> 'Bphtb\Controller\Setting\SettingHakTanah',
            'SettingJenisKetetapan'=> 'Bphtb\Controller\Setting\SettingJenisKetetapan',
            'SettingTarifBphtb'=> 'Bphtb\Controller\Setting\SettingTarifBphtb',
            'SettingUser'=> 'Bphtb\Controller\Setting\SettingUser',
            'SettingPersyaratanTransaksi' => 'Bphtb\Controller\Setting\SettingPersyaratanTransaksi',
            'SettingDokTanah'=> 'Bphtb\Controller\Setting\SettingDokTanah',
            'SettingTarget'=> 'Bphtb\Controller\Setting\SettingTarget',
            'SettingHargaAcuan'=> 'Bphtb\Controller\Setting\SettingHargaAcuan',
            //Modul Pendataan
            'PendataanSSPD' => 'Bphtb\Controller\Pendataan\PendataanSSPD',
            //Modul Pembayaran
            'PembayaranSPT' => 'Bphtb\Controller\Pembayaran\PembayaranSPT',
            //Modul Verifikasi
            'VerifikasiSPT' => 'Bphtb\Controller\Verifikasi\VerifikasiSPT',
            //Modul Pencetakan
            'CetakSSPD' => 'Bphtb\Controller\Pencetakan\CetakSSPD',
            'CetakLaporan' => 'Bphtb\Controller\Pencetakan\CetakLaporan',
            //Modul Koreksi
            'Koreksi' => 'Bphtb\Controller\Koreksi\Koreksi',
            //Modul BPN
            'Bpn' => 'Bphtb\Controller\BPN\Bpn',
            //Modul Pelaporan Notaris
            'PelaporanNotaris' => 'Bphtb\Controller\Pelaporan\PelaporanNotaris',
            //Modul BPN
            'Monitoring' => 'Bphtb\Controller\Monitoring\Monitoring',
            //
            'PendataanSismiop' => 'Bphtb\Controller\Pendataan\PendataanPbb',
            'Historylog'=> 'Bphtb\Controller\Historylog\Historylog'
        ),
    ),
    'router' => array(
        'routes' => array(
            'sign_in' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/sign_in[/:action][/:id]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'LoginAccess',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_persyaratan_transaksi_bphtb' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_persyaratan_transaksi_bphtb[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingPersyaratanTransaksi',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_user_bphtb' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_user_bphtb[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingUser',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_tarif_bphtb' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_tarif_bphtb[/:action][/:page][/:rows][/:direction][/:s_tarifbphtb][/:s_tanggaltarifbphtb][/:s_dasarhukumtarifbphtb][/:s_statustarifbphtb]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingTarifBphtb',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_jenis_ketetapan' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_jenis_ketetapan[/:action][/:page][/:rows][/:direction]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingJenisKetetapan',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_hak_tanah' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_hak_tanah[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingHakTanah',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_tarif_npotkp' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_tarif_npotkp[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingTarifNpotkp',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_jenis_transaksi_bphtb' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_jenis_transaksi_bphtb[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingJenisTransaksi',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_notaris_bphtb' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_notaris_bphtb[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingNotaris',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_pejabat_bphtb' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_pejabat_bphtb[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingPejabat',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_kelurahan_bphtb' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_kelurahan_bphtb[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingKelurahan',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_kecamatan_bphtb' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_kecamatan_bphtb[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingKecamatan',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_pemda' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_pemda[/:action][/:page][/:rows][/:direction]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingPemda',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_dokumen_tanah_bphtb' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_dokumen_tanah_bphtb[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingDokTanah',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_target' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_target[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingTarget',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_harga_acuan_bphtb' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_harga_acuan_bphtb[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingHargaAcuan',
                        'action' => 'index',
                    ),
                ),
            ),
            'pendataan_sspd' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/pendataan_sspd[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'PendataanSSPD',
                        'action' => 'index',
                    ),
                ),
            ),
            'pendataan_pbb' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/pendataan_pbb[/:action][/:page][/:rows][/:direction][/:t_kohirspt][/:t_periodespt][/:t_tglprosesspt][/:t_namawppembeli][/:t_totalspt][/:s_namajenistransaksi][/:t_noajbbaru][/:t_tglajbbaru]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'PendataanSismiop',
                        'action' => 'index',
                    ),
                ),
            ),
            'pembayaran_sptbphtb' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/pembayaran_sptbphtb[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'PembayaranSPT',
                        'action' => 'index',
                    ),
                ),
            ),
            'verifikasi_spt' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/verifikasi_spt[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'VerifikasiSPT',
                        'action' => 'index',
                    ),
                ),
            ),
            'cetak_sspd' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/cetak_sspd[/:action][/:id]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'CetakSSPD',
                        'action' => 'index',
                    ),
                ),
            ),
            'cetak_laporan' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/cetak_laporan[/:action][/:page][/:rows][/:direction]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'CetakLaporan',
                        'action' => 'index',
                    ),
                ),
            ),
            'koreksi' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/koreksi[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Koreksi',
                        'action' => 'index',
                    ),
                ),
            ),
            'bpn_lihatdata' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/bpn_lihatdata[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Bpn',
                        'action' => 'index',
                    ),
                ),
            ),
            'pelaporan_notaris' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/pelaporan_notaris[/:action][/:page][/:rows][/:direction][/:t_kohirspt][/:t_tglprosesspt][/:t_namawppembeli][/:t_totalspt][/:t_bulanselesaibayar][/:t_tanggalpembayaran][/:t_noajbbaru][/:t_tglajbbaru][/:t_idnotarisspt][/:statuspelaporan]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'PelaporanNotaris',
                        'action' => 'index',
                    ),
                ),
            ),
            'monitoring' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/monitoring[/:action]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Monitoring',
                        'action' => 'index',
                    ),
                ),
            ),
            'historylog' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/historylog[/:action][/:page][/:rows][/:direction][/:hislog_action][/:hislog_opr_user]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Historylog',
                        'action' => 'index',
                    ),
                ),
            ),
            'main_bphtb' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/main_bphtb[/:action][/:id]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'BPHTBINDEX',
                        'action' => 'index',
                    ),
                ),
            ),
        ),
    ),
    'view_manager' => array(
        'template_map' => array(
            'bphtb/layout' => __DIR__ . '/../view/layout/layout.phtml',
            'error/404' => __DIR__ . '/../view/error/404.phtml',
            'error/index' => __DIR__ . '/../view/error/index.phtml',
        ),
        'template_path_stack' => array(
            'bphtb' => __DIR__ . '/../view',
        ),
    ),    
);
