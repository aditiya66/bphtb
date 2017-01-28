<?php

// tanggal 2 oktober 2015

// 1. Edit KTP (KTP Pembeli dan Penjual) contohnya                                          = selesai
// 2. Harga Acuan salah query                                                               = selesai
// 3. tabel presentase untuk analisis harga acuan dan history                               = selesai
// 4. NOP diubah jadi kode blok                                                             = selesai
// 5. Verifikasi syarat belum urut                                                          = selesai
// 6. Jumlah hari untuk melengkapi (max 3 hari) -> bikin tabel referensi                    = selesai
// 7. Setelah validasi no sspd akan muncul (no pendaftaran beda dengan no sspd)             = selesai
// 8. surat pemberitahuan untuk melengkapi diberi waktu tenggang max 3 hari                 = selesai
// 9. tanda tangan diteliti di setiap surat                                                 = selesai
// 10. semua huruf besar (nama dan alamat)                                                  = selesai
// 11. grid jumlah pembayaran pada index pembayaran masih kurang tepat                      = selesai
// 12. cetak bukti sudah bayar di menu pembayaran / payment point                           = selesai
// 13. Denda                                                                            -> perlu koordinasi kembali
// 14. untuk data sismiop sementara yang diselesaikan mutasi penuh                          = mutasi penuh selesai
// 15. cetak media pemberitahuan (ketetapan denda / sanksi) 2 surat                         = selesai
// 16. kode rekening                                                                    -> belum jelas
// 17. koreksi bpn hanya bisa diinput bila luasan lebih besar dari data aslinya             = 
// 18. bikin harga minimal untuk koreksi luasan bpn (tabel referensi)                   -> tanya dulu
// 19. lebar kolom isian untuk nama di semua form                                           = selesai















































// Catatan BPHTB yang kurang :
//
//
// Database
// 1. Urutin Persyaratan                                                                    = selesai
//
// Menu Pendaftaran
// 1. Cetak Daftar Pendaftaran (Space G Cukup)                                              = selesai
// 2. Double input belum bisa                                                               =
// 3. Cetak Daftar Pendaftaran dan Cetak Status Berkas. Cek Session tombolnya g tampil      = selesai
//
// Menu Validasi
// 1. Edit Pemeriksaan Validasi                                                             = selesai
// 2. Cetak SSPD Hasil Pemeriksaan          (view_cetak_sspd)                               = selesai
// 3. Analisis Harga Acuan dan history                                                      = selesai
//
// Menu Pembayaran
// 1. Cetak Bukti Validasi sudah membayar                                                   = selesai
// 2. Pembayaran Sebelumnya (jika ada)                                                      = selesai
//
// Menu BPN
// 1. Koreksi Luas Tanah dan Bangunan                                                       = selesai
//
// Menu Setting
// 1. Bikin Harga Acuan                                                                     = selesai
// 2. Bikin User Wajib Pajak yang ingin mengentri SSPD sendiri      -> perlu dibicarakan lebih lanjut
//
// Menu Pelaporan Notaris
// 1. Denda tertuang dalam SSPD-BPHTB (input ke spt dahulu)                                 = selesai
// 2. Sanksi tertuang dalam media STS (input ke spt dahulu)                                 = selesai
//
// Menu Cetak Pelaporan
// 1. Cetak data yang berbeda antara BPHTB dan SISMIOP
// 2. Cetak daftar yang perlu verifikasi
// 3. Cetak laporan hasil koreksi dari BPN
// 4. Header page pertama                                                                   = selesai
//
// NOTES
// INPUT NAMA CONTROLLER BARU KE TABEL RESOURCE DENGAN NAMA "PendataanSismiop"
// INPUT NAMA ACTION DARI CONTROLLER "PendataanSismiop" KE TABEL PERMISSION.
//