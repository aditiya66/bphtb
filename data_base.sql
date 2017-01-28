/*
Navicat PGSQL Data Transfer

Source Server         : lokal postgres
Source Server Version : 90405
Source Host           : localhost:5432
Source Database       : bphtb_master
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90405
File Encoding         : 65001

Date: 2015-11-30 15:25:03
*/


-- ----------------------------
-- Sequence structure for "public"."permission_id_seq"
-- ----------------------------
DROP SEQUENCE "public"."permission_id_seq";
CREATE SEQUENCE "public"."permission_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."resource_id_seq"
-- ----------------------------
DROP SEQUENCE "public"."resource_id_seq";
CREATE SEQUENCE "public"."resource_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."role_permission_id_seq"
-- ----------------------------
DROP SEQUENCE "public"."role_permission_id_seq";
CREATE SEQUENCE "public"."role_permission_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."role_rid_seq"
-- ----------------------------
DROP SEQUENCE "public"."role_rid_seq";
CREATE SEQUENCE "public"."role_rid_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."s_acuan_s_idacuan_seq"
-- ----------------------------
DROP SEQUENCE "public"."s_acuan_s_idacuan_seq";
CREATE SEQUENCE "public"."s_acuan_s_idacuan_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 8
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."s_jenisdoktanah_s_iddoktanah_seq"
-- ----------------------------
DROP SEQUENCE "public"."s_jenisdoktanah_s_iddoktanah_seq";
CREATE SEQUENCE "public"."s_jenisdoktanah_s_iddoktanah_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 5
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."s_jenishaktanah_s_idjenishaktanah_seq"
-- ----------------------------
DROP SEQUENCE "public"."s_jenishaktanah_s_idjenishaktanah_seq";
CREATE SEQUENCE "public"."s_jenishaktanah_s_idjenishaktanah_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 7
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."s_jenisketetapan_s_idjenisketetapan_seq"
-- ----------------------------
DROP SEQUENCE "public"."s_jenisketetapan_s_idjenisketetapan_seq";
CREATE SEQUENCE "public"."s_jenisketetapan_s_idjenisketetapan_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."s_jenistransaksi_s_idjenistransaksi_seq"
-- ----------------------------
DROP SEQUENCE "public"."s_jenistransaksi_s_idjenistransaksi_seq";
CREATE SEQUENCE "public"."s_jenistransaksi_s_idjenistransaksi_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 15
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."s_kecamatan_s_idkecamatan_seq"
-- ----------------------------
DROP SEQUENCE "public"."s_kecamatan_s_idkecamatan_seq";
CREATE SEQUENCE "public"."s_kecamatan_s_idkecamatan_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."s_kelurahan_s_idkelurahan_seq"
-- ----------------------------
DROP SEQUENCE "public"."s_kelurahan_s_idkelurahan_seq";
CREATE SEQUENCE "public"."s_kelurahan_s_idkelurahan_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."s_koderekening_s_korekid_seq"
-- ----------------------------
DROP SEQUENCE "public"."s_koderekening_s_korekid_seq";
CREATE SEQUENCE "public"."s_koderekening_s_korekid_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."s_notaris_s_idnotaris_seq"
-- ----------------------------
DROP SEQUENCE "public"."s_notaris_s_idnotaris_seq";
CREATE SEQUENCE "public"."s_notaris_s_idnotaris_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 2
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."s_pejabat_s_idpejabat_seq"
-- ----------------------------
DROP SEQUENCE "public"."s_pejabat_s_idpejabat_seq";
CREATE SEQUENCE "public"."s_pejabat_s_idpejabat_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 8
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."s_pemda_s_idpemda_seq"
-- ----------------------------
DROP SEQUENCE "public"."s_pemda_s_idpemda_seq";
CREATE SEQUENCE "public"."s_pemda_s_idpemda_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."s_peraturan_s_idperaturan_seq"
-- ----------------------------
DROP SEQUENCE "public"."s_peraturan_s_idperaturan_seq";
CREATE SEQUENCE "public"."s_peraturan_s_idperaturan_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."s_persyaratan_s_idpersyaratan_seq"
-- ----------------------------
DROP SEQUENCE "public"."s_persyaratan_s_idpersyaratan_seq";
CREATE SEQUENCE "public"."s_persyaratan_s_idpersyaratan_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 80
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."s_presentase_s_idpresentase_seq"
-- ----------------------------
DROP SEQUENCE "public"."s_presentase_s_idpresentase_seq";
CREATE SEQUENCE "public"."s_presentase_s_idpresentase_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."s_tarifbphtb_s_idtarifbphtb_seq"
-- ----------------------------
DROP SEQUENCE "public"."s_tarifbphtb_s_idtarifbphtb_seq";
CREATE SEQUENCE "public"."s_tarifbphtb_s_idtarifbphtb_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."s_tarifnpoptkp_s_idtarifnpotkp_seq"
-- ----------------------------
DROP SEQUENCE "public"."s_tarifnpoptkp_s_idtarifnpotkp_seq";
CREATE SEQUENCE "public"."s_tarifnpoptkp_s_idtarifnpotkp_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 56
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."s_users_s_iduser_seq"
-- ----------------------------
DROP SEQUENCE "public"."s_users_s_iduser_seq";
CREATE SEQUENCE "public"."s_users_s_iduser_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 40
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."t_dendasanksinotaris_t_idds_seq"
-- ----------------------------
DROP SEQUENCE "public"."t_dendasanksinotaris_t_idds_seq";
CREATE SEQUENCE "public"."t_dendasanksinotaris_t_idds_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 16
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."t_detailsptbphtb_t_iddetailsptbphtb_seq"
-- ----------------------------
DROP SEQUENCE "public"."t_detailsptbphtb_t_iddetailsptbphtb_seq";
CREATE SEQUENCE "public"."t_detailsptbphtb_t_iddetailsptbphtb_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 45
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."t_pembayaranspt_t_idpembayaranspt_seq"
-- ----------------------------
DROP SEQUENCE "public"."t_pembayaranspt_t_idpembayaranspt_seq";
CREATE SEQUENCE "public"."t_pembayaranspt_t_idpembayaranspt_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 53
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."t_pemeriksaan_p_idpemeriksaan_seq"
-- ----------------------------
DROP SEQUENCE "public"."t_pemeriksaan_p_idpemeriksaan_seq";
CREATE SEQUENCE "public"."t_pemeriksaan_p_idpemeriksaan_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 16
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."t_penerimawaris_t_idpenerima_seq"
-- ----------------------------
DROP SEQUENCE "public"."t_penerimawaris_t_idpenerima_seq";
CREATE SEQUENCE "public"."t_penerimawaris_t_idpenerima_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 635
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."t_spt_t_idspt_seq"
-- ----------------------------
DROP SEQUENCE "public"."t_spt_t_idspt_seq";
CREATE SEQUENCE "public"."t_spt_t_idspt_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 46
 CACHE 1;

-- ----------------------------
-- Table structure for "public"."permission"
-- ----------------------------
DROP TABLE "public"."permission";
CREATE TABLE "public"."permission" (
"id" int8 DEFAULT nextval('permission_id_seq'::regclass) NOT NULL,
"permission_name" varchar(45) NOT NULL,
"resource_id" int8 NOT NULL,
"alias" varchar(255)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO "public"."permission" VALUES ('1', 'index', '1', 'Index');
INSERT INTO "public"."permission" VALUES ('2', 'setting', '1', 'Setting');
INSERT INTO "public"."permission" VALUES ('3', 'Pendataan', '1', 'Pendataan');
INSERT INTO "public"."permission" VALUES ('4', 'Pemeriksaan', '1', 'Pemeriksaan');
INSERT INTO "public"."permission" VALUES ('5', 'index', '2', 'Index');
INSERT INTO "public"."permission" VALUES ('6', 'logout', '2', 'Keluar');
INSERT INTO "public"."permission" VALUES ('7', 'index', '3', 'Index');
INSERT INTO "public"."permission" VALUES ('8', 'tambah', '3', 'Tambah');
INSERT INTO "public"."permission" VALUES ('9', 'index', '4', 'Index');
INSERT INTO "public"."permission" VALUES ('10', 'tambah', '4', 'Tambah');
INSERT INTO "public"."permission" VALUES ('11', 'edit', '4', 'Edit');
INSERT INTO "public"."permission" VALUES ('12', 'hapus', '4', 'Hapus');
INSERT INTO "public"."permission" VALUES ('13', 'sinkrondata', '4', 'Singkronisasi Data');
INSERT INTO "public"."permission" VALUES ('14', 'dataGrid', '4', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('15', 'index', '5', 'Index');
INSERT INTO "public"."permission" VALUES ('16', 'tambah', '5', 'Tambah');
INSERT INTO "public"."permission" VALUES ('17', 'edit', '5', 'Edit');
INSERT INTO "public"."permission" VALUES ('18', 'hapus', '5', 'Hapus');
INSERT INTO "public"."permission" VALUES ('19', 'sinkrondata', '5', 'Singkronisasi Data');
INSERT INTO "public"."permission" VALUES ('20', 'dataGrid', '5', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('21', 'index', '6', 'Index');
INSERT INTO "public"."permission" VALUES ('22', 'tambah', '6', 'Tambah');
INSERT INTO "public"."permission" VALUES ('23', 'edit', '6', 'Edit');
INSERT INTO "public"."permission" VALUES ('24', 'hapus', '6', 'Hapus');
INSERT INTO "public"."permission" VALUES ('25', 'dataGrid', '6', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('26', 'index', '7', 'Index');
INSERT INTO "public"."permission" VALUES ('27', 'tambah', '7', 'Tambah');
INSERT INTO "public"."permission" VALUES ('28', 'edit', '7', 'Edit');
INSERT INTO "public"."permission" VALUES ('29', 'hapus', '7', 'Hapus');
INSERT INTO "public"."permission" VALUES ('30', 'dataGrid', '7', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('31', 'index', '8', 'Index');
INSERT INTO "public"."permission" VALUES ('32', 'tambah', '8', 'Tambah');
INSERT INTO "public"."permission" VALUES ('33', 'edit', '8', 'Edit');
INSERT INTO "public"."permission" VALUES ('34', 'hapus', '8', 'Hapus');
INSERT INTO "public"."permission" VALUES ('35', 'dataGrid', '8', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('36', 'index', '9', 'Index');
INSERT INTO "public"."permission" VALUES ('37', 'tambah', '9', 'Tambah');
INSERT INTO "public"."permission" VALUES ('38', 'edit', '9', 'Edit');
INSERT INTO "public"."permission" VALUES ('39', 'hapus', '9', 'Hapus');
INSERT INTO "public"."permission" VALUES ('40', 'dataGrid', '9', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('41', 'index', '10', 'Index');
INSERT INTO "public"."permission" VALUES ('42', 'tambah', '10', 'Tambah');
INSERT INTO "public"."permission" VALUES ('43', 'edit', '10', 'Edit');
INSERT INTO "public"."permission" VALUES ('44', 'hapus', '10', 'Hapus');
INSERT INTO "public"."permission" VALUES ('45', 'dataGrid', '10', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('46', 'index', '12', 'Index');
INSERT INTO "public"."permission" VALUES ('47', 'tambah', '12', 'Tambah');
INSERT INTO "public"."permission" VALUES ('48', 'edit', '12', 'Edit');
INSERT INTO "public"."permission" VALUES ('49', 'hapus', '12', 'Hapus');
INSERT INTO "public"."permission" VALUES ('50', 'dataGrid', '12', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('51', 'index', '13', 'Index');
INSERT INTO "public"."permission" VALUES ('52', 'tambah', '13', 'Tambah');
INSERT INTO "public"."permission" VALUES ('53', 'edit', '13', 'Edit');
INSERT INTO "public"."permission" VALUES ('54', 'hapus', '13', 'Hapus');
INSERT INTO "public"."permission" VALUES ('55', 'index', '14', 'Index');
INSERT INTO "public"."permission" VALUES ('56', 'tambah', '14', 'Tambah');
INSERT INTO "public"."permission" VALUES ('57', 'edit', '14', 'Edit');
INSERT INTO "public"."permission" VALUES ('58', 'hapus', '14', 'Hapus');
INSERT INTO "public"."permission" VALUES ('59', 'dataGrid', '14', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('60', 'datanop', '14', 'Data NOP');
INSERT INTO "public"."permission" VALUES ('61', 'hitungBphtb', '14', 'Perhitungan AJB');
INSERT INTO "public"."permission" VALUES ('62', 'index', '15', 'Index');
INSERT INTO "public"."permission" VALUES ('63', 'tambah', '15', 'Tambah');
INSERT INTO "public"."permission" VALUES ('64', 'edit', '15', 'Edit');
INSERT INTO "public"."permission" VALUES ('65', 'hapus', '15', 'Hapus');
INSERT INTO "public"."permission" VALUES ('66', 'dataGrid', '15', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('67', 'datasspd', '15', 'Data SSPD');
INSERT INTO "public"."permission" VALUES ('68', 'index', '16', 'Index');
INSERT INTO "public"."permission" VALUES ('69', 'dataGrid', '16', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('70', 'tambah', '16', 'Tambah');
INSERT INTO "public"."permission" VALUES ('71', 'datapembayaran', '16', 'Data Pembayaran');
INSERT INTO "public"."permission" VALUES ('72', 'index', '17', 'Index');
INSERT INTO "public"."permission" VALUES ('73', 'dataGrid', '17', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('74', 'tambah', '17', 'Tambah');
INSERT INTO "public"."permission" VALUES ('75', 'datapembayaran', '17', 'Data Pembayaran');
INSERT INTO "public"."permission" VALUES ('76', 'cetaksspdbphtb', '18', 'Cetak SSPD');
INSERT INTO "public"."permission" VALUES ('77', 'validitassspd', '15', 'Validasi SSPD');
INSERT INTO "public"."permission" VALUES ('78', 'dataGridSkpdkbBphtb', '15', 'Data Grid SKPDKB');
INSERT INTO "public"."permission" VALUES ('79', 'dataGridPendataanBphtb', '15', 'Data Grid Pendataan');
INSERT INTO "public"."permission" VALUES ('80', 'pilihPendataanSspdBphtb', '15', 'Piih Pendataan SSPD');
INSERT INTO "public"."permission" VALUES ('81', 'pilihSkpdkbBphtb', '15', 'Pilih SKPDKB');
INSERT INTO "public"."permission" VALUES ('82', 'dataskpdkb', '15', 'Data SKPDKB');
INSERT INTO "public"."permission" VALUES ('83', 'dataGridPendataanBphtb', '17', 'Data Grid Pendataan');
INSERT INTO "public"."permission" VALUES ('84', 'pilihPendataanSspdBphtb', '17', 'Pilih Pendataan SSPD');
INSERT INTO "public"."permission" VALUES ('85', 'datapembayaran', '17', 'Data Pembayaran');
INSERT INTO "public"."permission" VALUES ('86', 'dataGridPendataanBphtb', '16', 'Data Grid Pendataan');
INSERT INTO "public"."permission" VALUES ('87', 'pilihPendataanSspdBphtb', '16', 'Pilih Pendataan SSPD');
INSERT INTO "public"."permission" VALUES ('88', 'datapembayaran', '16', 'Data Pembayaran');
INSERT INTO "public"."permission" VALUES ('89', 'hapus', '17', 'Hapus');
INSERT INTO "public"."permission" VALUES ('90', 'hapus', '16', 'Hapus');
INSERT INTO "public"."permission" VALUES ('91', 'updatepemeriksaan', '15', 'Simpan');
INSERT INTO "public"."permission" VALUES ('92', 'index', '19', 'Index');
INSERT INTO "public"."permission" VALUES ('93', 'cetakdaftarverifikasi', '19', 'Cetak Daftar Verifikasi');
INSERT INTO "public"."permission" VALUES ('94', 'cetaklapharian', '19', 'Cetak Laporan Harian');
INSERT INTO "public"."permission" VALUES ('95', 'cetaklapbphtb', '19', 'Cetak Laporan BPHTB');
INSERT INTO "public"."permission" VALUES ('96', 'cetaklapbulananbphtb', '19', 'Cetak Laporan Bulanan');
INSERT INTO "public"."permission" VALUES ('97', 'cetakrealisasibphtb', '19', 'Cetak Realisasi BPHTB');
INSERT INTO "public"."permission" VALUES ('98', 'cetakskpdkb', '19', 'Cetak SKPDKB');
INSERT INTO "public"."permission" VALUES ('99', 'dataGridSkpdkb', '19', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('100', 'pilihSkpdkbBphtb', '19', 'Pilih SKPDKB');
INSERT INTO "public"."permission" VALUES ('101', 'dataGridSkpdkb2', '19', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('102', 'pilihSkpdkbBphtb2', '19', 'Pilih SKPDKB');
INSERT INTO "public"."permission" VALUES ('103', 'cetakkodebayar', '18', 'Cetak Kode Bayar');
INSERT INTO "public"."permission" VALUES ('104', 'cetakpencatatansetoranbphtb', '18', 'Cetak pencatatan Setoran');
INSERT INTO "public"."permission" VALUES ('105', 'index', '20', 'Index');
INSERT INTO "public"."permission" VALUES ('106', 'dataGrid', '20', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('107', 'historybphtb', '14', 'Histori');
INSERT INTO "public"."permission" VALUES ('108', 'index', '21', 'Index');
INSERT INTO "public"."permission" VALUES ('109', 'dataGrid', '21', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('110', 'tambah', '21', 'Tambah');
INSERT INTO "public"."permission" VALUES ('111', 'edit', '21', 'Edit');
INSERT INTO "public"."permission" VALUES ('112', 'historybphtb', '14', 'Histori');
INSERT INTO "public"."permission" VALUES ('113', 'TampilPersyaratan', '14', 'Persyaratan');
INSERT INTO "public"."permission" VALUES ('114', 'hapus', '21', 'Hapus');
INSERT INTO "public"."permission" VALUES ('115', 'index', '22', 'Index');
INSERT INTO "public"."permission" VALUES ('116', 'dataGrid', '22', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('117', 'tambah', '22', 'Tambah');
INSERT INTO "public"."permission" VALUES ('118', 'edit', '22', 'Edit');
INSERT INTO "public"."permission" VALUES ('119', 'hapus', '22', 'Hapus');
INSERT INTO "public"."permission" VALUES ('120', 'tglajb', '14', 'Tanggal AJB');
INSERT INTO "public"."permission" VALUES ('121', 'tambahAjbBaru', '14', 'Tambah AJB');
INSERT INTO "public"."permission" VALUES ('122', 'index', '23', 'Index');
INSERT INTO "public"."permission" VALUES ('123', 'dataGrid', '23', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('124', 'laporkandata', '23', 'Laporan');
INSERT INTO "public"."permission" VALUES ('125', 'inputdenda', '23', 'Input Denda');
INSERT INTO "public"."permission" VALUES ('126', 'InputDendaNotaris', '23', 'Input Denda Notaris');
INSERT INTO "public"."permission" VALUES ('127', 'dataGridDendaNotaris', '23', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('128', 'Hapus', '23', 'Hapus');
INSERT INTO "public"."permission" VALUES ('129', 'cetakbuktipenerimaan', '18', 'Cetak Bukti Penerimaan');
INSERT INTO "public"."permission" VALUES ('130', 'edit', '20', 'Edit');
INSERT INTO "public"."permission" VALUES ('131', 'update', '20', 'Update');
INSERT INTO "public"."permission" VALUES ('132', 'inputsanksi', '23', 'Input Sanksi');
INSERT INTO "public"."permission" VALUES ('133', 'InputSanksiNotaris', '23', 'Input Sanksi Notaris');
INSERT INTO "public"."permission" VALUES ('134', 'formcetakdatapendaftaran', '14', 'Form Cetak Pendaftaran');
INSERT INTO "public"."permission" VALUES ('135', 'cetakdatapendaftaran', '14', 'Cetak Pendaftaran');
INSERT INTO "public"."permission" VALUES ('136', 'formcetakdatastatusberkas', '14', 'Form Status Berkas');
INSERT INTO "public"."permission" VALUES ('137', 'cetakdatastatusberkas', '14', 'Cetak Status Berkas');
INSERT INTO "public"."permission" VALUES ('138', 'edit', '17', 'Edit');
INSERT INTO "public"."permission" VALUES ('139', 'informasiop', '14', 'Informasi Objek Pajak');
INSERT INTO "public"."permission" VALUES ('140', 'cariinformasiop', '14', 'Cari Informasi OP');
INSERT INTO "public"."permission" VALUES ('141', 'ubahpass', '13', 'Ubah Password');
INSERT INTO "public"."permission" VALUES ('142', 'cetakbuktipenerimaanvalidasi', '18', 'Cetak Bukti Validasi');
INSERT INTO "public"."permission" VALUES ('143', 'inputsertifikat', '20', 'Input Sertifikat');
INSERT INTO "public"."permission" VALUES ('144', 'updatesertifikat', '20', 'Update Sertifikat');
INSERT INTO "public"."permission" VALUES ('145', 'cetakhasilbpn', '19', 'Cetak Hasil Input BPN');
INSERT INTO "public"."permission" VALUES ('146', 'hitungnjop', '14', 'Hitung NJOP');
INSERT INTO "public"."permission" VALUES ('147', 'konfirmasidata', '23', 'Konfirmasi Data Notaris');
INSERT INTO "public"."permission" VALUES ('148', 'cetakkonfnotaris', '19', 'Cetak Konfirmasi');
INSERT INTO "public"."permission" VALUES ('149', 'hitungnjop', '17', 'Hitung NJOP Pemeriksaan');
INSERT INTO "public"."permission" VALUES ('150', 'cetakbuktivalidasipembayaran', '19', 'Cetak Validasi Pembayaran');
INSERT INTO "public"."permission" VALUES ('151', 'index', '24', 'Index');
INSERT INTO "public"."permission" VALUES ('152', 'dataGrid', '24', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('153', 'tambah', '24', 'Tambah');
INSERT INTO "public"."permission" VALUES ('154', 'edit', '24', 'Edit');
INSERT INTO "public"."permission" VALUES ('155', 'hapus', '24', 'Hapus');
INSERT INTO "public"."permission" VALUES ('156', 'dataGridSanksiNotaris', '23', 'Data Grid Sanksi Notaris');
INSERT INTO "public"."permission" VALUES ('157', 'cetaksts', '23', 'Cetak STS');
INSERT INTO "public"."permission" VALUES ('158', 'sismiop', '14', 'Menu Sismiop');
INSERT INTO "public"."permission" VALUES ('159', 'dataGridSismiop', '14', 'Data Grid Sismiop');
INSERT INTO "public"."permission" VALUES ('160', 'dataGridDS', '15', 'Data Grid Pembayaran Denda');
INSERT INTO "public"."permission" VALUES ('161', 'pilihPendataanDS', '15', 'Pilih Denda Sanksi');
INSERT INTO "public"."permission" VALUES ('162', 'index', '25', 'Index');
INSERT INTO "public"."permission" VALUES ('163', 'tambah', '25', 'Tambah');
INSERT INTO "public"."permission" VALUES ('164', 'dataGrid', '25', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('165', 'cetakbuktipembayaran', '19', 'Cetak Bukti Pembayaran');
INSERT INTO "public"."permission" VALUES ('166', 'cetakpemberitahuandenda', '23', 'Cetak Pemberitahuan Denda');
INSERT INTO "public"."permission" VALUES ('167', 'cektunggakanpbb', '17', 'Cek Tunggakan PBB');
INSERT INTO "public"."permission" VALUES ('168', 'viewdata', '14', 'Lihat Data SSPD');
INSERT INTO "public"."permission" VALUES ('169', 'viewdata', '17', 'Lihat Data SSPD');
INSERT INTO "public"."permission" VALUES ('170', 'viewdata', '15', 'Lihat Data SSPD');
INSERT INTO "public"."permission" VALUES ('171', 'dataGrid', '13', 'Data Grid');
INSERT INTO "public"."permission" VALUES ('172', 'cetakpermohonanpenelitian', '14', 'Cetak Permohonan Penelitian');

-- ----------------------------
-- Table structure for "public"."permission_resource"
-- ----------------------------
DROP TABLE "public"."permission_resource";
CREATE TABLE "public"."permission_resource" (
"s_iduser" int4,
"s_idpermission" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of permission_resource
-- ----------------------------
INSERT INTO "public"."permission_resource" VALUES ('2', '1');
INSERT INTO "public"."permission_resource" VALUES ('2', '2');
INSERT INTO "public"."permission_resource" VALUES ('2', '3');
INSERT INTO "public"."permission_resource" VALUES ('2', '4');
INSERT INTO "public"."permission_resource" VALUES ('2', '7');
INSERT INTO "public"."permission_resource" VALUES ('2', '8');
INSERT INTO "public"."permission_resource" VALUES ('2', '21');
INSERT INTO "public"."permission_resource" VALUES ('2', '22');
INSERT INTO "public"."permission_resource" VALUES ('2', '23');
INSERT INTO "public"."permission_resource" VALUES ('2', '24');
INSERT INTO "public"."permission_resource" VALUES ('2', '25');
INSERT INTO "public"."permission_resource" VALUES ('2', '26');
INSERT INTO "public"."permission_resource" VALUES ('2', '27');
INSERT INTO "public"."permission_resource" VALUES ('2', '28');
INSERT INTO "public"."permission_resource" VALUES ('2', '29');
INSERT INTO "public"."permission_resource" VALUES ('2', '30');
INSERT INTO "public"."permission_resource" VALUES ('2', '31');
INSERT INTO "public"."permission_resource" VALUES ('2', '32');
INSERT INTO "public"."permission_resource" VALUES ('2', '33');
INSERT INTO "public"."permission_resource" VALUES ('2', '34');
INSERT INTO "public"."permission_resource" VALUES ('2', '35');
INSERT INTO "public"."permission_resource" VALUES ('2', '36');
INSERT INTO "public"."permission_resource" VALUES ('2', '37');
INSERT INTO "public"."permission_resource" VALUES ('2', '38');
INSERT INTO "public"."permission_resource" VALUES ('2', '39');
INSERT INTO "public"."permission_resource" VALUES ('2', '40');
INSERT INTO "public"."permission_resource" VALUES ('2', '41');
INSERT INTO "public"."permission_resource" VALUES ('2', '42');
INSERT INTO "public"."permission_resource" VALUES ('2', '43');
INSERT INTO "public"."permission_resource" VALUES ('2', '44');
INSERT INTO "public"."permission_resource" VALUES ('2', '45');
INSERT INTO "public"."permission_resource" VALUES ('2', '46');
INSERT INTO "public"."permission_resource" VALUES ('2', '47');
INSERT INTO "public"."permission_resource" VALUES ('2', '48');
INSERT INTO "public"."permission_resource" VALUES ('2', '49');
INSERT INTO "public"."permission_resource" VALUES ('2', '50');
INSERT INTO "public"."permission_resource" VALUES ('2', '51');
INSERT INTO "public"."permission_resource" VALUES ('2', '52');
INSERT INTO "public"."permission_resource" VALUES ('2', '53');
INSERT INTO "public"."permission_resource" VALUES ('2', '54');
INSERT INTO "public"."permission_resource" VALUES ('2', '55');
INSERT INTO "public"."permission_resource" VALUES ('2', '56');
INSERT INTO "public"."permission_resource" VALUES ('2', '57');
INSERT INTO "public"."permission_resource" VALUES ('2', '58');
INSERT INTO "public"."permission_resource" VALUES ('2', '59');
INSERT INTO "public"."permission_resource" VALUES ('2', '60');
INSERT INTO "public"."permission_resource" VALUES ('2', '61');
INSERT INTO "public"."permission_resource" VALUES ('2', '62');
INSERT INTO "public"."permission_resource" VALUES ('2', '63');
INSERT INTO "public"."permission_resource" VALUES ('2', '64');
INSERT INTO "public"."permission_resource" VALUES ('2', '65');
INSERT INTO "public"."permission_resource" VALUES ('2', '66');
INSERT INTO "public"."permission_resource" VALUES ('2', '67');
INSERT INTO "public"."permission_resource" VALUES ('2', '72');
INSERT INTO "public"."permission_resource" VALUES ('2', '73');
INSERT INTO "public"."permission_resource" VALUES ('2', '74');
INSERT INTO "public"."permission_resource" VALUES ('2', '75');
INSERT INTO "public"."permission_resource" VALUES ('2', '76');
INSERT INTO "public"."permission_resource" VALUES ('2', '77');
INSERT INTO "public"."permission_resource" VALUES ('2', '78');
INSERT INTO "public"."permission_resource" VALUES ('2', '79');
INSERT INTO "public"."permission_resource" VALUES ('2', '80');
INSERT INTO "public"."permission_resource" VALUES ('2', '81');
INSERT INTO "public"."permission_resource" VALUES ('2', '82');
INSERT INTO "public"."permission_resource" VALUES ('2', '83');
INSERT INTO "public"."permission_resource" VALUES ('2', '84');
INSERT INTO "public"."permission_resource" VALUES ('2', '85');
INSERT INTO "public"."permission_resource" VALUES ('2', '89');
INSERT INTO "public"."permission_resource" VALUES ('2', '91');
INSERT INTO "public"."permission_resource" VALUES ('2', '92');
INSERT INTO "public"."permission_resource" VALUES ('2', '93');
INSERT INTO "public"."permission_resource" VALUES ('2', '94');
INSERT INTO "public"."permission_resource" VALUES ('2', '95');
INSERT INTO "public"."permission_resource" VALUES ('2', '96');
INSERT INTO "public"."permission_resource" VALUES ('2', '97');
INSERT INTO "public"."permission_resource" VALUES ('2', '98');
INSERT INTO "public"."permission_resource" VALUES ('2', '99');
INSERT INTO "public"."permission_resource" VALUES ('2', '100');
INSERT INTO "public"."permission_resource" VALUES ('2', '101');
INSERT INTO "public"."permission_resource" VALUES ('2', '102');
INSERT INTO "public"."permission_resource" VALUES ('2', '103');
INSERT INTO "public"."permission_resource" VALUES ('2', '104');
INSERT INTO "public"."permission_resource" VALUES ('2', '105');
INSERT INTO "public"."permission_resource" VALUES ('2', '106');
INSERT INTO "public"."permission_resource" VALUES ('2', '107');
INSERT INTO "public"."permission_resource" VALUES ('2', '108');
INSERT INTO "public"."permission_resource" VALUES ('2', '109');
INSERT INTO "public"."permission_resource" VALUES ('2', '110');
INSERT INTO "public"."permission_resource" VALUES ('2', '111');
INSERT INTO "public"."permission_resource" VALUES ('2', '112');
INSERT INTO "public"."permission_resource" VALUES ('2', '113');
INSERT INTO "public"."permission_resource" VALUES ('2', '114');
INSERT INTO "public"."permission_resource" VALUES ('2', '115');
INSERT INTO "public"."permission_resource" VALUES ('2', '116');
INSERT INTO "public"."permission_resource" VALUES ('2', '117');
INSERT INTO "public"."permission_resource" VALUES ('2', '118');
INSERT INTO "public"."permission_resource" VALUES ('2', '119');
INSERT INTO "public"."permission_resource" VALUES ('2', '120');
INSERT INTO "public"."permission_resource" VALUES ('2', '121');
INSERT INTO "public"."permission_resource" VALUES ('2', '122');
INSERT INTO "public"."permission_resource" VALUES ('2', '123');
INSERT INTO "public"."permission_resource" VALUES ('2', '124');
INSERT INTO "public"."permission_resource" VALUES ('2', '125');
INSERT INTO "public"."permission_resource" VALUES ('2', '126');
INSERT INTO "public"."permission_resource" VALUES ('2', '127');
INSERT INTO "public"."permission_resource" VALUES ('2', '128');
INSERT INTO "public"."permission_resource" VALUES ('2', '129');
INSERT INTO "public"."permission_resource" VALUES ('2', '130');
INSERT INTO "public"."permission_resource" VALUES ('2', '131');
INSERT INTO "public"."permission_resource" VALUES ('2', '132');
INSERT INTO "public"."permission_resource" VALUES ('2', '133');
INSERT INTO "public"."permission_resource" VALUES ('2', '134');
INSERT INTO "public"."permission_resource" VALUES ('2', '135');
INSERT INTO "public"."permission_resource" VALUES ('2', '136');
INSERT INTO "public"."permission_resource" VALUES ('2', '137');
INSERT INTO "public"."permission_resource" VALUES ('2', '138');
INSERT INTO "public"."permission_resource" VALUES ('2', '139');
INSERT INTO "public"."permission_resource" VALUES ('2', '140');
INSERT INTO "public"."permission_resource" VALUES ('2', '141');
INSERT INTO "public"."permission_resource" VALUES ('2', '142');
INSERT INTO "public"."permission_resource" VALUES ('2', '143');
INSERT INTO "public"."permission_resource" VALUES ('2', '144');
INSERT INTO "public"."permission_resource" VALUES ('2', '145');
INSERT INTO "public"."permission_resource" VALUES ('2', '146');
INSERT INTO "public"."permission_resource" VALUES ('2', '147');
INSERT INTO "public"."permission_resource" VALUES ('2', '148');
INSERT INTO "public"."permission_resource" VALUES ('2', '149');
INSERT INTO "public"."permission_resource" VALUES ('2', '150');
INSERT INTO "public"."permission_resource" VALUES ('2', '151');
INSERT INTO "public"."permission_resource" VALUES ('2', '152');
INSERT INTO "public"."permission_resource" VALUES ('2', '153');
INSERT INTO "public"."permission_resource" VALUES ('2', '154');
INSERT INTO "public"."permission_resource" VALUES ('2', '155');
INSERT INTO "public"."permission_resource" VALUES ('2', '156');
INSERT INTO "public"."permission_resource" VALUES ('2', '157');
INSERT INTO "public"."permission_resource" VALUES ('2', '158');
INSERT INTO "public"."permission_resource" VALUES ('2', '159');
INSERT INTO "public"."permission_resource" VALUES ('2', '160');
INSERT INTO "public"."permission_resource" VALUES ('2', '161');
INSERT INTO "public"."permission_resource" VALUES ('2', '162');
INSERT INTO "public"."permission_resource" VALUES ('2', '163');
INSERT INTO "public"."permission_resource" VALUES ('2', '164');
INSERT INTO "public"."permission_resource" VALUES ('2', '165');
INSERT INTO "public"."permission_resource" VALUES ('2', '166');
INSERT INTO "public"."permission_resource" VALUES ('2', '167');
INSERT INTO "public"."permission_resource" VALUES ('2', '168');
INSERT INTO "public"."permission_resource" VALUES ('2', '169');
INSERT INTO "public"."permission_resource" VALUES ('2', '170');
INSERT INTO "public"."permission_resource" VALUES ('2', '171');
INSERT INTO "public"."permission_resource" VALUES ('2', '172');
INSERT INTO "public"."permission_resource" VALUES ('9', '1');
INSERT INTO "public"."permission_resource" VALUES ('9', '2');
INSERT INTO "public"."permission_resource" VALUES ('9', '3');
INSERT INTO "public"."permission_resource" VALUES ('9', '4');
INSERT INTO "public"."permission_resource" VALUES ('9', '55');
INSERT INTO "public"."permission_resource" VALUES ('9', '59');
INSERT INTO "public"."permission_resource" VALUES ('9', '62');
INSERT INTO "public"."permission_resource" VALUES ('9', '66');
INSERT INTO "public"."permission_resource" VALUES ('9', '72');
INSERT INTO "public"."permission_resource" VALUES ('9', '73');
INSERT INTO "public"."permission_resource" VALUES ('9', '74');
INSERT INTO "public"."permission_resource" VALUES ('9', '75');
INSERT INTO "public"."permission_resource" VALUES ('9', '76');
INSERT INTO "public"."permission_resource" VALUES ('9', '83');
INSERT INTO "public"."permission_resource" VALUES ('9', '84');
INSERT INTO "public"."permission_resource" VALUES ('9', '85');
INSERT INTO "public"."permission_resource" VALUES ('9', '89');
INSERT INTO "public"."permission_resource" VALUES ('9', '92');
INSERT INTO "public"."permission_resource" VALUES ('9', '93');
INSERT INTO "public"."permission_resource" VALUES ('9', '94');
INSERT INTO "public"."permission_resource" VALUES ('9', '95');
INSERT INTO "public"."permission_resource" VALUES ('9', '96');
INSERT INTO "public"."permission_resource" VALUES ('9', '97');
INSERT INTO "public"."permission_resource" VALUES ('9', '98');
INSERT INTO "public"."permission_resource" VALUES ('9', '99');
INSERT INTO "public"."permission_resource" VALUES ('9', '100');
INSERT INTO "public"."permission_resource" VALUES ('9', '101');
INSERT INTO "public"."permission_resource" VALUES ('9', '102');
INSERT INTO "public"."permission_resource" VALUES ('9', '103');
INSERT INTO "public"."permission_resource" VALUES ('9', '104');
INSERT INTO "public"."permission_resource" VALUES ('9', '105');
INSERT INTO "public"."permission_resource" VALUES ('9', '106');
INSERT INTO "public"."permission_resource" VALUES ('9', '122');
INSERT INTO "public"."permission_resource" VALUES ('9', '123');
INSERT INTO "public"."permission_resource" VALUES ('9', '124');
INSERT INTO "public"."permission_resource" VALUES ('9', '125');
INSERT INTO "public"."permission_resource" VALUES ('9', '126');
INSERT INTO "public"."permission_resource" VALUES ('9', '127');
INSERT INTO "public"."permission_resource" VALUES ('9', '128');
INSERT INTO "public"."permission_resource" VALUES ('9', '129');
INSERT INTO "public"."permission_resource" VALUES ('9', '132');
INSERT INTO "public"."permission_resource" VALUES ('9', '133');
INSERT INTO "public"."permission_resource" VALUES ('9', '141');
INSERT INTO "public"."permission_resource" VALUES ('9', '142');
INSERT INTO "public"."permission_resource" VALUES ('9', '149');
INSERT INTO "public"."permission_resource" VALUES ('12', '1');
INSERT INTO "public"."permission_resource" VALUES ('12', '2');
INSERT INTO "public"."permission_resource" VALUES ('12', '3');
INSERT INTO "public"."permission_resource" VALUES ('12', '4');
INSERT INTO "public"."permission_resource" VALUES ('12', '55');
INSERT INTO "public"."permission_resource" VALUES ('12', '56');
INSERT INTO "public"."permission_resource" VALUES ('12', '57');
INSERT INTO "public"."permission_resource" VALUES ('12', '58');
INSERT INTO "public"."permission_resource" VALUES ('12', '59');
INSERT INTO "public"."permission_resource" VALUES ('12', '60');
INSERT INTO "public"."permission_resource" VALUES ('12', '61');
INSERT INTO "public"."permission_resource" VALUES ('12', '76');
INSERT INTO "public"."permission_resource" VALUES ('12', '96');
INSERT INTO "public"."permission_resource" VALUES ('12', '107');
INSERT INTO "public"."permission_resource" VALUES ('12', '112');
INSERT INTO "public"."permission_resource" VALUES ('12', '113');
INSERT INTO "public"."permission_resource" VALUES ('12', '120');
INSERT INTO "public"."permission_resource" VALUES ('12', '121');
INSERT INTO "public"."permission_resource" VALUES ('12', '122');
INSERT INTO "public"."permission_resource" VALUES ('12', '123');
INSERT INTO "public"."permission_resource" VALUES ('12', '124');
INSERT INTO "public"."permission_resource" VALUES ('12', '127');
INSERT INTO "public"."permission_resource" VALUES ('12', '129');
INSERT INTO "public"."permission_resource" VALUES ('12', '134');
INSERT INTO "public"."permission_resource" VALUES ('12', '135');
INSERT INTO "public"."permission_resource" VALUES ('12', '136');
INSERT INTO "public"."permission_resource" VALUES ('12', '137');
INSERT INTO "public"."permission_resource" VALUES ('12', '139');
INSERT INTO "public"."permission_resource" VALUES ('12', '140');
INSERT INTO "public"."permission_resource" VALUES ('12', '141');
INSERT INTO "public"."permission_resource" VALUES ('12', '146');
INSERT INTO "public"."permission_resource" VALUES ('13', '1');
INSERT INTO "public"."permission_resource" VALUES ('13', '2');
INSERT INTO "public"."permission_resource" VALUES ('13', '3');
INSERT INTO "public"."permission_resource" VALUES ('13', '4');
INSERT INTO "public"."permission_resource" VALUES ('13', '55');
INSERT INTO "public"."permission_resource" VALUES ('13', '56');
INSERT INTO "public"."permission_resource" VALUES ('13', '57');
INSERT INTO "public"."permission_resource" VALUES ('13', '58');
INSERT INTO "public"."permission_resource" VALUES ('13', '59');
INSERT INTO "public"."permission_resource" VALUES ('13', '60');
INSERT INTO "public"."permission_resource" VALUES ('13', '61');
INSERT INTO "public"."permission_resource" VALUES ('13', '76');
INSERT INTO "public"."permission_resource" VALUES ('13', '107');
INSERT INTO "public"."permission_resource" VALUES ('13', '112');
INSERT INTO "public"."permission_resource" VALUES ('13', '113');
INSERT INTO "public"."permission_resource" VALUES ('13', '120');
INSERT INTO "public"."permission_resource" VALUES ('13', '121');
INSERT INTO "public"."permission_resource" VALUES ('13', '122');
INSERT INTO "public"."permission_resource" VALUES ('13', '123');
INSERT INTO "public"."permission_resource" VALUES ('13', '124');
INSERT INTO "public"."permission_resource" VALUES ('13', '127');
INSERT INTO "public"."permission_resource" VALUES ('13', '129');
INSERT INTO "public"."permission_resource" VALUES ('13', '134');
INSERT INTO "public"."permission_resource" VALUES ('13', '135');
INSERT INTO "public"."permission_resource" VALUES ('13', '136');
INSERT INTO "public"."permission_resource" VALUES ('13', '137');
INSERT INTO "public"."permission_resource" VALUES ('13', '139');
INSERT INTO "public"."permission_resource" VALUES ('13', '140');
INSERT INTO "public"."permission_resource" VALUES ('13', '141');
INSERT INTO "public"."permission_resource" VALUES ('14', '1');
INSERT INTO "public"."permission_resource" VALUES ('14', '2');
INSERT INTO "public"."permission_resource" VALUES ('14', '3');
INSERT INTO "public"."permission_resource" VALUES ('14', '4');
INSERT INTO "public"."permission_resource" VALUES ('14', '55');
INSERT INTO "public"."permission_resource" VALUES ('14', '56');
INSERT INTO "public"."permission_resource" VALUES ('14', '57');
INSERT INTO "public"."permission_resource" VALUES ('14', '58');
INSERT INTO "public"."permission_resource" VALUES ('14', '59');
INSERT INTO "public"."permission_resource" VALUES ('14', '60');
INSERT INTO "public"."permission_resource" VALUES ('14', '61');
INSERT INTO "public"."permission_resource" VALUES ('14', '76');
INSERT INTO "public"."permission_resource" VALUES ('14', '107');
INSERT INTO "public"."permission_resource" VALUES ('14', '112');
INSERT INTO "public"."permission_resource" VALUES ('14', '113');
INSERT INTO "public"."permission_resource" VALUES ('14', '120');
INSERT INTO "public"."permission_resource" VALUES ('14', '121');
INSERT INTO "public"."permission_resource" VALUES ('14', '122');
INSERT INTO "public"."permission_resource" VALUES ('14', '123');
INSERT INTO "public"."permission_resource" VALUES ('14', '124');
INSERT INTO "public"."permission_resource" VALUES ('14', '127');
INSERT INTO "public"."permission_resource" VALUES ('14', '129');
INSERT INTO "public"."permission_resource" VALUES ('14', '134');
INSERT INTO "public"."permission_resource" VALUES ('14', '135');
INSERT INTO "public"."permission_resource" VALUES ('14', '136');
INSERT INTO "public"."permission_resource" VALUES ('14', '137');
INSERT INTO "public"."permission_resource" VALUES ('14', '139');
INSERT INTO "public"."permission_resource" VALUES ('14', '140');
INSERT INTO "public"."permission_resource" VALUES ('14', '141');
INSERT INTO "public"."permission_resource" VALUES ('37', '59');
INSERT INTO "public"."permission_resource" VALUES ('37', '73');
INSERT INTO "public"."permission_resource" VALUES ('37', '78');
INSERT INTO "public"."permission_resource" VALUES ('38', '1');
INSERT INTO "public"."permission_resource" VALUES ('38', '2');
INSERT INTO "public"."permission_resource" VALUES ('38', '3');
INSERT INTO "public"."permission_resource" VALUES ('38', '4');
INSERT INTO "public"."permission_resource" VALUES ('38', '7');
INSERT INTO "public"."permission_resource" VALUES ('38', '8');
INSERT INTO "public"."permission_resource" VALUES ('38', '21');
INSERT INTO "public"."permission_resource" VALUES ('38', '22');
INSERT INTO "public"."permission_resource" VALUES ('38', '23');
INSERT INTO "public"."permission_resource" VALUES ('38', '24');
INSERT INTO "public"."permission_resource" VALUES ('38', '25');
INSERT INTO "public"."permission_resource" VALUES ('38', '26');
INSERT INTO "public"."permission_resource" VALUES ('38', '27');
INSERT INTO "public"."permission_resource" VALUES ('38', '28');
INSERT INTO "public"."permission_resource" VALUES ('38', '29');
INSERT INTO "public"."permission_resource" VALUES ('38', '30');
INSERT INTO "public"."permission_resource" VALUES ('38', '31');
INSERT INTO "public"."permission_resource" VALUES ('38', '32');
INSERT INTO "public"."permission_resource" VALUES ('38', '33');
INSERT INTO "public"."permission_resource" VALUES ('38', '34');
INSERT INTO "public"."permission_resource" VALUES ('38', '35');
INSERT INTO "public"."permission_resource" VALUES ('38', '36');
INSERT INTO "public"."permission_resource" VALUES ('38', '37');
INSERT INTO "public"."permission_resource" VALUES ('38', '38');
INSERT INTO "public"."permission_resource" VALUES ('38', '39');
INSERT INTO "public"."permission_resource" VALUES ('38', '40');
INSERT INTO "public"."permission_resource" VALUES ('38', '41');
INSERT INTO "public"."permission_resource" VALUES ('38', '42');
INSERT INTO "public"."permission_resource" VALUES ('38', '43');
INSERT INTO "public"."permission_resource" VALUES ('38', '44');
INSERT INTO "public"."permission_resource" VALUES ('38', '45');
INSERT INTO "public"."permission_resource" VALUES ('38', '46');
INSERT INTO "public"."permission_resource" VALUES ('38', '47');
INSERT INTO "public"."permission_resource" VALUES ('38', '48');
INSERT INTO "public"."permission_resource" VALUES ('38', '49');
INSERT INTO "public"."permission_resource" VALUES ('38', '50');
INSERT INTO "public"."permission_resource" VALUES ('38', '51');
INSERT INTO "public"."permission_resource" VALUES ('38', '52');
INSERT INTO "public"."permission_resource" VALUES ('38', '53');
INSERT INTO "public"."permission_resource" VALUES ('38', '54');
INSERT INTO "public"."permission_resource" VALUES ('38', '55');
INSERT INTO "public"."permission_resource" VALUES ('38', '56');
INSERT INTO "public"."permission_resource" VALUES ('38', '57');
INSERT INTO "public"."permission_resource" VALUES ('38', '58');
INSERT INTO "public"."permission_resource" VALUES ('38', '59');
INSERT INTO "public"."permission_resource" VALUES ('38', '60');
INSERT INTO "public"."permission_resource" VALUES ('38', '61');
INSERT INTO "public"."permission_resource" VALUES ('38', '62');
INSERT INTO "public"."permission_resource" VALUES ('38', '63');
INSERT INTO "public"."permission_resource" VALUES ('38', '64');
INSERT INTO "public"."permission_resource" VALUES ('38', '65');
INSERT INTO "public"."permission_resource" VALUES ('38', '66');
INSERT INTO "public"."permission_resource" VALUES ('38', '67');
INSERT INTO "public"."permission_resource" VALUES ('38', '72');
INSERT INTO "public"."permission_resource" VALUES ('38', '73');
INSERT INTO "public"."permission_resource" VALUES ('38', '74');
INSERT INTO "public"."permission_resource" VALUES ('38', '75');
INSERT INTO "public"."permission_resource" VALUES ('38', '76');
INSERT INTO "public"."permission_resource" VALUES ('38', '77');
INSERT INTO "public"."permission_resource" VALUES ('38', '78');
INSERT INTO "public"."permission_resource" VALUES ('38', '79');
INSERT INTO "public"."permission_resource" VALUES ('38', '80');
INSERT INTO "public"."permission_resource" VALUES ('38', '81');
INSERT INTO "public"."permission_resource" VALUES ('38', '82');
INSERT INTO "public"."permission_resource" VALUES ('38', '83');
INSERT INTO "public"."permission_resource" VALUES ('38', '84');
INSERT INTO "public"."permission_resource" VALUES ('38', '85');
INSERT INTO "public"."permission_resource" VALUES ('38', '89');
INSERT INTO "public"."permission_resource" VALUES ('38', '91');
INSERT INTO "public"."permission_resource" VALUES ('38', '92');
INSERT INTO "public"."permission_resource" VALUES ('38', '93');
INSERT INTO "public"."permission_resource" VALUES ('38', '94');
INSERT INTO "public"."permission_resource" VALUES ('38', '95');
INSERT INTO "public"."permission_resource" VALUES ('38', '96');
INSERT INTO "public"."permission_resource" VALUES ('38', '97');
INSERT INTO "public"."permission_resource" VALUES ('38', '98');
INSERT INTO "public"."permission_resource" VALUES ('38', '99');
INSERT INTO "public"."permission_resource" VALUES ('38', '100');
INSERT INTO "public"."permission_resource" VALUES ('38', '101');
INSERT INTO "public"."permission_resource" VALUES ('38', '102');
INSERT INTO "public"."permission_resource" VALUES ('38', '103');
INSERT INTO "public"."permission_resource" VALUES ('38', '104');
INSERT INTO "public"."permission_resource" VALUES ('38', '105');
INSERT INTO "public"."permission_resource" VALUES ('38', '106');
INSERT INTO "public"."permission_resource" VALUES ('38', '107');
INSERT INTO "public"."permission_resource" VALUES ('38', '108');
INSERT INTO "public"."permission_resource" VALUES ('38', '109');
INSERT INTO "public"."permission_resource" VALUES ('38', '110');
INSERT INTO "public"."permission_resource" VALUES ('38', '111');
INSERT INTO "public"."permission_resource" VALUES ('38', '112');
INSERT INTO "public"."permission_resource" VALUES ('38', '113');
INSERT INTO "public"."permission_resource" VALUES ('38', '114');
INSERT INTO "public"."permission_resource" VALUES ('38', '115');
INSERT INTO "public"."permission_resource" VALUES ('38', '116');
INSERT INTO "public"."permission_resource" VALUES ('38', '117');
INSERT INTO "public"."permission_resource" VALUES ('38', '118');
INSERT INTO "public"."permission_resource" VALUES ('38', '119');
INSERT INTO "public"."permission_resource" VALUES ('38', '120');
INSERT INTO "public"."permission_resource" VALUES ('38', '121');
INSERT INTO "public"."permission_resource" VALUES ('38', '122');
INSERT INTO "public"."permission_resource" VALUES ('38', '123');
INSERT INTO "public"."permission_resource" VALUES ('38', '124');
INSERT INTO "public"."permission_resource" VALUES ('38', '125');
INSERT INTO "public"."permission_resource" VALUES ('38', '126');
INSERT INTO "public"."permission_resource" VALUES ('38', '127');
INSERT INTO "public"."permission_resource" VALUES ('38', '128');
INSERT INTO "public"."permission_resource" VALUES ('38', '129');
INSERT INTO "public"."permission_resource" VALUES ('38', '130');
INSERT INTO "public"."permission_resource" VALUES ('38', '131');
INSERT INTO "public"."permission_resource" VALUES ('38', '132');
INSERT INTO "public"."permission_resource" VALUES ('38', '133');
INSERT INTO "public"."permission_resource" VALUES ('39', '1');
INSERT INTO "public"."permission_resource" VALUES ('39', '2');
INSERT INTO "public"."permission_resource" VALUES ('39', '3');
INSERT INTO "public"."permission_resource" VALUES ('39', '4');
INSERT INTO "public"."permission_resource" VALUES ('39', '62');
INSERT INTO "public"."permission_resource" VALUES ('39', '63');
INSERT INTO "public"."permission_resource" VALUES ('39', '64');
INSERT INTO "public"."permission_resource" VALUES ('39', '65');
INSERT INTO "public"."permission_resource" VALUES ('39', '66');
INSERT INTO "public"."permission_resource" VALUES ('39', '67');
INSERT INTO "public"."permission_resource" VALUES ('39', '76');
INSERT INTO "public"."permission_resource" VALUES ('39', '77');
INSERT INTO "public"."permission_resource" VALUES ('39', '78');
INSERT INTO "public"."permission_resource" VALUES ('39', '79');
INSERT INTO "public"."permission_resource" VALUES ('39', '80');
INSERT INTO "public"."permission_resource" VALUES ('39', '81');
INSERT INTO "public"."permission_resource" VALUES ('39', '82');
INSERT INTO "public"."permission_resource" VALUES ('39', '91');
INSERT INTO "public"."permission_resource" VALUES ('39', '103');
INSERT INTO "public"."permission_resource" VALUES ('39', '104');
INSERT INTO "public"."permission_resource" VALUES ('39', '129');
INSERT INTO "public"."permission_resource" VALUES ('39', '141');
INSERT INTO "public"."permission_resource" VALUES ('39', '150');
INSERT INTO "public"."permission_resource" VALUES ('39', '160');
INSERT INTO "public"."permission_resource" VALUES ('39', '161');
INSERT INTO "public"."permission_resource" VALUES ('39', '165');
INSERT INTO "public"."permission_resource" VALUES ('40', '1');
INSERT INTO "public"."permission_resource" VALUES ('40', '2');
INSERT INTO "public"."permission_resource" VALUES ('40', '3');
INSERT INTO "public"."permission_resource" VALUES ('40', '4');
INSERT INTO "public"."permission_resource" VALUES ('40', '105');
INSERT INTO "public"."permission_resource" VALUES ('40', '106');
INSERT INTO "public"."permission_resource" VALUES ('40', '130');
INSERT INTO "public"."permission_resource" VALUES ('40', '131');
INSERT INTO "public"."permission_resource" VALUES ('40', '141');
INSERT INTO "public"."permission_resource" VALUES ('40', '143');
INSERT INTO "public"."permission_resource" VALUES ('40', '144');

-- ----------------------------
-- Table structure for "public"."resource"
-- ----------------------------
DROP TABLE "public"."resource";
CREATE TABLE "public"."resource" (
"id" int8 DEFAULT nextval('resource_id_seq'::regclass) NOT NULL,
"resource_name" varchar(50) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO "public"."resource" VALUES ('1', 'BPHTBINDEX');
INSERT INTO "public"."resource" VALUES ('2', 'LoginAccess');
INSERT INTO "public"."resource" VALUES ('3', 'SettingPemda');
INSERT INTO "public"."resource" VALUES ('4', 'SettingKecamatan');
INSERT INTO "public"."resource" VALUES ('5', 'SettingKelurahan');
INSERT INTO "public"."resource" VALUES ('6', 'SettingPejabat');
INSERT INTO "public"."resource" VALUES ('7', 'SettingNotaris');
INSERT INTO "public"."resource" VALUES ('8', 'SettingJenisTransaksi');
INSERT INTO "public"."resource" VALUES ('9', 'SettingTarifNpotkp');
INSERT INTO "public"."resource" VALUES ('10', 'SettingHakTanah');
INSERT INTO "public"."resource" VALUES ('11', 'SettingJenisKetetapan');
INSERT INTO "public"."resource" VALUES ('12', 'SettingTarifBphtb');
INSERT INTO "public"."resource" VALUES ('13', 'SettingUser');
INSERT INTO "public"."resource" VALUES ('14', 'PendataanSSPD');
INSERT INTO "public"."resource" VALUES ('15', 'PembayaranSPT');
INSERT INTO "public"."resource" VALUES ('16', 'ValidasiSPT');
INSERT INTO "public"."resource" VALUES ('17', 'VerifikasiSPT');
INSERT INTO "public"."resource" VALUES ('18', 'CetakSSPD');
INSERT INTO "public"."resource" VALUES ('19', 'CetakLaporan');
INSERT INTO "public"."resource" VALUES ('20', 'Bpn');
INSERT INTO "public"."resource" VALUES ('21', 'SettingPersyaratanTransaksi');
INSERT INTO "public"."resource" VALUES ('22', 'SettingDokTanah');
INSERT INTO "public"."resource" VALUES ('23', 'PelaporanNotaris');
INSERT INTO "public"."resource" VALUES ('24', 'SettingHargaAcuan');
INSERT INTO "public"."resource" VALUES ('25', 'PendataanSismiop');

-- ----------------------------
-- Table structure for "public"."role"
-- ----------------------------
DROP TABLE "public"."role";
CREATE TABLE "public"."role" (
"rid" int8 DEFAULT nextval('role_rid_seq'::regclass) NOT NULL,
"role_name" varchar(60) NOT NULL,
"status" char(255) DEFAULT 'Active'::bpchar NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO "public"."role" VALUES ('1', 'Administrator', 'Active                                                                                                                                                                                                                                                         ');
INSERT INTO "public"."role" VALUES ('2', 'Pegawai', 'Active                                                                                                                                                                                                                                                         ');
INSERT INTO "public"."role" VALUES ('3', 'Notaris', 'Active                                                                                                                                                                                                                                                         ');
INSERT INTO "public"."role" VALUES ('4', 'Bank', 'Active                                                                                                                                                                                                                                                         ');
INSERT INTO "public"."role" VALUES ('5', 'BPN', 'Active                                                                                                                                                                                                                                                         ');

-- ----------------------------
-- Table structure for "public"."s_acuan"
-- ----------------------------
DROP TABLE "public"."s_acuan";
CREATE TABLE "public"."s_acuan" (
"s_idacuan" int4 DEFAULT nextval('s_acuan_s_idacuan_seq'::regclass) NOT NULL,
"s_kd_propinsi" varchar(2),
"s_kd_dati2" varchar(2),
"s_kd_kecamatan" varchar(3),
"s_kd_kelurahan" varchar(3),
"s_kd_blok" varchar(3),
"s_permetertanah" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of s_acuan
-- ----------------------------
INSERT INTO "public"."s_acuan" VALUES ('2', '32', '80', '720', '001', '027', '500000');
INSERT INTO "public"."s_acuan" VALUES ('3', '17', '09', '050', '035', '001', '1300000');
INSERT INTO "public"."s_acuan" VALUES ('4', '17', '09', '050', '035', '002', '1400000');
INSERT INTO "public"."s_acuan" VALUES ('5', '17', '09', '030', '048', '002', '1000000');
INSERT INTO "public"."s_acuan" VALUES ('6', '17', '09', '010', '013', '002', '1500');
INSERT INTO "public"."s_acuan" VALUES ('7', '17', '09', '080', '026', '002', '4000');

-- ----------------------------
-- Table structure for "public"."s_jenisdoktanah"
-- ----------------------------
DROP TABLE "public"."s_jenisdoktanah";
CREATE TABLE "public"."s_jenisdoktanah" (
"s_iddoktanah" int4 DEFAULT nextval('s_jenisdoktanah_s_iddoktanah_seq'::regclass) NOT NULL,
"s_namadoktanah" text
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of s_jenisdoktanah
-- ----------------------------
INSERT INTO "public"."s_jenisdoktanah" VALUES ('1', 'Sertifikat');
INSERT INTO "public"."s_jenisdoktanah" VALUES ('2', 'Warkah');
INSERT INTO "public"."s_jenisdoktanah" VALUES ('3', 'Girik');
INSERT INTO "public"."s_jenisdoktanah" VALUES ('4', 'Letter C');

-- ----------------------------
-- Table structure for "public"."s_jenishaktanah"
-- ----------------------------
DROP TABLE "public"."s_jenishaktanah";
CREATE TABLE "public"."s_jenishaktanah" (
"s_idhaktanah" int4 DEFAULT nextval('s_jenishaktanah_s_idjenishaktanah_seq'::regclass) NOT NULL,
"s_kodehaktanah" varchar(10),
"s_namahaktanah" text
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of s_jenishaktanah
-- ----------------------------
INSERT INTO "public"."s_jenishaktanah" VALUES ('1', '01', 'Hak Milik');
INSERT INTO "public"."s_jenishaktanah" VALUES ('2', '02', 'Hak Guna Usaha');
INSERT INTO "public"."s_jenishaktanah" VALUES ('3', '03', 'Hak Guna Bangunan');
INSERT INTO "public"."s_jenishaktanah" VALUES ('4', '04', 'Hak Pakai');
INSERT INTO "public"."s_jenishaktanah" VALUES ('5', '05', 'Hak Milik Atas Satuan Rumah');
INSERT INTO "public"."s_jenishaktanah" VALUES ('6', '06', 'Hak Pengelolaan');

-- ----------------------------
-- Table structure for "public"."s_jenisketetapan"
-- ----------------------------
DROP TABLE "public"."s_jenisketetapan";
CREATE TABLE "public"."s_jenisketetapan" (
"s_idjenisketetapan" int4 DEFAULT nextval('s_jenisketetapan_s_idjenisketetapan_seq'::regclass) NOT NULL,
"s_namajenisketetapan" text NOT NULL,
"s_namasingkatjenisketetapan" varchar(20) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of s_jenisketetapan
-- ----------------------------

-- ----------------------------
-- Table structure for "public"."s_jenistransaksi"
-- ----------------------------
DROP TABLE "public"."s_jenistransaksi";
CREATE TABLE "public"."s_jenistransaksi" (
"s_idjenistransaksi" int4 DEFAULT nextval('s_jenistransaksi_s_idjenistransaksi_seq'::regclass) NOT NULL,
"s_kodejenistransaksi" varchar(5),
"s_namajenistransaksi" varchar(200)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of s_jenistransaksi
-- ----------------------------
INSERT INTO "public"."s_jenistransaksi" VALUES ('1', '01', 'Jual Beli');
INSERT INTO "public"."s_jenistransaksi" VALUES ('2', '02', 'Tukar Menukar');
INSERT INTO "public"."s_jenistransaksi" VALUES ('3', '03', 'Hibah');
INSERT INTO "public"."s_jenistransaksi" VALUES ('4', '04', 'Hibah Wasiat');
INSERT INTO "public"."s_jenistransaksi" VALUES ('5', '05', 'Waris');
INSERT INTO "public"."s_jenistransaksi" VALUES ('6', '06', 'Pemasukan Dalam Perseroan atau Badan Hukum Lainnya');
INSERT INTO "public"."s_jenistransaksi" VALUES ('7', '07', 'Pemisahan Hak yang Mengakibatkan Peralihan');
INSERT INTO "public"."s_jenistransaksi" VALUES ('8', '08', 'Penunjukan Pembeli Dalam Lelang');
INSERT INTO "public"."s_jenistransaksi" VALUES ('9', '09', 'Pelaksanaan Putusan Hakim yang Mempunyai Kekuatan Hukum Tetap');
INSERT INTO "public"."s_jenistransaksi" VALUES ('10', '10', 'Penggabungan Usaha');
INSERT INTO "public"."s_jenistransaksi" VALUES ('11', '11', 'Peleburan Usaha');
INSERT INTO "public"."s_jenistransaksi" VALUES ('12', '12', 'Pemekaran Usaha');
INSERT INTO "public"."s_jenistransaksi" VALUES ('13', '13', 'Hadiah');

-- ----------------------------
-- Table structure for "public"."s_kecamatan"
-- ----------------------------
DROP TABLE "public"."s_kecamatan";
CREATE TABLE "public"."s_kecamatan" (
"s_idkecamatan" int4 DEFAULT nextval('s_kecamatan_s_idkecamatan_seq'::regclass) NOT NULL,
"s_kodekecamatan" varchar(4) NOT NULL,
"s_namakecamatan" text NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of s_kecamatan
-- ----------------------------

-- ----------------------------
-- Table structure for "public"."s_kelurahan"
-- ----------------------------
DROP TABLE "public"."s_kelurahan";
CREATE TABLE "public"."s_kelurahan" (
"s_idkelurahan" int4 DEFAULT nextval('s_kelurahan_s_idkelurahan_seq'::regclass) NOT NULL,
"s_idkecamatan" int4 NOT NULL,
"s_kodekelurahan" varchar(4) NOT NULL,
"s_namakelurahan" text NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of s_kelurahan
-- ----------------------------

-- ----------------------------
-- Table structure for "public"."s_koderekening"
-- ----------------------------
DROP TABLE "public"."s_koderekening";
CREATE TABLE "public"."s_koderekening" (
"s_korekid" int4 DEFAULT nextval('s_koderekening_s_korekid_seq'::regclass) NOT NULL,
"s_korektipe" varchar(2) NOT NULL,
"s_korekkelompok" varchar(2) NOT NULL,
"s_korekjenis" varchar(2) NOT NULL,
"s_korekobjek" varchar(4) NOT NULL,
"s_korekrincian" varchar(4) NOT NULL,
"s_korekrinciansub" varchar(10) NOT NULL,
"s_koreknama" varchar(300) NOT NULL,
"s_korekketerangan" text NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of s_koderekening
-- ----------------------------
INSERT INTO "public"."s_koderekening" VALUES ('1', '4', '1', '1', '11', '', '', 'Bea Perolehan Hak Atas Tanah dan Bangunan (BPHTB) - LRA Bea Perolehan Hak Atas Tanah dan Bangunan (BPHTB) - LRA', '');
INSERT INTO "public"."s_koderekening" VALUES ('2', '4', '1', '1', '11', '01', '', 'BPHTB', '');
INSERT INTO "public"."s_koderekening" VALUES ('3', '4', '1', '7', '11', '01', '', 'Denda BPHTB', '');
INSERT INTO "public"."s_koderekening" VALUES ('4', '4', '1', '7', '11', '02', '', 'Sanksi BPHTB', '');

-- ----------------------------
-- Table structure for "public"."s_notaris"
-- ----------------------------
DROP TABLE "public"."s_notaris";
CREATE TABLE "public"."s_notaris" (
"s_idnotaris" int4 DEFAULT nextval('s_notaris_s_idnotaris_seq'::regclass) NOT NULL,
"s_namanotaris" varchar,
"s_alamatnotaris" text,
"s_kodenotaris" varchar,
"s_sknotaris" varchar(50),
"s_tgl1notaris" date,
"s_tgl2notaris" date,
"s_statusnotaris" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of s_notaris
-- ----------------------------
INSERT INTO "public"."s_notaris" VALUES ('4', 'Farhan SE MKn', 'Solo', '02', '02', '2010-01-12', '2020-01-12', '1');
INSERT INTO "public"."s_notaris" VALUES ('5', 'Miftahul Huda SE MKn', 'Guyangan', '03', '03', '2015-01-01', '2015-12-31', '1');
INSERT INTO "public"."s_notaris" VALUES ('6', 'Ade Dwi Fabianto SE MKn', 'Lebak Bulus', '01', '01', '2000-01-01', '2020-01-01', '1');

-- ----------------------------
-- Table structure for "public"."s_pejabat"
-- ----------------------------
DROP TABLE "public"."s_pejabat";
CREATE TABLE "public"."s_pejabat" (
"s_idpejabat" int4 DEFAULT nextval('s_pejabat_s_idpejabat_seq'::regclass) NOT NULL,
"s_namapejabat" text NOT NULL,
"s_jabatanpejabat" text NOT NULL,
"s_nippejabat" varchar(25) NOT NULL,
"s_golonganpejabat" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of s_pejabat
-- ----------------------------
INSERT INTO "public"."s_pejabat" VALUES ('1', 'Caca', 'Bendahara', '123', null);
INSERT INTO "public"."s_pejabat" VALUES ('2', 'Alex', 'Bendahara Penerima', '928390182930819', '3');

-- ----------------------------
-- Table structure for "public"."s_pemda"
-- ----------------------------
DROP TABLE "public"."s_pemda";
CREATE TABLE "public"."s_pemda" (
"s_idpemda" int4 DEFAULT nextval('s_pemda_s_idpemda_seq'::regclass) NOT NULL,
"s_namaprov" varchar(250) NOT NULL,
"s_namakabkot" varchar(250) NOT NULL,
"s_namaibukotakabkot" varchar(250) NOT NULL,
"s_kodeprovinsi" varchar(3) NOT NULL,
"s_kodekabkot" varchar(4) NOT NULL,
"s_namainstansi" varchar(250) NOT NULL,
"s_namasingkatinstansi" varchar(50) NOT NULL,
"s_alamatinstansi" text NOT NULL,
"s_notelinstansi" varchar(15) NOT NULL,
"s_namabank" varchar(100) NOT NULL,
"s_norekbank" varchar(30) NOT NULL,
"s_logo" text,
"s_namacabang" varchar(50),
"s_kodecabang" varchar(20),
"s_kodepos" varchar(5)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of s_pemda
-- ----------------------------
INSERT INTO "public"."s_pemda" VALUES ('4', 'Jawa Barat', 'Kabupaten Bandung Barat', 'Ngamprah', '61', '72', 'Dinas Pendapatan, Pengelolaan Keuangan & Aset', 'DPPKA', 'Ngamprah', '(0562) 639623', 'Bank Jabar', '2001001661', 'public/upload/Kab_Bandung_Barat.svg.png', 'Singkawang', '-', '73123');

-- ----------------------------
-- Table structure for "public"."s_peraturan"
-- ----------------------------
DROP TABLE "public"."s_peraturan";
CREATE TABLE "public"."s_peraturan" (
"s_idperaturan" int4 DEFAULT nextval('s_peraturan_s_idperaturan_seq'::regclass) NOT NULL,
"s_teksperaturan" text,
"s_kodeperaturan" varchar(5)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of s_peraturan
-- ----------------------------
INSERT INTO "public"."s_peraturan" VALUES ('1', 'Pasal 12 ayat (1) Peraturan Daerah Kabupaten Bandung Barat Nomor 7 Tahun 2010 tentang Bea Perolehan Hak Atas Tanah dan Bangunan', '3');
INSERT INTO "public"."s_peraturan" VALUES ('2', 'Pasal 12 ayat (1) Peraturan Daerah Kabupaten Bandung Barat Nomor 7 Tahun 2010 tentang Bea Perolehan Hak Atas Tanah dan Bangunan', '4');

-- ----------------------------
-- Table structure for "public"."s_persyaratan"
-- ----------------------------
DROP TABLE "public"."s_persyaratan";
CREATE TABLE "public"."s_persyaratan" (
"s_idpersyaratan" int4 DEFAULT nextval('s_persyaratan_s_idpersyaratan_seq'::regclass) NOT NULL,
"s_idjenistransaksi" int4,
"s_namapersyaratan" varchar,
"order" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of s_persyaratan
-- ----------------------------
INSERT INTO "public"."s_persyaratan" VALUES ('1', '1', 'KTP Pembeli/Penjual', null);
INSERT INTO "public"."s_persyaratan" VALUES ('2', '1', 'Kartu Keluarga', null);
INSERT INTO "public"."s_persyaratan" VALUES ('3', '1', 'Akta Jual Beli (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('4', '1', 'Bukti Kepemilikan (Sertifikat/Nomor Bukti Kepemilikan)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('5', '1', 'SPPT PBB Tahun Terakhir', null);
INSERT INTO "public"."s_persyaratan" VALUES ('6', '1', 'Bukti-bukti lainnya yang dapat dijadikan dasar perhitungan BPHTB', null);
INSERT INTO "public"."s_persyaratan" VALUES ('7', '2', 'KTP Penerima Hak Tukar/Pemberi Hak Tukar', null);
INSERT INTO "public"."s_persyaratan" VALUES ('8', '2', 'Kartu Keluarga', null);
INSERT INTO "public"."s_persyaratan" VALUES ('9', '2', 'Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('10', '2', 'Bukti Kepemilikan (Sertifikat, Warkah)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('11', '2', 'SPPT PBB Tahun Terakhir', null);
INSERT INTO "public"."s_persyaratan" VALUES ('12', '2', 'Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB', null);
INSERT INTO "public"."s_persyaratan" VALUES ('13', '3', 'KTP Penerima Hibah/Pemberi Hibah', null);
INSERT INTO "public"."s_persyaratan" VALUES ('14', '3', 'Kartu Keluarga', null);
INSERT INTO "public"."s_persyaratan" VALUES ('15', '3', 'Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('16', '3', 'Bukti Kepemilikan (Sertifikat, Warkah)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('17', '3', 'SPPT PBB Tahun Terakhir', null);
INSERT INTO "public"."s_persyaratan" VALUES ('18', '3', 'Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB', null);
INSERT INTO "public"."s_persyaratan" VALUES ('19', '4', 'KTP Penerima Hibah/Pemberi Hibah', null);
INSERT INTO "public"."s_persyaratan" VALUES ('20', '4', 'Kartu Keluarga', null);
INSERT INTO "public"."s_persyaratan" VALUES ('21', '4', 'Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('22', '4', 'Bukti Kepemilikan (Sertifikat, Warkah)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('23', '4', 'SPPT PBB Tahun Terakhir', null);
INSERT INTO "public"."s_persyaratan" VALUES ('24', '4', 'Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB', null);
INSERT INTO "public"."s_persyaratan" VALUES ('25', '5', 'KTP Penerima Hak Waris/Pewaris', null);
INSERT INTO "public"."s_persyaratan" VALUES ('26', '5', 'Kartu Keluarga', null);
INSERT INTO "public"."s_persyaratan" VALUES ('27', '5', 'Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('28', '5', 'Bukti Kepemilikan (Sertifikat, Warkah)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('29', '5', 'Bukti Waris', null);
INSERT INTO "public"."s_persyaratan" VALUES ('30', '5', 'SPPT PBB Tahun Terakhir', null);
INSERT INTO "public"."s_persyaratan" VALUES ('31', '5', 'Bukti-bukti lainnya yang dapat dijadikan dasar perhitungan BPHTB', null);
INSERT INTO "public"."s_persyaratan" VALUES ('32', '6', 'KTP', null);
INSERT INTO "public"."s_persyaratan" VALUES ('33', '6', 'Kartu Keluarga', null);
INSERT INTO "public"."s_persyaratan" VALUES ('34', '6', 'Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('35', '6', 'Bukti Kepemilikan (Sertifikat, Warkah)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('36', '6', 'SPPT PBB Tahun Terakhir', null);
INSERT INTO "public"."s_persyaratan" VALUES ('37', '6', 'Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB', null);
INSERT INTO "public"."s_persyaratan" VALUES ('38', '7', 'KTP', null);
INSERT INTO "public"."s_persyaratan" VALUES ('39', '7', 'Kartu Keluarga', null);
INSERT INTO "public"."s_persyaratan" VALUES ('40', '7', 'Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('41', '7', 'Bukti Kepemilikan (Sertifikat, Warkah)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('42', '7', 'SPPT PBB Tahun Terakhir', null);
INSERT INTO "public"."s_persyaratan" VALUES ('43', '7', 'Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB', null);
INSERT INTO "public"."s_persyaratan" VALUES ('44', '8', 'KPT', null);
INSERT INTO "public"."s_persyaratan" VALUES ('45', '8', 'Kartu Keluarga', null);
INSERT INTO "public"."s_persyaratan" VALUES ('46', '8', 'Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('47', '8', 'Bukti Kepemilikan (Sertifikat, Warkah)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('48', '8', 'SPPT PBB Tahun Terakhir', null);
INSERT INTO "public"."s_persyaratan" VALUES ('49', '8', 'Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB', null);
INSERT INTO "public"."s_persyaratan" VALUES ('50', '9', 'KTP', null);
INSERT INTO "public"."s_persyaratan" VALUES ('51', '9', 'Kartu Keluarga', null);
INSERT INTO "public"."s_persyaratan" VALUES ('52', '9', 'Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('53', '9', 'Bukti Kepemilikan (Sertifikat, Warkah)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('54', '9', 'SPPT PBB Tahun Terakhir', null);
INSERT INTO "public"."s_persyaratan" VALUES ('55', '9', 'Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB', null);
INSERT INTO "public"."s_persyaratan" VALUES ('56', '10', 'KTP', null);
INSERT INTO "public"."s_persyaratan" VALUES ('57', '10', 'Kartu Keluarga', null);
INSERT INTO "public"."s_persyaratan" VALUES ('58', '10', 'Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('59', '10', 'Bukti Kepemilikan (Sertifikat, Warkah)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('60', '10', 'SPPT PBB Tahun Terakhir', null);
INSERT INTO "public"."s_persyaratan" VALUES ('61', '10', 'Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB', null);
INSERT INTO "public"."s_persyaratan" VALUES ('62', '11', 'KTP', null);
INSERT INTO "public"."s_persyaratan" VALUES ('63', '11', 'Kartu Keluarga', null);
INSERT INTO "public"."s_persyaratan" VALUES ('64', '11', 'Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('65', '11', 'Bukti Kepemilikan (Sertifikat, Warkah)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('66', '11', 'SPPT PBB Tahun Terakhir', null);
INSERT INTO "public"."s_persyaratan" VALUES ('67', '11', 'Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB', null);
INSERT INTO "public"."s_persyaratan" VALUES ('68', '12', 'KTP', null);
INSERT INTO "public"."s_persyaratan" VALUES ('69', '12', 'Kartu Keluarga', null);
INSERT INTO "public"."s_persyaratan" VALUES ('70', '12', 'Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('71', '12', 'Bukti Kepemilikan (Sertifikat, Warkah)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('72', '12', 'SPPT PBB Tahun Terakhir', null);
INSERT INTO "public"."s_persyaratan" VALUES ('73', '12', 'Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB', null);
INSERT INTO "public"."s_persyaratan" VALUES ('74', '13', 'KTP Penerima Hadiah/Pemberi Hadiah', null);
INSERT INTO "public"."s_persyaratan" VALUES ('75', '13', 'Kartu Keluarga', null);
INSERT INTO "public"."s_persyaratan" VALUES ('76', '13', 'Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('77', '13', 'Bukti Kepemilikan (Sertifikat, Warkah)', null);
INSERT INTO "public"."s_persyaratan" VALUES ('78', '13', 'SPPT PBB Tahun Terakhir', null);
INSERT INTO "public"."s_persyaratan" VALUES ('79', '13', 'Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB', null);

-- ----------------------------
-- Table structure for "public"."s_presentase"
-- ----------------------------
DROP TABLE "public"."s_presentase";
CREATE TABLE "public"."s_presentase" (
"s_idpresentase" int4 DEFAULT nextval('s_presentase_s_idpresentase_seq'::regclass) NOT NULL,
"s_presentase" int4,
"s_keterangan" varchar(30),
"s_presentasemin" int4,
"warna" varchar(20)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of s_presentase
-- ----------------------------
INSERT INTO "public"."s_presentase" VALUES ('1', '50', 'Tidak Wajar', '0', 'red');
INSERT INTO "public"."s_presentase" VALUES ('2', '75', 'Kurang Wajar', '51', 'yellow');
INSERT INTO "public"."s_presentase" VALUES ('3', '100', 'Wajar', '76', 'green');

-- ----------------------------
-- Table structure for "public"."s_tarifbphtb"
-- ----------------------------
DROP TABLE "public"."s_tarifbphtb";
CREATE TABLE "public"."s_tarifbphtb" (
"s_idtarifbphtb" int4 DEFAULT nextval('s_tarifbphtb_s_idtarifbphtb_seq'::regclass) NOT NULL,
"s_tarifbphtb" float4,
"s_dasarhukumtarifbphtb" text,
"s_tanggaltarifbphtb" date,
"s_statustarifbphtb" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of s_tarifbphtb
-- ----------------------------
INSERT INTO "public"."s_tarifbphtb" VALUES ('2', '5', 'Dasar Hukum', '2014-06-06', '1');

-- ----------------------------
-- Table structure for "public"."s_tarifnpoptkp"
-- ----------------------------
DROP TABLE "public"."s_tarifnpoptkp";
CREATE TABLE "public"."s_tarifnpoptkp" (
"s_idtarifnpotkp" int4 DEFAULT nextval('s_tarifnpoptkp_s_idtarifnpotkp_seq'::regclass) NOT NULL,
"s_idjenistransaksinpotkp" int4,
"s_tarifnpotkp" float4,
"s_dasarhukumnpotkp" text,
"s_statusnpotkp" int4,
"s_tarifnpotkptambahan" float4,
"s_tarifnpotkptahunajb1" int4,
"s_tarifnpotkptahunajb2" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of s_tarifnpoptkp
-- ----------------------------
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('1', '1', '6e+07', 'Dasar Hukum', '1', null, '2011', '2015');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('2', '2', '6e+07', 'Dasar Hukum', '1', null, '2011', '2015');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('3', '3', '6e+07', 'Dasar Hukum', '1', null, '2011', '2015');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('4', '4', '6e+07', 'Dasar Hukum', '1', '3e+08', '2011', '2015');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('5', '5', '6e+07', 'Dasar Hukum', '1', '3e+08', '2011', '2015');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('6', '6', '6e+07', 'Dasar Hukum', '1', null, '2011', '2015');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('7', '7', '6e+07', 'Dasar Hukum', '1', null, '2011', '2015');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('8', '8', '6e+07', 'Dasar Hukum', '1', null, '2011', '2015');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('9', '9', '6e+07', 'Dasar Hukum', '1', null, '2011', '2015');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('10', '10', '6e+07', 'Dasar Hukum', '1', null, '2011', '2015');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('11', '11', '6e+07', 'Dasar Hukum', '1', null, '2011', '2015');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('12', '12', '6e+07', 'Dasar Hukum', '1', null, '2011', '2015');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('13', '13', '6e+07', 'Dasar Hukum', '1', null, '2011', '2015');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('16', '1', '2e+07', 'Dasar Hukum', '1', null, '2010', '2010');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('17', '2', '2e+07', 'Dasar Hukum', '1', null, '2010', '2010');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('18', '3', '2e+07', 'Dasar Hukum', '1', null, '2010', '2010');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('19', '4', '2e+07', 'Dasar Hukum', '1', null, '2010', '2010');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('20', '5', '2e+07', 'Dasar Hukum', '1', null, '2010', '2010');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('21', '6', '2e+07', 'Dasar Hukum', '1', null, '2010', '2010');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('22', '7', '2e+07', 'Dasar Hukum', '1', null, '2010', '2010');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('23', '8', '2e+07', 'Dasar Hukum', '1', null, '2010', '2010');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('24', '9', '2e+07', 'Dasar Hukum', '1', null, '2010', '2010');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('25', '10', '2e+07', 'Dasar Hukum', '1', null, '2010', '2010');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('26', '11', '2e+07', 'Dasar Hukum', '1', null, '2010', '2010');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('27', '12', '2e+07', 'Dasar Hukum', '1', null, '2010', '2010');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('28', '13', '2e+07', 'Dasar Hukum', '1', null, '2010', '2010');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('29', '2', '3e+07', 'Dasar Hukum', '1', null, '2009', '2009');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('30', '3', '3e+07', 'Dasar Hukum', '1', null, '2009', '2009');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('31', '4', '3e+07', 'Dasar Hukum', '1', null, '2009', '2009');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('32', '5', '3e+07', 'Dasar Hukum', '1', null, '2009', '2009');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('33', '6', '3e+07', 'Dasar Hukum', '1', null, '2009', '2009');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('34', '7', '3e+07', 'Dasar Hukum', '1', null, '2009', '2009');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('35', '8', '3e+07', 'Dasar Hukum', '1', null, '2009', '2009');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('36', '9', '3e+07', 'Dasar Hukum', '1', null, '2009', '2009');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('37', '10', '3e+07', 'Dasar Hukum', '1', null, '2009', '2009');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('38', '11', '3e+07', 'Dasar Hukum', '1', null, '2009', '2009');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('39', '12', '3e+07', 'Dasar Hukum', '1', null, '2009', '2009');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('40', '13', '3e+07', 'Dasar Hukum', '1', null, '2009', '2009');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('41', '1', '3e+07', 'Dasar Hukum', '1', null, '2009', '2009');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('42', '2', '2e+07', 'Dasar Hukum', '1', null, '1997', '2008');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('43', '3', '2e+07', 'Dasar Hukum', '1', null, '1997', '2008');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('44', '4', '2e+07', 'Dasar Hukum', '1', null, '1997', '2008');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('45', '5', '2e+07', 'Dasar Hukum', '1', null, '1997', '2008');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('46', '6', '2e+07', 'Dasar Hukum', '1', null, '1997', '2008');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('47', '7', '2e+07', 'Dasar Hukum', '1', null, '1997', '2008');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('48', '8', '2e+07', 'Dasar Hukum', '1', null, '1997', '2008');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('49', '9', '2e+07', 'Dasar Hukum', '1', null, '1997', '2008');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('50', '10', '2e+07', 'Dasar Hukum', '1', null, '1997', '2008');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('51', '11', '2e+07', 'Dasar Hukum', '1', null, '1997', '2008');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('52', '12', '2e+07', 'Dasar Hukum', '1', null, '1997', '2008');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('53', '13', '2e+07', 'Dasar Hukum', '1', null, '1997', '2008');
INSERT INTO "public"."s_tarifnpoptkp" VALUES ('54', '1', '2e+07', 'Dasar Hukum', '1', null, '1997', '2008');

-- ----------------------------
-- Table structure for "public"."s_tempo"
-- ----------------------------
DROP TABLE "public"."s_tempo";
CREATE TABLE "public"."s_tempo" (
"s_jumlahhari" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of s_tempo
-- ----------------------------
INSERT INTO "public"."s_tempo" VALUES ('3');

-- ----------------------------
-- Table structure for "public"."s_users"
-- ----------------------------
DROP TABLE "public"."s_users";
CREATE TABLE "public"."s_users" (
"s_iduser" int4 DEFAULT nextval('s_users_s_iduser_seq'::regclass) NOT NULL,
"s_username" varchar(100) NOT NULL,
"s_password" varchar(100) NOT NULL,
"s_jabatan" text NOT NULL,
"s_akses" int4,
"s_idpejabat_idnotaris" varchar,
"s_tipe_pejabat" varchar(1)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of s_users
-- ----------------------------
INSERT INTO "public"."s_users" VALUES ('2', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator Aplikasi', '1', '', '');
INSERT INTO "public"."s_users" VALUES ('9', 'pegawai', '81dc9bdb52d04dc20036dbd8313ed055', 'Kasi', '2', '', '1');
INSERT INTO "public"."s_users" VALUES ('12', 'ade', '81dc9bdb52d04dc20036dbd8313ed055', 'Notaris', '3', '6', '2');
INSERT INTO "public"."s_users" VALUES ('13', 'farhan', '81dc9bdb52d04dc20036dbd8313ed055', 'Notaris', '3', '4', '2');
INSERT INTO "public"."s_users" VALUES ('14', 'huda', '81dc9bdb52d04dc20036dbd8313ed055', 'Notaris', '3', '5', '2');
INSERT INTO "public"."s_users" VALUES ('39', 'bank', '81dc9bdb52d04dc20036dbd8313ed055', 'Pegawai Bank', '4', '', '1');
INSERT INTO "public"."s_users" VALUES ('40', 'bpn', '81dc9bdb52d04dc20036dbd8313ed055', 'Pegawai BPN', '5', '', '1');

-- ----------------------------
-- Table structure for "public"."ss_golonganpejabat"
-- ----------------------------
DROP TABLE "public"."ss_golonganpejabat";
CREATE TABLE "public"."ss_golonganpejabat" (
"ss_idgolongan" int4 NOT NULL,
"ss_namagolongan" varchar(50) NOT NULL,
"ss_pangkatgolongan" text NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of ss_golonganpejabat
-- ----------------------------
INSERT INTO "public"."ss_golonganpejabat" VALUES ('1', 'II/a', 'Pengatur Muda');
INSERT INTO "public"."ss_golonganpejabat" VALUES ('2', 'II/b', 'Pengatur Muda Tingkat I');
INSERT INTO "public"."ss_golonganpejabat" VALUES ('3', 'II/c', 'Pengatur');
INSERT INTO "public"."ss_golonganpejabat" VALUES ('4', 'II/d', 'Pengatur Tingkat I');
INSERT INTO "public"."ss_golonganpejabat" VALUES ('5', 'III/a', 'Penata Muda');
INSERT INTO "public"."ss_golonganpejabat" VALUES ('6', 'III/b', 'Penata Muda Tingkat I');
INSERT INTO "public"."ss_golonganpejabat" VALUES ('7', 'III/c', 'Penata');
INSERT INTO "public"."ss_golonganpejabat" VALUES ('8', 'III/d', 'Penata Tingkat I');
INSERT INTO "public"."ss_golonganpejabat" VALUES ('9', 'IV/a', 'Pembina');
INSERT INTO "public"."ss_golonganpejabat" VALUES ('10', 'IV/b', 'Pembina Tingkat I');
INSERT INTO "public"."ss_golonganpejabat" VALUES ('11', 'IV/c', 'Pembina Utama Muda');
INSERT INTO "public"."ss_golonganpejabat" VALUES ('12', 'IV/d', 'Pembina Utama Madya');
INSERT INTO "public"."ss_golonganpejabat" VALUES ('13', 'IV/e', 'Pembina Utama');

-- ----------------------------
-- Table structure for "public"."t_dendasanksinotaris"
-- ----------------------------
DROP TABLE "public"."t_dendasanksinotaris";
CREATE TABLE "public"."t_dendasanksinotaris" (
"t_idds" int4 DEFAULT nextval('t_dendasanksinotaris_t_idds_seq'::regclass) NOT NULL,
"t_tglprosesds" date,
"t_periodeds" int2,
"t_dendabulan" varchar(15) NOT NULL,
"t_idnotaris" int4,
"t_jumlahds" int4,
"t_ketetapands" int4,
"t_idspt" int4,
"t_kohirds" int4,
"t_kodebayards" varchar(10)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of t_dendasanksinotaris
-- ----------------------------

-- ----------------------------
-- Table structure for "public"."t_detailsptbphtb"
-- ----------------------------
DROP TABLE "public"."t_detailsptbphtb";
CREATE TABLE "public"."t_detailsptbphtb" (
"t_iddetailsptbphtb" int4 DEFAULT nextval('t_detailsptbphtb_t_iddetailsptbphtb_seq'::regclass) NOT NULL,
"t_idspt" int4,
"t_namawppembeli" varchar,
"t_nikwppembeli" varchar,
"t_alamatwppembeli" text,
"t_kecamatanwppembeli" varchar,
"t_kelurahanwppembeli" varchar,
"t_kabkotawppembeli" varchar,
"t_telponwppembeli" varchar,
"t_kodeposwppembeli" varchar,
"t_npwpwppembeli" varchar,
"t_namawppenjual" varchar,
"t_nikwppenjual" varchar,
"t_alamatwppenjual" text,
"t_kecamatanwppenjual" varchar,
"t_kelurahanwppenjual" varchar,
"t_kabkotawppenjual" varchar,
"t_telponwppenjual" varchar,
"t_kodeposwppenjual" varchar,
"t_npwpwppenjual" varchar,
"t_luastanah" numeric(18,2),
"t_njoptanah" int8,
"t_luasbangunan" numeric(18,2),
"t_njopbangunan" int8,
"t_totalnjoptanah" int8,
"t_totalnjopbangunan" int8,
"t_grandtotalnjop" int8,
"t_nosertifikathaktanah" varchar(30),
"t_kelurahanop" varchar(30),
"t_kecamatanop" varchar(30),
"t_ketwaris" varchar(200),
"t_terbukti" varchar(10),
"t_rtwppembeli" varchar,
"t_rwwppembeli" varchar,
"t_alamatop" varchar,
"t_rtop" varchar(3),
"t_rwop" varchar(3),
"t_dokpersyaratan" varchar,
"t_namasppt" varchar,
"t_tglajb" date,
"t_luastanahbpn" numeric(18,2),
"t_luasbangunanbpn" numeric(18,2),
"t_tglajbbaru" date,
"t_noajbbaru" varchar,
"t_statuspelaporannotaris" bool,
"t_tglpelaporannotaris" date,
"t_kabupatenop" varchar,
"t_rtwppenjual" varchar,
"t_rwwppenjual" varchar,
"t_nosertifikatbaru" varchar(10),
"t_tglsertifikatbaru" date,
"t_inputbpn" bool,
"t_statuskonfirmasinotaris" bool,
"t_tglkonfirmasinotaris" date
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of t_detailsptbphtb
-- ----------------------------
INSERT INTO "public"."t_detailsptbphtb" VALUES ('45', '46', 'Ade Dwi Fabianto', '1111111111111111', 'Jln. Taman Sari I', 'Kecamatan', 'Desa', 'Jakarta Selatan', '111111111111', '11111', '11.111.111.1-111.111', 'PORKORUS MISA', '1212121212122212', 'Jl. ACE', 'Mala', 'MALA', 'TALAUD', '111111111111', '11111', '22.222.222.2-222.222', '20000.00', '1200', '0.00', '0', '24000000', '0', '24000000', '1', 'MALA TIMUR', 'MELONGUANE', '', '0', '001', '001', 'ACE', '001', '002', null, 'PORKORUS MISA', '1982-11-29', null, null, null, null, null, null, 'Bandung Barat', '001', '002', null, null, null, null, null);

-- ----------------------------
-- Table structure for "public"."t_pembayaranspt"
-- ----------------------------
DROP TABLE "public"."t_pembayaranspt";
CREATE TABLE "public"."t_pembayaranspt" (
"t_idpembayaranspt" int4 DEFAULT nextval('t_pembayaranspt_t_idpembayaranspt_seq'::regclass) NOT NULL,
"t_idspt" int4,
"t_kohirpembayaran" int4,
"t_periodepembayaran" int2,
"t_tanggalpembayaran" date,
"t_objekspt" int4,
"t_idnotaris" int4,
"t_ketetapanspt" int8,
"t_nilaipembayaranspt" int8,
"t_idkorekspt" int4,
"t_kodebayarspt" varchar,
"t_verifikasispt" varchar,
"t_tglverifikasispt" date,
"t_pejabatverifikasispt" int4,
"t_statusbayarspt" bool,
"t_kodebayarbanksppt" varchar,
"t_dendabulan" int8,
"t_pejabatpembayaranspt" int4,
"t_idds" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of t_pembayaranspt
-- ----------------------------

-- ----------------------------
-- Table structure for "public"."t_pemeriksaan"
-- ----------------------------
DROP TABLE "public"."t_pemeriksaan";
CREATE TABLE "public"."t_pemeriksaan" (
"p_idpemeriksaan" int4 DEFAULT nextval('t_pemeriksaan_p_idpemeriksaan_seq'::regclass) NOT NULL,
"p_idpembayaranspt" int4,
"p_luastanah" numeric(18,2),
"p_luasbangunan" numeric(18,2),
"p_njoptanah" int8,
"p_njopbangunan" int8,
"p_totalnjoptanah" int8,
"p_totalnjopbangunan" int8,
"p_grandtotalnjop" int8,
"p_nilaitransaksispt" int8,
"p_potonganspt" int4,
"p_ketwaris" varchar(200),
"p_terbukti" varchar(10),
"p_idjenistransaksi" int4,
"p_idjenishaktanah" int4,
"p_totalspt" int8,
"p_nilaipembayaranspt" int8,
"p_nilaikurangbayar" int8,
"p_kohirskpdkb" int4,
"p_pembayaranskpdkb" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of t_pemeriksaan
-- ----------------------------

-- ----------------------------
-- Table structure for "public"."t_penerimawaris"
-- ----------------------------
DROP TABLE "public"."t_penerimawaris";
CREATE TABLE "public"."t_penerimawaris" (
"t_idpenerima" int4 DEFAULT nextval('t_penerimawaris_t_idpenerima_seq'::regclass) NOT NULL,
"t_idspt" int4,
"t_namapenerima" varchar,
"t_alamatpenerima" varchar,
"t_nikpenerima" varchar
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of t_penerimawaris
-- ----------------------------
INSERT INTO "public"."t_penerimawaris" VALUES ('635', '46', '', '', '');

-- ----------------------------
-- Table structure for "public"."t_spt"
-- ----------------------------
DROP TABLE "public"."t_spt";
CREATE TABLE "public"."t_spt" (
"t_idspt" int4 DEFAULT nextval('t_spt_t_idspt_seq'::regclass) NOT NULL,
"t_kohirspt" int4,
"t_kohirketetapanspt" int4,
"t_tglprosesspt" date,
"t_periodespt" int2,
"t_idnotarisspt" int4,
"t_objekspt" int4,
"t_idtarifspt" int4,
"t_ketetapanspt" int4,
"t_tglketetapanspt" date,
"t_tgljatuhtempospt" date,
"t_nopbphtbsppt" varchar,
"t_kodebayarbanksppt" varchar,
"t_idjenistransaksi" int4,
"t_idjenishaktanah" int4,
"t_idrefspt" int4,
"t_pejabatverifikasispt" int4,
"t_dasarspt" int8,
"t_totalspt" int8,
"t_nilaitransaksispt" int8,
"t_potonganspt" int4,
"t_thnsppt" varchar,
"t_persyaratan" varchar,
"t_idjenisdoktanah" int4,
"t_idsptsebelumnya" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of t_spt
-- ----------------------------
INSERT INTO "public"."t_spt" VALUES ('46', '1', '2', '2015-11-29', '2015', '13', null, null, null, null, null, '71.41.070.015.002.0199.0', null, '1', '1', null, null, null, '200000', '24000000', '20000000', '2005', '["1","2","3","4","5","6"]', '1', null);

-- ----------------------------
-- View structure for "public"."view_cetak_sspd"
-- ----------------------------
CREATE OR REPLACE VIEW "public"."view_cetak_sspd" AS 
 SELECT a.t_idspt,
    a.t_kohirspt,
    a.t_kohirketetapanspt,
    a.t_tglprosesspt,
    a.t_periodespt,
    a.t_idnotarisspt,
    a.t_idtarifspt,
    a.t_tglketetapanspt,
    a.t_tgljatuhtempospt,
    a.t_nopbphtbsppt,
    a.t_idjenistransaksi,
    a.t_idjenishaktanah,
    a.t_idrefspt,
    a.t_dasarspt,
    a.t_totalspt,
    a.t_nilaitransaksispt,
    a.t_potonganspt,
    a.t_thnsppt,
    a.t_persyaratan,
    a.t_idjenisdoktanah,
    a.t_idsptsebelumnya,
    b.t_iddetailsptbphtb,
    b.t_namawppembeli,
    b.t_nikwppembeli,
    b.t_alamatwppembeli,
    b.t_kecamatanwppembeli,
    b.t_kelurahanwppembeli,
    b.t_kabkotawppembeli,
    b.t_telponwppembeli,
    b.t_kodeposwppembeli,
    b.t_npwpwppembeli,
    b.t_namawppenjual,
    b.t_nikwppenjual,
    b.t_alamatwppenjual,
    b.t_kecamatanwppenjual,
    b.t_kelurahanwppenjual,
    b.t_kabkotawppenjual,
    b.t_telponwppenjual,
    b.t_kodeposwppenjual,
    b.t_npwpwppenjual,
    b.t_luastanah,
    b.t_njoptanah,
    b.t_luasbangunan,
    b.t_njopbangunan,
    b.t_totalnjoptanah,
    b.t_totalnjopbangunan,
    b.t_grandtotalnjop,
    b.t_nosertifikathaktanah,
    b.t_kelurahanop,
    b.t_kecamatanop,
    b.t_ketwaris,
    b.t_terbukti,
    b.t_rtwppembeli,
    b.t_rwwppembeli,
    b.t_alamatop,
    b.t_rtop,
    b.t_rwop,
    b.t_dokpersyaratan,
    b.t_namasppt,
    b.t_tglajb,
    b.t_luastanahbpn,
    b.t_luasbangunanbpn,
    b.t_tglajbbaru,
    b.t_noajbbaru,
    b.t_statuspelaporannotaris,
    b.t_tglpelaporannotaris,
    b.t_kabupatenop,
    b.t_rtwppenjual,
    b.t_rwwppenjual,
    b.t_nosertifikatbaru,
    b.t_tglsertifikatbaru,
    b.t_inputbpn,
    b.t_statuskonfirmasinotaris,
    b.t_tglkonfirmasinotaris,
    c.t_idpembayaranspt,
    c.t_kohirpembayaran,
    c.t_periodepembayaran,
    c.t_tanggalpembayaran,
    c.t_idnotaris,
    c.t_nilaipembayaranspt,
    c.t_idkorekspt,
    c.t_kodebayarspt,
    c.t_verifikasispt,
    c.t_tglverifikasispt,
    c.t_pejabatverifikasispt,
    c.t_statusbayarspt,
    c.t_kodebayarbanksppt,
    c.t_dendabulan,
    c.t_pejabatpembayaranspt,
    d.p_idpemeriksaan,
    d.p_idpembayaranspt,
    d.p_luastanah,
    d.p_luasbangunan,
    d.p_njoptanah,
    d.p_njopbangunan,
    d.p_totalnjoptanah,
    d.p_totalnjopbangunan,
    d.p_grandtotalnjop,
    d.p_nilaitransaksispt,
    d.p_potonganspt,
    d.p_ketwaris,
    d.p_terbukti,
    d.p_idjenistransaksi,
    d.p_idjenishaktanah,
    d.p_totalspt,
    d.p_nilaipembayaranspt,
    d.p_nilaikurangbayar,
    d.p_kohirskpdkb,
    d.p_pembayaranskpdkb,
    e.s_iduser,
    e.s_username,
    e.s_password,
    e.s_jabatan,
    e.s_akses,
    e.s_idpejabat_idnotaris,
    e.s_tipe_pejabat,
    f.s_idnotaris,
    f.s_namanotaris,
    g.s_idpejabat,
    g.s_namapejabat,
    g.s_jabatanpejabat,
    g.s_nippejabat,
    g.s_golonganpejabat
   FROM ((((((t_spt a
     LEFT JOIN t_detailsptbphtb b ON ((b.t_idspt = a.t_idspt)))
     LEFT JOIN t_pembayaranspt c ON ((c.t_idspt = a.t_idspt)))
     LEFT JOIN t_pemeriksaan d ON ((d.p_idpembayaranspt = c.t_idpembayaranspt)))
     LEFT JOIN s_users e ON ((e.s_iduser = a.t_idnotarisspt)))
     LEFT JOIN s_notaris f ON (((f.s_idnotaris)::text = (e.s_idpejabat_idnotaris)::text)))
     LEFT JOIN s_pejabat g ON ((g.s_idpejabat = c.t_pejabatverifikasispt)));

-- ----------------------------
-- View structure for "public"."view_data_notaris"
-- ----------------------------
CREATE OR REPLACE VIEW "public"."view_data_notaris" AS 
 SELECT g.s_iduser,
    g.s_username,
    g.s_password,
    g.s_jabatan,
    g.s_akses,
    g.s_idpejabat_idnotaris,
    g.s_tipe_pejabat,
    h.s_idnotaris,
    h.s_namanotaris,
    h.s_alamatnotaris,
    h.s_kodenotaris,
    h.s_sknotaris,
    h.s_tgl1notaris,
    h.s_tgl2notaris,
    h.s_statusnotaris
   FROM (s_users g
     LEFT JOIN s_notaris h ON (((h.s_idnotaris)::text = (g.s_idpejabat_idnotaris)::text)))
  WHERE (h.s_statusnotaris = 1);

-- ----------------------------
-- View structure for "public"."view_data_terbit_ajb"
-- ----------------------------
CREATE OR REPLACE VIEW "public"."view_data_terbit_ajb" AS 
 SELECT a.t_idspt,
    a.t_tglprosesspt,
    a.t_periodespt,
    a.t_nopbphtbsppt,
    a.t_totalspt,
    a.t_nilaitransaksispt,
    b.t_namawppembeli,
    b.t_nikwppembeli,
    b.t_alamatwppembeli,
    b.t_kecamatanwppembeli,
    b.t_kelurahanwppembeli,
    b.t_kabkotawppembeli,
    b.t_telponwppembeli,
    b.t_kodeposwppembeli,
    b.t_npwpwppembeli,
    b.t_namawppenjual,
    b.t_nikwppenjual,
    b.t_alamatwppenjual,
    b.t_kecamatanwppenjual,
    b.t_kelurahanwppenjual,
    b.t_kabkotawppenjual,
    b.t_telponwppenjual,
    b.t_kodeposwppenjual,
    b.t_npwpwppenjual,
    b.t_luastanah,
    b.t_njoptanah,
    b.t_luasbangunan,
    b.t_njopbangunan,
    b.t_totalnjoptanah,
    b.t_totalnjopbangunan,
    b.t_grandtotalnjop,
    b.t_nosertifikathaktanah,
    b.t_iddetailsptbphtb,
    c.s_namajenistransaksi,
    b.t_kelurahanop,
    b.t_kecamatanop,
    a.t_kohirspt,
    d.s_namahaktanah,
    a.t_potonganspt,
    a.t_idjenistransaksi,
    a.t_idjenishaktanah,
    e.t_idpembayaranspt,
    e.t_kohirpembayaran,
    e.t_periodepembayaran,
    e.t_tanggalpembayaran,
    e.t_idnotaris,
    e.t_nilaipembayaranspt,
    e.t_kodebayarspt,
    e.t_verifikasispt,
    e.t_tglverifikasispt,
    e.t_pejabatverifikasispt,
    e.t_statusbayarspt,
    e.t_ketetapanspt,
    e.t_kodebayarbanksppt,
    b.t_kabupatenop,
    b.t_rtwppembeli,
    b.t_rwwppembeli,
    a.t_thnsppt,
    b.t_alamatop,
    b.t_rtop,
    b.t_rwop,
    a.t_persyaratan,
    b.t_tglajbbaru,
    b.t_noajbbaru,
    h.s_namanotaris,
    h.s_alamatnotaris,
    b.t_inputbpn,
    b.t_statuskonfirmasinotaris,
    b.t_tglkonfirmasinotaris
   FROM ((((((t_spt a
     LEFT JOIN t_detailsptbphtb b ON ((b.t_idspt = a.t_idspt)))
     LEFT JOIN s_jenistransaksi c ON ((c.s_idjenistransaksi = a.t_idjenistransaksi)))
     LEFT JOIN s_jenishaktanah d ON ((d.s_idhaktanah = a.t_idjenishaktanah)))
     LEFT JOIN t_pembayaranspt e ON ((e.t_idspt = a.t_idspt)))
     LEFT JOIN s_users g ON ((g.s_iduser = a.t_idnotarisspt)))
     LEFT JOIN s_notaris h ON (((h.s_idnotaris)::text = (g.s_idpejabat_idnotaris)::text)))
  WHERE ((b.t_tglajbbaru IS NOT NULL) AND (b.t_noajbbaru IS NOT NULL));

-- ----------------------------
-- View structure for "public"."view_data_verifikasi_isi"
-- ----------------------------
CREATE OR REPLACE VIEW "public"."view_data_verifikasi_isi" AS 
 SELECT a.t_idspt,
    a.t_kohirspt,
    a.t_kohirketetapanspt,
    a.t_tglprosesspt,
    a.t_periodespt,
    a.t_idnotarisspt,
    a.t_objekspt,
    a.t_idtarifspt,
    a.t_ketetapanspt,
    a.t_tglketetapanspt,
    a.t_tgljatuhtempospt,
    a.t_nopbphtbsppt,
    a.t_kodebayarbanksppt,
    a.t_idjenistransaksi,
    a.t_idjenishaktanah,
    a.t_idrefspt,
    a.t_pejabatverifikasispt,
    a.t_dasarspt,
    a.t_totalspt,
    a.t_nilaitransaksispt,
    a.t_potonganspt,
    a.t_thnsppt,
    a.t_persyaratan,
    a.t_idjenisdoktanah,
    b.t_iddetailsptbphtb,
    b.t_namawppembeli,
    b.t_nikwppembeli,
    b.t_alamatwppembeli,
    b.t_kecamatanwppembeli,
    b.t_kelurahanwppembeli,
    b.t_kabkotawppembeli,
    b.t_telponwppembeli,
    b.t_kodeposwppembeli,
    b.t_npwpwppembeli,
    b.t_namawppenjual,
    b.t_nikwppenjual,
    b.t_alamatwppenjual,
    b.t_kecamatanwppenjual,
    b.t_kelurahanwppenjual,
    b.t_kabkotawppenjual,
    b.t_telponwppenjual,
    b.t_kodeposwppenjual,
    b.t_npwpwppenjual,
    b.t_luastanah,
    b.t_njoptanah,
    b.t_luasbangunan,
    b.t_njopbangunan,
    b.t_totalnjoptanah,
    b.t_totalnjopbangunan,
    b.t_grandtotalnjop,
    b.t_nosertifikathaktanah,
    b.t_kelurahanop,
    b.t_kecamatanop,
    b.t_ketwaris,
    b.t_terbukti,
    b.t_rtwppembeli,
    b.t_rwwppembeli,
    b.t_alamatop,
    b.t_rtop,
    b.t_rwop,
    b.t_dokpersyaratan,
    b.t_namasppt,
    b.t_tglajb,
    b.t_luastanahbpn,
    b.t_luasbangunanbpn,
    b.t_tglajbbaru,
    b.t_noajbbaru,
    b.t_statuspelaporannotaris,
    b.t_tglpelaporannotaris,
    b.t_kabupatenop,
    b.t_rtwppenjual,
    b.t_rwwppenjual,
    b.t_nosertifikatbaru,
    b.t_tglsertifikatbaru,
    d.s_idhaktanah,
    d.s_kodehaktanah,
    d.s_namahaktanah,
    g.s_iduser,
    g.s_username,
    g.s_jabatan,
    g.s_akses,
    g.s_idpejabat_idnotaris,
    g.s_tipe_pejabat,
    h.s_idnotaris,
    h.s_namanotaris,
    h.s_alamatnotaris,
    h.s_kodenotaris,
    h.s_sknotaris,
    h.s_tgl1notaris,
    h.s_tgl2notaris,
    h.s_statusnotaris,
    c.s_idjenistransaksi,
    c.s_kodejenistransaksi,
    c.s_namajenistransaksi,
    f.p_idpemeriksaan,
    f.p_idpembayaranspt,
    f.p_luastanah,
    f.p_luasbangunan,
    f.p_njoptanah,
    f.p_njopbangunan,
    f.p_totalnjoptanah,
    f.p_totalnjopbangunan,
    f.p_grandtotalnjop,
    f.p_nilaitransaksispt,
    f.p_potonganspt,
    f.p_ketwaris,
    f.p_terbukti,
    f.p_idjenistransaksi,
    f.p_idjenishaktanah,
    f.p_totalspt,
    f.p_nilaipembayaranspt,
    f.p_nilaikurangbayar,
    f.p_kohirskpdkb,
    f.p_pembayaranskpdkb,
    e.t_idpembayaranspt,
    e.t_kohirpembayaran,
    e.t_periodepembayaran,
    e.t_tanggalpembayaran,
    e.t_objekspt AS t_objekspt_pembayaran,
    e.t_idnotaris,
    e.t_ketetapanspt AS t_ketetapanspt_pembayaran,
    e.t_nilaipembayaranspt,
    e.t_idkorekspt,
    e.t_kodebayarspt,
    e.t_verifikasispt,
    e.t_tglverifikasispt,
    e.t_pejabatverifikasispt AS t_pejabatverifikasispt_pembayaran,
    e.t_statusbayarspt,
    e.t_kodebayarbanksppt AS t_kodebayarbanksppt_pembayaran,
    e.t_dendabulan,
    b.t_inputbpn
   FROM (((((((t_spt a
     LEFT JOIN t_detailsptbphtb b ON ((b.t_idspt = a.t_idspt)))
     LEFT JOIN s_jenistransaksi c ON ((c.s_idjenistransaksi = a.t_idjenistransaksi)))
     LEFT JOIN s_jenishaktanah d ON ((d.s_idhaktanah = a.t_idjenishaktanah)))
     LEFT JOIN s_users g ON ((g.s_iduser = a.t_idnotarisspt)))
     LEFT JOIN s_notaris h ON (((h.s_idnotaris)::text = (g.s_idpejabat_idnotaris)::text)))
     LEFT JOIN t_pembayaranspt e ON ((e.t_idspt = a.t_idspt)))
     LEFT JOIN t_pemeriksaan f ON ((f.p_idpembayaranspt = e.t_kohirpembayaran)))
  WHERE (e.t_verifikasispt IS NOT NULL);

-- ----------------------------
-- View structure for "public"."view_harganjoptanah"
-- ----------------------------
CREATE OR REPLACE VIEW "public"."view_harganjoptanah" AS 
 SELECT a.t_nopbphtbsppt,
    (((b.t_grandtotalnjop - b.t_totalnjopbangunan))::numeric / b.t_luastanah) AS njoptanahtransaksi,
    (((a.t_nilaitransaksispt - b.t_totalnjopbangunan))::numeric / b.t_luastanah) AS njoptanah,
    a.t_idspt,
    c.t_idpembayaranspt
   FROM ((t_spt a
     LEFT JOIN t_detailsptbphtb b ON ((b.t_idspt = a.t_idspt)))
     LEFT JOIN t_pembayaranspt c ON ((c.t_idspt = a.t_idspt)));

-- ----------------------------
-- View structure for "public"."view_hasilbpn"
-- ----------------------------
CREATE OR REPLACE VIEW "public"."view_hasilbpn" AS 
 SELECT a.t_idspt,
    a.t_kohirspt,
    a.t_kohirketetapanspt,
    a.t_tglprosesspt,
    a.t_periodespt,
    a.t_idnotarisspt,
    a.t_objekspt,
    a.t_idtarifspt,
    a.t_ketetapanspt,
    a.t_tglketetapanspt,
    a.t_tgljatuhtempospt,
    a.t_nopbphtbsppt,
    a.t_kodebayarbanksppt,
    a.t_idjenistransaksi,
    a.t_idjenishaktanah,
    a.t_idrefspt,
    a.t_pejabatverifikasispt,
    a.t_dasarspt,
    a.t_totalspt,
    a.t_nilaitransaksispt,
    a.t_potonganspt,
    a.t_thnsppt,
    a.t_persyaratan,
    a.t_idjenisdoktanah,
    b.t_iddetailsptbphtb,
    b.t_namawppembeli,
    b.t_nikwppembeli,
    b.t_alamatwppembeli,
    b.t_kecamatanwppembeli,
    b.t_kelurahanwppembeli,
    b.t_kabkotawppembeli,
    b.t_telponwppembeli,
    b.t_kodeposwppembeli,
    b.t_npwpwppembeli,
    b.t_namawppenjual,
    b.t_nikwppenjual,
    b.t_alamatwppenjual,
    b.t_kecamatanwppenjual,
    b.t_kelurahanwppenjual,
    b.t_kabkotawppenjual,
    b.t_telponwppenjual,
    b.t_kodeposwppenjual,
    b.t_npwpwppenjual,
    b.t_luastanah,
    b.t_njoptanah,
    b.t_luasbangunan,
    b.t_njopbangunan,
    b.t_totalnjoptanah,
    b.t_totalnjopbangunan,
    b.t_grandtotalnjop,
    b.t_nosertifikathaktanah,
    b.t_kelurahanop,
    b.t_kecamatanop,
    b.t_ketwaris,
    b.t_terbukti,
    b.t_rtwppembeli,
    b.t_rwwppembeli,
    b.t_alamatop,
    b.t_rtop,
    b.t_rwop,
    b.t_dokpersyaratan,
    b.t_namasppt,
    b.t_tglajb,
    b.t_luastanahbpn,
    b.t_luasbangunanbpn,
    b.t_tglajbbaru,
    b.t_noajbbaru,
    b.t_statuspelaporannotaris,
    b.t_tglpelaporannotaris,
    b.t_kabupatenop,
    b.t_rtwppenjual,
    b.t_rwwppenjual,
    b.t_nosertifikatbaru,
    b.t_tglsertifikatbaru,
    d.s_idhaktanah,
    d.s_kodehaktanah,
    d.s_namahaktanah,
    g.s_iduser,
    g.s_username,
    g.s_password,
    g.s_jabatan,
    g.s_akses,
    g.s_idpejabat_idnotaris,
    g.s_tipe_pejabat,
    h.s_idnotaris,
    h.s_namanotaris,
    h.s_alamatnotaris,
    h.s_kodenotaris,
    h.s_sknotaris,
    h.s_tgl1notaris,
    h.s_tgl2notaris,
    h.s_statusnotaris,
    c.s_idjenistransaksi,
    c.s_kodejenistransaksi,
    c.s_namajenistransaksi,
    f.p_idpemeriksaan,
    f.p_idpembayaranspt,
    f.p_luastanah,
    f.p_luasbangunan,
    f.p_njoptanah,
    f.p_njopbangunan,
    f.p_totalnjoptanah,
    f.p_totalnjopbangunan,
    f.p_grandtotalnjop,
    f.p_nilaitransaksispt,
    f.p_potonganspt,
    f.p_ketwaris,
    f.p_terbukti,
    f.p_idjenistransaksi,
    f.p_idjenishaktanah,
    f.p_totalspt,
    f.p_nilaipembayaranspt,
    f.p_nilaikurangbayar,
    f.p_kohirskpdkb,
    f.p_pembayaranskpdkb,
    e.t_idpembayaranspt,
    e.t_kohirpembayaran,
    e.t_periodepembayaran,
    e.t_tanggalpembayaran,
    e.t_objekspt AS t_objekspt_pembayaran,
    e.t_idnotaris,
    e.t_ketetapanspt AS t_ketetapanspt_pembayaran,
    e.t_nilaipembayaranspt,
    e.t_idkorekspt,
    e.t_kodebayarspt,
    e.t_verifikasispt,
    e.t_tglverifikasispt,
    e.t_pejabatverifikasispt AS t_pejabatverifikasispt_pembayaran,
    e.t_statusbayarspt,
    e.t_kodebayarbanksppt AS t_kodebayarbanksppt_pembayaran,
    e.t_dendabulan,
    b.t_inputbpn
   FROM (((((((t_spt a
     LEFT JOIN t_detailsptbphtb b ON ((b.t_idspt = a.t_idspt)))
     LEFT JOIN s_jenistransaksi c ON ((c.s_idjenistransaksi = a.t_idjenistransaksi)))
     LEFT JOIN s_jenishaktanah d ON ((d.s_idhaktanah = a.t_idjenishaktanah)))
     LEFT JOIN s_users g ON ((g.s_iduser = a.t_idnotarisspt)))
     LEFT JOIN s_notaris h ON (((h.s_idnotaris)::text = (g.s_idpejabat_idnotaris)::text)))
     LEFT JOIN t_pembayaranspt e ON ((e.t_idspt = a.t_idspt)))
     LEFT JOIN t_pemeriksaan f ON ((f.p_idpembayaranspt = e.t_kohirpembayaran)))
  WHERE (b.t_inputbpn = true);

-- ----------------------------
-- View structure for "public"."view_pembayarandenda"
-- ----------------------------
CREATE OR REPLACE VIEW "public"."view_pembayarandenda" AS 
 SELECT a.t_tglprosesds,
    a.t_periodeds,
    a.t_dendabulan AS t_dendabulandata,
    a.t_idnotaris AS t_idnotarisdata,
    a.t_jumlahds,
    a.t_ketetapands,
    a.t_idspt AS t_idsptdata,
    a.t_kohirds,
    a.t_kodebayards,
    b.t_idpembayaranspt,
    b.t_idspt,
    b.t_kohirpembayaran,
    b.t_periodepembayaran,
    b.t_tanggalpembayaran,
    b.t_objekspt,
    b.t_idnotaris,
    b.t_ketetapanspt,
    b.t_nilaipembayaranspt,
    b.t_idkorekspt,
    b.t_kodebayarspt,
    b.t_verifikasispt,
    b.t_tglverifikasispt,
    b.t_pejabatverifikasispt,
    b.t_statusbayarspt,
    b.t_kodebayarbanksppt,
    b.t_dendabulan,
    b.t_pejabatpembayaranspt,
    b.t_idds AS idds,
    d.s_namanotaris,
    d.s_alamatnotaris,
    a.t_idds
   FROM (((t_dendasanksinotaris a
     LEFT JOIN t_pembayaranspt b ON ((b.t_idds = a.t_idds)))
     LEFT JOIN s_users c ON ((c.s_iduser = a.t_idnotaris)))
     LEFT JOIN s_notaris d ON (((d.s_idnotaris)::text = (c.s_idpejabat_idnotaris)::text)))
  WHERE (b.t_nilaipembayaranspt IS NULL);

-- ----------------------------
-- View structure for "public"."view_pendaftaran"
-- ----------------------------
CREATE OR REPLACE VIEW "public"."view_pendaftaran" AS 
 SELECT a.t_idspt,
    a.t_kohirspt,
    a.t_kohirketetapanspt,
    a.t_tglprosesspt,
    a.t_periodespt,
    a.t_idnotarisspt,
    a.t_objekspt,
    a.t_idtarifspt,
    a.t_ketetapanspt,
    a.t_tglketetapanspt,
    a.t_tgljatuhtempospt,
    a.t_nopbphtbsppt,
    a.t_kodebayarbanksppt,
    a.t_idjenistransaksi,
    a.t_idjenishaktanah,
    a.t_idrefspt,
    a.t_pejabatverifikasispt,
    a.t_dasarspt,
    a.t_totalspt,
    a.t_nilaitransaksispt,
    a.t_potonganspt,
    a.t_thnsppt,
    a.t_persyaratan,
    a.t_idjenisdoktanah,
    b.t_iddetailsptbphtb,
    b.t_namawppembeli,
    b.t_nikwppembeli,
    b.t_alamatwppembeli,
    b.t_kecamatanwppembeli,
    b.t_kelurahanwppembeli,
    b.t_kabkotawppembeli,
    b.t_telponwppembeli,
    b.t_kodeposwppembeli,
    b.t_npwpwppembeli,
    b.t_namawppenjual,
    b.t_nikwppenjual,
    b.t_alamatwppenjual,
    b.t_kecamatanwppenjual,
    b.t_kelurahanwppenjual,
    b.t_kabkotawppenjual,
    b.t_telponwppenjual,
    b.t_kodeposwppenjual,
    b.t_npwpwppenjual,
    b.t_luastanah,
    b.t_njoptanah,
    b.t_luasbangunan,
    b.t_njopbangunan,
    b.t_totalnjoptanah,
    b.t_totalnjopbangunan,
    b.t_grandtotalnjop,
    b.t_nosertifikathaktanah,
    b.t_kelurahanop,
    b.t_kecamatanop,
    b.t_ketwaris,
    b.t_terbukti,
    b.t_rtwppembeli,
    b.t_rwwppembeli,
    b.t_alamatop,
    b.t_rtop,
    b.t_rwop,
    b.t_dokpersyaratan,
    b.t_namasppt,
    b.t_tglajb,
    b.t_luastanahbpn,
    b.t_luasbangunanbpn,
    b.t_tglajbbaru,
    b.t_noajbbaru,
    b.t_statuspelaporannotaris,
    b.t_tglpelaporannotaris,
    b.t_kabupatenop,
    b.t_rtwppenjual,
    b.t_rwwppenjual,
    b.t_nosertifikatbaru,
    b.t_tglsertifikatbaru,
    d.s_idhaktanah,
    d.s_kodehaktanah,
    d.s_namahaktanah,
    g.s_iduser,
    g.s_username,
    g.s_password,
    g.s_jabatan,
    g.s_akses,
    g.s_idpejabat_idnotaris,
    g.s_tipe_pejabat,
    h.s_idnotaris,
    h.s_namanotaris,
    h.s_alamatnotaris,
    h.s_kodenotaris,
    h.s_sknotaris,
    h.s_tgl1notaris,
    h.s_tgl2notaris,
    h.s_statusnotaris,
    c.s_idjenistransaksi,
    c.s_kodejenistransaksi,
    c.s_namajenistransaksi,
    f.p_idpemeriksaan,
    f.p_idpembayaranspt,
    f.p_luastanah,
    f.p_luasbangunan,
    f.p_njoptanah,
    f.p_njopbangunan,
    f.p_totalnjoptanah,
    f.p_totalnjopbangunan,
    f.p_grandtotalnjop,
    f.p_nilaitransaksispt,
    f.p_potonganspt,
    f.p_ketwaris,
    f.p_terbukti,
    f.p_idjenistransaksi,
    f.p_idjenishaktanah,
    f.p_totalspt,
    f.p_nilaipembayaranspt,
    f.p_nilaikurangbayar,
    f.p_kohirskpdkb,
    f.p_pembayaranskpdkb,
    e.t_idpembayaranspt,
    e.t_kohirpembayaran,
    e.t_periodepembayaran,
    e.t_tanggalpembayaran,
    e.t_objekspt AS t_objekspt_pembayaran,
    e.t_idnotaris,
    e.t_ketetapanspt AS t_ketetapanspt_pembayaran,
    e.t_nilaipembayaranspt,
    e.t_idkorekspt,
    e.t_kodebayarspt,
    e.t_verifikasispt,
    e.t_tglverifikasispt,
    e.t_pejabatverifikasispt AS t_pejabatverifikasispt_pembayaran,
    e.t_statusbayarspt,
    e.t_kodebayarbanksppt AS t_kodebayarbanksppt_pembayaran,
    e.t_dendabulan,
    b.t_inputbpn
   FROM (((((((t_spt a
     LEFT JOIN t_detailsptbphtb b ON ((b.t_idspt = a.t_idspt)))
     LEFT JOIN s_jenistransaksi c ON ((c.s_idjenistransaksi = a.t_idjenistransaksi)))
     LEFT JOIN s_jenishaktanah d ON ((d.s_idhaktanah = a.t_idjenishaktanah)))
     LEFT JOIN s_users g ON ((g.s_iduser = a.t_idnotarisspt)))
     LEFT JOIN s_notaris h ON (((h.s_idnotaris)::text = (g.s_idpejabat_idnotaris)::text)))
     LEFT JOIN t_pembayaranspt e ON ((e.t_idspt = a.t_idspt)))
     LEFT JOIN t_pemeriksaan f ON ((f.p_idpembayaranspt = e.t_kohirpembayaran)));

-- ----------------------------
-- View structure for "public"."view_pendataandendasanksinotaris"
-- ----------------------------
CREATE OR REPLACE VIEW "public"."view_pendataandendasanksinotaris" AS 
 SELECT a.t_idds,
    a.t_tglprosesds,
    a.t_periodeds,
    a.t_dendabulan,
    a.t_idnotaris,
    a.t_jumlahds,
    a.t_ketetapands,
    a.t_idspt,
    c.s_namanotaris,
    d.t_noajbbaru,
    d.t_tglajbbaru,
    c.s_alamatnotaris,
    a.t_kohirds,
    a.t_kodebayards,
    b.s_jabatan
   FROM (((t_dendasanksinotaris a
     LEFT JOIN s_users b ON ((b.s_iduser = a.t_idnotaris)))
     LEFT JOIN s_notaris c ON (((c.s_idnotaris)::text = (b.s_idpejabat_idnotaris)::text)))
     LEFT JOIN t_detailsptbphtb d ON ((d.t_idspt = a.t_idspt)));

-- ----------------------------
-- View structure for "public"."view_s_persyaratan"
-- ----------------------------
CREATE OR REPLACE VIEW "public"."view_s_persyaratan" AS 
 SELECT s_persyaratan.s_idpersyaratan,
    s_persyaratan.s_idjenistransaksi,
    s_persyaratan.s_namapersyaratan,
    s_persyaratan."order"
   FROM s_persyaratan
  ORDER BY s_persyaratan.s_idpersyaratan;

-- ----------------------------
-- View structure for "public"."view_sspd"
-- ----------------------------
CREATE OR REPLACE VIEW "public"."view_sspd" AS 
 SELECT a.t_idspt,
    a.t_tglprosesspt,
    a.t_periodespt,
    a.t_nopbphtbsppt,
    a.t_kodebayarbanksppt,
    a.t_totalspt,
    a.t_nilaitransaksispt,
    a.t_kohirspt,
    a.t_potonganspt,
    a.t_idjenistransaksi,
    a.t_idjenishaktanah,
    a.t_thnsppt,
    b.t_namawppembeli,
    b.t_nikwppembeli,
    b.t_npwpwppembeli,
    b.t_alamatwppembeli,
    b.t_rtwppembeli,
    b.t_rwwppembeli,
    b.t_kecamatanwppembeli,
    b.t_kelurahanwppembeli,
    b.t_telponwppembeli,
    b.t_kodeposwppembeli,
    b.t_namawppenjual,
    b.t_nikwppenjual,
    b.t_npwpwppenjual,
    b.t_alamatwppenjual,
    b.t_kelurahanwppenjual,
    b.t_kecamatanwppenjual,
    b.t_kabkotawppenjual,
    b.t_telponwppenjual,
    b.t_kodeposwppenjual,
    b.t_alamatop,
    b.t_rtop,
    b.t_rwop,
    b.t_luastanah,
    b.t_njoptanah,
    b.t_totalnjoptanah,
    b.t_luasbangunan,
    b.t_njopbangunan,
    b.t_totalnjopbangunan,
    b.t_grandtotalnjop,
    b.t_nosertifikathaktanah,
    b.t_iddetailsptbphtb,
    b.t_kelurahanop,
    b.t_kecamatanop,
    c.s_namajenistransaksi,
    d.s_namahaktanah,
    a.t_idnotarisspt,
    b.t_kabkotawppembeli,
    a.t_persyaratan,
    b.t_kabupatenop,
    a.t_idsptsebelumnya,
    b.t_inputbpn,
    a.t_kohirketetapanspt
   FROM (((t_spt a
     LEFT JOIN t_detailsptbphtb b ON ((b.t_idspt = a.t_idspt)))
     LEFT JOIN s_jenistransaksi c ON ((c.s_idjenistransaksi = a.t_idjenistransaksi)))
     LEFT JOIN s_jenishaktanah d ON ((d.s_idhaktanah = a.t_idjenishaktanah)));

-- ----------------------------
-- View structure for "public"."view_sspd_blm_validasi"
-- ----------------------------
CREATE OR REPLACE VIEW "public"."view_sspd_blm_validasi" AS 
 SELECT a.t_idspt,
    a.t_tglprosesspt,
    a.t_periodespt,
    a.t_nopbphtbsppt,
    a.t_kodebayarbanksppt,
    a.t_totalspt,
    a.t_nilaitransaksispt,
    b.t_namawppembeli,
    b.t_nikwppembeli,
    b.t_alamatwppembeli,
    b.t_kecamatanwppembeli,
    b.t_kelurahanwppembeli,
    b.t_kabkotawppembeli,
    b.t_telponwppembeli,
    b.t_kodeposwppembeli,
    b.t_npwpwppembeli,
    b.t_namawppenjual,
    b.t_nikwppenjual,
    b.t_alamatwppenjual,
    b.t_kecamatanwppenjual,
    b.t_kelurahanwppenjual,
    b.t_kabkotawppenjual,
    b.t_telponwppenjual,
    b.t_kodeposwppenjual,
    b.t_npwpwppenjual,
    b.t_luastanah,
    b.t_njoptanah,
    b.t_luasbangunan,
    b.t_njopbangunan,
    b.t_totalnjoptanah,
    b.t_totalnjopbangunan,
    b.t_grandtotalnjop,
    b.t_nosertifikathaktanah,
    b.t_iddetailsptbphtb,
    c.s_namajenistransaksi,
    b.t_kelurahanop,
    b.t_kecamatanop,
    a.t_kohirspt,
    d.s_namahaktanah,
    a.t_potonganspt,
    a.t_idjenistransaksi,
    a.t_idjenishaktanah,
    e.t_idpembayaranspt,
    e.t_kohirpembayaran,
    e.t_periodepembayaran,
    e.t_tanggalpembayaran,
    e.t_idnotaris,
    e.t_nilaipembayaranspt,
    e.t_kodebayarspt,
    e.t_verifikasispt,
    e.t_tglverifikasispt,
    e.t_pejabatverifikasispt,
    e.t_statusbayarspt,
    f.p_kohirskpdkb,
    f.p_luastanah,
    f.p_luasbangunan,
    f.p_njoptanah,
    f.p_njopbangunan,
    f.p_totalnjoptanah,
    f.p_totalnjopbangunan,
    f.p_grandtotalnjop,
    f.p_nilaitransaksispt,
    f.p_potonganspt,
    f.p_ketwaris,
    f.p_terbukti,
    f.p_idjenistransaksi,
    f.p_idjenishaktanah,
    f.p_totalspt,
    f.p_nilaipembayaranspt,
    f.p_nilaikurangbayar,
    e.t_ketetapanspt,
    f.p_idpemeriksaan,
    b.t_luastanahbpn,
    b.t_luasbangunanbpn,
    b.t_tglajbbaru,
    b.t_noajbbaru,
    b.t_statuspelaporannotaris,
    b.t_tglpelaporannotaris,
    h.s_namanotaris,
    b.t_kabupatenop,
    a.t_persyaratan,
    g.s_iduser AS t_idnotarisspt,
    b.t_rtwppembeli,
    b.t_rwwppembeli,
    a.t_thnsppt,
    b.t_alamatop,
    b.t_rtop,
    b.t_rwop,
    b.t_rtwppenjual,
    b.t_rwwppenjual,
    b.t_inputbpn
   FROM (((((((t_spt a
     LEFT JOIN t_detailsptbphtb b ON ((b.t_idspt = a.t_idspt)))
     LEFT JOIN s_jenistransaksi c ON ((c.s_idjenistransaksi = a.t_idjenistransaksi)))
     LEFT JOIN s_jenishaktanah d ON ((d.s_idhaktanah = a.t_idjenishaktanah)))
     LEFT JOIN t_pembayaranspt e ON ((e.t_idspt = a.t_idspt)))
     LEFT JOIN t_pemeriksaan f ON ((f.p_idpembayaranspt = e.t_kohirpembayaran)))
     LEFT JOIN s_users g ON ((g.s_iduser = a.t_idnotarisspt)))
     LEFT JOIN s_notaris h ON (((h.s_idnotaris)::text = (g.s_idpejabat_idnotaris)::text)))
  WHERE (e.t_tglverifikasispt IS NULL);

-- ----------------------------
-- View structure for "public"."view_sspd_pembayaran"
-- ----------------------------
CREATE OR REPLACE VIEW "public"."view_sspd_pembayaran" AS 
 SELECT a.t_idspt,
    a.t_tglprosesspt,
    a.t_periodespt,
    a.t_nopbphtbsppt,
    a.t_totalspt,
    a.t_nilaitransaksispt,
    b.t_namawppembeli,
    b.t_nikwppembeli,
    b.t_alamatwppembeli,
    b.t_kecamatanwppembeli,
    b.t_kelurahanwppembeli,
    b.t_kabkotawppembeli,
    b.t_telponwppembeli,
    b.t_kodeposwppembeli,
    b.t_npwpwppembeli,
    b.t_namawppenjual,
    b.t_nikwppenjual,
    b.t_alamatwppenjual,
    b.t_kecamatanwppenjual,
    b.t_kelurahanwppenjual,
    b.t_kabkotawppenjual,
    b.t_telponwppenjual,
    b.t_kodeposwppenjual,
    b.t_npwpwppenjual,
    b.t_luastanah,
    b.t_njoptanah,
    b.t_luasbangunan,
    b.t_njopbangunan,
    b.t_totalnjoptanah,
    b.t_totalnjopbangunan,
    b.t_grandtotalnjop,
    b.t_nosertifikathaktanah,
    b.t_iddetailsptbphtb,
    c.s_namajenistransaksi,
    b.t_kelurahanop,
    b.t_kecamatanop,
    a.t_kohirspt,
    d.s_namahaktanah,
    a.t_potonganspt,
    a.t_idjenistransaksi,
    a.t_idjenishaktanah,
    e.t_idpembayaranspt,
    e.t_kohirpembayaran,
    e.t_periodepembayaran,
    e.t_tanggalpembayaran,
    e.t_idnotaris,
    e.t_nilaipembayaranspt,
    e.t_kodebayarspt,
    e.t_verifikasispt,
    e.t_tglverifikasispt,
    e.t_pejabatverifikasispt,
    e.t_statusbayarspt,
    e.t_ketetapanspt,
    e.t_kodebayarbanksppt,
    b.t_kabupatenop,
    b.t_rtwppembeli,
    b.t_rwwppembeli,
    a.t_thnsppt,
    b.t_alamatop,
    b.t_rtop,
    b.t_rwop,
    a.t_persyaratan,
    b.t_rtwppenjual,
    b.t_rwwppenjual,
    h.s_namanotaris,
    a.t_idnotarisspt,
    b.t_inputbpn,
    f.p_idpemeriksaan,
    f.p_idpembayaranspt,
    f.p_luastanah,
    f.p_luasbangunan,
    f.p_njoptanah,
    f.p_njopbangunan,
    f.p_totalnjoptanah,
    f.p_totalnjopbangunan,
    f.p_grandtotalnjop,
    f.p_nilaitransaksispt,
    f.p_potonganspt,
    f.p_totalspt,
    a.t_idsptsebelumnya,
    a.t_kohirketetapanspt,
    b.t_noajbbaru,
    b.t_tglajbbaru
   FROM (((((((t_spt a
     LEFT JOIN t_detailsptbphtb b ON ((b.t_idspt = a.t_idspt)))
     LEFT JOIN s_jenistransaksi c ON ((c.s_idjenistransaksi = a.t_idjenistransaksi)))
     LEFT JOIN s_jenishaktanah d ON ((d.s_idhaktanah = a.t_idjenishaktanah)))
     LEFT JOIN t_pembayaranspt e ON ((e.t_idspt = a.t_idspt)))
     LEFT JOIN t_pemeriksaan f ON ((f.p_idpembayaranspt = e.t_idpembayaranspt)))
     LEFT JOIN s_users g ON ((g.s_iduser = a.t_idnotarisspt)))
     LEFT JOIN s_notaris h ON (((h.s_idnotaris)::text = (g.s_idpejabat_idnotaris)::text)));

-- ----------------------------
-- View structure for "public"."view_sspd_semua_pembayaran"
-- ----------------------------
CREATE OR REPLACE VIEW "public"."view_sspd_semua_pembayaran" AS 
 SELECT z.t_idspt,
    z.t_tglprosesspt,
    z.t_periodespt,
    z.t_nopbphtbsppt,
    e.t_kodebayarbanksppt,
    z.t_totalspt,
    z.t_nilaitransaksispt,
    b.t_namawppembeli,
    b.t_nikwppembeli,
    b.t_alamatwppembeli,
    b.t_kecamatanwppembeli,
    b.t_kelurahanwppembeli,
    b.t_kabkotawppembeli,
    b.t_telponwppembeli,
    b.t_kodeposwppembeli,
    b.t_npwpwppembeli,
    b.t_namawppenjual,
    b.t_nikwppenjual,
    b.t_alamatwppenjual,
    b.t_kecamatanwppenjual,
    b.t_kelurahanwppenjual,
    b.t_kabkotawppenjual,
    b.t_telponwppenjual,
    b.t_kodeposwppenjual,
    b.t_npwpwppenjual,
    b.t_luastanah,
    b.t_njoptanah,
    b.t_luasbangunan,
    b.t_njopbangunan,
    b.t_totalnjoptanah,
    b.t_totalnjopbangunan,
    b.t_grandtotalnjop,
    b.t_nosertifikathaktanah,
    b.t_iddetailsptbphtb,
    c.s_namajenistransaksi,
    b.t_kelurahanop,
    b.t_kecamatanop,
    z.t_kohirspt,
    d.s_namahaktanah,
    z.t_potonganspt,
    z.t_idjenistransaksi,
    z.t_idjenishaktanah,
    e.t_idpembayaranspt,
    e.t_kohirpembayaran,
    e.t_periodepembayaran,
    e.t_tanggalpembayaran,
    e.t_idnotaris,
    e.t_nilaipembayaranspt,
    e.t_kodebayarspt,
    e.t_verifikasispt,
    e.t_tglverifikasispt,
    e.t_pejabatverifikasispt,
    e.t_statusbayarspt,
    f.p_kohirskpdkb,
    f.p_luastanah,
    f.p_luasbangunan,
    f.p_njoptanah,
    f.p_njopbangunan,
    f.p_totalnjoptanah,
    f.p_totalnjopbangunan,
    f.p_grandtotalnjop,
    f.p_nilaitransaksispt,
    f.p_potonganspt,
    f.p_ketwaris,
    f.p_terbukti,
    f.p_idjenistransaksi,
    f.p_idjenishaktanah,
    f.p_totalspt,
    f.p_nilaipembayaranspt,
    f.p_nilaikurangbayar,
    e.t_ketetapanspt,
    f.p_idpemeriksaan,
    b.t_luastanahbpn,
    b.t_luasbangunanbpn,
    b.t_tglajbbaru,
    b.t_noajbbaru,
    b.t_statuspelaporannotaris,
    b.t_tglpelaporannotaris,
    h.s_namanotaris,
    b.t_kabupatenop,
    z.t_persyaratan,
    g.s_iduser AS t_idnotarisspt,
    b.t_nosertifikatbaru,
    b.t_tglsertifikatbaru,
    b.t_inputbpn,
    b.t_statuskonfirmasinotaris,
    z.t_kohirketetapanspt,
    i.t_kodebayards,
    k.s_namanotaris AS notarisds,
    i.t_kohirds,
    i.t_ketetapands,
    to_char((e.t_tanggalpembayaran)::timestamp with time zone, 'MM-YYYY'::text) AS t_bulanselesaibayar
   FROM ((((((((((t_pembayaranspt e
     LEFT JOIN t_spt z ON ((e.t_idspt = z.t_idspt)))
     LEFT JOIN t_detailsptbphtb b ON ((b.t_idspt = z.t_idspt)))
     LEFT JOIN s_jenistransaksi c ON ((c.s_idjenistransaksi = z.t_idjenistransaksi)))
     LEFT JOIN s_jenishaktanah d ON ((d.s_idhaktanah = z.t_idjenishaktanah)))
     LEFT JOIN t_pemeriksaan f ON ((f.p_idpembayaranspt = e.t_idpembayaranspt)))
     LEFT JOIN s_users g ON ((g.s_iduser = z.t_idnotarisspt)))
     LEFT JOIN s_notaris h ON (((h.s_idnotaris)::text = (g.s_idpejabat_idnotaris)::text)))
     LEFT JOIN t_dendasanksinotaris i ON ((i.t_idds = e.t_idds)))
     LEFT JOIN s_users j ON ((j.s_iduser = i.t_idnotaris)))
     LEFT JOIN s_notaris k ON (((k.s_idnotaris)::text = (j.s_idpejabat_idnotaris)::text)));

-- ----------------------------
-- View structure for "public"."view_sspd_sudah_tervalidasi"
-- ----------------------------
CREATE OR REPLACE VIEW "public"."view_sspd_sudah_tervalidasi" AS 
 SELECT a.t_idspt,
    a.t_tglprosesspt,
    a.t_periodespt,
    a.t_nopbphtbsppt,
    a.t_totalspt,
    a.t_nilaitransaksispt,
    b.t_namawppembeli,
    b.t_nikwppembeli,
    b.t_alamatwppembeli,
    b.t_kecamatanwppembeli,
    b.t_kelurahanwppembeli,
    b.t_kabkotawppembeli,
    b.t_telponwppembeli,
    b.t_kodeposwppembeli,
    b.t_npwpwppembeli,
    b.t_namawppenjual,
    b.t_nikwppenjual,
    b.t_alamatwppenjual,
    b.t_kecamatanwppenjual,
    b.t_kelurahanwppenjual,
    b.t_kabkotawppenjual,
    b.t_telponwppenjual,
    b.t_kodeposwppenjual,
    b.t_npwpwppenjual,
    b.t_luastanah,
    b.t_njoptanah,
    b.t_luasbangunan,
    b.t_njopbangunan,
    b.t_totalnjoptanah,
    b.t_totalnjopbangunan,
    b.t_grandtotalnjop,
    b.t_nosertifikathaktanah,
    b.t_iddetailsptbphtb,
    c.s_namajenistransaksi,
    b.t_kelurahanop,
    b.t_kecamatanop,
    a.t_kohirspt,
    d.s_namahaktanah,
    a.t_potonganspt,
    a.t_idjenistransaksi,
    a.t_idjenishaktanah,
    e.t_idpembayaranspt,
    e.t_kohirpembayaran,
    e.t_periodepembayaran,
    e.t_tanggalpembayaran,
    e.t_idnotaris,
    e.t_nilaipembayaranspt,
    e.t_kodebayarspt,
    e.t_verifikasispt,
    e.t_tglverifikasispt,
    e.t_pejabatverifikasispt,
    e.t_statusbayarspt,
    e.t_ketetapanspt,
    e.t_kodebayarbanksppt,
    b.t_kabupatenop,
    b.t_rtwppembeli,
    b.t_rwwppembeli,
    a.t_thnsppt,
    b.t_alamatop,
    b.t_rtop,
    b.t_rwop,
    a.t_persyaratan,
    b.t_rtwppenjual,
    b.t_rwwppenjual,
    h.s_namanotaris,
    a.t_idnotarisspt,
    b.t_inputbpn,
    a.t_kohirketetapanspt
   FROM ((((((t_spt a
     LEFT JOIN t_detailsptbphtb b ON ((b.t_idspt = a.t_idspt)))
     LEFT JOIN s_jenistransaksi c ON ((c.s_idjenistransaksi = a.t_idjenistransaksi)))
     LEFT JOIN s_jenishaktanah d ON ((d.s_idhaktanah = a.t_idjenishaktanah)))
     LEFT JOIN t_pembayaranspt e ON ((e.t_idspt = a.t_idspt)))
     LEFT JOIN s_users g ON ((g.s_iduser = a.t_idnotarisspt)))
     LEFT JOIN s_notaris h ON (((h.s_idnotaris)::text = (g.s_idpejabat_idnotaris)::text)))
  WHERE (e.t_kodebayarbanksppt IS NOT NULL);

-- ----------------------------
-- View structure for "public"."view_terbit_ajb"
-- ----------------------------
CREATE OR REPLACE VIEW "public"."view_terbit_ajb" AS 
 SELECT a.t_idspt,
    a.t_tglprosesspt,
    a.t_periodespt,
    a.t_nopbphtbsppt,
    e.t_kodebayarbanksppt,
    a.t_totalspt,
    a.t_nilaitransaksispt,
    b.t_namawppembeli,
    b.t_nikwppembeli,
    b.t_alamatwppembeli,
    b.t_kecamatanwppembeli,
    b.t_kelurahanwppembeli,
    b.t_kabkotawppembeli,
    b.t_telponwppembeli,
    b.t_kodeposwppembeli,
    b.t_npwpwppembeli,
    b.t_namawppenjual,
    b.t_nikwppenjual,
    b.t_alamatwppenjual,
    b.t_kecamatanwppenjual,
    b.t_kelurahanwppenjual,
    b.t_kabkotawppenjual,
    b.t_telponwppenjual,
    b.t_kodeposwppenjual,
    b.t_npwpwppenjual,
    b.t_luastanah,
    b.t_njoptanah,
    b.t_luasbangunan,
    b.t_njopbangunan,
    b.t_totalnjoptanah,
    b.t_totalnjopbangunan,
    b.t_grandtotalnjop,
    b.t_nosertifikathaktanah,
    b.t_iddetailsptbphtb,
    c.s_namajenistransaksi,
    b.t_kelurahanop,
    b.t_kecamatanop,
    a.t_kohirspt,
    d.s_namahaktanah,
    a.t_potonganspt,
    a.t_idjenistransaksi,
    a.t_idjenishaktanah,
    e.t_idpembayaranspt,
    e.t_kohirpembayaran,
    e.t_periodepembayaran,
    e.t_tanggalpembayaran,
    e.t_idnotaris,
    e.t_nilaipembayaranspt,
    e.t_kodebayarspt,
    e.t_verifikasispt,
    e.t_tglverifikasispt,
    e.t_pejabatverifikasispt,
    e.t_statusbayarspt,
    f.p_kohirskpdkb,
    f.p_luastanah,
    f.p_luasbangunan,
    f.p_njoptanah,
    f.p_njopbangunan,
    f.p_totalnjoptanah,
    f.p_totalnjopbangunan,
    f.p_grandtotalnjop,
    f.p_nilaitransaksispt,
    f.p_potonganspt,
    f.p_ketwaris,
    f.p_terbukti,
    f.p_idjenistransaksi,
    f.p_idjenishaktanah,
    f.p_totalspt,
    f.p_nilaipembayaranspt,
    f.p_nilaikurangbayar,
    e.t_ketetapanspt,
    f.p_idpemeriksaan,
    b.t_luastanahbpn,
    b.t_luasbangunanbpn,
    b.t_tglajbbaru,
    b.t_noajbbaru,
    b.t_statuspelaporannotaris,
    b.t_tglpelaporannotaris,
    h.s_namanotaris,
    b.t_kabupatenop,
    a.t_persyaratan,
    g.s_iduser AS t_idnotarisspt,
    b.t_nosertifikatbaru,
    b.t_tglsertifikatbaru,
    b.t_inputbpn,
    b.t_statuskonfirmasinotaris
   FROM (((((((t_spt a
     LEFT JOIN t_detailsptbphtb b ON ((b.t_idspt = a.t_idspt)))
     LEFT JOIN s_jenistransaksi c ON ((c.s_idjenistransaksi = a.t_idjenistransaksi)))
     LEFT JOIN s_jenishaktanah d ON ((d.s_idhaktanah = a.t_idjenishaktanah)))
     LEFT JOIN t_pembayaranspt e ON ((e.t_idspt = a.t_idspt)))
     LEFT JOIN t_pemeriksaan f ON ((f.p_idpembayaranspt = e.t_idpembayaranspt)))
     LEFT JOIN s_users g ON ((g.s_iduser = a.t_idnotarisspt)))
     LEFT JOIN s_notaris h ON (((h.s_idnotaris)::text = (g.s_idpejabat_idnotaris)::text)))
  WHERE ((b.t_noajbbaru IS NOT NULL) AND (b.t_tglajbbaru IS NOT NULL));

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "public"."permission_id_seq" OWNED BY "permission"."id";
ALTER SEQUENCE "public"."resource_id_seq" OWNED BY "resource"."id";
ALTER SEQUENCE "public"."role_rid_seq" OWNED BY "role"."rid";
ALTER SEQUENCE "public"."s_acuan_s_idacuan_seq" OWNED BY "s_acuan"."s_idacuan";
ALTER SEQUENCE "public"."s_jenishaktanah_s_idjenishaktanah_seq" OWNED BY "s_jenishaktanah"."s_idhaktanah";
ALTER SEQUENCE "public"."s_jenisketetapan_s_idjenisketetapan_seq" OWNED BY "s_jenisketetapan"."s_idjenisketetapan";
ALTER SEQUENCE "public"."s_jenistransaksi_s_idjenistransaksi_seq" OWNED BY "s_jenistransaksi"."s_idjenistransaksi";
ALTER SEQUENCE "public"."s_kecamatan_s_idkecamatan_seq" OWNED BY "s_kecamatan"."s_idkecamatan";
ALTER SEQUENCE "public"."s_kelurahan_s_idkelurahan_seq" OWNED BY "s_kelurahan"."s_idkelurahan";
ALTER SEQUENCE "public"."s_koderekening_s_korekid_seq" OWNED BY "s_koderekening"."s_korekid";
ALTER SEQUENCE "public"."s_notaris_s_idnotaris_seq" OWNED BY "s_notaris"."s_idnotaris";
ALTER SEQUENCE "public"."s_pejabat_s_idpejabat_seq" OWNED BY "s_pejabat"."s_idpejabat";
ALTER SEQUENCE "public"."s_pemda_s_idpemda_seq" OWNED BY "s_pemda"."s_idpemda";
ALTER SEQUENCE "public"."s_peraturan_s_idperaturan_seq" OWNED BY "s_peraturan"."s_idperaturan";
ALTER SEQUENCE "public"."s_persyaratan_s_idpersyaratan_seq" OWNED BY "s_persyaratan"."s_idpersyaratan";
ALTER SEQUENCE "public"."s_presentase_s_idpresentase_seq" OWNED BY "s_presentase"."s_idpresentase";
ALTER SEQUENCE "public"."s_tarifbphtb_s_idtarifbphtb_seq" OWNED BY "s_tarifbphtb"."s_idtarifbphtb";
ALTER SEQUENCE "public"."s_users_s_iduser_seq" OWNED BY "s_users"."s_iduser";
ALTER SEQUENCE "public"."t_dendasanksinotaris_t_idds_seq" OWNED BY "t_dendasanksinotaris"."t_idds";
ALTER SEQUENCE "public"."t_pembayaranspt_t_idpembayaranspt_seq" OWNED BY "t_pembayaranspt"."t_idpembayaranspt";
ALTER SEQUENCE "public"."t_pemeriksaan_p_idpemeriksaan_seq" OWNED BY "t_pemeriksaan"."p_idpemeriksaan";
ALTER SEQUENCE "public"."t_penerimawaris_t_idpenerima_seq" OWNED BY "t_penerimawaris"."t_idpenerima";

-- ----------------------------
-- Primary Key structure for table "public"."permission"
-- ----------------------------
ALTER TABLE "public"."permission" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table "public"."resource"
-- ----------------------------
ALTER TABLE "public"."resource" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table "public"."role"
-- ----------------------------
ALTER TABLE "public"."role" ADD PRIMARY KEY ("rid");

-- ----------------------------
-- Primary Key structure for table "public"."s_acuan"
-- ----------------------------
ALTER TABLE "public"."s_acuan" ADD PRIMARY KEY ("s_idacuan");

-- ----------------------------
-- Primary Key structure for table "public"."s_jenisdoktanah"
-- ----------------------------
ALTER TABLE "public"."s_jenisdoktanah" ADD PRIMARY KEY ("s_iddoktanah");

-- ----------------------------
-- Primary Key structure for table "public"."s_jenishaktanah"
-- ----------------------------
ALTER TABLE "public"."s_jenishaktanah" ADD PRIMARY KEY ("s_idhaktanah");

-- ----------------------------
-- Primary Key structure for table "public"."s_jenisketetapan"
-- ----------------------------
ALTER TABLE "public"."s_jenisketetapan" ADD PRIMARY KEY ("s_idjenisketetapan");

-- ----------------------------
-- Primary Key structure for table "public"."s_jenistransaksi"
-- ----------------------------
ALTER TABLE "public"."s_jenistransaksi" ADD PRIMARY KEY ("s_idjenistransaksi");

-- ----------------------------
-- Uniques structure for table "public"."s_kecamatan"
-- ----------------------------
ALTER TABLE "public"."s_kecamatan" ADD UNIQUE ("s_kodekecamatan");

-- ----------------------------
-- Primary Key structure for table "public"."s_kecamatan"
-- ----------------------------
ALTER TABLE "public"."s_kecamatan" ADD PRIMARY KEY ("s_idkecamatan");

-- ----------------------------
-- Primary Key structure for table "public"."s_kelurahan"
-- ----------------------------
ALTER TABLE "public"."s_kelurahan" ADD PRIMARY KEY ("s_idkelurahan");

-- ----------------------------
-- Indexes structure for table s_koderekening
-- ----------------------------
CREATE INDEX "s_koderekening_s_korekid" ON "public"."s_koderekening" USING btree ("s_korekid");

-- ----------------------------
-- Primary Key structure for table "public"."s_koderekening"
-- ----------------------------
ALTER TABLE "public"."s_koderekening" ADD PRIMARY KEY ("s_korekid");

-- ----------------------------
-- Primary Key structure for table "public"."s_notaris"
-- ----------------------------
ALTER TABLE "public"."s_notaris" ADD PRIMARY KEY ("s_idnotaris");

-- ----------------------------
-- Primary Key structure for table "public"."s_pejabat"
-- ----------------------------
ALTER TABLE "public"."s_pejabat" ADD PRIMARY KEY ("s_idpejabat");

-- ----------------------------
-- Primary Key structure for table "public"."s_pemda"
-- ----------------------------
ALTER TABLE "public"."s_pemda" ADD PRIMARY KEY ("s_idpemda");

-- ----------------------------
-- Primary Key structure for table "public"."s_peraturan"
-- ----------------------------
ALTER TABLE "public"."s_peraturan" ADD PRIMARY KEY ("s_idperaturan");

-- ----------------------------
-- Primary Key structure for table "public"."s_persyaratan"
-- ----------------------------
ALTER TABLE "public"."s_persyaratan" ADD PRIMARY KEY ("s_idpersyaratan");

-- ----------------------------
-- Primary Key structure for table "public"."s_presentase"
-- ----------------------------
ALTER TABLE "public"."s_presentase" ADD PRIMARY KEY ("s_idpresentase");

-- ----------------------------
-- Primary Key structure for table "public"."s_tarifbphtb"
-- ----------------------------
ALTER TABLE "public"."s_tarifbphtb" ADD PRIMARY KEY ("s_idtarifbphtb");

-- ----------------------------
-- Primary Key structure for table "public"."s_tarifnpoptkp"
-- ----------------------------
ALTER TABLE "public"."s_tarifnpoptkp" ADD PRIMARY KEY ("s_idtarifnpotkp");

-- ----------------------------
-- Primary Key structure for table "public"."s_users"
-- ----------------------------
ALTER TABLE "public"."s_users" ADD PRIMARY KEY ("s_iduser");

-- ----------------------------
-- Primary Key structure for table "public"."ss_golonganpejabat"
-- ----------------------------
ALTER TABLE "public"."ss_golonganpejabat" ADD PRIMARY KEY ("ss_idgolongan");

-- ----------------------------
-- Primary Key structure for table "public"."t_dendasanksinotaris"
-- ----------------------------
ALTER TABLE "public"."t_dendasanksinotaris" ADD PRIMARY KEY ("t_idds");

-- ----------------------------
-- Primary Key structure for table "public"."t_detailsptbphtb"
-- ----------------------------
ALTER TABLE "public"."t_detailsptbphtb" ADD PRIMARY KEY ("t_iddetailsptbphtb");

-- ----------------------------
-- Primary Key structure for table "public"."t_pembayaranspt"
-- ----------------------------
ALTER TABLE "public"."t_pembayaranspt" ADD PRIMARY KEY ("t_idpembayaranspt");

-- ----------------------------
-- Primary Key structure for table "public"."t_pemeriksaan"
-- ----------------------------
ALTER TABLE "public"."t_pemeriksaan" ADD PRIMARY KEY ("p_idpemeriksaan");

-- ----------------------------
-- Primary Key structure for table "public"."t_penerimawaris"
-- ----------------------------
ALTER TABLE "public"."t_penerimawaris" ADD PRIMARY KEY ("t_idpenerima");

-- ----------------------------
-- Primary Key structure for table "public"."t_spt"
-- ----------------------------
ALTER TABLE "public"."t_spt" ADD PRIMARY KEY ("t_idspt");
