--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permission (
    id bigint NOT NULL,
    permission_name character varying(45) NOT NULL,
    resource_id bigint NOT NULL,
    alias character varying(255)
);


ALTER TABLE permission OWNER TO postgres;

--
-- Name: permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permission_id_seq OWNER TO postgres;

--
-- Name: permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE permission_id_seq OWNED BY permission.id;


--
-- Name: permission_resource; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permission_resource (
    s_iduser integer,
    s_idpermission integer
);


ALTER TABLE permission_resource OWNER TO postgres;

--
-- Name: resource; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE resource (
    id bigint NOT NULL,
    resource_name character varying(50) NOT NULL
);


ALTER TABLE resource OWNER TO postgres;

--
-- Name: resource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resource_id_seq OWNER TO postgres;

--
-- Name: resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE resource_id_seq OWNED BY resource.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE role (
    rid bigint NOT NULL,
    role_name character varying(60) NOT NULL,
    status character(255) DEFAULT 'Active'::bpchar NOT NULL
);


ALTER TABLE role OWNER TO postgres;

--
-- Name: role_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE role_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_permission_id_seq OWNER TO postgres;

--
-- Name: role_rid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE role_rid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_rid_seq OWNER TO postgres;

--
-- Name: role_rid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE role_rid_seq OWNED BY role.rid;


--
-- Name: s_acuan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_acuan (
    s_idacuan integer NOT NULL,
    s_kd_propinsi character varying(2),
    s_kd_dati2 character varying(2),
    s_kd_kecamatan character varying(3),
    s_kd_kelurahan character varying(3),
    s_kd_blok character varying(3),
    s_permetertanah integer
);


ALTER TABLE s_acuan OWNER TO postgres;

--
-- Name: s_acuan_s_idacuan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_acuan_s_idacuan_seq
    START WITH 8
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_acuan_s_idacuan_seq OWNER TO postgres;

--
-- Name: s_acuan_s_idacuan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE s_acuan_s_idacuan_seq OWNED BY s_acuan.s_idacuan;


--
-- Name: s_jenisdoktanah_s_iddoktanah_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_jenisdoktanah_s_iddoktanah_seq
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_jenisdoktanah_s_iddoktanah_seq OWNER TO postgres;

--
-- Name: s_jenisdoktanah; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_jenisdoktanah (
    s_iddoktanah integer DEFAULT nextval('s_jenisdoktanah_s_iddoktanah_seq'::regclass) NOT NULL,
    s_namadoktanah text
);


ALTER TABLE s_jenisdoktanah OWNER TO postgres;

--
-- Name: s_jenishaktanah; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_jenishaktanah (
    s_idhaktanah integer NOT NULL,
    s_kodehaktanah character varying(10),
    s_namahaktanah text
);


ALTER TABLE s_jenishaktanah OWNER TO postgres;

--
-- Name: s_jenishaktanah_s_idjenishaktanah_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_jenishaktanah_s_idjenishaktanah_seq
    START WITH 7
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_jenishaktanah_s_idjenishaktanah_seq OWNER TO postgres;

--
-- Name: s_jenishaktanah_s_idjenishaktanah_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE s_jenishaktanah_s_idjenishaktanah_seq OWNED BY s_jenishaktanah.s_idhaktanah;


--
-- Name: s_jenisketetapan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_jenisketetapan (
    s_idjenisketetapan integer NOT NULL,
    s_namajenisketetapan text NOT NULL,
    s_namasingkatjenisketetapan character varying(20) NOT NULL
);


ALTER TABLE s_jenisketetapan OWNER TO postgres;

--
-- Name: s_jenisketetapan_s_idjenisketetapan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_jenisketetapan_s_idjenisketetapan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_jenisketetapan_s_idjenisketetapan_seq OWNER TO postgres;

--
-- Name: s_jenisketetapan_s_idjenisketetapan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE s_jenisketetapan_s_idjenisketetapan_seq OWNED BY s_jenisketetapan.s_idjenisketetapan;


--
-- Name: s_jenistransaksi; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_jenistransaksi (
    s_idjenistransaksi integer NOT NULL,
    s_kodejenistransaksi character varying(5),
    s_namajenistransaksi character varying(200)
);


ALTER TABLE s_jenistransaksi OWNER TO postgres;

--
-- Name: s_jenistransaksi_s_idjenistransaksi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_jenistransaksi_s_idjenistransaksi_seq
    START WITH 15
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_jenistransaksi_s_idjenistransaksi_seq OWNER TO postgres;

--
-- Name: s_jenistransaksi_s_idjenistransaksi_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE s_jenistransaksi_s_idjenistransaksi_seq OWNED BY s_jenistransaksi.s_idjenistransaksi;


--
-- Name: s_kecamatan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_kecamatan (
    s_idkecamatan integer NOT NULL,
    s_kodekecamatan character varying(4) NOT NULL,
    s_namakecamatan text NOT NULL
);


ALTER TABLE s_kecamatan OWNER TO postgres;

--
-- Name: s_kecamatan_s_idkecamatan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_kecamatan_s_idkecamatan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_kecamatan_s_idkecamatan_seq OWNER TO postgres;

--
-- Name: s_kecamatan_s_idkecamatan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE s_kecamatan_s_idkecamatan_seq OWNED BY s_kecamatan.s_idkecamatan;


--
-- Name: s_kelurahan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_kelurahan (
    s_idkelurahan integer NOT NULL,
    s_idkecamatan integer NOT NULL,
    s_kodekelurahan character varying(4) NOT NULL,
    s_namakelurahan text NOT NULL
);


ALTER TABLE s_kelurahan OWNER TO postgres;

--
-- Name: s_kelurahan_s_idkelurahan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_kelurahan_s_idkelurahan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_kelurahan_s_idkelurahan_seq OWNER TO postgres;

--
-- Name: s_kelurahan_s_idkelurahan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE s_kelurahan_s_idkelurahan_seq OWNED BY s_kelurahan.s_idkelurahan;


--
-- Name: s_koderekening; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_koderekening (
    s_korekid integer NOT NULL,
    s_korektipe character varying(2) NOT NULL,
    s_korekkelompok character varying(2) NOT NULL,
    s_korekjenis character varying(2) NOT NULL,
    s_korekobjek character varying(4) NOT NULL,
    s_korekrincian character varying(4) NOT NULL,
    s_korekrinciansub character varying(10) NOT NULL,
    s_koreknama character varying(300) NOT NULL,
    s_korekketerangan text NOT NULL
);


ALTER TABLE s_koderekening OWNER TO postgres;

--
-- Name: s_koderekening_s_korekid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_koderekening_s_korekid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_koderekening_s_korekid_seq OWNER TO postgres;

--
-- Name: s_koderekening_s_korekid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE s_koderekening_s_korekid_seq OWNED BY s_koderekening.s_korekid;


--
-- Name: s_notaris; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_notaris (
    s_idnotaris integer NOT NULL,
    s_namanotaris character varying,
    s_alamatnotaris text,
    s_kodenotaris character varying,
    s_sknotaris character varying(50),
    s_tgl1notaris date,
    s_tgl2notaris date,
    s_statusnotaris integer
);


ALTER TABLE s_notaris OWNER TO postgres;

--
-- Name: s_notaris_s_idnotaris_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_notaris_s_idnotaris_seq
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_notaris_s_idnotaris_seq OWNER TO postgres;

--
-- Name: s_notaris_s_idnotaris_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE s_notaris_s_idnotaris_seq OWNED BY s_notaris.s_idnotaris;


--
-- Name: s_pejabat; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_pejabat (
    s_idpejabat integer NOT NULL,
    s_namapejabat text NOT NULL,
    s_jabatanpejabat text NOT NULL,
    s_nippejabat character varying(25) NOT NULL,
    s_golonganpejabat integer
);


ALTER TABLE s_pejabat OWNER TO postgres;

--
-- Name: s_pejabat_s_idpejabat_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_pejabat_s_idpejabat_seq
    START WITH 8
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_pejabat_s_idpejabat_seq OWNER TO postgres;

--
-- Name: s_pejabat_s_idpejabat_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE s_pejabat_s_idpejabat_seq OWNED BY s_pejabat.s_idpejabat;


--
-- Name: s_pemda; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_pemda (
    s_idpemda integer NOT NULL,
    s_namaprov character varying(250) NOT NULL,
    s_namakabkot character varying(250) NOT NULL,
    s_namaibukotakabkot character varying(250) NOT NULL,
    s_kodeprovinsi character varying(3) NOT NULL,
    s_kodekabkot character varying(4) NOT NULL,
    s_namainstansi character varying(250) NOT NULL,
    s_namasingkatinstansi character varying(50) NOT NULL,
    s_alamatinstansi text NOT NULL,
    s_notelinstansi character varying(15) NOT NULL,
    s_namabank character varying(100) NOT NULL,
    s_norekbank character varying(30) NOT NULL,
    s_logo text,
    s_namacabang character varying(50),
    s_kodecabang character varying(20),
    s_kodepos character varying(5)
);


ALTER TABLE s_pemda OWNER TO postgres;

--
-- Name: s_pemda_s_idpemda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_pemda_s_idpemda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_pemda_s_idpemda_seq OWNER TO postgres;

--
-- Name: s_pemda_s_idpemda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE s_pemda_s_idpemda_seq OWNED BY s_pemda.s_idpemda;


--
-- Name: s_peraturan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_peraturan (
    s_idperaturan integer NOT NULL,
    s_teksperaturan text,
    s_kodeperaturan character varying(5)
);


ALTER TABLE s_peraturan OWNER TO postgres;

--
-- Name: s_peraturan_s_idperaturan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_peraturan_s_idperaturan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_peraturan_s_idperaturan_seq OWNER TO postgres;

--
-- Name: s_peraturan_s_idperaturan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE s_peraturan_s_idperaturan_seq OWNED BY s_peraturan.s_idperaturan;


--
-- Name: s_persyaratan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_persyaratan (
    s_idpersyaratan integer NOT NULL,
    s_idjenistransaksi integer,
    s_namapersyaratan character varying,
    "order" integer
);


ALTER TABLE s_persyaratan OWNER TO postgres;

--
-- Name: s_persyaratan_s_idpersyaratan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_persyaratan_s_idpersyaratan_seq
    START WITH 80
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_persyaratan_s_idpersyaratan_seq OWNER TO postgres;

--
-- Name: s_persyaratan_s_idpersyaratan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE s_persyaratan_s_idpersyaratan_seq OWNED BY s_persyaratan.s_idpersyaratan;


--
-- Name: s_presentase; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_presentase (
    s_idpresentase integer NOT NULL,
    s_presentase integer,
    s_keterangan character varying(30),
    s_presentasemin integer,
    warna character varying(20)
);


ALTER TABLE s_presentase OWNER TO postgres;

--
-- Name: s_presentase_s_idpresentase_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_presentase_s_idpresentase_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_presentase_s_idpresentase_seq OWNER TO postgres;

--
-- Name: s_presentase_s_idpresentase_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE s_presentase_s_idpresentase_seq OWNED BY s_presentase.s_idpresentase;


--
-- Name: s_tarifbphtb; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tarifbphtb (
    s_idtarifbphtb integer NOT NULL,
    s_tarifbphtb real,
    s_dasarhukumtarifbphtb text,
    s_tanggaltarifbphtb date,
    s_statustarifbphtb integer
);


ALTER TABLE s_tarifbphtb OWNER TO postgres;

--
-- Name: s_tarifbphtb_s_idtarifbphtb_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_tarifbphtb_s_idtarifbphtb_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_tarifbphtb_s_idtarifbphtb_seq OWNER TO postgres;

--
-- Name: s_tarifbphtb_s_idtarifbphtb_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE s_tarifbphtb_s_idtarifbphtb_seq OWNED BY s_tarifbphtb.s_idtarifbphtb;


--
-- Name: s_tarifnpoptkp_s_idtarifnpotkp_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_tarifnpoptkp_s_idtarifnpotkp_seq
    START WITH 56
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_tarifnpoptkp_s_idtarifnpotkp_seq OWNER TO postgres;

--
-- Name: s_tarifnpoptkp; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tarifnpoptkp (
    s_idtarifnpotkp integer DEFAULT nextval('s_tarifnpoptkp_s_idtarifnpotkp_seq'::regclass) NOT NULL,
    s_idjenistransaksinpotkp integer,
    s_tarifnpotkp real,
    s_dasarhukumnpotkp text,
    s_statusnpotkp integer,
    s_tarifnpotkptambahan real,
    s_tarifnpotkptahunajb1 integer,
    s_tarifnpotkptahunajb2 integer
);


ALTER TABLE s_tarifnpoptkp OWNER TO postgres;

--
-- Name: s_tempo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tempo (
    s_jumlahhari integer
);


ALTER TABLE s_tempo OWNER TO postgres;

--
-- Name: s_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_users (
    s_iduser integer NOT NULL,
    s_username character varying(100) NOT NULL,
    s_password character varying(100) NOT NULL,
    s_jabatan text NOT NULL,
    s_akses integer,
    s_idpejabat_idnotaris character varying,
    s_tipe_pejabat character varying(1)
);


ALTER TABLE s_users OWNER TO postgres;

--
-- Name: s_users_s_iduser_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_users_s_iduser_seq
    START WITH 40
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s_users_s_iduser_seq OWNER TO postgres;

--
-- Name: s_users_s_iduser_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE s_users_s_iduser_seq OWNED BY s_users.s_iduser;


--
-- Name: ss_golonganpejabat; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ss_golonganpejabat (
    ss_idgolongan integer NOT NULL,
    ss_namagolongan character varying(50) NOT NULL,
    ss_pangkatgolongan text NOT NULL
);


ALTER TABLE ss_golonganpejabat OWNER TO postgres;

--
-- Name: t_dendasanksinotaris; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_dendasanksinotaris (
    t_idds integer NOT NULL,
    t_tglprosesds date,
    t_periodeds smallint,
    t_dendabulan character varying(15) NOT NULL,
    t_idnotaris integer,
    t_jumlahds integer,
    t_ketetapands integer,
    t_idspt integer,
    t_kohirds integer,
    t_kodebayards character varying(10)
);


ALTER TABLE t_dendasanksinotaris OWNER TO postgres;

--
-- Name: t_dendasanksinotaris_t_idds_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_dendasanksinotaris_t_idds_seq
    START WITH 16
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_dendasanksinotaris_t_idds_seq OWNER TO postgres;

--
-- Name: t_dendasanksinotaris_t_idds_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE t_dendasanksinotaris_t_idds_seq OWNED BY t_dendasanksinotaris.t_idds;


--
-- Name: t_detailsptbphtb_t_iddetailsptbphtb_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_detailsptbphtb_t_iddetailsptbphtb_seq
    START WITH 45
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_detailsptbphtb_t_iddetailsptbphtb_seq OWNER TO postgres;

--
-- Name: t_detailsptbphtb; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailsptbphtb (
    t_iddetailsptbphtb integer DEFAULT nextval('t_detailsptbphtb_t_iddetailsptbphtb_seq'::regclass) NOT NULL,
    t_idspt integer,
    t_namawppembeli character varying,
    t_nikwppembeli character varying,
    t_alamatwppembeli text,
    t_kecamatanwppembeli character varying,
    t_kelurahanwppembeli character varying,
    t_kabkotawppembeli character varying,
    t_telponwppembeli character varying,
    t_kodeposwppembeli character varying,
    t_npwpwppembeli character varying,
    t_namawppenjual character varying,
    t_nikwppenjual character varying,
    t_alamatwppenjual text,
    t_kecamatanwppenjual character varying,
    t_kelurahanwppenjual character varying,
    t_kabkotawppenjual character varying,
    t_telponwppenjual character varying,
    t_kodeposwppenjual character varying,
    t_npwpwppenjual character varying,
    t_luastanah numeric(18,2),
    t_njoptanah bigint,
    t_luasbangunan numeric(18,2),
    t_njopbangunan bigint,
    t_totalnjoptanah bigint,
    t_totalnjopbangunan bigint,
    t_grandtotalnjop bigint,
    t_nosertifikathaktanah character varying(30),
    t_kelurahanop character varying(30),
    t_kecamatanop character varying(30),
    t_ketwaris character varying(200),
    t_terbukti character varying(10),
    t_rtwppembeli character varying,
    t_rwwppembeli character varying,
    t_alamatop character varying,
    t_rtop character varying(3),
    t_rwop character varying(3),
    t_dokpersyaratan character varying,
    t_namasppt character varying,
    t_tglajb date,
    t_luastanahbpn numeric(18,2),
    t_luasbangunanbpn numeric(18,2),
    t_tglajbbaru date,
    t_noajbbaru character varying,
    t_statuspelaporannotaris boolean,
    t_tglpelaporannotaris date,
    t_kabupatenop character varying,
    t_rtwppenjual character varying,
    t_rwwppenjual character varying,
    t_nosertifikatbaru character varying(10),
    t_tglsertifikatbaru date,
    t_inputbpn boolean,
    t_statuskonfirmasinotaris boolean,
    t_tglkonfirmasinotaris date
);


ALTER TABLE t_detailsptbphtb OWNER TO postgres;

--
-- Name: t_pembayaranspt; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_pembayaranspt (
    t_idpembayaranspt integer NOT NULL,
    t_idspt integer,
    t_kohirpembayaran integer,
    t_periodepembayaran smallint,
    t_tanggalpembayaran date,
    t_objekspt integer,
    t_idnotaris integer,
    t_ketetapanspt bigint,
    t_nilaipembayaranspt bigint,
    t_idkorekspt integer,
    t_kodebayarspt character varying,
    t_verifikasispt character varying,
    t_tglverifikasispt date,
    t_pejabatverifikasispt integer,
    t_statusbayarspt boolean,
    t_kodebayarbanksppt character varying,
    t_dendabulan bigint,
    t_pejabatpembayaranspt integer,
    t_idds integer,
    t_dendaspt bigint
);


ALTER TABLE t_pembayaranspt OWNER TO postgres;

--
-- Name: t_pembayaranspt_t_idpembayaranspt_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_pembayaranspt_t_idpembayaranspt_seq
    START WITH 53
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_pembayaranspt_t_idpembayaranspt_seq OWNER TO postgres;

--
-- Name: t_pembayaranspt_t_idpembayaranspt_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE t_pembayaranspt_t_idpembayaranspt_seq OWNED BY t_pembayaranspt.t_idpembayaranspt;


--
-- Name: t_pemeriksaan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_pemeriksaan (
    p_idpemeriksaan integer NOT NULL,
    p_idpembayaranspt integer,
    p_luastanah numeric(18,2),
    p_luasbangunan numeric(18,2),
    p_njoptanah bigint,
    p_njopbangunan bigint,
    p_totalnjoptanah bigint,
    p_totalnjopbangunan bigint,
    p_grandtotalnjop bigint,
    p_nilaitransaksispt bigint,
    p_potonganspt integer,
    p_ketwaris character varying(200),
    p_terbukti character varying(10),
    p_idjenistransaksi integer,
    p_idjenishaktanah integer,
    p_totalspt bigint,
    p_nilaipembayaranspt bigint,
    p_nilaikurangbayar bigint,
    p_kohirskpdkb integer,
    p_pembayaranskpdkb boolean
);


ALTER TABLE t_pemeriksaan OWNER TO postgres;

--
-- Name: t_pemeriksaan_p_idpemeriksaan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_pemeriksaan_p_idpemeriksaan_seq
    START WITH 16
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_pemeriksaan_p_idpemeriksaan_seq OWNER TO postgres;

--
-- Name: t_pemeriksaan_p_idpemeriksaan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE t_pemeriksaan_p_idpemeriksaan_seq OWNED BY t_pemeriksaan.p_idpemeriksaan;


--
-- Name: t_penerimawaris; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_penerimawaris (
    t_idpenerima integer NOT NULL,
    t_idspt integer,
    t_namapenerima character varying,
    t_alamatpenerima character varying,
    t_nikpenerima character varying
);


ALTER TABLE t_penerimawaris OWNER TO postgres;

--
-- Name: t_penerimawaris_t_idpenerima_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_penerimawaris_t_idpenerima_seq
    START WITH 635
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_penerimawaris_t_idpenerima_seq OWNER TO postgres;

--
-- Name: t_penerimawaris_t_idpenerima_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE t_penerimawaris_t_idpenerima_seq OWNED BY t_penerimawaris.t_idpenerima;


--
-- Name: t_spt_t_idspt_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_spt_t_idspt_seq
    START WITH 46
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_spt_t_idspt_seq OWNER TO postgres;

--
-- Name: t_spt; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_spt (
    t_idspt integer DEFAULT nextval('t_spt_t_idspt_seq'::regclass) NOT NULL,
    t_kohirspt integer,
    t_kohirketetapanspt integer,
    t_tglprosesspt date,
    t_periodespt smallint,
    t_idnotarisspt integer,
    t_objekspt integer,
    t_idtarifspt integer,
    t_ketetapanspt integer,
    t_tglketetapanspt date,
    t_tgljatuhtempospt date,
    t_nopbphtbsppt character varying,
    t_kodebayarbanksppt character varying,
    t_idjenistransaksi integer,
    t_idjenishaktanah integer,
    t_idrefspt integer,
    t_pejabatverifikasispt integer,
    t_dasarspt bigint,
    t_totalspt bigint,
    t_nilaitransaksispt bigint,
    t_potonganspt integer,
    t_thnsppt character varying,
    t_persyaratan character varying,
    t_idjenisdoktanah integer,
    t_idsptsebelumnya integer,
    t_dendaspt bigint,
    t_bulandendaspt integer,
    t_tglprosesspttime timestamp without time zone
);


ALTER TABLE t_spt OWNER TO postgres;

--
-- Name: view_cetak_sspd; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_cetak_sspd AS
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
    a.t_dendaspt,
    a.t_bulandendaspt,
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


ALTER TABLE view_cetak_sspd OWNER TO postgres;

--
-- Name: view_data_notaris; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_data_notaris AS
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


ALTER TABLE view_data_notaris OWNER TO postgres;

--
-- Name: view_data_terbit_ajb; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_data_terbit_ajb AS
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


ALTER TABLE view_data_terbit_ajb OWNER TO postgres;

--
-- Name: view_data_verifikasi_isi; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_data_verifikasi_isi AS
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
    b.t_inputbpn,
    a.t_dendaspt
   FROM (((((((t_spt a
     LEFT JOIN t_detailsptbphtb b ON ((b.t_idspt = a.t_idspt)))
     LEFT JOIN s_jenistransaksi c ON ((c.s_idjenistransaksi = a.t_idjenistransaksi)))
     LEFT JOIN s_jenishaktanah d ON ((d.s_idhaktanah = a.t_idjenishaktanah)))
     LEFT JOIN s_users g ON ((g.s_iduser = a.t_idnotarisspt)))
     LEFT JOIN s_notaris h ON (((h.s_idnotaris)::text = (g.s_idpejabat_idnotaris)::text)))
     LEFT JOIN t_pembayaranspt e ON ((e.t_idspt = a.t_idspt)))
     LEFT JOIN t_pemeriksaan f ON ((f.p_idpembayaranspt = e.t_kohirpembayaran)))
  WHERE (e.t_verifikasispt IS NOT NULL);


ALTER TABLE view_data_verifikasi_isi OWNER TO postgres;

--
-- Name: view_harganjoptanah; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_harganjoptanah AS
 SELECT a.t_nopbphtbsppt,
    (((b.t_grandtotalnjop - b.t_totalnjopbangunan))::numeric / b.t_luastanah) AS njoptanahtransaksi,
    (((a.t_nilaitransaksispt - b.t_totalnjopbangunan))::numeric / b.t_luastanah) AS njoptanah,
    a.t_idspt,
    c.t_idpembayaranspt
   FROM ((t_spt a
     LEFT JOIN t_detailsptbphtb b ON ((b.t_idspt = a.t_idspt)))
     LEFT JOIN t_pembayaranspt c ON ((c.t_idspt = a.t_idspt)));


ALTER TABLE view_harganjoptanah OWNER TO postgres;

--
-- Name: view_hasilbpn; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_hasilbpn AS
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


ALTER TABLE view_hasilbpn OWNER TO postgres;

--
-- Name: view_pembayarandenda; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_pembayarandenda AS
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


ALTER TABLE view_pembayarandenda OWNER TO postgres;

--
-- Name: view_pendaftaran; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_pendaftaran AS
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


ALTER TABLE view_pendaftaran OWNER TO postgres;

--
-- Name: view_pendataandendasanksinotaris; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_pendataandendasanksinotaris AS
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


ALTER TABLE view_pendataandendasanksinotaris OWNER TO postgres;

--
-- Name: view_s_persyaratan; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_s_persyaratan AS
 SELECT s_persyaratan.s_idpersyaratan,
    s_persyaratan.s_idjenistransaksi,
    s_persyaratan.s_namapersyaratan,
    s_persyaratan."order"
   FROM s_persyaratan
  ORDER BY s_persyaratan.s_idpersyaratan;


ALTER TABLE view_s_persyaratan OWNER TO postgres;

--
-- Name: view_sspd; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_sspd AS
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
    a.t_dendaspt,
    a.t_bulandendaspt,
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
    a.t_kohirketetapanspt,
    a.t_tglprosesspttime
   FROM (((t_spt a
     LEFT JOIN t_detailsptbphtb b ON ((b.t_idspt = a.t_idspt)))
     LEFT JOIN s_jenistransaksi c ON ((c.s_idjenistransaksi = a.t_idjenistransaksi)))
     LEFT JOIN s_jenishaktanah d ON ((d.s_idhaktanah = a.t_idjenishaktanah)));


ALTER TABLE view_sspd OWNER TO postgres;

--
-- Name: view_sspd_blm_validasi; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_sspd_blm_validasi AS
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


ALTER TABLE view_sspd_blm_validasi OWNER TO postgres;

--
-- Name: view_sspd_pembayaran; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_sspd_pembayaran AS
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
    b.t_tglajbbaru,
    b.t_tglajb,
    a.t_dendaspt,
    a.t_bulandendaspt
   FROM (((((((t_spt a
     LEFT JOIN t_detailsptbphtb b ON ((b.t_idspt = a.t_idspt)))
     LEFT JOIN s_jenistransaksi c ON ((c.s_idjenistransaksi = a.t_idjenistransaksi)))
     LEFT JOIN s_jenishaktanah d ON ((d.s_idhaktanah = a.t_idjenishaktanah)))
     LEFT JOIN t_pembayaranspt e ON ((e.t_idspt = a.t_idspt)))
     LEFT JOIN t_pemeriksaan f ON ((f.p_idpembayaranspt = e.t_idpembayaranspt)))
     LEFT JOIN s_users g ON ((g.s_iduser = a.t_idnotarisspt)))
     LEFT JOIN s_notaris h ON (((h.s_idnotaris)::text = (g.s_idpejabat_idnotaris)::text)));


ALTER TABLE view_sspd_pembayaran OWNER TO postgres;

--
-- Name: view_sspd_semua_pembayaran; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_sspd_semua_pembayaran AS
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
    to_char((e.t_tanggalpembayaran)::timestamp with time zone, 'MM-YYYY'::text) AS t_bulanselesaibayar,
    b.t_alamatop,
    z.t_dendaspt,
    b.t_rtwppembeli,
    b.t_rwwppembeli,
    c.s_kodejenistransaksi
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


ALTER TABLE view_sspd_semua_pembayaran OWNER TO postgres;

--
-- Name: view_sspd_sudah_tervalidasi; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_sspd_sudah_tervalidasi AS
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


ALTER TABLE view_sspd_sudah_tervalidasi OWNER TO postgres;

--
-- Name: view_terbit_ajb; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_terbit_ajb AS
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


ALTER TABLE view_terbit_ajb OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permission ALTER COLUMN id SET DEFAULT nextval('permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource ALTER COLUMN id SET DEFAULT nextval('resource_id_seq'::regclass);


--
-- Name: rid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role ALTER COLUMN rid SET DEFAULT nextval('role_rid_seq'::regclass);


--
-- Name: s_idacuan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY s_acuan ALTER COLUMN s_idacuan SET DEFAULT nextval('s_acuan_s_idacuan_seq'::regclass);


--
-- Name: s_idhaktanah; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY s_jenishaktanah ALTER COLUMN s_idhaktanah SET DEFAULT nextval('s_jenishaktanah_s_idjenishaktanah_seq'::regclass);


--
-- Name: s_idjenisketetapan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY s_jenisketetapan ALTER COLUMN s_idjenisketetapan SET DEFAULT nextval('s_jenisketetapan_s_idjenisketetapan_seq'::regclass);


--
-- Name: s_idjenistransaksi; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY s_jenistransaksi ALTER COLUMN s_idjenistransaksi SET DEFAULT nextval('s_jenistransaksi_s_idjenistransaksi_seq'::regclass);


--
-- Name: s_idkecamatan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY s_kecamatan ALTER COLUMN s_idkecamatan SET DEFAULT nextval('s_kecamatan_s_idkecamatan_seq'::regclass);


--
-- Name: s_idkelurahan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY s_kelurahan ALTER COLUMN s_idkelurahan SET DEFAULT nextval('s_kelurahan_s_idkelurahan_seq'::regclass);


--
-- Name: s_korekid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY s_koderekening ALTER COLUMN s_korekid SET DEFAULT nextval('s_koderekening_s_korekid_seq'::regclass);


--
-- Name: s_idnotaris; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY s_notaris ALTER COLUMN s_idnotaris SET DEFAULT nextval('s_notaris_s_idnotaris_seq'::regclass);


--
-- Name: s_idpejabat; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY s_pejabat ALTER COLUMN s_idpejabat SET DEFAULT nextval('s_pejabat_s_idpejabat_seq'::regclass);


--
-- Name: s_idpemda; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY s_pemda ALTER COLUMN s_idpemda SET DEFAULT nextval('s_pemda_s_idpemda_seq'::regclass);


--
-- Name: s_idperaturan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY s_peraturan ALTER COLUMN s_idperaturan SET DEFAULT nextval('s_peraturan_s_idperaturan_seq'::regclass);


--
-- Name: s_idpersyaratan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY s_persyaratan ALTER COLUMN s_idpersyaratan SET DEFAULT nextval('s_persyaratan_s_idpersyaratan_seq'::regclass);


--
-- Name: s_idpresentase; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY s_presentase ALTER COLUMN s_idpresentase SET DEFAULT nextval('s_presentase_s_idpresentase_seq'::regclass);


--
-- Name: s_idtarifbphtb; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY s_tarifbphtb ALTER COLUMN s_idtarifbphtb SET DEFAULT nextval('s_tarifbphtb_s_idtarifbphtb_seq'::regclass);


--
-- Name: s_iduser; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY s_users ALTER COLUMN s_iduser SET DEFAULT nextval('s_users_s_iduser_seq'::regclass);


--
-- Name: t_idds; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_dendasanksinotaris ALTER COLUMN t_idds SET DEFAULT nextval('t_dendasanksinotaris_t_idds_seq'::regclass);


--
-- Name: t_idpembayaranspt; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_pembayaranspt ALTER COLUMN t_idpembayaranspt SET DEFAULT nextval('t_pembayaranspt_t_idpembayaranspt_seq'::regclass);


--
-- Name: p_idpemeriksaan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_pemeriksaan ALTER COLUMN p_idpemeriksaan SET DEFAULT nextval('t_pemeriksaan_p_idpemeriksaan_seq'::regclass);


--
-- Name: t_idpenerima; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_penerimawaris ALTER COLUMN t_idpenerima SET DEFAULT nextval('t_penerimawaris_t_idpenerima_seq'::regclass);


--
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY permission (id, permission_name, resource_id, alias) FROM stdin;
1	index	1	Index
2	setting	1	Setting
3	Pendataan	1	Pendataan
4	Pemeriksaan	1	Pemeriksaan
5	index	2	Index
6	logout	2	Keluar
7	index	3	Index
8	tambah	3	Tambah
9	index	4	Index
10	tambah	4	Tambah
11	edit	4	Edit
12	hapus	4	Hapus
13	sinkrondata	4	Singkronisasi Data
14	dataGrid	4	Data Grid
15	index	5	Index
16	tambah	5	Tambah
17	edit	5	Edit
18	hapus	5	Hapus
19	sinkrondata	5	Singkronisasi Data
20	dataGrid	5	Data Grid
21	index	6	Index
22	tambah	6	Tambah
23	edit	6	Edit
24	hapus	6	Hapus
25	dataGrid	6	Data Grid
26	index	7	Index
27	tambah	7	Tambah
28	edit	7	Edit
29	hapus	7	Hapus
30	dataGrid	7	Data Grid
31	index	8	Index
32	tambah	8	Tambah
33	edit	8	Edit
34	hapus	8	Hapus
35	dataGrid	8	Data Grid
36	index	9	Index
37	tambah	9	Tambah
38	edit	9	Edit
39	hapus	9	Hapus
40	dataGrid	9	Data Grid
41	index	10	Index
42	tambah	10	Tambah
43	edit	10	Edit
44	hapus	10	Hapus
45	dataGrid	10	Data Grid
46	index	12	Index
47	tambah	12	Tambah
48	edit	12	Edit
49	hapus	12	Hapus
50	dataGrid	12	Data Grid
51	index	13	Index
52	tambah	13	Tambah
53	edit	13	Edit
54	hapus	13	Hapus
55	index	14	Index
56	tambah	14	Tambah
57	edit	14	Edit
58	hapus	14	Hapus
59	dataGrid	14	Data Grid
60	datanop	14	Data NOP
61	hitungBphtb	14	Perhitungan AJB
62	index	15	Index
63	tambah	15	Tambah
64	edit	15	Edit
65	hapus	15	Hapus
66	dataGrid	15	Data Grid
67	datasspd	15	Data SSPD
68	index	16	Index
69	dataGrid	16	Data Grid
70	tambah	16	Tambah
71	datapembayaran	16	Data Pembayaran
72	index	17	Index
73	dataGrid	17	Data Grid
74	tambah	17	Tambah
75	datapembayaran	17	Data Pembayaran
76	cetaksspdbphtb	18	Cetak SSPD
77	validitassspd	15	Validasi SSPD
78	dataGridSkpdkbBphtb	15	Data Grid SKPDKB
79	dataGridPendataanBphtb	15	Data Grid Pendataan
80	pilihPendataanSspdBphtb	15	Piih Pendataan SSPD
81	pilihSkpdkbBphtb	15	Pilih SKPDKB
82	dataskpdkb	15	Data SKPDKB
83	dataGridPendataanBphtb	17	Data Grid Pendataan
84	pilihPendataanSspdBphtb	17	Pilih Pendataan SSPD
85	datapembayaran	17	Data Pembayaran
86	dataGridPendataanBphtb	16	Data Grid Pendataan
87	pilihPendataanSspdBphtb	16	Pilih Pendataan SSPD
88	datapembayaran	16	Data Pembayaran
89	hapus	17	Hapus
90	hapus	16	Hapus
91	updatepemeriksaan	15	Simpan
92	index	19	Index
93	cetakdaftarverifikasi	19	Cetak Daftar Verifikasi
94	cetaklapharian	19	Cetak Laporan Harian
95	cetaklapbphtb	19	Cetak Laporan BPHTB
96	cetaklapbulananbphtb	19	Cetak Laporan Bulanan
97	cetakrealisasibphtb	19	Cetak Realisasi BPHTB
98	cetakskpdkb	19	Cetak SKPDKB
99	dataGridSkpdkb	19	Data Grid
100	pilihSkpdkbBphtb	19	Pilih SKPDKB
101	dataGridSkpdkb2	19	Data Grid
102	pilihSkpdkbBphtb2	19	Pilih SKPDKB
103	cetakkodebayar	18	Cetak Kode Bayar
104	cetakpencatatansetoranbphtb	18	Cetak pencatatan Setoran
105	index	20	Index
106	dataGrid	20	Data Grid
107	historybphtb	14	Histori
108	index	21	Index
109	dataGrid	21	Data Grid
110	tambah	21	Tambah
111	edit	21	Edit
112	historybphtb	14	Histori
113	TampilPersyaratan	14	Persyaratan
114	hapus	21	Hapus
115	index	22	Index
116	dataGrid	22	Data Grid
117	tambah	22	Tambah
118	edit	22	Edit
119	hapus	22	Hapus
120	tglajb	14	Tanggal AJB
121	tambahAjbBaru	14	Tambah AJB
122	index	23	Index
123	dataGrid	23	Data Grid
124	laporkandata	23	Laporan
125	inputdenda	23	Input Denda
126	InputDendaNotaris	23	Input Denda Notaris
127	dataGridDendaNotaris	23	Data Grid
128	Hapus	23	Hapus
129	cetakbuktipenerimaan	18	Cetak Bukti Penerimaan
130	edit	20	Edit
131	update	20	Update
132	inputsanksi	23	Input Sanksi
133	InputSanksiNotaris	23	Input Sanksi Notaris
134	formcetakdatapendaftaran	14	Form Cetak Pendaftaran
135	cetakdatapendaftaran	14	Cetak Pendaftaran
136	formcetakdatastatusberkas	14	Form Status Berkas
137	cetakdatastatusberkas	14	Cetak Status Berkas
138	edit	17	Edit
139	informasiop	14	Informasi Objek Pajak
140	cariinformasiop	14	Cari Informasi OP
141	ubahpass	13	Ubah Password
142	cetakbuktipenerimaanvalidasi	18	Cetak Bukti Validasi
143	inputsertifikat	20	Input Sertifikat
144	updatesertifikat	20	Update Sertifikat
145	cetakhasilbpn	19	Cetak Hasil Input BPN
146	hitungnjop	14	Hitung NJOP
147	konfirmasidata	23	Konfirmasi Data Notaris
148	cetakkonfnotaris	19	Cetak Konfirmasi
149	hitungnjop	17	Hitung NJOP Pemeriksaan
150	cetakbuktivalidasipembayaran	19	Cetak Validasi Pembayaran
151	index	24	Index
152	dataGrid	24	Data Grid
153	tambah	24	Tambah
154	edit	24	Edit
155	hapus	24	Hapus
156	dataGridSanksiNotaris	23	Data Grid Sanksi Notaris
157	cetaksts	23	Cetak STS
158	sismiop	14	Menu Sismiop
159	dataGridSismiop	14	Data Grid Sismiop
160	dataGridDS	15	Data Grid Pembayaran Denda
161	pilihPendataanDS	15	Pilih Denda Sanksi
162	index	25	Index
163	tambah	25	Tambah
164	dataGrid	25	Data Grid
165	cetakbuktipembayaran	19	Cetak Bukti Pembayaran
166	cetakpemberitahuandenda	23	Cetak Pemberitahuan Denda
167	cektunggakanpbb	17	Cek Tunggakan PBB
168	viewdata	14	Lihat Data SSPD
169	viewdata	17	Lihat Data SSPD
170	viewdata	15	Lihat Data SSPD
171	dataGrid	13	Data Grid
172	cetakpermohonanpenelitian	14	Cetak Permohonan Penelitian
173	getListPejabat	13	Daftar Pejabat
\.


--
-- Name: permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('permission_id_seq', 1, false);


--
-- Data for Name: permission_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY permission_resource (s_iduser, s_idpermission) FROM stdin;
40	140
40	135
40	137
40	172
40	59
40	159
40	60
40	57
40	134
40	136
40	58
40	112
40	107
40	61
40	146
40	55
40	139
40	158
40	56
40	121
40	113
40	120
40	168
40	167
40	73
40	83
40	85
40	75
40	138
40	89
40	149
40	72
40	84
40	74
40	169
40	66
40	160
40	79
40	78
40	82
40	67
40	64
40	65
40	62
40	161
40	80
40	81
40	63
40	91
40	77
40	170
40	106
40	130
40	105
40	143
40	131
40	144
40	165
40	150
40	93
40	145
40	148
40	95
40	96
40	94
40	97
40	98
40	99
40	101
40	92
40	100
40	102
40	129
40	142
40	103
40	104
40	76
40	166
40	157
40	123
40	127
40	156
40	128
40	122
40	125
40	126
40	132
40	133
40	147
40	124
40	116
40	118
40	119
40	115
40	117
40	45
40	43
40	44
40	41
40	42
40	35
40	33
40	34
40	31
40	32
40	30
40	28
40	29
40	26
40	27
40	25
40	23
40	24
40	21
40	22
40	7
40	8
40	109
40	111
40	114
40	108
40	110
40	50
40	48
40	49
40	46
40	47
40	40
40	38
40	39
40	36
40	37
40	171
40	53
40	173
40	54
40	51
40	52
40	141
40	1
40	4
40	3
40	2
40	152
40	154
40	155
40	151
40	153
40	164
40	162
42	140
42	135
42	137
42	172
42	59
42	159
42	60
42	57
42	134
42	136
42	112
42	107
42	61
42	146
42	55
42	139
42	158
42	56
42	121
42	113
42	120
42	168
42	166
42	157
42	123
42	127
42	156
42	122
42	147
42	124
42	173
42	1
42	3
51	140
51	135
51	137
51	172
51	59
51	159
51	60
51	57
51	134
51	136
51	112
51	107
51	61
51	146
51	55
51	139
51	158
51	56
51	121
51	113
51	120
51	168
47	140
47	135
47	137
47	172
47	59
47	159
47	60
47	57
47	134
47	136
47	112
47	107
47	61
47	146
47	55
47	139
47	158
47	56
47	121
47	113
47	120
43	140
43	135
43	137
43	172
43	59
43	159
43	60
43	57
43	134
43	136
43	112
43	107
43	61
43	146
43	55
43	139
43	158
43	56
43	121
43	113
43	120
43	168
43	129
43	142
43	103
43	104
43	76
43	166
43	157
43	123
43	127
43	156
43	122
43	147
43	124
43	173
43	1
43	3
51	129
51	142
51	103
51	104
51	76
51	166
51	157
51	123
51	127
51	156
47	168
47	129
47	142
47	103
47	104
47	76
47	166
47	157
47	123
47	127
37	59
37	73
37	78
38	1
38	2
38	3
38	4
38	7
38	8
38	21
38	22
38	23
38	24
38	25
38	26
38	27
38	28
38	29
38	30
38	31
38	32
38	33
38	34
38	35
38	36
38	37
38	38
38	39
38	40
38	41
38	42
38	43
38	44
38	45
38	46
38	47
38	48
38	49
38	50
38	51
38	52
38	53
38	54
38	55
38	56
38	57
38	58
38	59
38	60
38	61
38	62
38	63
38	64
38	65
38	66
38	67
38	72
38	73
38	74
38	75
38	76
38	77
38	78
38	79
38	80
38	81
38	82
38	83
38	84
38	85
38	89
38	91
38	92
38	93
38	94
38	95
38	96
38	97
38	98
38	99
38	100
38	101
38	102
38	103
38	104
38	105
38	106
38	107
38	108
38	109
38	110
38	111
38	112
38	113
38	114
38	115
38	116
38	117
38	118
38	119
38	120
38	121
38	122
38	123
38	124
38	125
38	126
38	127
38	128
38	129
38	130
38	131
38	132
38	133
47	156
47	124
47	173
47	1
47	3
51	122
51	147
51	124
51	173
51	1
51	3
55	140
55	135
55	137
55	172
55	59
2	140
2	135
2	137
2	172
2	59
2	159
2	60
2	57
2	134
2	136
2	58
2	112
2	107
2	61
2	146
2	55
2	139
2	158
2	56
2	121
2	113
2	120
2	168
2	167
2	73
2	83
2	85
2	75
2	138
2	89
2	149
2	72
2	84
2	74
2	169
2	66
2	160
2	79
2	78
2	82
2	67
2	64
2	65
2	62
2	161
2	80
2	81
2	63
2	91
2	77
2	170
2	106
2	130
2	105
2	143
2	131
2	144
2	165
2	150
2	93
2	145
2	148
2	95
2	96
2	94
2	97
2	98
2	99
2	101
2	92
2	100
2	102
2	129
2	142
2	103
2	104
2	76
2	166
2	157
2	123
2	127
2	156
2	128
2	122
2	125
2	126
2	132
2	133
2	147
2	124
2	116
2	118
2	119
2	115
2	117
2	45
2	43
2	44
2	41
2	42
2	35
2	33
2	34
2	31
2	32
2	30
2	28
2	29
2	26
2	27
2	25
2	23
2	24
2	21
2	22
2	7
2	8
2	109
2	111
2	114
2	108
2	110
2	50
2	48
2	49
2	46
2	47
2	40
2	38
2	39
2	36
2	37
2	171
2	53
2	173
2	54
2	51
2	52
2	141
2	1
2	4
2	3
2	2
2	152
2	154
2	155
2	151
2	153
2	164
2	162
2	163
40	163
49	140
49	135
49	137
49	172
49	59
49	159
49	60
49	57
49	134
49	136
49	112
49	107
49	61
49	146
49	55
49	139
49	158
49	56
49	121
49	113
49	120
49	168
49	129
49	142
49	103
49	104
49	76
49	166
49	157
49	123
49	127
49	156
49	122
49	147
49	124
49	173
49	1
49	3
53	140
53	135
53	137
53	172
53	59
53	159
53	60
53	57
53	134
53	136
53	112
53	107
53	61
53	146
53	55
53	139
53	158
53	56
53	121
53	113
53	120
53	168
53	129
53	142
53	103
53	104
53	76
53	166
53	157
53	123
53	127
53	156
53	124
53	173
53	1
53	3
55	159
55	60
55	57
55	134
55	136
55	112
55	107
55	61
55	146
55	55
55	139
55	158
55	56
55	121
55	113
55	120
55	168
55	129
55	142
55	103
55	104
55	76
55	166
55	157
55	123
55	127
55	156
55	124
55	173
55	1
55	3
56	139
56	158
56	56
56	121
56	113
56	120
56	168
50	140
50	135
50	137
50	172
50	59
50	159
50	60
50	57
50	134
50	136
50	112
77	135
77	137
77	172
77	57
77	134
77	55
77	56
77	129
77	142
77	103
77	104
77	76
77	166
77	157
77	122
77	1
77	3
77	140
77	167
77	20
77	25
77	30
77	35
77	40
77	45
77	50
77	59
77	69
77	106
77	164
77	66
77	109
77	171
77	73
77	14
77	152
77	123
77	116
77	127
77	160
77	83
77	79
77	86
77	156
77	159
77	99
77	101
77	78
77	60
77	85
77	71
77	75
77	88
77	82
77	67
77	136
77	173
77	112
77	107
77	61
77	149
77	146
77	139
77	125
77	126
77	132
77	133
77	143
77	147
77	124
77	6
77	161
77	84
77	80
77	87
77	100
77	81
77	102
77	13
77	19
77	158
77	121
77	113
77	120
77	141
77	131
77	91
77	144
77	77
77	168
77	169
77	170
78	135
78	137
78	172
78	57
78	134
78	55
78	56
78	129
78	142
52	140
52	135
52	137
52	172
52	59
52	159
52	60
52	57
52	134
52	136
52	112
52	107
52	61
52	146
52	55
52	139
52	158
52	56
52	121
52	113
52	120
52	168
52	129
52	142
52	103
52	104
52	76
52	166
52	157
52	123
52	127
52	156
52	122
52	125
52	126
52	132
52	133
52	147
52	124
52	173
52	1
52	3
44	140
44	135
44	137
44	172
44	59
44	159
44	60
44	57
44	134
44	136
44	58
44	112
44	107
44	61
44	146
44	55
44	139
44	158
44	56
44	121
44	113
44	120
44	168
44	129
44	142
44	103
44	104
44	76
44	166
44	157
44	123
44	127
44	156
44	122
44	125
44	126
44	132
44	133
44	147
44	124
44	173
44	1
44	3
45	140
45	135
45	137
45	172
45	59
50	107
50	61
50	146
50	55
50	139
50	158
50	56
50	121
50	113
50	120
50	168
50	129
50	142
50	103
50	104
50	76
50	166
50	157
50	123
50	127
50	156
50	122
45	159
45	60
45	57
45	134
45	136
45	112
45	107
45	61
45	146
45	55
45	139
45	158
45	56
45	121
45	113
45	120
45	168
45	129
45	142
45	103
45	104
45	76
45	166
45	157
45	123
45	127
45	156
45	122
45	125
45	126
45	132
45	133
45	147
45	124
45	173
45	1
45	3
46	140
46	135
46	137
46	172
46	59
46	159
46	60
46	57
46	134
46	136
46	58
46	112
46	107
46	61
46	146
46	55
46	139
46	158
46	56
46	121
46	113
46	120
46	168
46	129
46	142
46	103
46	104
46	76
46	166
46	157
46	123
46	127
46	156
46	128
46	122
46	125
46	126
46	132
46	133
46	147
46	124
46	173
46	1
46	3
41	140
41	135
41	137
41	172
41	59
41	159
41	60
41	57
41	134
41	136
41	112
41	107
41	61
41	146
41	55
41	139
41	158
41	56
41	121
41	113
41	120
41	168
41	165
41	150
41	93
41	145
41	148
41	95
41	96
41	94
41	97
41	98
41	99
41	101
41	92
41	100
41	102
41	129
41	142
41	103
41	104
41	76
41	166
41	157
41	123
41	127
41	156
41	124
41	173
41	1
41	3
48	140
48	135
48	137
48	172
48	59
48	159
48	60
48	57
48	134
48	136
48	112
48	107
48	61
48	146
48	55
48	139
48	158
48	56
48	121
48	113
48	120
48	168
48	129
48	142
48	103
48	104
48	76
48	166
48	157
48	123
48	127
48	156
48	122
48	147
48	124
48	173
48	1
48	3
50	147
50	124
50	173
50	1
50	3
54	140
54	135
54	137
54	172
54	59
54	159
54	60
54	57
54	134
54	136
54	112
54	107
54	61
54	146
54	55
54	139
54	158
54	56
54	121
54	113
54	120
54	168
54	129
54	142
54	103
54	104
54	76
54	166
54	157
54	123
54	127
54	156
54	124
54	173
54	1
54	3
56	140
56	135
56	137
56	172
56	59
56	159
56	60
56	57
56	134
56	136
56	112
56	107
56	61
56	146
56	55
56	129
56	142
56	103
56	104
56	76
56	166
56	157
56	123
56	127
56	156
56	124
56	173
56	1
56	3
57	140
57	135
57	137
57	172
57	59
57	159
57	60
57	57
57	134
57	136
57	112
57	107
57	61
57	146
57	55
57	139
57	158
57	56
57	121
57	113
57	120
57	168
57	129
57	142
57	103
57	104
57	76
57	166
57	157
57	123
57	127
57	156
57	124
57	173
57	1
57	3
58	140
58	135
58	137
58	172
58	59
58	159
58	60
58	57
58	134
58	136
58	112
58	107
58	61
58	146
58	55
58	139
58	158
58	56
58	121
58	113
58	120
58	168
58	129
58	142
58	103
58	104
58	76
58	166
58	157
58	123
58	127
58	156
58	124
58	173
58	1
58	3
59	140
59	135
59	137
59	172
59	59
59	159
59	60
59	57
59	134
59	136
59	112
59	107
59	61
59	146
59	55
59	139
59	158
59	56
59	121
59	113
59	120
59	168
59	129
59	142
59	103
59	104
59	76
59	166
59	157
59	123
59	127
59	156
59	124
59	173
59	1
59	3
60	140
60	135
60	137
60	172
60	59
60	159
60	60
60	57
60	134
60	136
60	112
60	107
60	61
60	146
60	55
60	139
60	158
60	56
60	121
60	113
60	120
60	168
60	129
60	142
60	103
60	104
60	76
60	166
60	157
60	123
60	127
60	156
60	124
60	173
60	1
60	3
61	140
61	135
61	137
61	172
61	59
61	159
61	60
61	57
61	134
61	136
61	112
61	107
61	61
61	146
61	55
61	139
61	158
61	56
61	121
61	113
61	120
61	168
61	129
61	142
61	103
61	104
61	76
61	166
61	157
61	123
61	127
61	156
61	124
61	173
61	1
61	3
62	140
62	135
62	137
62	172
62	59
62	159
62	60
62	57
62	134
62	136
62	112
62	107
62	61
62	146
62	55
62	139
62	158
62	56
62	121
62	113
62	120
62	168
62	129
62	142
62	103
62	104
62	76
62	166
62	157
62	123
62	127
62	156
62	124
62	173
62	1
62	3
63	140
63	135
63	137
63	172
63	59
63	159
63	60
63	57
63	134
63	136
63	112
63	107
63	61
63	146
63	55
63	139
63	158
63	56
63	121
63	113
63	120
63	168
63	129
63	142
63	103
63	104
63	76
63	166
63	157
63	123
63	127
63	156
63	124
63	173
63	1
63	3
64	140
64	135
64	137
64	172
64	59
64	159
64	60
64	57
64	134
64	136
64	112
64	107
64	61
64	146
64	55
64	139
64	158
64	56
64	121
64	113
64	120
64	168
64	129
64	142
64	103
64	104
64	76
64	166
64	157
64	123
64	127
64	156
64	124
64	173
64	1
64	3
65	140
65	135
65	137
65	172
65	59
65	159
65	60
65	57
65	134
65	136
65	112
65	107
65	61
65	146
65	55
65	139
65	158
65	56
65	121
65	113
65	120
65	168
65	129
65	142
65	103
65	104
65	76
65	166
65	157
65	123
65	127
65	156
65	124
65	173
65	1
65	3
66	140
66	135
66	137
66	172
66	59
66	159
66	60
66	57
66	134
66	136
66	112
66	107
66	61
66	146
66	55
66	139
66	158
66	56
66	121
66	113
66	120
66	168
66	129
66	142
66	103
66	104
66	76
66	166
66	157
66	123
66	127
66	156
66	124
66	173
66	1
66	3
67	140
67	135
67	137
67	172
67	59
67	159
67	60
67	57
67	134
67	136
67	112
67	107
67	61
67	146
67	55
67	139
67	158
67	56
67	121
67	113
67	120
67	168
67	129
67	142
67	103
67	104
67	76
67	166
67	157
67	123
67	127
67	156
67	124
67	173
67	1
67	3
68	140
68	135
68	137
68	172
68	59
68	159
68	60
68	57
68	134
68	136
68	112
68	107
68	61
68	146
68	55
68	139
68	158
68	56
68	121
68	113
68	120
68	168
68	129
68	142
68	103
68	104
68	76
68	166
68	157
68	123
68	127
68	156
68	124
68	173
68	1
68	3
69	140
69	135
69	137
69	172
69	59
69	159
69	60
69	57
69	134
69	136
69	112
69	107
69	61
69	146
69	55
69	139
69	158
69	56
69	121
69	113
69	120
69	168
69	129
69	142
69	103
69	104
69	76
69	166
69	157
69	123
69	127
69	156
69	124
69	173
69	1
69	3
70	140
70	135
70	137
70	172
70	59
70	159
70	60
70	57
70	134
70	136
70	112
70	107
70	61
70	146
70	55
70	139
70	158
70	56
70	121
70	113
70	120
70	168
70	129
70	142
70	103
70	104
70	76
70	166
70	157
70	123
70	127
70	156
70	124
70	173
70	1
70	3
71	135
71	137
71	172
71	57
71	134
71	55
71	56
71	129
71	142
71	103
71	104
71	76
71	166
71	157
71	122
71	1
71	3
71	140
71	167
71	164
71	14
71	106
71	171
71	20
71	25
71	30
71	35
71	40
71	45
71	50
71	59
71	66
71	69
71	73
71	152
71	123
71	116
71	109
71	127
71	160
71	79
71	86
71	83
71	156
71	159
71	99
71	101
71	78
71	60
71	71
71	75
71	85
71	88
71	82
71	67
71	136
71	173
71	112
71	107
71	61
71	146
71	149
71	139
71	125
71	126
71	132
71	133
71	143
71	147
71	124
71	6
71	4
71	3
71	161
71	87
71	84
71	80
71	81
71	100
71	102
71	2
71	19
71	13
71	158
71	121
71	113
71	120
71	141
71	131
71	91
71	144
71	77
71	169
71	170
71	168
74	135
74	137
74	172
74	57
74	134
74	55
74	56
74	129
74	142
74	103
74	104
74	76
74	166
74	157
74	122
74	1
74	3
74	140
74	167
74	164
74	14
74	106
74	171
74	20
74	25
74	30
74	35
74	40
74	45
74	50
74	59
74	66
74	69
74	73
74	152
74	123
74	116
74	109
74	127
74	160
74	79
74	86
74	83
74	156
74	159
74	99
74	101
74	78
74	60
74	71
74	75
74	85
74	88
74	82
74	67
74	136
74	173
74	112
74	107
74	61
74	146
74	149
74	139
74	125
74	126
74	132
74	133
74	143
74	147
74	124
74	6
74	4
74	3
74	161
74	87
74	84
74	80
74	81
74	100
74	102
74	2
74	19
74	13
74	158
74	121
74	113
74	120
74	141
74	131
74	91
74	144
74	77
74	169
74	170
74	168
76	135
76	137
76	172
76	57
76	134
76	55
76	56
76	129
76	142
76	103
76	104
76	76
76	166
76	157
76	122
76	1
76	3
76	140
76	167
76	20
76	25
76	30
76	35
76	40
76	45
76	50
76	59
76	69
76	106
76	164
76	66
76	109
76	171
76	73
76	14
76	152
76	123
76	116
76	127
76	160
76	83
76	79
76	86
76	156
76	159
76	99
76	101
76	78
76	60
76	85
76	71
76	75
76	88
76	82
76	67
76	136
76	173
76	112
76	107
76	61
76	149
76	146
76	139
76	125
76	126
76	132
76	133
76	143
76	147
76	124
76	6
76	161
76	84
76	80
76	87
76	100
76	81
76	102
76	13
76	19
76	158
76	121
76	113
76	120
76	141
76	131
76	91
76	144
76	77
76	168
76	169
76	170
78	103
78	104
78	76
78	166
78	157
78	122
78	1
78	3
78	140
78	167
78	20
78	25
78	30
78	35
78	40
78	45
78	50
78	59
78	69
78	106
78	164
78	66
78	109
78	171
78	73
78	14
78	152
78	123
78	116
78	127
78	160
78	83
78	79
78	86
78	156
78	159
78	99
78	101
78	78
78	60
78	85
78	71
78	75
78	88
78	82
73	135
73	137
73	172
73	57
73	134
73	55
73	56
73	129
73	142
73	103
73	104
73	76
73	166
73	157
73	122
73	1
73	3
73	140
73	167
73	20
73	25
73	30
73	35
73	40
73	45
73	50
73	59
73	69
73	106
73	164
73	66
73	109
73	171
73	73
73	14
73	152
73	123
73	116
73	127
73	160
73	83
73	79
73	86
73	156
73	159
73	99
73	101
73	78
73	60
73	85
73	71
73	75
73	88
73	82
73	67
73	136
73	173
73	112
73	107
73	61
73	149
73	146
73	139
73	125
73	126
73	132
73	133
73	143
73	147
73	124
73	6
73	161
73	84
73	80
73	87
73	100
73	81
73	102
73	13
73	19
73	158
73	121
73	113
73	120
73	141
73	131
73	91
73	144
73	77
73	168
73	169
73	170
78	67
78	136
78	173
78	112
78	107
78	61
78	149
78	146
78	139
78	125
78	126
78	132
78	133
78	143
78	147
78	124
78	6
78	161
78	84
78	80
78	87
78	100
78	81
78	102
78	13
78	19
78	158
78	121
78	113
78	120
78	141
78	131
78	91
78	144
78	77
78	168
78	169
78	170
79	86
79	156
79	159
79	99
79	101
79	78
79	60
79	85
79	71
79	75
79	88
79	82
79	67
79	136
79	173
79	112
79	107
79	61
79	149
79	146
79	139
79	125
79	126
79	132
79	133
79	143
79	147
79	124
79	6
79	161
79	84
79	80
79	87
79	100
79	81
79	102
79	13
79	19
79	158
79	121
79	113
79	120
79	141
79	131
79	91
79	144
79	77
79	168
79	169
79	170
80	135
80	137
80	172
80	57
80	134
80	55
80	56
80	129
80	142
80	103
80	104
80	76
80	166
80	157
80	122
80	1
80	3
80	140
80	167
80	20
80	25
80	30
80	35
80	40
80	45
80	50
80	59
80	69
80	106
80	164
80	66
80	109
80	171
80	73
80	14
80	152
80	123
80	116
80	127
80	160
80	83
80	79
80	86
80	156
80	159
80	99
72	135
72	137
72	172
72	57
72	134
72	55
72	56
72	129
72	142
72	103
72	104
72	76
72	166
72	157
72	122
72	1
72	3
75	135
75	137
75	172
75	57
75	134
75	55
75	56
75	129
75	142
75	103
75	104
75	76
75	166
75	157
75	122
75	1
75	3
75	140
75	167
75	20
75	25
75	30
75	35
75	40
75	45
75	50
75	59
75	69
75	106
75	164
75	66
75	109
75	171
75	73
75	14
75	152
75	123
75	116
75	127
75	160
75	83
75	79
75	86
75	156
75	159
75	99
75	101
75	78
75	60
75	85
75	71
75	75
75	88
75	82
75	67
75	136
75	173
75	112
75	107
75	61
75	149
75	146
75	139
75	125
75	126
75	132
75	133
75	143
75	147
75	124
75	6
75	161
75	84
75	80
75	87
75	100
75	81
75	102
75	13
75	19
75	158
75	121
75	113
75	120
75	141
75	131
75	91
75	144
75	77
75	168
75	169
75	170
72	140
72	167
72	20
72	25
72	30
72	35
72	40
72	45
72	50
72	59
72	69
72	106
72	164
72	66
72	109
72	171
72	73
72	14
72	152
72	123
72	116
72	127
72	160
72	83
72	79
72	86
72	156
72	159
72	99
72	101
72	78
72	60
72	85
72	71
72	75
72	88
72	82
72	67
72	136
72	173
72	112
72	107
72	61
72	149
72	146
72	139
72	125
72	126
72	132
72	133
72	143
72	147
72	124
72	6
72	161
72	84
72	80
72	87
72	100
72	81
72	102
72	13
72	19
72	158
72	121
72	113
72	120
72	141
72	131
72	91
72	144
72	77
72	168
72	169
72	170
79	135
79	137
79	172
79	57
79	134
79	55
79	56
79	129
79	142
79	103
79	104
79	76
79	166
79	157
79	122
79	1
79	3
79	140
79	167
79	20
79	25
79	30
79	35
79	40
79	45
79	50
79	59
79	69
79	106
79	164
79	66
79	109
79	171
79	73
79	14
79	152
79	123
79	116
79	127
79	160
79	83
79	79
80	101
80	78
80	60
80	85
80	71
80	75
80	88
80	82
80	67
80	136
80	173
80	112
80	107
80	61
80	149
80	146
80	139
80	125
80	126
80	132
80	133
80	143
80	147
80	124
80	6
80	161
80	84
80	80
80	87
80	100
80	81
80	102
80	13
80	19
80	158
80	121
80	113
80	120
80	141
80	131
80	91
80	144
80	77
80	168
80	169
80	170
81	135
81	137
81	172
81	57
81	134
81	55
81	56
81	129
81	142
81	103
81	104
81	76
81	166
81	157
81	122
81	1
81	3
81	140
81	167
81	20
81	25
81	30
81	35
81	40
81	45
81	50
81	59
81	69
81	106
81	164
81	66
81	109
81	171
81	73
81	14
81	152
81	123
81	116
81	127
81	160
81	83
81	79
81	86
81	156
81	159
81	99
81	101
81	78
81	60
81	85
81	71
81	75
81	88
81	82
81	67
81	136
81	173
81	112
81	107
81	61
81	149
81	146
81	139
81	125
81	126
81	132
81	133
81	143
81	147
81	124
81	6
81	161
81	84
81	80
81	87
81	100
81	81
81	102
81	13
81	19
81	158
81	121
81	113
81	120
81	141
81	131
81	91
81	144
81	77
81	168
81	169
81	170
82	135
82	137
82	172
82	57
82	134
82	55
82	56
82	129
82	142
82	103
82	104
82	76
82	166
82	157
82	122
82	1
82	3
82	140
82	167
82	20
82	25
82	30
82	35
82	40
82	45
82	50
82	59
82	69
82	106
82	164
82	66
82	109
82	171
82	73
82	14
82	152
82	123
82	116
82	127
82	160
82	83
82	79
82	86
82	156
82	159
82	99
82	101
82	78
82	60
82	85
82	71
82	75
82	88
82	82
82	67
82	136
82	173
82	112
82	107
82	61
82	149
82	146
82	139
82	125
82	126
82	132
82	133
82	143
82	147
82	124
82	6
82	161
82	84
82	80
82	87
82	100
82	81
82	102
82	13
82	19
82	158
82	121
82	113
82	120
82	141
82	131
82	91
82	144
82	77
82	168
82	169
82	170
83	135
83	137
83	172
83	57
83	134
83	55
83	56
83	129
83	142
83	103
83	104
83	76
83	166
83	157
83	122
83	1
83	3
83	140
83	167
83	20
83	25
83	30
83	35
83	40
83	45
83	50
83	59
83	69
83	106
83	164
83	66
83	109
83	171
83	73
83	14
83	152
83	123
83	116
83	127
83	160
83	83
83	79
83	86
83	156
83	159
83	99
83	101
83	78
83	60
83	85
83	71
83	75
83	88
83	82
83	67
83	136
83	173
83	112
83	107
83	61
83	149
83	146
83	139
83	125
83	126
83	132
83	133
83	143
83	147
83	124
83	6
83	161
83	84
83	80
83	87
83	100
83	81
83	102
83	13
83	19
83	158
83	121
83	113
83	120
83	141
83	131
83	91
83	144
83	77
83	168
83	169
83	170
84	135
84	137
84	172
84	57
84	134
84	55
84	56
84	129
84	142
84	103
84	104
84	76
84	166
84	157
84	122
84	1
84	3
84	140
84	167
84	20
84	25
84	30
84	35
84	40
84	45
84	50
84	59
84	69
84	106
84	164
84	66
84	109
84	171
84	73
84	14
84	152
84	123
84	116
84	127
84	160
84	83
84	79
84	86
84	156
84	159
84	99
84	101
84	78
84	60
84	85
84	71
84	75
84	88
84	82
84	67
84	136
84	173
84	112
84	107
84	61
84	149
84	146
84	139
84	125
84	126
84	132
84	133
84	143
84	147
84	124
84	6
84	161
84	84
84	80
84	87
84	100
84	81
84	102
84	13
84	19
84	158
84	121
84	113
84	120
84	141
84	131
84	91
84	144
84	77
84	168
84	169
84	170
85	135
85	137
85	172
85	57
85	134
85	55
85	56
85	129
85	142
85	103
85	104
85	76
85	166
85	157
85	122
85	1
85	3
85	140
85	167
85	20
85	25
85	30
85	35
85	40
85	45
85	50
85	59
85	69
85	106
85	164
85	66
85	109
85	171
85	73
85	14
85	152
85	123
85	116
85	127
85	160
85	83
85	79
85	86
85	156
85	159
85	99
85	101
85	78
85	60
85	85
85	71
85	75
85	88
85	82
85	67
85	136
85	173
85	112
85	107
85	61
85	149
85	146
85	139
85	125
85	126
85	132
85	133
85	143
85	147
85	124
85	6
85	161
85	84
85	80
85	87
85	100
85	81
85	102
85	13
85	19
85	158
85	121
85	113
85	120
85	141
85	131
85	91
85	144
85	77
85	168
85	169
85	170
86	135
86	137
86	172
86	57
86	134
86	55
86	56
86	129
86	142
86	103
86	104
86	76
86	166
86	157
86	122
86	1
86	3
86	140
86	167
86	20
86	25
86	30
86	35
86	40
86	45
86	50
86	59
86	69
86	106
86	164
86	66
86	109
86	171
86	73
86	14
86	152
86	123
86	116
86	127
86	160
86	83
86	79
86	86
86	156
86	159
86	99
86	101
86	78
86	60
86	85
86	71
86	75
86	88
86	82
86	67
86	136
86	173
86	112
86	107
86	61
86	149
86	146
86	139
86	125
86	126
86	132
86	133
86	143
86	147
86	124
86	6
86	161
86	84
86	80
86	87
86	100
86	81
86	102
86	13
86	19
86	158
86	121
86	113
86	120
86	141
86	131
86	91
86	144
86	77
86	168
86	169
86	170
87	135
87	137
87	172
87	57
87	134
87	55
87	56
87	129
87	142
87	103
87	104
87	76
87	166
87	157
87	122
87	1
87	3
87	140
87	167
87	20
87	25
87	30
87	35
87	40
87	45
87	50
87	59
87	69
87	106
87	164
87	66
87	109
87	171
87	73
87	14
87	152
87	123
87	116
87	127
87	160
87	83
87	79
87	86
87	156
87	159
87	99
87	101
87	78
87	60
87	85
87	71
87	75
87	88
87	82
87	67
87	136
87	173
87	112
87	107
87	61
87	149
87	146
87	139
87	125
87	126
87	132
87	133
87	143
87	147
87	124
87	6
87	161
87	84
87	80
87	87
87	100
87	81
87	102
87	13
87	19
87	158
87	121
87	113
87	120
87	141
87	131
87	91
87	144
87	77
87	168
87	169
87	170
88	135
88	137
88	172
88	57
88	134
88	55
88	56
88	129
88	142
88	103
88	104
88	76
88	166
88	157
88	122
88	1
88	3
88	140
88	167
88	20
88	25
88	30
88	35
88	40
88	45
88	50
88	59
88	69
88	106
88	164
88	66
88	109
88	171
88	73
88	14
88	152
88	123
88	116
88	127
88	160
88	83
88	79
88	86
88	156
88	159
88	99
88	101
88	78
88	60
88	85
88	71
88	75
88	88
88	82
88	67
88	136
88	173
88	112
88	107
88	61
88	149
88	146
88	139
88	125
88	126
88	132
88	133
88	143
88	147
88	124
88	6
88	161
88	84
88	80
88	87
88	100
88	81
88	102
88	13
88	19
88	158
88	121
88	113
88	120
88	141
88	131
88	91
88	144
88	77
88	168
88	169
88	170
89	135
89	137
89	172
89	57
89	134
89	55
89	56
89	96
89	94
89	129
89	142
89	103
89	104
89	76
89	166
89	157
89	122
89	1
89	3
89	140
89	167
89	20
89	25
89	30
89	35
89	40
89	45
89	50
89	59
89	69
89	106
89	164
89	66
89	109
89	171
89	73
89	14
89	152
89	123
89	116
89	127
89	160
89	83
89	79
89	86
89	156
89	159
89	99
89	101
89	78
89	60
89	85
89	71
89	75
89	88
89	82
89	67
89	136
89	173
89	112
89	107
89	61
89	149
89	146
89	139
89	125
89	126
89	132
89	133
89	143
89	147
89	124
89	6
89	161
89	84
89	80
89	87
89	100
89	81
89	102
89	13
89	19
89	158
89	121
89	113
89	120
89	141
89	131
89	91
89	144
89	77
89	168
89	169
89	170
90	135
90	137
90	172
90	57
90	134
90	55
90	56
90	96
90	94
90	129
90	142
90	103
90	104
90	76
90	166
90	157
90	122
90	1
90	3
90	140
90	167
90	20
90	25
90	30
90	35
90	40
90	45
90	50
90	59
90	69
90	106
90	164
90	66
90	109
90	171
90	73
90	14
90	152
90	123
90	116
90	127
90	160
90	83
90	79
90	86
90	156
90	159
90	99
90	101
90	78
90	60
90	85
90	71
90	75
90	88
90	82
90	67
90	136
90	173
90	112
90	107
90	61
90	149
90	146
90	139
90	125
90	126
90	132
90	133
90	143
90	147
90	124
90	6
90	161
90	84
90	80
90	87
90	100
90	81
90	102
90	13
90	19
90	158
90	121
90	113
90	120
90	141
90	131
90	91
90	144
90	77
90	168
90	169
90	170
91	135
91	137
91	172
91	57
91	134
91	55
91	56
91	96
91	94
91	129
91	142
91	103
91	104
91	76
91	166
91	157
91	122
91	1
91	3
91	140
91	167
91	20
91	25
91	30
91	35
91	40
91	45
91	50
91	59
91	69
91	106
91	164
91	66
91	109
91	171
91	73
91	14
91	152
91	123
91	116
91	127
91	160
91	83
91	79
91	86
91	156
91	159
91	99
91	101
91	78
91	60
91	85
91	71
91	75
91	88
91	82
91	67
91	136
91	173
91	112
91	107
91	61
91	149
91	146
91	139
91	125
91	126
91	132
91	133
91	143
91	147
91	124
91	6
91	161
91	84
91	80
91	87
91	100
91	81
91	102
91	13
91	19
91	158
91	121
91	113
91	120
91	141
91	131
91	91
91	144
91	77
91	168
91	169
91	170
92	135
92	137
92	172
92	57
92	134
92	55
92	56
92	96
92	94
92	129
92	142
92	103
92	104
92	76
92	166
92	157
92	122
92	1
92	3
92	140
92	167
92	20
92	25
92	30
92	35
92	40
92	45
92	50
92	59
92	69
92	106
92	164
92	66
92	109
92	171
92	73
92	14
92	152
92	123
92	116
92	127
92	160
92	83
92	79
92	86
92	156
92	159
92	99
92	101
92	78
92	60
92	85
92	71
92	75
92	88
92	82
92	67
92	136
92	173
92	112
92	107
92	61
92	149
92	146
92	139
92	125
92	126
92	132
92	133
92	143
92	147
92	124
92	6
92	161
92	84
92	80
92	87
92	100
92	81
92	102
92	13
92	19
92	158
92	121
92	113
92	120
92	141
92	131
92	91
92	144
92	77
92	168
92	169
92	170
93	135
93	137
93	172
93	57
93	134
93	55
93	56
93	96
93	94
93	129
93	142
93	103
93	104
93	76
93	166
93	157
93	122
93	1
93	3
93	140
93	167
93	20
93	25
93	30
93	35
93	40
93	45
93	50
93	59
93	69
93	106
93	164
93	66
93	109
93	171
93	73
93	14
93	152
93	123
93	116
93	127
93	160
93	83
93	79
93	86
93	156
93	159
93	99
93	101
93	78
93	60
93	85
93	71
93	75
93	88
93	82
93	67
93	136
93	173
93	112
93	107
93	61
93	149
93	146
93	139
93	125
93	126
93	132
93	133
93	143
93	147
93	124
93	6
93	161
93	84
93	80
93	87
93	100
93	81
93	102
93	13
93	19
93	158
93	121
93	113
93	120
93	141
93	131
93	91
93	144
93	77
93	168
93	169
93	170
94	135
94	137
94	172
94	57
94	134
94	55
94	56
94	96
94	94
94	129
94	142
94	103
94	104
94	76
94	166
94	157
94	122
94	1
94	3
94	140
94	167
94	20
94	25
94	30
94	35
94	40
94	45
94	50
94	59
94	69
94	106
94	164
94	66
94	109
94	171
94	73
94	14
94	152
94	123
94	116
94	127
94	160
94	83
94	79
94	86
94	156
94	159
94	99
94	101
94	78
94	60
94	85
94	71
94	75
94	88
94	82
94	67
94	136
94	173
94	112
94	107
94	61
94	149
94	146
94	139
94	125
94	126
94	132
94	133
94	143
94	147
94	124
94	6
94	161
94	84
94	80
94	87
94	100
94	81
94	102
94	13
94	19
94	158
94	121
94	113
94	120
94	141
94	131
94	91
94	144
94	77
94	168
94	169
94	170
95	135
95	137
95	172
95	57
95	134
95	55
95	56
95	96
95	94
95	129
95	142
95	103
95	104
95	76
95	166
95	157
95	122
95	1
95	3
95	140
95	167
95	20
95	25
95	30
95	35
95	40
95	45
95	50
95	59
95	69
95	106
95	164
95	66
95	109
95	171
95	73
95	14
95	152
95	123
95	116
95	127
95	160
95	83
95	79
95	86
95	156
95	159
95	99
95	101
95	78
95	60
95	85
95	71
95	75
95	88
95	82
95	67
95	136
95	173
95	112
95	107
95	61
95	149
95	146
95	139
95	125
95	126
95	132
95	133
95	143
95	147
95	124
95	6
95	161
95	84
95	80
95	87
95	100
95	81
95	102
95	13
95	19
95	158
95	121
95	113
95	120
95	141
95	131
95	91
95	144
95	77
95	168
95	169
95	170
96	135
96	137
96	172
96	57
96	134
96	55
96	56
96	96
96	94
96	129
96	142
96	103
96	104
96	76
96	166
96	157
96	122
96	1
96	3
96	140
96	167
96	20
96	25
96	30
96	35
96	40
96	45
96	50
96	59
96	69
96	106
96	164
96	66
96	109
96	171
96	73
96	14
96	152
96	123
96	116
96	127
96	160
96	83
96	79
96	86
96	156
96	159
96	99
96	101
96	78
96	60
96	85
96	71
96	75
96	88
96	82
96	67
96	136
96	173
96	112
96	107
96	61
96	149
96	146
96	139
96	125
96	126
96	132
96	133
96	143
96	147
96	124
96	6
96	161
96	84
96	80
96	87
96	100
96	81
96	102
96	13
96	19
96	158
96	121
96	113
96	120
96	141
96	131
96	91
96	144
96	77
96	168
96	169
96	170
97	135
97	137
97	172
97	57
97	134
97	55
97	56
97	96
97	94
97	129
97	142
97	103
97	104
97	76
97	166
97	157
97	122
97	1
97	3
97	140
97	167
97	20
97	25
97	30
97	35
97	40
97	45
97	50
97	59
97	69
97	106
97	164
97	66
97	109
97	171
97	73
97	14
97	152
97	123
97	116
97	127
97	160
97	83
97	79
97	86
97	156
97	159
97	99
97	101
97	78
97	60
97	85
97	71
97	75
97	88
97	82
97	67
97	136
97	173
97	112
97	107
97	61
97	149
97	146
97	139
97	125
97	126
97	132
97	133
97	143
97	147
97	124
97	6
97	161
97	84
97	80
97	87
97	100
97	81
97	102
97	13
97	19
97	158
97	121
97	113
97	120
97	141
97	131
97	91
97	144
97	77
97	168
97	169
97	170
98	135
98	137
98	172
98	57
98	134
98	55
98	56
98	96
98	94
98	129
98	142
98	103
98	104
98	76
98	166
98	157
98	122
98	1
98	3
98	140
98	167
98	20
98	25
98	30
98	35
98	40
98	45
98	50
98	59
98	69
98	106
98	164
98	66
98	109
98	171
98	73
98	14
98	152
98	123
98	116
98	127
98	160
98	83
98	79
98	86
98	156
98	159
98	99
98	101
98	78
98	60
98	85
98	71
98	75
98	88
98	82
98	67
98	136
98	173
98	112
98	107
98	61
98	149
98	146
98	139
98	125
98	126
98	132
98	133
98	143
98	147
98	124
98	6
98	161
98	84
98	80
98	87
98	100
98	81
98	102
98	13
98	19
98	158
98	121
98	113
98	120
98	141
98	131
98	91
98	144
98	77
98	168
98	169
98	170
99	135
99	137
99	172
99	57
99	134
99	55
99	56
99	96
99	94
99	129
99	142
99	103
99	104
99	76
99	166
99	157
99	122
99	1
99	3
99	140
99	167
99	20
99	25
99	30
99	35
99	40
99	45
99	50
99	59
99	69
99	106
99	164
99	66
99	109
99	171
99	73
99	14
99	152
99	123
99	116
99	127
99	160
99	83
99	79
99	86
99	156
99	159
99	99
99	101
99	78
99	60
99	85
99	71
99	75
99	88
99	82
99	67
99	136
99	173
99	112
99	107
99	61
99	149
99	146
99	139
99	125
99	126
99	132
99	133
99	143
99	147
99	124
99	6
99	161
99	84
99	80
99	87
99	100
99	81
99	102
99	13
99	19
99	158
99	121
99	113
99	120
99	141
99	131
99	91
99	144
99	77
99	168
99	169
99	170
100	135
100	137
100	172
100	57
100	134
100	55
100	56
100	96
100	94
100	129
100	142
100	103
100	104
100	76
100	166
100	157
100	122
100	1
100	3
100	140
100	167
100	20
100	25
100	30
100	35
100	40
100	45
100	50
100	59
100	69
100	106
100	164
100	66
100	109
100	171
100	73
100	14
100	152
100	123
100	116
100	127
100	160
100	83
100	79
100	86
100	156
100	159
100	99
100	101
100	78
100	60
100	85
100	71
100	75
100	88
100	82
100	67
100	136
100	173
100	112
100	107
100	61
100	149
100	146
100	139
100	125
100	126
100	132
100	133
100	143
100	147
100	124
100	6
100	161
100	84
100	80
100	87
100	100
100	81
100	102
100	13
100	19
100	158
100	121
100	113
100	120
100	141
100	131
100	91
100	144
100	77
100	168
100	169
100	170
101	135
101	137
101	172
101	57
101	134
101	55
101	56
101	96
101	94
101	129
101	142
101	103
101	104
101	76
101	166
101	157
101	122
101	1
101	3
101	140
101	167
101	20
101	25
101	30
101	35
101	40
101	45
101	50
101	59
101	69
101	106
101	164
101	66
101	109
101	171
101	73
101	14
101	152
101	123
101	116
101	127
101	160
101	83
101	79
101	86
101	156
101	159
101	99
101	101
101	78
101	60
101	85
101	71
101	75
101	88
101	82
101	67
101	136
101	173
101	112
101	107
101	61
101	149
101	146
101	139
101	125
101	126
101	132
101	133
101	143
101	147
101	124
101	6
101	161
101	84
101	80
101	87
101	100
101	81
101	102
101	13
101	19
101	158
101	121
101	113
101	120
101	141
101	131
101	91
101	144
101	77
101	168
101	169
101	170
102	135
102	137
102	172
102	57
102	134
102	55
102	56
102	96
102	94
102	129
102	142
102	103
102	104
102	76
102	166
102	157
102	122
102	1
102	3
102	140
102	167
102	20
102	25
102	30
102	35
102	40
102	45
102	50
102	59
102	69
102	106
102	164
102	66
102	109
102	171
102	73
102	14
102	152
102	123
102	116
102	127
102	160
102	83
102	79
102	86
102	156
102	159
102	99
102	101
102	78
102	60
102	85
102	71
102	75
102	88
102	82
102	67
102	136
102	173
102	112
102	107
102	61
102	149
102	146
102	139
102	125
102	126
102	132
102	133
102	143
102	147
102	124
102	6
102	161
102	84
102	80
102	87
102	100
102	81
102	102
102	13
102	19
102	158
102	121
102	113
102	120
102	141
102	131
102	91
102	144
102	77
102	168
102	169
102	170
103	135
103	137
103	172
103	57
103	134
103	55
103	56
103	96
103	94
103	129
103	142
103	103
103	104
103	76
103	166
103	157
103	122
103	1
103	3
103	140
103	167
103	20
103	25
103	30
103	35
103	40
103	45
103	50
103	59
103	69
103	106
103	164
103	66
103	109
103	171
103	73
103	14
103	152
103	123
103	116
103	127
103	160
103	83
103	79
103	86
103	156
103	159
103	99
103	101
103	78
103	60
103	85
103	71
103	75
103	88
103	82
103	67
103	136
103	173
103	112
103	107
103	61
103	149
103	146
103	139
103	125
103	126
103	132
103	133
103	143
103	147
103	124
103	6
103	161
103	84
103	80
103	87
103	100
103	81
103	102
103	13
103	19
103	158
103	121
103	113
103	120
103	141
103	131
103	91
103	144
103	77
103	168
103	169
103	170
104	135
104	137
104	172
104	57
104	134
104	55
104	56
104	96
104	94
104	129
104	142
104	103
104	104
104	76
104	166
104	157
104	122
104	1
104	3
104	140
104	167
104	20
104	25
104	30
104	35
104	40
104	45
104	50
104	59
104	69
104	106
104	164
104	66
104	109
104	171
104	73
104	14
104	152
104	123
104	116
104	127
104	160
104	83
104	79
104	86
104	156
104	159
104	99
104	101
104	78
104	60
104	85
104	71
104	75
104	88
104	82
104	67
104	136
104	173
104	112
104	107
104	61
104	149
104	146
104	139
104	125
104	126
104	132
104	133
104	143
104	147
104	124
104	6
104	161
104	84
104	80
104	87
104	100
104	81
104	102
104	13
104	19
104	158
104	121
104	113
104	120
104	141
104	131
104	91
104	144
104	77
104	168
104	169
104	170
105	135
105	137
105	172
105	57
105	134
105	55
105	56
105	96
105	94
105	129
105	142
105	103
105	104
105	76
105	166
105	157
105	122
105	1
105	3
105	140
105	167
105	20
105	25
105	30
105	35
105	40
105	45
105	50
105	59
105	69
105	106
105	164
105	66
105	109
105	171
105	73
105	14
105	152
105	123
105	116
105	127
105	160
105	83
105	79
105	86
105	156
105	159
105	99
105	101
105	78
105	60
105	85
105	71
105	75
105	88
105	82
105	67
105	136
105	173
105	112
105	107
105	61
105	149
105	146
105	139
105	125
105	126
105	132
105	133
105	143
105	147
105	124
105	6
105	161
105	84
105	80
105	87
105	100
105	81
105	102
105	13
105	19
105	158
105	121
105	113
105	120
105	141
105	131
105	91
105	144
105	77
105	168
105	169
105	170
106	135
106	137
106	172
106	57
106	134
106	55
106	56
106	96
106	94
106	129
106	142
106	103
106	104
106	76
106	166
106	157
106	122
106	1
106	3
106	140
106	167
106	20
106	25
106	30
106	35
106	40
106	45
106	50
106	59
106	69
106	106
106	164
106	66
106	109
106	171
106	73
106	14
106	152
106	123
106	116
106	127
106	160
106	83
106	79
106	86
106	156
106	159
106	99
106	101
106	78
106	60
106	85
106	71
106	75
106	88
106	82
106	67
106	136
106	173
106	112
106	107
106	61
106	149
106	146
106	139
106	125
106	126
106	132
106	133
106	143
106	147
106	124
106	6
106	161
106	84
106	80
106	87
106	100
106	81
106	102
106	13
106	19
106	158
106	121
106	113
106	120
106	141
106	131
106	91
106	144
106	77
106	168
106	169
106	170
107	135
107	137
107	172
107	57
107	134
107	55
107	56
107	96
107	94
107	129
107	142
107	103
107	104
107	76
107	166
107	157
107	122
107	1
107	3
107	140
107	167
107	20
107	25
107	30
107	35
107	40
107	45
107	50
107	59
107	69
107	106
107	164
107	66
107	109
107	171
107	73
107	14
107	152
107	123
107	116
107	127
107	160
107	83
107	79
107	86
107	156
107	159
107	99
107	101
107	78
107	60
107	85
107	71
107	75
107	88
107	82
107	67
107	136
107	173
107	112
107	107
107	61
107	149
107	146
107	139
107	125
107	126
107	132
107	133
107	143
107	147
107	124
107	6
107	161
107	84
107	80
107	87
107	100
107	81
107	102
107	13
107	19
107	158
107	121
107	113
107	120
107	141
107	131
107	91
107	144
107	77
107	168
107	169
107	170
108	135
108	137
108	172
108	57
108	134
108	55
108	56
108	96
108	94
108	129
108	142
108	103
108	104
108	76
108	166
108	157
108	122
108	1
108	3
108	140
108	167
108	20
108	25
108	30
108	35
108	40
108	45
108	50
108	59
108	69
108	106
108	164
108	66
108	109
108	171
108	73
108	14
108	152
108	123
108	116
108	127
108	160
108	83
108	79
108	86
108	156
108	159
108	99
108	101
108	78
108	60
108	85
108	71
108	75
108	88
108	82
108	67
108	136
108	173
108	112
108	107
108	61
108	149
108	146
108	139
108	125
108	126
108	132
108	133
108	143
108	147
108	124
108	6
108	161
108	84
108	80
108	87
108	100
108	81
108	102
108	13
108	19
108	158
108	121
108	113
108	120
108	141
108	131
108	91
108	144
108	77
108	168
108	169
108	170
109	135
109	137
109	172
109	57
109	134
109	55
109	56
109	96
109	94
109	129
109	142
109	103
109	104
109	76
109	166
109	157
109	122
109	1
109	3
109	140
109	167
109	20
109	25
109	30
109	35
109	40
109	45
109	50
109	59
109	69
109	106
109	164
109	66
109	109
109	171
109	73
109	14
109	152
109	123
109	116
109	127
109	160
109	83
109	79
109	86
109	156
109	159
109	99
109	101
109	78
109	60
109	85
109	71
109	75
109	88
109	82
109	67
109	136
109	173
109	112
109	107
109	61
109	149
109	146
109	139
109	125
109	126
109	132
109	133
109	143
109	147
109	124
109	6
109	161
109	84
109	80
109	87
109	100
109	81
109	102
109	13
109	19
109	158
109	121
109	113
109	120
109	141
109	131
109	91
109	144
109	77
109	168
109	169
109	170
110	135
110	137
110	172
110	57
110	134
110	55
110	56
110	96
110	94
110	129
110	142
110	103
110	104
110	76
110	166
110	157
110	122
110	1
110	3
110	140
110	167
110	20
110	25
110	30
110	35
110	40
110	45
110	50
110	59
110	69
110	106
110	164
110	66
110	109
110	171
110	73
110	14
110	152
110	123
110	116
110	127
110	160
110	83
110	79
110	86
110	156
110	159
110	99
110	101
110	78
110	60
110	85
110	71
110	75
110	88
110	82
110	67
110	136
110	173
110	112
110	107
110	61
110	149
110	146
110	139
110	125
110	126
110	132
110	133
110	143
110	147
110	124
110	6
110	161
110	84
110	80
110	87
110	100
110	81
110	102
110	13
110	19
110	158
110	121
110	113
110	120
110	141
110	131
110	91
110	144
110	77
110	168
110	169
110	170
111	135
111	137
111	172
111	57
111	134
111	55
111	56
111	96
111	94
111	129
111	142
111	103
111	104
111	76
111	166
111	157
111	122
111	1
111	3
111	140
111	167
111	20
111	25
111	30
111	35
111	40
111	45
111	50
111	59
111	69
111	106
111	164
111	66
111	109
111	171
111	73
111	14
111	152
111	123
111	116
111	127
111	160
111	83
111	79
111	86
111	156
111	159
111	99
111	101
111	78
111	60
111	85
111	71
111	75
111	88
111	82
111	67
111	136
111	173
111	112
111	107
111	61
111	149
111	146
111	139
111	125
111	126
111	132
111	133
111	143
111	147
111	124
111	6
111	161
111	84
111	80
111	87
111	100
111	81
111	102
111	13
111	19
111	158
111	121
111	113
111	120
111	141
111	131
111	91
111	144
111	77
111	168
111	169
111	170
112	135
112	137
112	172
112	57
112	134
112	55
112	56
112	96
112	94
112	129
112	142
112	103
112	104
112	76
112	166
112	157
112	122
112	1
112	3
112	140
112	167
112	20
112	25
112	30
112	35
112	40
112	45
112	50
112	59
112	69
112	106
112	164
112	66
112	109
112	171
112	73
112	14
112	152
112	123
112	116
112	127
112	160
112	83
112	79
112	86
112	156
112	159
112	99
112	101
112	78
112	60
112	85
112	71
112	75
112	88
112	82
112	67
112	136
112	173
112	112
112	107
112	61
112	149
112	146
112	139
112	125
112	126
112	132
112	133
112	143
112	147
112	124
112	6
112	161
112	84
112	80
112	87
112	100
112	81
112	102
112	13
112	19
112	158
112	121
112	113
112	120
112	141
112	131
112	91
112	144
112	77
112	168
112	169
112	170
113	135
113	137
113	172
113	57
113	134
113	55
113	56
113	96
113	94
113	129
113	142
113	103
113	104
113	76
113	166
113	157
113	122
113	1
113	3
113	140
113	167
113	20
113	25
113	30
113	35
113	40
113	45
113	50
113	59
113	69
113	106
113	164
113	66
113	109
113	171
113	73
113	14
113	152
113	123
113	116
113	127
113	160
113	83
113	79
113	86
113	156
113	159
113	99
113	101
113	78
113	60
113	85
113	71
113	75
113	88
113	82
113	67
113	136
113	173
113	112
113	107
113	61
113	149
113	146
113	139
113	125
113	126
113	132
113	133
113	143
113	147
113	124
113	6
113	161
113	84
113	80
113	87
113	100
113	81
113	102
113	13
113	19
113	158
113	121
113	113
113	120
113	141
113	131
113	91
113	144
113	77
113	168
113	169
113	170
114	135
114	137
114	172
114	57
114	134
114	58
114	55
114	56
114	138
114	89
114	72
114	74
114	64
114	65
114	62
114	63
114	130
114	105
114	165
114	150
114	93
114	145
114	148
114	95
114	96
114	94
114	97
114	98
114	92
114	129
114	142
114	103
114	104
114	76
114	166
114	157
114	128
114	122
114	118
114	119
114	115
114	117
114	43
114	44
114	41
114	42
114	33
114	34
114	31
114	32
114	28
114	29
114	26
114	27
114	23
114	24
114	21
114	22
114	7
114	8
114	111
114	114
114	108
114	110
114	48
114	49
114	46
114	47
114	38
114	39
114	36
114	37
114	53
114	54
114	51
114	52
114	1
114	4
114	3
114	2
114	154
114	155
114	151
114	153
114	162
114	163
114	140
114	167
114	20
114	25
114	30
114	35
114	40
114	45
114	50
114	59
114	69
114	106
114	164
114	66
114	109
114	171
114	73
114	14
114	152
114	123
114	116
114	127
114	160
114	83
114	79
114	86
114	156
114	159
114	99
114	101
114	78
114	60
114	85
114	71
114	75
114	88
114	82
114	67
114	136
114	173
114	112
114	107
114	61
114	149
114	146
114	139
114	125
114	126
114	132
114	133
114	143
114	147
114	124
114	6
114	161
114	84
114	80
114	87
114	100
114	81
114	102
114	13
114	19
114	158
114	121
114	113
114	120
114	141
114	131
114	91
114	144
114	77
114	168
114	169
114	170
115	135
115	137
115	172
115	57
115	134
115	55
115	56
115	96
115	94
115	129
115	142
115	103
115	104
115	76
115	166
115	157
115	122
115	1
115	3
115	140
115	167
115	20
115	25
115	30
115	35
115	40
115	45
115	50
115	59
115	69
115	106
115	164
115	66
115	109
115	171
115	73
115	14
115	152
115	123
115	116
115	127
115	160
115	83
115	79
115	86
115	156
115	159
115	99
115	101
115	78
115	60
115	85
115	71
115	75
115	88
115	82
115	67
115	136
115	173
115	112
115	107
115	61
115	149
115	146
115	139
115	125
115	126
115	132
115	133
115	143
115	147
115	124
115	6
115	161
115	84
115	80
115	87
115	100
115	81
115	102
115	13
115	19
115	158
115	121
115	113
115	120
115	141
115	131
115	91
115	144
115	77
115	168
115	169
115	170
116	135
116	137
116	172
116	57
116	134
116	55
116	56
116	96
116	94
116	129
116	142
116	103
116	104
116	76
116	166
116	157
116	122
116	1
116	3
116	140
116	167
116	20
116	25
116	30
116	35
116	40
116	45
116	50
116	59
116	69
116	106
116	164
116	66
116	109
116	171
116	73
116	14
116	152
116	123
116	116
116	127
116	160
116	83
116	79
116	86
116	156
116	159
116	99
116	101
116	78
116	60
116	85
116	71
116	75
116	88
116	82
116	67
116	136
116	173
116	112
116	107
116	61
116	149
116	146
116	139
116	125
116	126
116	132
116	133
116	143
116	147
116	124
116	6
116	161
116	84
116	80
116	87
116	100
116	81
116	102
116	13
116	19
116	158
116	121
116	113
116	120
116	141
116	131
116	91
116	144
116	77
116	168
116	169
116	170
117	135
117	137
117	172
117	57
117	134
117	55
117	56
117	96
117	94
117	129
117	142
117	103
117	104
117	76
117	166
117	157
117	122
117	1
117	3
117	140
117	167
117	20
117	25
117	30
117	35
117	40
117	45
117	50
117	59
117	69
117	106
117	164
117	66
117	109
117	171
117	73
117	14
117	152
117	123
117	116
117	127
117	160
117	83
117	79
117	86
117	156
117	159
117	99
117	101
117	78
117	60
117	85
117	71
117	75
117	88
117	82
117	67
117	136
117	173
117	112
117	107
117	61
117	149
117	146
117	139
117	125
117	126
117	132
117	133
117	143
117	147
117	124
117	6
117	161
117	84
117	80
117	87
117	100
117	81
117	102
117	13
117	19
117	158
117	121
117	113
117	120
117	141
117	131
117	91
117	144
117	77
117	168
117	169
117	170
118	135
118	137
118	172
118	57
118	134
118	55
118	56
118	96
118	94
118	129
118	142
118	103
118	104
118	76
118	166
118	157
118	122
118	1
118	3
118	140
118	167
118	20
118	25
118	30
118	35
118	40
118	45
118	50
118	59
118	69
118	106
118	164
118	66
118	109
118	171
118	73
118	14
118	152
118	123
118	116
118	127
118	160
118	83
118	79
118	86
118	156
118	159
118	99
118	101
118	78
118	60
118	85
118	71
118	75
118	88
118	82
118	67
118	136
118	173
118	112
118	107
118	61
118	149
118	146
118	139
118	125
118	126
118	132
118	133
118	143
118	147
118	124
118	6
118	161
118	84
118	80
118	87
118	100
118	81
118	102
118	13
118	19
118	158
118	121
118	113
118	120
118	141
118	131
118	91
118	144
118	77
118	168
118	169
118	170
120	135
120	137
120	172
120	57
120	134
120	55
120	56
120	96
120	94
120	129
120	142
120	103
120	104
120	76
120	166
120	157
120	122
120	1
120	3
120	140
120	167
120	20
120	25
120	30
120	35
120	40
120	45
120	50
120	59
120	69
120	106
120	164
120	66
120	109
120	171
120	73
120	14
120	152
120	123
120	116
120	127
120	160
120	83
120	79
120	86
120	156
120	159
120	99
120	101
120	78
120	60
120	85
120	71
120	75
120	88
120	82
120	67
120	136
120	173
120	112
120	107
120	61
120	149
120	146
120	139
120	125
120	126
120	132
120	133
120	143
120	147
120	124
120	6
120	161
120	84
120	80
120	87
120	100
120	81
120	102
120	13
120	19
120	158
120	121
120	113
120	120
120	141
120	131
120	91
120	144
120	77
120	168
120	169
120	170
121	135
121	137
121	172
121	57
121	134
121	55
121	56
121	96
121	94
121	129
121	142
121	103
121	104
121	76
121	166
121	157
121	122
121	1
121	3
121	140
121	167
121	20
121	25
121	30
121	35
121	40
121	45
121	50
121	59
121	69
121	106
121	164
121	66
121	109
121	171
121	73
121	14
121	152
121	123
121	116
121	127
121	160
121	83
121	79
121	86
121	156
121	159
121	99
121	101
121	78
121	60
121	85
121	71
121	75
121	88
121	82
121	67
121	136
121	173
121	112
121	107
121	61
121	149
121	146
121	139
121	125
121	126
121	132
121	133
121	143
121	147
121	124
121	6
121	161
121	84
121	80
121	87
121	100
121	81
121	102
121	13
121	19
121	158
121	121
121	113
121	120
121	141
121	131
121	91
121	144
121	77
121	168
121	169
121	170
122	135
122	137
122	172
122	57
122	134
122	55
122	56
122	96
122	94
122	129
122	142
122	103
122	104
122	76
122	166
122	157
122	122
122	1
122	3
122	140
122	167
122	20
122	25
122	30
122	35
122	40
122	45
122	50
122	59
122	69
122	106
122	164
122	66
122	109
122	171
122	73
122	14
122	152
122	123
122	116
122	127
122	160
122	83
122	79
122	86
122	156
122	159
122	99
122	101
122	78
122	60
122	85
122	71
122	75
122	88
122	82
122	67
122	136
122	173
122	112
122	107
122	61
122	149
122	146
122	139
122	125
122	126
122	132
122	133
122	143
122	147
122	124
122	6
122	161
122	84
122	80
122	87
122	100
122	81
122	102
122	13
122	19
122	158
122	121
122	113
122	120
122	141
122	131
122	91
122	144
122	77
122	168
122	169
122	170
123	135
123	137
123	172
123	57
123	134
123	55
123	56
123	96
123	94
123	129
123	142
123	103
123	104
123	76
123	166
123	157
123	122
123	1
123	3
123	140
123	167
123	20
123	25
123	30
123	35
123	40
123	45
123	50
123	59
123	69
123	106
123	164
123	66
123	109
123	171
123	73
123	14
123	152
123	123
123	116
123	127
123	160
123	83
123	79
123	86
123	156
123	159
123	99
123	101
123	78
123	60
123	85
123	71
123	75
123	88
123	82
123	67
123	136
123	173
123	112
123	107
123	61
123	149
123	146
123	139
123	125
123	126
123	132
123	133
123	143
123	147
123	124
123	6
123	161
123	84
123	80
123	87
123	100
123	81
123	102
123	13
123	19
123	158
123	121
123	113
123	120
123	141
123	131
123	91
123	144
123	77
123	168
123	169
123	170
124	135
124	137
124	172
124	57
124	134
124	55
124	56
124	96
124	94
124	129
124	142
124	103
124	104
124	76
124	166
124	157
124	122
124	1
124	3
124	140
124	167
124	20
124	25
124	30
124	35
124	40
124	45
124	50
124	59
124	69
124	106
124	164
124	66
124	109
124	171
124	73
124	14
124	152
124	123
124	116
124	127
124	160
124	83
124	79
124	86
124	156
124	159
124	99
124	101
124	78
124	60
124	85
124	71
124	75
124	88
124	82
124	67
124	136
124	173
124	112
124	107
124	61
124	149
124	146
124	139
124	125
124	126
124	132
124	133
124	143
124	147
124	124
124	6
124	161
124	84
124	80
124	87
124	100
124	81
124	102
124	13
124	19
124	158
124	121
124	113
124	120
124	141
124	131
124	91
124	144
124	77
124	168
124	169
124	170
125	135
125	137
125	172
125	57
125	134
125	55
125	56
125	96
125	94
125	129
125	142
125	103
125	104
125	76
125	166
125	157
125	122
125	1
125	3
125	140
125	167
125	20
125	25
125	30
125	35
125	40
125	45
125	50
125	59
125	69
125	106
125	164
125	66
125	109
125	171
125	73
125	14
125	152
125	123
125	116
125	127
125	160
125	83
125	79
125	86
125	156
125	159
125	99
125	101
125	78
125	60
125	85
125	71
125	75
125	88
125	82
125	67
125	136
125	173
125	112
125	107
125	61
125	149
125	146
125	139
125	125
125	126
125	132
125	133
125	143
125	147
125	124
125	6
125	161
125	84
125	80
125	87
125	100
125	81
125	102
125	13
125	19
125	158
125	121
125	113
125	120
125	141
125	131
125	91
125	144
125	77
125	168
125	169
125	170
126	135
126	137
126	172
126	57
126	134
126	55
126	56
126	96
126	94
126	129
126	142
126	103
126	104
126	76
126	166
126	157
126	122
126	1
126	3
126	140
126	167
126	20
126	25
126	30
126	35
126	40
126	45
126	50
126	59
126	69
126	106
126	164
126	66
126	109
126	171
126	73
126	14
126	152
126	123
126	116
126	127
126	160
126	83
126	79
126	86
126	156
126	159
126	99
126	101
126	78
126	60
126	85
126	71
126	75
126	88
126	82
126	67
126	136
126	173
126	112
126	107
126	61
126	149
126	146
126	139
126	125
126	126
126	132
126	133
126	143
126	147
126	124
126	6
126	161
126	84
126	80
126	87
126	100
126	81
126	102
126	13
126	19
126	158
126	121
126	113
126	120
126	141
126	131
126	91
126	144
126	77
126	168
126	169
126	170
127	135
127	137
127	172
127	57
127	134
127	55
127	56
127	96
127	94
127	129
127	142
127	103
127	104
127	76
127	166
127	157
127	122
127	1
127	3
127	140
127	167
127	20
127	25
127	30
127	35
127	40
127	45
127	50
127	59
127	69
127	106
127	164
127	66
127	109
127	171
127	73
127	14
127	152
127	123
127	116
127	127
127	160
127	83
127	79
127	86
127	156
127	159
127	99
127	101
127	78
127	60
127	85
127	71
127	75
127	88
127	82
127	67
127	136
127	173
127	112
127	107
127	61
127	149
127	146
127	139
127	125
127	126
127	132
127	133
127	143
127	147
127	124
127	6
127	161
127	84
127	80
127	87
127	100
127	81
127	102
127	13
127	19
127	158
127	121
127	113
127	120
127	141
127	131
127	91
127	144
127	77
127	168
127	169
127	170
128	135
128	137
128	172
128	57
128	134
128	55
128	56
128	96
128	94
128	129
128	142
128	103
128	104
128	76
128	166
128	157
128	122
128	1
128	3
128	140
128	167
128	20
128	25
128	30
128	35
128	40
128	45
128	50
128	59
128	69
128	106
128	164
128	66
128	109
128	171
128	73
128	14
128	152
128	123
128	116
128	127
128	160
128	83
128	79
128	86
128	156
128	159
128	99
128	101
128	78
128	60
128	85
128	71
128	75
128	88
128	82
128	67
128	136
128	173
128	112
128	107
128	61
128	149
128	146
128	139
128	125
128	126
128	132
128	133
128	143
128	147
128	124
128	6
128	161
128	84
128	80
128	87
128	100
128	81
128	102
128	13
128	19
128	158
128	121
128	113
128	120
128	141
128	131
128	91
128	144
128	77
128	168
128	169
128	170
130	135
130	137
130	172
130	57
130	134
130	55
130	56
130	96
130	94
130	129
130	142
130	103
130	104
130	76
130	166
130	157
130	122
130	1
130	3
130	140
130	167
130	20
130	25
130	30
130	35
130	40
130	45
130	50
130	59
130	69
130	106
130	164
130	66
130	109
130	171
130	73
130	14
130	152
130	123
130	116
130	127
130	160
130	83
130	79
130	86
130	156
130	159
130	99
130	101
130	78
130	60
130	85
130	71
130	75
130	88
130	82
130	67
130	136
130	173
130	112
130	107
130	61
130	149
130	146
130	139
130	125
130	126
130	132
130	133
130	143
130	147
130	124
130	6
130	161
130	84
130	80
130	87
130	100
130	81
130	102
130	13
130	19
130	158
130	121
130	113
130	120
130	141
130	131
130	91
130	144
130	77
130	168
130	169
130	170
131	135
131	137
131	172
131	57
131	134
131	55
131	56
131	96
131	94
131	129
131	142
131	103
131	104
131	76
131	166
131	157
131	122
131	1
131	3
131	140
131	167
131	20
131	25
131	30
131	35
131	40
131	45
131	50
131	59
131	69
131	106
131	164
131	66
131	109
131	171
131	73
131	14
131	152
131	123
131	116
131	127
131	160
131	83
131	79
131	86
131	156
131	159
131	99
131	101
131	78
131	60
131	85
131	71
131	75
131	88
131	82
131	67
131	136
131	173
131	112
131	107
131	61
131	149
131	146
131	139
131	125
131	126
131	132
131	133
131	143
131	147
131	124
131	6
131	161
131	84
131	80
131	87
131	100
131	81
131	102
131	13
131	19
131	158
131	121
131	113
131	120
131	141
131	131
131	91
131	144
131	77
131	168
131	169
131	170
132	135
132	137
132	172
132	57
132	134
132	55
132	56
132	96
132	94
132	129
132	142
132	103
132	104
132	76
132	166
132	157
132	122
132	1
132	3
132	140
132	167
132	20
132	25
132	30
132	35
132	40
132	45
132	50
132	59
132	69
132	106
132	164
132	66
132	109
132	171
132	73
132	14
132	152
132	123
132	116
132	127
132	160
132	83
132	79
132	86
132	156
132	159
132	99
132	101
132	78
132	60
132	85
132	71
132	75
132	88
132	82
132	67
132	136
132	173
132	112
132	107
132	61
132	149
132	146
132	139
132	125
132	126
132	132
132	133
132	143
132	147
132	124
132	6
132	161
132	84
132	80
132	87
132	100
132	81
132	102
132	13
132	19
132	158
132	121
132	113
132	120
132	141
132	131
132	91
132	144
132	77
132	168
132	169
132	170
133	135
133	137
133	172
133	57
133	134
133	55
133	56
133	96
133	94
133	129
133	142
133	103
133	104
133	76
133	166
133	157
133	122
133	1
133	3
133	140
133	167
133	20
133	25
133	30
133	35
133	40
133	45
133	50
133	59
133	69
133	106
133	164
133	66
133	109
133	171
133	73
133	14
133	152
133	123
133	116
133	127
133	160
133	83
133	79
133	86
133	156
133	159
133	99
133	101
133	78
133	60
133	85
133	71
133	75
133	88
133	82
133	67
133	136
133	173
133	112
133	107
133	61
133	149
133	146
133	139
133	125
133	126
133	132
133	133
133	143
133	147
133	124
133	6
133	161
133	84
133	80
133	87
133	100
133	81
133	102
133	13
133	19
133	158
133	121
133	113
133	120
133	141
133	131
133	91
133	144
133	77
133	168
133	169
133	170
134	135
134	137
134	172
134	57
134	134
134	55
134	56
134	96
134	94
134	129
134	142
134	103
134	104
134	76
134	166
134	157
134	122
134	1
134	3
134	140
134	167
134	20
134	25
134	30
134	35
134	40
134	45
134	50
134	59
134	69
134	106
134	164
134	66
134	109
134	171
134	73
134	14
134	152
134	123
134	116
134	127
134	160
134	83
134	79
134	86
134	156
134	159
134	99
134	101
134	78
134	60
134	85
134	71
134	75
134	88
134	82
134	67
134	136
134	173
134	112
134	107
134	61
134	149
134	146
134	139
134	125
134	126
134	132
134	133
134	143
134	147
134	124
134	6
134	161
134	84
134	80
134	87
134	100
134	81
134	102
134	13
134	19
134	158
134	121
134	113
134	120
134	141
134	131
134	91
134	144
134	77
134	168
134	169
134	170
135	135
135	137
135	172
135	57
135	134
135	55
135	56
135	96
135	94
135	129
135	142
135	103
135	104
135	76
135	166
135	157
135	122
135	1
135	3
135	140
135	167
135	20
135	25
135	30
135	35
135	40
135	45
135	50
135	59
135	69
135	106
135	164
135	66
135	109
135	171
135	73
135	14
135	152
135	123
135	116
135	127
135	160
135	83
135	79
135	86
135	156
135	159
135	99
135	101
135	78
135	60
135	85
135	71
135	75
135	88
135	82
135	67
135	136
135	173
135	112
135	107
135	61
135	149
135	146
135	139
135	125
135	126
135	132
135	133
135	143
135	147
135	124
135	6
135	161
135	84
135	80
135	87
135	100
135	81
135	102
135	13
135	19
135	158
135	121
135	113
135	120
135	141
135	131
135	91
135	144
135	77
135	168
135	169
135	170
136	135
136	137
136	172
136	57
136	134
136	55
136	56
136	96
136	94
136	129
136	142
136	103
136	104
136	76
136	166
136	157
136	122
136	1
136	3
136	140
136	167
136	20
136	25
136	30
136	35
136	40
136	45
136	50
136	59
136	69
136	106
136	164
136	66
136	109
136	171
136	73
136	14
136	152
136	123
136	116
136	127
136	160
136	83
136	79
136	86
136	156
136	159
136	99
136	101
136	78
136	60
136	85
136	71
136	75
136	88
136	82
136	67
136	136
136	173
136	112
136	107
136	61
136	149
136	146
136	139
136	125
136	126
136	132
136	133
136	143
136	147
136	124
136	6
136	161
136	84
136	80
136	87
136	100
136	81
136	102
136	13
136	19
136	158
136	121
136	113
136	120
136	141
136	131
136	91
136	144
136	77
136	168
136	169
136	170
137	135
137	137
137	172
137	57
137	134
137	55
137	56
137	96
137	94
137	129
137	142
137	103
137	104
137	76
137	166
137	157
137	122
137	1
137	3
137	140
137	167
137	20
137	25
137	30
137	35
137	40
137	45
137	50
137	59
137	69
137	106
137	164
137	66
137	109
137	171
137	73
137	14
137	152
137	123
137	116
137	127
137	160
137	83
137	79
137	86
137	156
137	159
137	99
137	101
137	78
137	60
137	85
137	71
137	75
137	88
137	82
137	67
137	136
137	173
137	112
137	107
137	61
137	149
137	146
137	139
137	125
137	126
137	132
137	133
137	143
137	147
137	124
137	6
137	161
137	84
137	80
137	87
137	100
137	81
137	102
137	13
137	19
137	158
137	121
137	113
137	120
137	141
137	131
137	91
137	144
137	77
137	168
137	169
137	170
138	135
138	137
138	172
138	57
138	134
138	55
138	56
138	96
138	94
138	129
138	142
138	103
138	104
138	76
138	166
138	157
138	122
138	1
138	3
138	140
138	167
138	20
138	25
138	30
138	35
138	40
138	45
138	50
138	59
138	69
138	106
138	164
138	66
138	109
138	171
138	73
138	14
138	152
138	123
138	116
138	127
138	160
138	83
138	79
138	86
138	156
138	159
138	99
138	101
138	78
138	60
138	85
138	71
138	75
138	88
138	82
138	67
138	136
138	173
138	112
138	107
138	61
138	149
138	146
138	139
138	125
138	126
138	132
138	133
138	143
138	147
138	124
138	6
138	161
138	84
138	80
138	87
138	100
138	81
138	102
138	13
138	19
138	158
138	121
138	113
138	120
138	141
138	131
138	91
138	144
138	77
138	168
138	169
138	170
139	135
139	137
139	172
139	57
139	134
139	55
139	56
139	96
139	94
139	129
139	142
139	103
139	104
139	76
139	166
139	157
139	122
139	1
139	3
139	140
139	167
139	20
139	25
139	30
139	35
139	40
139	45
139	50
139	59
139	69
139	106
139	164
139	66
139	109
139	171
139	73
139	14
139	152
139	123
139	116
139	127
139	160
139	83
139	79
139	86
139	156
139	159
139	99
139	101
139	78
139	60
139	85
139	71
139	75
139	88
139	82
139	67
139	136
139	173
139	112
139	107
139	61
139	149
139	146
139	139
139	125
139	126
139	132
139	133
139	143
139	147
139	124
139	6
139	161
139	84
139	80
139	87
139	100
139	81
139	102
139	13
139	19
139	158
139	121
139	113
139	120
139	141
139	131
139	91
139	144
139	77
139	168
139	169
139	170
140	135
140	137
140	172
140	57
140	134
140	55
140	56
140	96
140	94
140	129
140	142
140	103
140	104
140	76
140	166
140	157
140	122
140	1
140	3
140	140
140	167
140	20
140	25
140	30
140	35
140	40
140	45
140	50
140	59
140	69
140	106
140	164
140	66
140	109
140	171
140	73
140	14
140	152
140	123
140	116
140	127
140	160
140	83
140	79
140	86
140	156
140	159
140	99
140	101
140	78
140	60
140	85
140	71
140	75
140	88
140	82
140	67
140	136
140	173
140	112
140	107
140	61
140	149
140	146
140	139
140	125
140	126
140	132
140	133
140	143
140	147
140	124
140	6
140	161
140	84
140	80
140	87
140	100
140	81
140	102
140	13
140	19
140	158
140	121
140	113
140	120
140	141
140	131
140	91
140	144
140	77
140	168
140	169
140	170
141	135
141	137
141	172
141	57
141	134
141	55
141	56
141	96
141	94
141	129
141	142
141	103
141	104
141	76
141	166
141	157
141	122
141	1
141	3
141	140
141	167
141	20
141	25
141	30
141	35
141	40
141	45
141	50
141	59
141	69
141	106
141	164
141	66
141	109
141	171
141	73
141	14
141	152
141	123
141	116
141	127
141	160
141	83
141	79
141	86
141	156
141	159
141	99
141	101
141	78
141	60
141	85
141	71
141	75
141	88
141	82
141	67
141	136
141	173
141	112
141	107
141	61
141	149
141	146
141	139
141	125
141	126
141	132
141	133
141	143
141	147
141	124
141	6
141	161
141	84
141	80
141	87
141	100
141	81
141	102
141	13
141	19
141	158
141	121
141	113
141	120
141	141
141	131
141	91
141	144
141	77
141	168
141	169
141	170
142	135
142	137
142	172
142	57
142	134
142	55
142	56
142	72
142	62
142	105
142	165
142	150
142	93
142	145
142	148
142	95
142	96
142	94
142	97
142	98
142	92
142	129
142	142
142	103
142	104
142	76
142	166
142	157
142	128
142	122
142	1
142	3
142	140
142	167
142	20
142	25
142	30
142	35
142	40
142	45
142	50
142	59
142	69
142	106
142	164
142	66
142	109
142	171
142	73
142	14
142	152
142	123
142	116
142	127
142	160
142	83
142	79
142	86
142	156
142	159
142	99
142	101
142	78
142	60
142	85
142	71
142	75
142	88
142	82
142	67
142	136
142	173
142	112
142	107
142	61
142	149
142	146
142	139
142	125
142	126
142	132
142	133
142	143
142	147
142	124
142	6
142	161
142	84
142	80
142	87
142	100
142	81
142	102
142	13
142	19
142	158
142	121
142	113
142	120
142	141
142	131
142	91
142	144
142	77
142	168
142	169
142	170
129	137
129	172
129	57
129	134
129	55
129	56
129	138
129	72
129	74
129	62
129	63
129	130
129	105
129	150
129	93
129	145
129	148
129	95
129	96
129	94
129	97
129	98
129	92
129	129
129	142
129	103
129	104
129	76
129	166
129	157
129	122
129	1
129	4
129	3
129	162
129	163
129	140
129	167
129	20
129	25
129	30
129	35
129	40
129	45
129	50
129	59
129	69
129	106
129	164
129	66
129	109
129	171
129	73
129	14
129	152
129	123
129	116
129	127
129	160
129	83
129	79
129	86
129	156
129	159
129	99
129	101
129	78
129	60
129	85
129	71
129	75
129	88
129	82
129	67
129	136
129	173
129	112
129	107
129	61
129	149
129	146
129	139
129	125
129	126
129	132
129	133
129	143
129	147
129	124
129	6
129	161
129	84
129	80
129	87
129	100
129	81
129	102
129	13
129	19
129	158
129	121
129	113
129	120
129	141
129	131
129	91
129	144
129	77
129	168
129	169
129	170
119	135
119	137
119	172
119	57
119	134
119	55
119	56
119	138
119	72
119	74
119	64
119	62
119	63
119	130
119	105
119	150
119	93
119	145
119	148
119	95
119	96
119	94
119	97
119	98
119	92
119	129
119	142
119	103
119	104
119	76
119	166
119	157
119	122
119	1
119	4
119	3
119	162
119	163
119	140
119	167
119	20
119	25
119	30
119	35
119	40
119	45
119	50
119	59
119	69
119	106
119	164
119	66
119	109
119	171
119	73
119	14
119	152
119	123
119	116
119	127
119	160
119	83
119	79
119	86
119	156
119	159
119	99
119	101
119	78
119	60
119	85
119	71
119	75
119	88
119	82
119	67
119	136
119	173
119	112
119	107
119	61
119	149
119	146
119	139
119	125
119	126
119	132
119	133
119	143
119	147
119	124
119	6
119	161
119	84
119	80
119	87
119	100
119	81
119	102
119	13
119	19
119	158
119	121
119	113
119	120
119	141
119	131
119	91
119	144
119	77
119	168
119	169
119	170
143	135
143	137
143	172
143	57
143	134
143	55
143	56
143	96
143	94
143	129
143	142
143	103
143	104
143	76
143	166
143	157
143	122
143	1
143	3
143	140
143	167
143	20
143	25
143	30
143	35
143	40
143	45
143	50
143	59
143	69
143	106
143	164
143	66
143	109
143	171
143	73
143	14
143	152
143	123
143	116
143	127
143	160
143	83
143	79
143	86
143	156
143	159
143	99
143	101
143	78
143	60
143	85
143	71
143	75
143	88
143	82
143	67
143	136
143	173
143	112
143	107
143	61
143	149
143	146
143	139
143	125
143	126
143	132
143	133
143	143
143	147
143	124
143	6
143	161
143	84
143	80
143	87
143	100
143	81
143	102
143	13
143	19
143	158
143	121
143	113
143	120
143	141
143	131
143	91
143	144
143	77
143	168
143	169
143	170
144	135
144	137
144	172
144	57
144	134
144	55
144	56
144	96
144	94
144	129
144	142
144	103
144	104
144	76
144	166
144	157
144	122
144	1
144	3
144	140
144	167
144	20
144	25
144	30
144	35
144	40
144	45
144	50
144	59
144	69
144	106
144	164
144	66
144	109
144	171
144	73
144	14
144	152
144	123
144	116
144	127
144	160
144	83
144	79
144	86
144	156
144	159
144	99
144	101
144	78
144	60
144	85
144	71
144	75
144	88
144	82
144	67
144	136
144	173
144	112
144	107
144	61
144	149
144	146
144	139
144	125
144	126
144	132
144	133
144	143
144	147
144	124
144	6
144	161
144	84
144	80
144	87
144	100
144	81
144	102
144	13
144	19
144	158
144	121
144	113
144	120
144	141
144	131
144	91
144	144
144	77
144	168
144	169
144	170
145	135
145	137
145	172
145	134
145	55
145	56
145	96
145	94
145	129
145	142
145	103
145	104
145	76
145	166
145	157
145	122
145	1
145	3
145	140
145	167
145	20
145	25
145	30
145	35
145	40
145	45
145	50
145	59
145	69
145	106
145	164
145	66
145	109
145	171
145	73
145	14
145	152
145	123
145	116
145	127
145	160
145	83
145	79
145	86
145	156
145	159
145	99
145	101
145	78
145	60
145	85
145	71
145	75
145	88
145	82
145	67
145	136
145	173
145	112
145	107
145	61
145	149
145	146
145	139
145	125
145	126
145	132
145	133
145	143
145	147
145	124
145	6
145	161
145	84
145	80
145	87
145	100
145	81
145	102
145	13
145	19
145	158
145	121
145	113
145	120
145	141
145	131
145	91
145	144
145	77
145	168
145	169
145	170
146	135
146	137
146	172
146	57
146	134
146	55
146	56
146	165
146	150
146	93
146	145
146	148
146	95
146	96
146	94
146	97
146	98
146	92
146	129
146	142
146	103
146	104
146	76
146	166
146	157
146	1
146	3
146	140
146	167
146	20
146	25
146	30
146	35
146	40
146	45
146	50
146	59
146	69
146	106
146	164
146	66
146	109
146	171
146	73
146	14
146	152
146	123
146	116
146	127
146	160
146	83
146	79
146	86
146	156
146	159
146	99
146	101
146	78
146	60
146	85
146	71
146	75
146	88
146	82
146	67
146	136
146	173
146	112
146	107
146	61
146	149
146	146
146	139
146	125
146	126
146	132
146	133
146	143
146	147
146	124
146	6
146	161
146	84
146	80
146	87
146	100
146	81
146	102
146	13
146	19
146	158
146	121
146	113
146	120
146	141
146	131
146	91
146	144
146	77
146	168
146	169
146	170
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY resource (id, resource_name) FROM stdin;
1	BPHTBINDEX
2	LoginAccess
3	SettingPemda
4	SettingKecamatan
5	SettingKelurahan
6	SettingPejabat
7	SettingNotaris
8	SettingJenisTransaksi
9	SettingTarifNpotkp
10	SettingHakTanah
11	SettingJenisKetetapan
12	SettingTarifBphtb
13	SettingUser
14	PendataanSSPD
15	PembayaranSPT
16	ValidasiSPT
17	VerifikasiSPT
18	CetakSSPD
19	CetakLaporan
20	Bpn
21	SettingPersyaratanTransaksi
22	SettingDokTanah
23	PelaporanNotaris
24	SettingHargaAcuan
25	PendataanSismiop
\.


--
-- Name: resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_id_seq', 1, false);


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY role (rid, role_name, status) FROM stdin;
1	Administrator	Active                                                                                                                                                                                                                                                         
2	Pegawai	Active                                                                                                                                                                                                                                                         
3	Notaris	Active                                                                                                                                                                                                                                                         
4	Bank	Active                                                                                                                                                                                                                                                         
5	BPN	Active                                                                                                                                                                                                                                                         
\.


--
-- Name: role_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('role_permission_id_seq', 1, false);


--
-- Name: role_rid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('role_rid_seq', 1, false);


--
-- Data for Name: s_acuan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_acuan (s_idacuan, s_kd_propinsi, s_kd_dati2, s_kd_kecamatan, s_kd_kelurahan, s_kd_blok, s_permetertanah) FROM stdin;
\.


--
-- Name: s_acuan_s_idacuan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_acuan_s_idacuan_seq', 8, false);


--
-- Data for Name: s_jenisdoktanah; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_jenisdoktanah (s_iddoktanah, s_namadoktanah) FROM stdin;
1	Sertifikat
2	Warkah
3	Girik
4	Letter C
5	Akta 
6	dan lain-lain
\.


--
-- Name: s_jenisdoktanah_s_iddoktanah_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_jenisdoktanah_s_iddoktanah_seq', 6, true);


--
-- Data for Name: s_jenishaktanah; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_jenishaktanah (s_idhaktanah, s_kodehaktanah, s_namahaktanah) FROM stdin;
1	01	Hak Milik
2	02	Hak Guna Usaha
3	03	Hak Guna Bangunan
4	04	Hak Pakai
5	05	Hak Milik Atas Satuan Rumah
6	06	Hak Pengelolaan
7	07	dan lain-lain
\.


--
-- Name: s_jenishaktanah_s_idjenishaktanah_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_jenishaktanah_s_idjenishaktanah_seq', 7, true);


--
-- Data for Name: s_jenisketetapan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_jenisketetapan (s_idjenisketetapan, s_namajenisketetapan, s_namasingkatjenisketetapan) FROM stdin;
\.


--
-- Name: s_jenisketetapan_s_idjenisketetapan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_jenisketetapan_s_idjenisketetapan_seq', 1, false);


--
-- Data for Name: s_jenistransaksi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_jenistransaksi (s_idjenistransaksi, s_kodejenistransaksi, s_namajenistransaksi) FROM stdin;
1	01	Jual Beli
2	02	Tukar Menukar
3	03	Hibah
4	04	Hibah Wasiat
5	05	Waris
6	06	Pemasukan Dalam Perseroan atau Badan Hukum Lainnya
7	07	Pemisahan Hak yang Mengakibatkan Peralihan
8	08	Penunjukan Pembeli Dalam Lelang
9	09	Pelaksanaan Putusan Hakim yang Mempunyai Kekuatan Hukum Tetap
10	10	Penggabungan Usaha
11	11	Peleburan Usaha
12	12	Pemekaran Usaha
13	13	Hadiah
15	14	Pemberian Hak Baru Sebagai Kelanjutan dari Pelepasan Hak
16	15	Pemberian Hak Baru Diluar Pelepasan Hak
\.


--
-- Name: s_jenistransaksi_s_idjenistransaksi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_jenistransaksi_s_idjenistransaksi_seq', 16, true);


--
-- Data for Name: s_kecamatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_kecamatan (s_idkecamatan, s_kodekecamatan, s_namakecamatan) FROM stdin;
\.


--
-- Name: s_kecamatan_s_idkecamatan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_kecamatan_s_idkecamatan_seq', 1, false);


--
-- Data for Name: s_kelurahan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_kelurahan (s_idkelurahan, s_idkecamatan, s_kodekelurahan, s_namakelurahan) FROM stdin;
\.


--
-- Name: s_kelurahan_s_idkelurahan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_kelurahan_s_idkelurahan_seq', 1, false);


--
-- Data for Name: s_koderekening; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_koderekening (s_korekid, s_korektipe, s_korekkelompok, s_korekjenis, s_korekobjek, s_korekrincian, s_korekrinciansub, s_koreknama, s_korekketerangan) FROM stdin;
1	4	1	1	11			Bea Perolehan Hak Atas Tanah dan Bangunan (BPHTB) - LRA Bea Perolehan Hak Atas Tanah dan Bangunan (BPHTB) - LRA	
2	4	1	1	11	01		BPHTB	
3	4	1	7	11	01		Denda BPHTB	
4	4	1	7	11	02		Sanksi BPHTB	
\.


--
-- Name: s_koderekening_s_korekid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_koderekening_s_korekid_seq', 1, false);


--
-- Data for Name: s_notaris; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_notaris (s_idnotaris, s_namanotaris, s_alamatnotaris, s_kodenotaris, s_sknotaris, s_tgl1notaris, s_tgl2notaris, s_statusnotaris) FROM stdin;
37	Nia Nurdiana, SH,M.Kn	Batujajar Regency II D Blok AD-30 RT. 05 RW. 15 Ds. Laksanamekar Kec. Padalarang Kab. Bandung Barat. 08122324411	-	223/KEP-17.3/X/2014	1970-01-01	1970-01-01	1
4	Anna Yulianti, Sh, Mkn	Awani Residence Blok. B 19, Gadobangkong, Telp. (022) 87774576. (022) 87774567	-	9-XV11-PPAT-2008	2008-01-01	2015-12-31	1
2	Indirawati Hayuningtyas SH	Jl. Raya Padalarang No. 510 Kab. Bandung Barat. (022)6809865	-	17/XI/1999	1999-11-17	2015-12-17	1
3	Detty Triesnawaty	Komplek Cimareme Indah Ruko A1 No. 12A Cimareme Kab. Bandung Barat. (022)6868683- (022)91257288	-	SK.3-IX-2001	2001-01-18	2015-01-18	1
6	Harry Teddy Suganda SH	Jl. Raya Purwakarta No. 79 Padalarang Kab. Bandung Barat. (022)6808454	-	3-XI-1996	1996-03-04	2015-03-04	1
7	Julia Nurwulan Sari Atuty, SH, M. Kn	Komplek Perumahan Cimareme Indah Ruko A.1 No. 4 Cimareme	-	803/Kep17.3/X/2013	2013-10-21	2015-12-31	1
8	Nining Sutarni	Jl. Grand Hotel No.5 Rt.003 Rw. 005, Desa Lembang, Kecamatan Lemmbang No. Telp (022) 2786862 - 081321111647	-	223/KEP-17.3/X/2014	2014-10-17	2015-12-02	1
5	Tuti Mulyati SH	Permata Cimahi Blok C2 No. 21 Ds. Tanimulya Kec. Ngamprah Kab. Bandung Barat. (022) 6624041	-	13-X.A-2005	1970-01-01	1970-01-01	1
9	Mariana Chandra,SH,M.Kn	Setraduta Raya L3 No.8A Kab. Bandung Barat. (022)82025604	-	9-XVII-PPAT-2008	1970-01-01	1970-01-01	1
10	Ivone Nurul Fuadah,SH,M.Kn	Jl. Okulasi No. 24 Komplek Tanimulya Indah Kec. Ngamprah Kab. Bandung Barat. (022) 88886906	-	801/kep-17.3/x/2013	1970-01-01	1970-01-01	1
11	Dedi Priadi, SH, M.Kn	Jl. Raya Cimareme Batujajar No. 34 Laksanamekar Kab. Bandung Barat. 085220074167	-	144/Kep-17.3/III/2013	2013-03-04	1970-01-01	1
12	Ukaesih, SH, M.Kn	Komplek Permata Cimahi 2 Blok N 19/8 RT/RW 03/24 Tanimulya Kab. Bandung Barat. 081320745335	-	156/Kep-17.3/VII/2014	1970-01-01	1970-01-01	1
13	Cahya Ningsih, SH	Villa Triniti No. 29 Rt. 01/ Rw.03 Cigugurgirang Parongpong Kab. Bandung Barat. 08122309195	-	9-XVII-PPAT-2008	1970-01-01	1970-01-01	1
15	Detti Dharmayanti, SH	Jl. Cijeungjing No.13 RT.01 RW. 16 Ds. Kertamulya Kec. Padalarang Kab. Bandung Barat. 085659325979	-	I-XVII-PPAT-2009	1970-01-01	1970-01-01	1
14	Susi Susanti, SH, M.Kn	Jl. Raya Batujajar No. 266 Padalarang Kab. Bandung Barat. 08122402141	-	223/Kep-17.3/X/2014	2014-10-17	1970-01-01	1
16	Olivia Maharani, SH,M.Kn	Jl. Pita Niaga No. 31 Lantai 2 Ruko Tatar Pitaloka Kota Baru Parahyangan Padalarang Kab. Bandung Barat. 081573926699	-	912/Kep-300-17.3/XI/2013	2013-11-20	1970-01-01	1
17	Dermawan Purba, SH, M.Kn	Graha Bukit Raya 2 Blok I-1 No.2 Ds. Cilame Kec. Ngamprah Kab. Bandung Barat. (022) 86618526	-	223/Kep-17.3/X/2014	1970-01-01	1970-01-01	1
18	Leni Mariana, SH, M.Kn	Kp. Lembur Panjang Jl. Cihanjuang 201 Kab. Bandung Barat. (022)6610942	-	802/Kep-17.3/X/2013	1970-01-01	1970-01-01	1
19	Hj. Rosmarliana  SH	Jl. Raya Lembang Km 14.3 No. 153 Kab. Bandung Barat. (022)2784628/0811221563	-	104/KEP-17.3/III/2011	1970-01-01	1970-01-01	1
20	Dr. Hj. Sri Ahyani, SH, M.Kn	Jl. Raya Ciburuy 193 Padalarang Kab. Bandung Barat. (022) 6807233	-	5-XI-1996	1996-06-03	1970-01-01	1
21	Edymar Hutajulu,SH	Jl. Raya Gadobangkong No.122 Ds. Gadobangkong Kec. Ngamprah Kab. Bandung Barat. (022)6651212/(022) 6646586	-	11-XI-2000	2000-04-11	1970-01-01	1
22	Yulia Hidayat, SH,M.Kn	Ruko Cimerang Bisnis Center Unit No. 7 Ds. Cimerang Kec. Padalarang Kab. Bandung Barat. (022) 86861177/081322552055	-	912/KEP-17.3/XI/2013	2013-11-20	1970-01-01	1
23	Rani Yuniar, SH,M.Kn	Komplek Cilame Permai Jl. Artileri Blok C-24 Kab. Bandung Barat . 082126826659	-	223/KEP-17.3/X/2014	1970-01-01	1970-01-01	1
24	Novrita, SH	Perumahan Permata Cimahi Jl. Zamrud V Blok D II/12 Kab. Bandung Barat. (022) 651381/08122053486	-	31-XI-2000	2000-10-06	1970-01-01	1
25	Yuyun Mintarsih,SH,M.Kn	Jl. Raya Batujajar No. 58 Kab. Bandung Barat. 081214540410/(022)92030231	-	912/KEP-17.3/XI/2013	1970-01-01	1970-01-01	1
26	Lenny Farida, SH,M.Kn	The Awani Residence B 18 Jl. Raya Gadobangkong - Ngamprah Kab. Bandung Barat. (022) 92054667/085100195959	-	803/KEP-17.3/X/2013	2013-10-21	1970-01-01	1
27	Nunung Nurhayati, SH	Komp. Setra Duta Cipaganti Blok N No. 31B, Sariwangi Kec. Parongpong Kab. Bandung Barat. (022) 2001501	-	25-IX-2001	2001-12-31	1970-01-01	1
28	R.A Nukantini Putri Parincha,SH,M.Kn	Komplek PPR ITB Kav. F-5 Dago Bengkok Ds. Mekarwangi Kab. Bandung Barat. (022) 92467066	-	1-XVII-PPAT-2009	2009-02-12	1970-01-01	1
29	Zairani Setiawaty Effendi, SH,M.Kn	Jl. Terusan Sersan Bajuri Atas No. 18 Cihideung Kec. Parongpong Kab. Bandung Barat. 08122177577	-	9-XVII-PPAT-2008	2008-09-01	1970-01-01	1
30	Titin Nurnaeni, SH,M.Kn	Permata Cimahi Jl. Rubi Raya Blok R3 No. 5 Kab. Bandung Barat. (022) 6623206	-	803/KEP-17.3/X/2013	1970-01-01	1970-01-01	1
31	Sidharwati Tri Marlinasari, SH	Jl. Gunung Rahayu II Komp. Gunung Rahayu Regency No. 10 RT.03 RW.10 Kab. Bandung Barat. 08122019918	-	223/KEP-17.3/X/2014	1970-01-01	1970-01-01	1
32	 Henry Samudra Gamal A.M, SH,M.Kn	The Awani Residence Blok A-16 Ngamprah Kab. Bandung Barat. 081214438577	-	223/KEP/-17.3/X/2014	2014-10-17	1970-01-01	1
33	Dr. Amelia Nur Widyanti, SH, M.Kn	Jl. Raya Caringin No. 367 Padalarang Kab. Bandung Barat 40533. 08161421438	-	912/KEP/17.3/XI/2013	1970-01-01	1970-01-01	1
34	Sonny Ario Sulaksono,SH,M.Kn	Jl. Raya Batujajar No. 96 Kp. Cikandang Ds. Cimareme Kab. Bandung Barat. 081394861974	-	223/KEP-17.3/X/2014	1970-01-01	1970-01-01	1
35	Novie Aprianti,SH,M.Kn	Jl. Rancabali No. 673 Kab. Bandung Barat. 081393003400	-	803/KEP-17.3/X/2013	2013-10-21	1970-01-01	1
36	Fransiska veenbrink,SH,M.Kn	Jl. Batujajar No. 153 Ciampel- Padalarang Kab. Bandung Barat. 082214910257	-	223/KEP-17.3/X/2014	1970-01-01	1970-01-01	1
38	Tatan Sutanto Hermawanto, SH,M.Kn	Jl. Ciwaruga No. 10 Ds. Ciwaruga Kec. Parongpong Kab. Bandung Barat. (022) 2008215	-	803/KEP-17.3/X/2013	1970-01-01	1970-01-01	1
39	Albertus Wahyu Agung Prabowo, SH, M.Kn	Komp. Perumahan Cimareme Indah Blok A1 No. 37 Jl. Raya Cimareme Padalarang Kab. Bandung Barat. 0811213255	-	9/KEP-17.3/I/2015	2015-01-14	1970-01-01	1
40	Pemalang,SH,M.Kn	Jl. Raya Batujajar No. 108 Cimareme Ngamprah Kab. Bandung Barat. 087880442123	-	912/KEP-17.3/XI/2013	1970-01-01	1970-01-01	1
41	Desita Afianti,SH,M.Kn	Perumahan Cimareme Indah Blok C 1 No. 14 Kab. Bandung Barat. (022) 86862272/085100493717	-	800/KEP-7.3/X/2013	1970-01-01	1970-01-01	1
42	Gunadi Sumantri,SH,M.Kn	Jl. Cihanjuang- Cibaligo No. 80 RT.03 RW. 02 Parongpong Kab. Bandung Barat. 082317656989	-	05/KEP-17.3/1/2012	1970-01-01	1970-01-01	1
43	Lita Deriana, SH	Jl. Sariwangi No. 68A Kab. Bandung Barat. 08164867424	-	9-XI-1998	1998-06-04	1970-01-01	1
44	Tommy Herfindo,SE,SH,M.Kn	Jl. Ciwaruga Jaya No.4 Ciwaruga Kec. Parongpong Kab. Bandung Barat. 08156080749	-	223/KEP-17.3/X/2014	1970-01-01	1970-01-01	1
45	Sinta Rusmalia Sari, SH,M.Kn	Puri Cipageran Indah 2 Blok A.12 No. 3 Ds. Tanimulya Kec. Ngamprah Kab. Bandung Barat. 085624041460	-	803/KEP.17.3/X/2013	1970-01-01	1970-01-01	1
46	Drs. Maryoto,SH	Jl. Raya Gadobangkong No. 60 Ngamprah Kab. Bandung Barat. (022) 6626600/6647825	-	3-XA-2003	2003-02-27	1970-01-01	1
47	Untung,SH,M.Kn	Jl. Maribaya No. 52 Ds. Kayuambon Kec. Lembang Kab. Bandung Barat. 081573049591	-	9-XVII-PPAT-2008	1970-01-01	1970-01-01	1
48	Hendarin, SH,M.Kn	Jl. Raya Batujajar No. 33 Padalarang Kab. Bandung Barat. (022) 76258617/08122378017	-	802/KEP-17.3/2013	2013-10-21	1970-01-01	1
49	Nelsy Suryaningsih,SH,M.Kn	Graha Bukit Raya 1 Blok F.8 No.1 RT.10 RW. 21 Ds. Cilame Kec. Ngamprah Kab. Bandung Barat. 082214252601	-	223/KEP-17.3/X/2014	2014-10-17	1970-01-01	1
54	Desiyana Chafsah SH	Ruko Centra Lembang Blok A. 8 Jl. Maribaya No. 1 Lembang Kab. Bandung Barat. (022) 2784598/0811205221	-	33-XI-2000	2000-10-18	1970-01-01	1
51	Hj. Eti Nurhayati, SH 	Jl. Raya Lembang No. 360 Kab. Bandung Barat. (022) 2788423	-	25-IX-2001	1970-01-01	1970-01-01	1
50	Andreani, SH	Jl. Raya Batujajar No. 2 KM 2 Padalarang Kab. Bandung Barat. (022) 6868634	-	9-XVII-PPAT-2008	1970-01-01	1970-01-01	1
53	Mila Kumari,SH,M.Kn	Jl. Raya Cimareme No. 199 Kec. Ngamprah Kab. Bandung Barat. (022) 87806354/081320000629	-	802/KEP-17.3/X/2013	1970-01-01	1970-01-01	1
52	Tatti Muktiati Hidayat, SH	Jl. Caringin 359 Padalarang Ds. Kertajaya Kec. Padalarang Kab. Bandung Barat. (022) 6868067	-	25-IX-2001	2001-12-31	1970-01-01	1
55	Anne Gunadi Martono Widjojo, SH,M.Kn	Jl. Raya Gadobangkong 158 Ngamprah Kab. Bandung Barat. (022) 6621052	-	SK.3-IX-2001	2001-01-18	1970-01-01	1
56	 Ashari Koerniawan, SH	Perumahan Awani Blok A No. 11 Kab. Bandung Barat. (022) 87800870	-	912/KEP-17.3/XI/2013	1970-01-01	1970-01-01	1
57	Emma Ramdaniah, SH	Jl. Dipalaya II No. 3 Kab. Bandung Barat. 081320131307	-	104/KEP-17.3/III/2011	2011-03-21	1970-01-01	1
58	Gandhi Masya Kusumanegara, SH	Terusan Gegerkalong Hilir Jl. Abah Muhalim No. 6 Ciwaruga Kab. Bandung Barat. (022) 91122666-92650666	-	9-XVII-PPAT-2008	2008-09-01	1970-01-01	1
59	Yenny Dewi Martini, SH	Komp. Taman Cihanjuang No. 3 Parongpong Kab. Bandung Barat. (022) 6611010-0811232091	-	9-XVII-PPAT-2008	2008-09-01	1970-01-01	1
60	Zulhijah Arni, SH,M.Kn	Jl. Gadobangkong No . 46 Kab. Bandung Barat. (022) 6627266	-	5/KEP-17.3/I/2012	1970-01-01	1970-01-01	1
61	Maya Srigarnera,SH,M.Kn	Jl. Raya Lembang No. 144 Lembang Kab. Bandung Barat. (022) 2787211-2786402	-	1-XVII-PPAT-2009	1970-01-01	1970-01-01	1
62	Muliaty, SH	Jl. Raya Cimareme No. 265 Ngamprah Kab. Bandung Barat. (022)70053530-6612297	-	3-XA-2005	2005-02-11	1970-01-01	1
63	Anniesa, SH	Ruko Wangsa Niaga Kulon No. 3 Kota Baru Parahyangan Padalarang Kab. Bandung Barat. (022) 6803024	-	803/KEP-17.3/X/2013	1970-01-01	1970-01-01	1
64	Gitta Puspitasari,SH,M.Kn	Ruko Wangsa Niga Kulon No. 3 Kota Baru Parahyangan Padalarang Kab. Bandung Barat. (022) 6803024	-	223/KEP-17.3/X/2014	1970-01-01	1970-01-01	1
65	Delila Kania,SH,Sp.1,M.Pd	Jl.Smp No. 18 Batujajar Barat Kab. Bandung Barat. 085107921224	-	224-XVII-2006	2006-12-18	1970-01-01	1
66	Sitti Rahayu Kaniawaty, SH 	Jl. Raya Lembang No. 118 Lembang Kab. Bandung Barat	-	9-XVII-PPAT-2008	2008-09-01	1970-01-01	1
67	Anastasia Zaidulfar, SH	Tidak ada	-	Tidak ada	1970-01-01	1970-01-01	1
68	Admininistrator	DPPKAD BPHTB KBB	-	-	1970-01-01	1970-01-01	1
69	Camat Batujajar	Jl. Raya Batujajar No. 145	-	-	1970-01-01	1970-01-01	1
70	Sri Hendarti, SH	Tidak ada	-	-	1970-01-01	1970-01-01	1
71	Elsa, SH	Tidak ada	-	-	1970-01-01	1970-01-01	1
72	Diah Suryadi, SH	Tidak ada	-	-	1970-01-01	1970-01-01	1
74	Camat Padalarang	Tidak Ada	-	-	1970-01-01	1970-01-01	1
75	Ani Nuryani, SH	Tidak Ada	-	-	1970-01-01	1970-01-01	1
76	Camat Cikalongwetan	Tidak Ada	-	-	1970-01-01	1970-01-01	1
77	Christian Arjanto, SH,M.Kn	Jl. Pita Niaga No. 9 Tatar Pitaloka KBP Padalarang, Kab. Bandung Barat. 022-95953030 / 081285899777	-	912/KEP-17.3/XI/2013	2013-11-20	1970-01-01	1
78	Dyah Astuti P ,SH	Tidak Ada	-	-	1970-01-01	1970-01-01	1
79	Nunung Feti Matul, SH	Tidak Ada	-	-	1970-01-01	1970-01-01	1
80	Yukasanu S SH	Tidak Ada	-	-	1970-01-01	1970-01-01	1
81	Camat Cihampelas	Tidak Ada	-	-	1970-01-01	1970-01-01	1
82	Camat Cisarua	Tidak Ada	-	-	1970-01-01	1970-01-01	1
83	Evita Anggraeni, SH	Tidak Ada	-	-	1970-01-01	1970-01-01	1
84	Camat Parongpong	Tidak Ada	-	-	2016-01-01	2016-01-02	1
85	Camat Lembang	Tidak Ada	-	-	2016-01-01	2016-01-01	1
86	Camat Cipatat	Tidak Ada	-	-	1970-01-01	1970-01-01	1
87	Camat Ngamprah	Tidak Ada	-	-	1970-01-01	1970-01-01	1
89	Kadar Solihat, SH	Tidak Ada	-	-	1970-01-01	1970-01-01	1
92	Toni Somantri, SH	Tidak Ada	-	-	1970-01-01	1970-01-01	1
93	Thasya Variella, SH,M.Kn	Jl. Gadobangkong No. 171 Kab. Bandung Barat. (022) 87774656	-	-	1970-01-01	1970-01-01	1
94	Wara, SH,M.Kn	Jl. Cihanjuang Atas No. 49 Kab. Bandung Barat. (022) 86618733/082121979792	-	-	1970-01-01	1970-01-01	1
95	Kantor Pelayanan Kekayaan Negara  Dan Lelang 	Tidak Ada	-	-	1970-01-01	1970-01-01	1
96	M. Rizqi Febrian,SH,M.Kn	Tidak Ada	-	-	1970-01-01	1970-01-01	1
97	Camat Saguling	Tidak Ada	-	-	1970-01-01	1970-01-01	1
98	Cut Sari Luffiana Dewi Lutfi ,SH,M.KN	JL. G.A Manulang - Komp. Bentang Padalarang Regency Blok F3 No. 3	-	912/KEP-17.3/XI/2013	2013-11-20	1970-01-01	1
90	Hermain Pidel, SH	Jl. Raya Rajamandala No. 442 Kec. Cipatat Kab. Bandung Barat. (022)70744581-08122332541	-	4-X-2002	2002-04-25	1970-01-01	1
73	H. Iwa Rukiwa, SH	JL. Raya Padalarang No. 465 D. (022) 6808324	-	I-XVII-PPAT-2009	1970-01-01	1970-01-01	1
99	Andri Zarman, SH,M.Kn	Tidak Ada	-	-	1970-01-01	1970-01-01	1
100	Irma Rismasari, SH	JL. Raya Lembang No. 208 Kab. Bandung Barat . (022)2784699-082214444123	-	155/KEP-17.3/VII/2014	2014-07-08	1970-01-01	1
101	Gira Mayang Septantia, SH,M.KN	Perumahan Lembah Teratai Blok E1 NO. 2 Desa. Gadobangkong  Kec. Ngamprah KBB. (022) 87774739-08562249913	-	-	1970-01-01	1970-01-01	1
102	Donna Irene Simamora SH	Tidak Ada	-	-	1970-01-01	1970-01-01	1
103	Ribi Azwar, S.H, M.Kn	Jl. Raya Cimareme No.354, Kabupaten Bandung Barat	-	5/KEP-17.3/1/2012	2012-01-01	2016-12-31	1
104	Irra Melyaningsih, SH,M.Kn	Tidak Ada	-	-	1970-01-01	1970-01-01	1
105	Ririn Rismawanti, SH	Tidak Ada	-	-	1970-01-01	1970-01-01	1
106	Iman Prapda, SH	Tidak Ada	-	-	1970-01-01	1970-01-01	1
107	Pinta Rahmadani, S.H, M.Kn	JL. Wangsa Niaga Wetan No.1, Kotabaru Parahyangan	-	AHU-292.AH.02.01	2011-05-05	2012-05-05	1
\.


--
-- Name: s_notaris_s_idnotaris_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_notaris_s_idnotaris_seq', 107, true);


--
-- Data for Name: s_pejabat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_pejabat (s_idpejabat, s_namapejabat, s_jabatanpejabat, s_nippejabat, s_golonganpejabat) FROM stdin;
9	Dewi Kaniaty	Kasi Pengolahan Data dan Informasi 	196901051996012001	8
8	H. Deni Herawan, SE,M.Si	Kepada Bidang PBB & BPHTB	196008231986031009	10
10	Sindi Aliandi Wijaya	Koordinator Operator BPHTB	198710072011012005	4
11	Rudimansyah ST	Operator BPHTB 1	PTT	14
12	R. Sheyra Dibba Sunda Manik,A.Md	Operator BPHTB 2	PTT	14
13	Dea Sopiani	Operator BPHTB 3	PTT	14
\.


--
-- Name: s_pejabat_s_idpejabat_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_pejabat_s_idpejabat_seq', 13, true);


--
-- Data for Name: s_pemda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_pemda (s_idpemda, s_namaprov, s_namakabkot, s_namaibukotakabkot, s_kodeprovinsi, s_kodekabkot, s_namainstansi, s_namasingkatinstansi, s_alamatinstansi, s_notelinstansi, s_namabank, s_norekbank, s_logo, s_namacabang, s_kodecabang, s_kodepos) FROM stdin;
4	Jawa Barat	Kabupaten Bandung Barat	Ngamprah	32	06	Dinas Pendapatan, Pengelolaan Keuangan & Aset Daerah	DPPKAD	Jl. Raya Padalarang- Cisarua KM.2	(022)82783570	Bank Jabar	2001001661	public/upload/logo_bandungbarat.png	Singkawang	-	73123
\.


--
-- Name: s_pemda_s_idpemda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_pemda_s_idpemda_seq', 1, false);


--
-- Data for Name: s_peraturan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_peraturan (s_idperaturan, s_teksperaturan, s_kodeperaturan) FROM stdin;
1	Pasal 12 ayat (1) Peraturan Daerah Kabupaten Bandung Barat Nomor 7 Tahun 2010 tentang Bea Perolehan Hak Atas Tanah dan Bangunan	3
2	Pasal 12 ayat (1) Peraturan Daerah Kabupaten Bandung Barat Nomor 7 Tahun 2010 tentang Bea Perolehan Hak Atas Tanah dan Bangunan	4
\.


--
-- Name: s_peraturan_s_idperaturan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_peraturan_s_idperaturan_seq', 1, false);


--
-- Data for Name: s_persyaratan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_persyaratan (s_idpersyaratan, s_idjenistransaksi, s_namapersyaratan, "order") FROM stdin;
1	1	KTP Pembeli/Penjual	\N
2	1	Kartu Keluarga	\N
3	1	Akta Jual Beli (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)	\N
4	1	Bukti Kepemilikan (Sertifikat/Nomor Bukti Kepemilikan)	\N
5	1	SPPT PBB Tahun Terakhir	\N
6	1	Bukti-bukti lainnya yang dapat dijadikan dasar perhitungan BPHTB	\N
7	2	KTP Penerima Hak Tukar/Pemberi Hak Tukar	\N
8	2	Kartu Keluarga	\N
9	2	Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)	\N
10	2	Bukti Kepemilikan (Sertifikat, Warkah)	\N
11	2	SPPT PBB Tahun Terakhir	\N
12	2	Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB	\N
13	3	KTP Penerima Hibah/Pemberi Hibah	\N
14	3	Kartu Keluarga	\N
15	3	Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)	\N
16	3	Bukti Kepemilikan (Sertifikat, Warkah)	\N
17	3	SPPT PBB Tahun Terakhir	\N
18	3	Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB	\N
19	4	KTP Penerima Hibah/Pemberi Hibah	\N
20	4	Kartu Keluarga	\N
21	4	Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)	\N
22	4	Bukti Kepemilikan (Sertifikat, Warkah)	\N
23	4	SPPT PBB Tahun Terakhir	\N
24	4	Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB	\N
25	5	KTP Penerima Hak Waris/Pewaris	\N
26	5	Kartu Keluarga	\N
27	5	Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)	\N
28	5	Bukti Kepemilikan (Sertifikat, Warkah)	\N
29	5	Bukti Waris	\N
30	5	SPPT PBB Tahun Terakhir	\N
31	5	Bukti-bukti lainnya yang dapat dijadikan dasar perhitungan BPHTB	\N
32	6	KTP	\N
33	6	Kartu Keluarga	\N
34	6	Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)	\N
35	6	Bukti Kepemilikan (Sertifikat, Warkah)	\N
36	6	SPPT PBB Tahun Terakhir	\N
37	6	Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB	\N
38	7	KTP	\N
39	7	Kartu Keluarga	\N
40	7	Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)	\N
41	7	Bukti Kepemilikan (Sertifikat, Warkah)	\N
42	7	SPPT PBB Tahun Terakhir	\N
43	7	Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB	\N
45	8	Kartu Keluarga	\N
47	8	Bukti Kepemilikan (Sertifikat, Warkah)	\N
48	8	SPPT PBB Tahun Terakhir	\N
49	8	Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB	\N
50	9	KTP	\N
51	9	Kartu Keluarga	\N
52	9	Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)	\N
53	9	Bukti Kepemilikan (Sertifikat, Warkah)	\N
54	9	SPPT PBB Tahun Terakhir	\N
55	9	Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB	\N
56	10	KTP	\N
57	10	Kartu Keluarga	\N
58	10	Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)	\N
59	10	Bukti Kepemilikan (Sertifikat, Warkah)	\N
60	10	SPPT PBB Tahun Terakhir	\N
61	10	Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB	\N
62	11	KTP	\N
63	11	Kartu Keluarga	\N
64	11	Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)	\N
65	11	Bukti Kepemilikan (Sertifikat, Warkah)	\N
66	11	SPPT PBB Tahun Terakhir	\N
67	11	Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB	\N
68	12	KTP	\N
69	12	Kartu Keluarga	\N
70	12	Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)	\N
71	12	Bukti Kepemilikan (Sertifikat, Warkah)	\N
72	12	SPPT PBB Tahun Terakhir	\N
73	12	Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB	\N
74	13	KTP Penerima Hadiah/Pemberi Hadiah	\N
75	13	Kartu Keluarga	\N
76	13	Akta (apabila sudah diaktakan/Sertifikat/Warkah/Girik/Letter C)	\N
77	13	Bukti Kepemilikan (Sertifikat, Warkah)	\N
78	13	SPPT PBB Tahun Terakhir	\N
79	13	Bukti-bukti lainnya yang dapat dijadikan perhitungan BPHTB	\N
46	8	Risalah Lelang	\N
44	8	KTP	\N
80	15	KTP	\N
81	15	Kartu Keluarga	\N
82	15	Akta(akta apabila sudah di aktakan/Sertifikat/Warkah/Girik/LeterC)	\N
83	15	SPPT PBB Tahun Terakhir	\N
84	15	Bukti-bukti lainnya 	\N
86	16	Kartu Keluarga	\N
87	16	Akta(akta apabila sudah di aktakan/Sertifikat/Warkah/Girik/LeterC)	\N
88	16	SPPT PBB Tahun Terakhir	\N
85	16	KTP	\N
89	16	Bukti-bukti lainnya 	\N
\.


--
-- Name: s_persyaratan_s_idpersyaratan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_persyaratan_s_idpersyaratan_seq', 89, true);


--
-- Data for Name: s_presentase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_presentase (s_idpresentase, s_presentase, s_keterangan, s_presentasemin, warna) FROM stdin;
1	50	Tidak Wajar	0	red
2	75	Kurang Wajar	51	yellow
3	100	Wajar	76	green
\.


--
-- Name: s_presentase_s_idpresentase_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_presentase_s_idpresentase_seq', 1, false);


--
-- Data for Name: s_tarifbphtb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tarifbphtb (s_idtarifbphtb, s_tarifbphtb, s_dasarhukumtarifbphtb, s_tanggaltarifbphtb, s_statustarifbphtb) FROM stdin;
2	5	Dasar Hukum	2014-06-06	1
\.


--
-- Name: s_tarifbphtb_s_idtarifbphtb_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_tarifbphtb_s_idtarifbphtb_seq', 3, false);


--
-- Data for Name: s_tarifnpoptkp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tarifnpoptkp (s_idtarifnpotkp, s_idjenistransaksinpotkp, s_tarifnpotkp, s_dasarhukumnpotkp, s_statusnpotkp, s_tarifnpotkptambahan, s_tarifnpotkptahunajb1, s_tarifnpotkptahunajb2) FROM stdin;
16	1	20000000	Dasar Hukum	1	\N	2010	2010
17	2	20000000	Dasar Hukum	1	\N	2010	2010
18	3	20000000	Dasar Hukum	1	\N	2010	2010
19	4	20000000	Dasar Hukum	1	\N	2010	2010
20	5	20000000	Dasar Hukum	1	\N	2010	2010
21	6	20000000	Dasar Hukum	1	\N	2010	2010
22	7	20000000	Dasar Hukum	1	\N	2010	2010
23	8	20000000	Dasar Hukum	1	\N	2010	2010
24	9	20000000	Dasar Hukum	1	\N	2010	2010
25	10	20000000	Dasar Hukum	1	\N	2010	2010
26	11	20000000	Dasar Hukum	1	\N	2010	2010
27	12	20000000	Dasar Hukum	1	\N	2010	2010
28	13	20000000	Dasar Hukum	1	\N	2010	2010
29	2	30000000	Dasar Hukum	1	\N	2009	2009
30	3	30000000	Dasar Hukum	1	\N	2009	2009
31	4	30000000	Dasar Hukum	1	\N	2009	2009
32	5	30000000	Dasar Hukum	1	\N	2009	2009
33	6	30000000	Dasar Hukum	1	\N	2009	2009
34	7	30000000	Dasar Hukum	1	\N	2009	2009
35	8	30000000	Dasar Hukum	1	\N	2009	2009
36	9	30000000	Dasar Hukum	1	\N	2009	2009
37	10	30000000	Dasar Hukum	1	\N	2009	2009
38	11	30000000	Dasar Hukum	1	\N	2009	2009
39	12	30000000	Dasar Hukum	1	\N	2009	2009
40	13	30000000	Dasar Hukum	1	\N	2009	2009
41	1	30000000	Dasar Hukum	1	\N	2009	2009
42	2	20000000	Dasar Hukum	1	\N	1997	2008
43	3	20000000	Dasar Hukum	1	\N	1997	2008
44	4	20000000	Dasar Hukum	1	\N	1997	2008
45	5	20000000	Dasar Hukum	1	\N	1997	2008
46	6	20000000	Dasar Hukum	1	\N	1997	2008
47	7	20000000	Dasar Hukum	1	\N	1997	2008
48	8	20000000	Dasar Hukum	1	\N	1997	2008
49	9	20000000	Dasar Hukum	1	\N	1997	2008
50	10	20000000	Dasar Hukum	1	\N	1997	2008
51	11	20000000	Dasar Hukum	1	\N	1997	2008
52	12	20000000	Dasar Hukum	1	\N	1997	2008
53	13	20000000	Dasar Hukum	1	\N	1997	2008
54	1	20000000	Dasar Hukum	1	\N	1997	2008
1	1	60000000	Dasar Hukum	1	0	2011	2016
2	2	60000000	Dasar Hukum	1	0	2011	2016
3	3	60000000	Dasar Hukum	1	0	2011	2016
4	4	60000000	Dasar Hukum	1	300000000	2011	2016
5	5	60000000	Dasar Hukum	1	300000000	2011	2016
6	6	60000000	Dasar Hukum	1	0	2011	2016
7	7	60000000	Dasar Hukum	1	0	2011	2016
8	8	60000000	Dasar Hukum	1	0	2011	2016
9	9	60000000	Dasar Hukum	1	0	2011	2016
10	10	60000000	Dasar Hukum	1	0	2011	2016
11	11	60000000	Dasar Hukum	1	0	2011	2016
12	12	60000000	Dasar Hukum	1	0	2011	2016
13	13	60000000	Dasar Hukum	1	0	2011	2016
\.


--
-- Name: s_tarifnpoptkp_s_idtarifnpotkp_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_tarifnpoptkp_s_idtarifnpotkp_seq', 56, true);


--
-- Data for Name: s_tempo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tempo (s_jumlahhari) FROM stdin;
3
\.


--
-- Data for Name: s_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_users (s_iduser, s_username, s_password, s_jabatan, s_akses, s_idpejabat_idnotaris, s_tipe_pejabat) FROM stdin;
2	admin	21232f297a57a5a743894a0e4a801fc3	Administrator Aplikasi	1		
40	sindialiandi	b33a4006134bb6ee62b30fc0fac5cec6	Koordinator Operator BPHTB	1	10	1
47	niningsutarni	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	8	2
85	maryoto	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	46	2
86	untung	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	47	2
87	hendarin	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	48	2
52	cahyaningsih	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	13	2
44	annayulianti	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	4	2
45	harryteddy	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	6	2
46	julianurwulan	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	7	2
41	indirawati	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	2	2
48	marianachandra	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	9	2
42	dettytriesnawaty	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	3	2
43	tutimulyati	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	5	2
49	ivonenurul	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	10	2
50	dedipriadi	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	11	2
51	ukaesih	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	12	2
53	susisusanti	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	14	2
54	dettidharmayanti	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	15	2
55	oliviamaharani	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	16	2
56	dermawanpurba	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	17	2
57	lenimariana	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	18	2
58	rosmarliana	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	19	2
59	sriahyani	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	20	2
60	edymarhutajulu	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	21	2
61	yuliahidayat	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	22	2
62	raniyuniar	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	23	2
63	novrita	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	24	2
64	yuyunmintarsih	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	25	2
65	lennyfarida	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	26	2
66	nunungnurhayati	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	27	2
67	ranukantini	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	28	2
68	zairanisetiawaty	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	29	2
69	titinnurnaeni	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	30	2
70	sidharwati	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	31	2
71	henrysamudra	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	32	2
74	novieaprianti	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	35	2
88	nelsysuryaningsih	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	49	2
89	andreani	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	50	2
90	etinurhayati	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	51	2
75	fransiskaveenbrink	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3		2
77	tatansutanto	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	38	2
76	nianurdiana	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	37	2
73	sonnyario	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	34	2
72	amelianur	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	33	2
78	albertuswahyu	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	39	2
79	pemalang	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	40	2
80	desitaafianti	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	41	2
81	gunadisumantri	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	42	2
82	litaderiana	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	43	2
83	tommyherfindo	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	44	2
84	sintarusmalia	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	45	2
91	tattimuktiati	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	52	2
92	milakumari	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	53	2
93	desiyanachafsah	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	54	2
94	annegunadi	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	55	2
95	asharikoerniawan	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	56	2
96	emmaramdaniah	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	57	2
97	gandhimasya	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	58	2
98	yennydewi	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	59	2
99	mayasrigarnera	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	61	2
100	muliaty	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	62	2
101	anniesa	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	63	2
102	gittapuspitasari	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	64	2
103	delilakania	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	65	2
104	sittirahayu	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	66	2
105	anastasia	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	67	2
106	adminwaris	81dc9bdb52d04dc20036dbd8313ed055	Pelaksana	3	68	2
107	camatbatujajar	81dc9bdb52d04dc20036dbd8313ed055	PPATS	3	69	2
108	srihendarti	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	70	2
109	elsa	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	71	2
110	diahsuryadi	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	72	2
111	iwarukiwa	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	73	2
112	camatpadalarang	81dc9bdb52d04dc20036dbd8313ed055	PPATS	3	74	2
113	aninuryani	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	75	2
114	testerapp	81dc9bdb52d04dc20036dbd8313ed055	TESTER APLIKASI ADE	1	10	1
115	camatcikalongwetan	81dc9bdb52d04dc20036dbd8313ed055	PPATS	3	76	2
116	christian	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	77	2
117	dyahastuti	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	78	2
118	nunungfeti	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	79	2
120	yukasanu	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	80	2
121	camatcihampelas	81dc9bdb52d04dc20036dbd8313ed055	PPATS	3	81	2
122	camatcisarua	81dc9bdb52d04dc20036dbd8313ed055	PPATS	3	82	2
123	evita	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	83	2
124	camatparongpong	cc43bba1b55cbc1a1a0de92b31518f2a	PPATS	3	84	2
125	camatlembang	cc98691c51ad04ea32e6e96bb57ed465	PPATS	3	85	2
126	camatcipatat	81dc9bdb52d04dc20036dbd8313ed055	PPATS	3	86	2
127	camatngamprah	81dc9bdb52d04dc20036dbd8313ed055	PPATS	3	87	2
128	kadarsolihat	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	89	2
130	hermainpidel	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	90	2
131	tonisomantri	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	92	2
132	thasya	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	93	2
133	wara	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	94	2
134	lelang	81dc9bdb52d04dc20036dbd8313ed055	-	3	95	2
135	mrizqi	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	96	2
136	camatsaguling	81dc9bdb52d04dc20036dbd8313ed055	PPATS	3	97	2
137	cutsari	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	98	2
138	andrizarman	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	99	2
139	irmarismasari	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	100	2
140	giramayang	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	101	2
141	donnairene	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	102	2
142	ribiazwar	81dc9bdb52d04dc20036dbd8313ed055	notaris	3	103	2
129	sheyra	81dc9bdb52d04dc20036dbd8313ed055	Operator BPHTB 1	2		1
119	deasopiani	f16d516a54829c71709539021ce51840	Operator	2		1
143	irramelyaningsih	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	104	2
144	ririnrismawanti	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	105	2
145	imanprapda	81dc9bdb52d04dc20036dbd8313ed055	Notaris	3	106	2
146	pintarahmadani	81dc9bdb52d04dc20036dbd8313ed055	notaris	3	107	2
\.


--
-- Name: s_users_s_iduser_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_users_s_iduser_seq', 146, true);


--
-- Data for Name: ss_golonganpejabat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ss_golonganpejabat (ss_idgolongan, ss_namagolongan, ss_pangkatgolongan) FROM stdin;
1	II/a	Pengatur Muda
2	II/b	Pengatur Muda Tingkat I
3	II/c	Pengatur
4	II/d	Pengatur Tingkat I
5	III/a	Penata Muda
6	III/b	Penata Muda Tingkat I
7	III/c	Penata
8	III/d	Penata Tingkat I
9	IV/a	Pembina
10	IV/b	Pembina Tingkat I
11	IV/c	Pembina Utama Muda
12	IV/d	Pembina Utama Madya
13	IV/e	Pembina Utama
14	PTT	Pegawai Tidak Tetap
\.


--
-- Data for Name: t_dendasanksinotaris; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_dendasanksinotaris (t_idds, t_tglprosesds, t_periodeds, t_dendabulan, t_idnotaris, t_jumlahds, t_ketetapands, t_idspt, t_kohirds, t_kodebayards) FROM stdin;
20	2016-02-18	2016		126	7500000	4	273	1	EP3AU4
\.


--
-- Name: t_dendasanksinotaris_t_idds_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_dendasanksinotaris_t_idds_seq', 20, true);


--
-- Data for Name: t_detailsptbphtb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailsptbphtb (t_iddetailsptbphtb, t_idspt, t_namawppembeli, t_nikwppembeli, t_alamatwppembeli, t_kecamatanwppembeli, t_kelurahanwppembeli, t_kabkotawppembeli, t_telponwppembeli, t_kodeposwppembeli, t_npwpwppembeli, t_namawppenjual, t_nikwppenjual, t_alamatwppenjual, t_kecamatanwppenjual, t_kelurahanwppenjual, t_kabkotawppenjual, t_telponwppenjual, t_kodeposwppenjual, t_npwpwppenjual, t_luastanah, t_njoptanah, t_luasbangunan, t_njopbangunan, t_totalnjoptanah, t_totalnjopbangunan, t_grandtotalnjop, t_nosertifikathaktanah, t_kelurahanop, t_kecamatanop, t_ketwaris, t_terbukti, t_rtwppembeli, t_rwwppembeli, t_alamatop, t_rtop, t_rwop, t_dokpersyaratan, t_namasppt, t_tglajb, t_luastanahbpn, t_luasbangunanbpn, t_tglajbbaru, t_noajbbaru, t_statuspelaporannotaris, t_tglpelaporannotaris, t_kabupatenop, t_rtwppenjual, t_rwwppenjual, t_nosertifikatbaru, t_tglsertifikatbaru, t_inputbpn, t_statuskonfirmasinotaris, t_tglkonfirmasinotaris) FROM stdin;
85	90	TATI	3273034603800005	JL. CARINGIN LUMBUNG I	BABAKAN CIPARAY	BABAKAN CIPARAY	KOTA BANDUNG				PURNAMA HERTARIA MANURUNG CS	3204015903450063	Jl. KP RANCABALI	PADALARANG	KERTAMULYA	KABUPATEN BANDUNG BARAT				87.00	285000	36.00	823000	24795000	29628000	54423000	SHM NO. 03161	KERTAMULYA	PADALARANG		0	07	03	KP. RANCABALI	003	02	\N	P MANURUNG	2016-01-20	\N	\N	\N	\N	\N	\N		003	02	\N	\N	\N	\N	\N
74	76	Nevi Amelia Yasmin	3217065708930007	Bumi Pakusarakan 	Ngamprah	Tanimulya	Kab. Bandung Barat				JASMIN	3217061502680017	Bumi Pakusarakan 	NGAMPRAH	TANIMULYA	KABUPATEN BANDUNG BARAT				70.00	916000	58.00	595000	64120000	34510000	98630000	SHM No. 4007	TANIMULYA	NGAMPRAH		0	02	16	JL. LARASANTANG I	002	16	\N	JASMIN	2016-01-20	\N	\N	\N	\N	\N	\N	Bandung Barat	002	16	\N	\N	\N	\N	\N
75	77	ENDEN NURDIYATI	3374044803580001	SRONDOL BUMI INDAH BLOK R-9	BANYUMANIK	SUMURBOTO	KOTA SEMARANG				AHMAD FASNI MAHMUD	3217062005740008	JL. TERUSAN TERUBUS NO. 52	NGAMPRAH	TANIMULYA	KABUPATEN BANDUNG BARAT				60.00	1573000	72.00	968000	94380000	69696000	164076000	HGB NO. 282	CIMAREME	NGAMPRAH		0	07	05	KO. CIMAREME INDAH	000	01	\N	TINTIN DINIR SURGAENAH SSOS NY	2016-01-20	\N	\N	\N	\N	\N	\N	BANDUNG BARAT	04	02	\N	\N	\N	\N	\N
76	78	TINA ROSTARINA CS	3217025608820014	JL. SARIWANGI NO.12D 	PARONGPONG	SARIWANGI	KAB. BANDUNG BARAT				TRIAN FERDIANA	474.3/22/WRS/VI/	Jl. KO. THE GREEN SARIWANGI	PARONGPONG	SARIWANGI	KAB. BANDUNG BARAT				80.00	1573000	36.00	1833000	125840000	65988000	191828000	SHM NO. 3988	SARIWANGI	PARONGPONG	SURAT KETERANGAN SUSUNAN AKHLI WARIS NO. 474.3/152/WRS/KEC. PARONGPONG	1	02	11	KO. THE GREEN SARIWANGI	002	11	\N	SRI HARTATI JACHJA R H	2016-01-21	\N	\N	\N	\N	\N	\N		002	11	\N	\N	\N	\N	\N
78	80	RINA MARDIANA GUNAWAN	3273036309820001	JL. SENJA NO. 10 KOPO ELOK	BABAKAN CIPARAY	CIRANGRANG	KOTA BANDUNG				TINNE CHRISTIANA	3277036109560001	Jl. CIHANJUANG NO. 202	CIMAHI UTARA	CIBABAT	KOTA CIMAHI				138.00	1416000	72.00	1200000	195408000	86400000	281808000	SHM NO. 4324 &SHM NO. 4217	SARIWANGI	PARONGPONG		0	07	05	CLUSTER SARI DUTA	005	07	\N	JAMES TANUJAYA	2016-01-20	\N	\N	\N	\N	\N	\N		06	11	\N	\N	\N	\N	\N
77	79	RIDA RACHMAWATI	3217064604740013	GRAHA BUKIT RAYA 2 BLOK I 6 NO. 5	NGAMPRAH	CILAME	KAB. BANDUNG BARAT				CICIH	3217094702460004	Jl. BL. CIBUNGUR	BATUJAJAR	BATUJAJAR TIMUR	KABUPATEN BANDUNG BARAT				121.00	27000	0.00	0	3267000	0	3267000	AJB NO. 1026/2015	BATUJAJAR TIMUR	BATUJAJAR		0	03	24	BL. CIBUNGUR	001	11	\N	CICIH	2015-11-03	\N	\N	2015-11-03	10262015	\N	\N		02	10	\N	\N	\N	\N	\N
90	95	M. RAMADHAN LUBIS	3217080707720035	KP. CIKAMUNING 	PADALARANG	CIBURUY	KAB. BANDUNG BARAT				ANWAR SETIAWAN	3217101507720011	KP. CICALENGKA	CIHAMPELAS	MEKARMUKTI	KABUPATEN BANDUNG BARAT				54.00	285000	21.00	310000	15390000	6510000	21900000	SHM NO.1069	CIPTAHARJA	CIPATAT		0	03	19	KO. CIPATAT ELOK	002	15	\N	PEMILIK	2016-01-21	\N	\N	\N	\N	\N	\N		01	03	\N	\N	\N	\N	\N
81	86	LITA ALAMIA	3217034107870111	KP. MURIL RAHAYU	CISARUA	JAMBUDIPA	KAB. BANDUNG BARAT				OCIN MUKSIN	3277020508730002	Jl. JL. POJOK UTARA 2	CIMAHI TENGAH	SETIAMANAH	CIMAHI				255.00	82000	0.00	0	20910000	0	20910000	SHM NO. 716	JAMBUDIPA	CISARUA		0	01	15	BL. MURIL	001	15	\N	OCIN MUKSIN	2016-01-20	\N	\N	\N	\N	\N	\N		006	05	\N	\N	\N	\N	\N
82	87	DEDEN MULYANA	3217062705740007	KP. SINDANG SARI 	NGAMPRAH	CIMAREME	KAB. BANDUNG BARAT				DINI SETIAWATI	3217064506830018	Jl. KO. GRAHA BUKIT RAYA E-3 NO. 28	NGAMPRAH	CILAME	KABUPATEN BANDUNG BARAT				60.00	802000	60.00	700000	48120000	42000000	90120000	HGB NO. 01814	CILAME	NGAMPRAH		0	05	06	KO. GRAHA BUKIT RAYA	021	06	\N	SLAMET SOBARI	2016-01-20	\N	\N	\N	\N	\N	\N		07	21	\N	\N	\N	\N	\N
83	88	ASEP KUSNANDAR	3217062512650019	JL. BUNISARI 152	NGAMPRAH	CIMAREME	KAB. BANDUNG BARAT				RICKY KUSUMA	3273140302800011	KOMP. GRAHA BUKIT RAYA 3 BLOK C6 NO. 38	NGAMPRAH	CILAME 	KAB. BANDUNG BARAT				60.00	802000	22.00	700000	48120000	15400000	63520000	SHM NO. 3146	CILAME	NGAMPRAH		0	05	06	KO. BUKIT GALUDRA	000	00	\N	PT. RAYA DEVINDO	2016-01-20	\N	\N	\N	\N	\N	\N	BANDUNG BARAT	06	25	\N	\N	\N	\N	\N
84	89	NURDIN	3217062002720011	GRIYA KALAPA GADING NO. 4B	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT			__.___.___._-___.___	MOHAMMAD SUHENDAR	3217061612650007	Jl. KO. PURI CIPAGERAN INDAH D-11 NO. 12	NGAMPRAH	TANIMULYA	KABUPATEN BANDUNG BARAT				68.00	916000	36.00	505000	62288000	18180000	80468000	HGB NO.04809	TANIMULYA	NGAMPRAH		0	01	02	KO. PURI CIPAGERAN INDAH II	003	22	\N	MUHAMAD MUTAQIN	2016-01-20	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	22	\N	\N	\N	\N	\N
87	92	KOKOM KOMARIAH	3277035509670011	PURI CIPAGERAN INDAH I C  87	CIMAHI UTARA	CIPAGERAN	KOTA CIMAHI				A. FADLI YOFIRLAN TANUWIJAYA	3217082901820010	JL. WANGSA PATRA WETAN NO. 20 WANGSAKERTA-KBP	PADALARANG	KERTAJAYA	KAB. BANDUNG BARAT				89.00	802000	22.00	823000	71378000	18106000	89484000	HGB:06219,6180	TANIMULYA	NGAMPRAH		0	04	23	KO. PESONA LEMBAH CIDAHU	007	01	\N	TUMADI	2016-01-20	\N	\N	\N	\N	\N	\N		01	15	\N	\N	\N	\N	\N
88	93	JAJAT MULYA	3217021109760001	KP. PANYAIRAN 	PARONGPONG	CIHIDEUNG	KAB. BANDUNG BARAT				H. TATA SUPRIATNA	3217021312490001	KP. PANYAIRAN 	PARONGPONG	CIHIDEUNG	KAB. BANDUNG BARAT				320.00	702000	0.00	0	224640000	0	224640000	SHM NO. 02023	CIHIDEUNG	PARONGPONG		0	01	10	JL. SERSAN BAJURI	002	10	\N	SUPRIATNA	2016-01-21	\N	\N	\N	\N	\N	\N		002	10	\N	\N	\N	\N	\N
89	94	YANA HERDIANA	3217080407630003	PERUM BINA KARYA C-22	PADALARANG	JAYAMEKAR	KAB. BAN				HJ. HASANAH	3217084101330013	Jl. KP. GANTUNGAN	PADALARANG	JAYAMEKAR	KABUPATEN BANDUNG BARAT				1541.00	27000	0.00	0	41607000	0	41607000	AJB NO.02/2011	JAYAMEKAR	PADALARANG		0	04	18	KP. GANTUNGAN	003	09	\N	H. ACIN	2011-12-13	\N	\N	2011-12-13	02/2011	\N	\N	KAB. BANDUNG BARAT	02	09	\N	\N	\N	\N	\N
79	84	PANJI SUTRIANTO	3273281804790005	PAMEKARAN BARAT IV NO.5	PANYILEUKAN	MEKAR MULYA	KOTA BANDUNG			__.___.___._-___.___	IR.H.DADANG HIDAYAT	3273260610500001	JL. RAHAYU NO. 11A CIJAMBE	UJUNGBERUNG	PASIRENDAH	KOTA BANDUNG				95.00	103000	40.00	1200000	9785000	48000000	57785000	HGB: 06384, 06369, 06411	CILAME	NGAMPRAH		0	006	003	KP. CILOA	001	03	\N	TANTO HARTONO	2016-01-20	\N	\N	\N	\N	\N	\N		02	06	\N	\N	\N	\N	\N
80	85	PENI MEILANDARI DEWI PUTRI	3174044205790012	JL. PEJATEN INDAH II 	PASAR MINGGU	PASAR MINGGU	JAKARTA SELATAN				IR.H.DADANG HIDAYAT	3273260610500001	Jl. KP. CILOA	NGAMPRAH	CILAME	KABUPATEN BANDUNG BARAT				130.00	103000	45.00	1200000	13390000	54000000	67390000	HGB:06365, 06407	CILAME	NGAMPRAH		0	10	02	KP. CILOA	001	03	\N	TANTO HARTONO	2016-01-20	\N	\N	\N	\N	\N	\N		001	03	\N	\N	\N	\N	\N
91	96	LINA MULYANI	3273066909800004	JL.AHMAD I NO. 275/65	CICENDO	PAMOYANAN	KOTA. BANDUNG				IMAS MASRIAH	3217085505660006	Jl. KP. CIJEUNGJING	PADALARANG	KERTAMULYA	KABUPATEN BANDUNG BARAT				118.00	285000	0.00	0	33630000	0	33630000	594/14/I/13/DS/2016	KERTAMULYA	PADALARANG		0	04	06	KP. CIJEUNGJING	001	22	\N	DEDE RAHMAT	2016-01-21	\N	\N	\N	\N	\N	\N		001	21	\N	\N	\N	\N	\N
86	91	SAMMY YANSEN WONGSO	3217082209820013	JL. BANYAK CIPTA KALER NO. 5-KBP	PADALARANG	CIPEUNDEUY	KAB. BANDUNG BARAT				IR. SANUSI TANAWI	3173062210530001	PERUM CITRA II BLOK G.11/2	KALIDERES	PEGADUNGAN	JAKARTABARAT				108.00	2352000	60.00	823000	254016000	49380000	303396000	HGB NO.1949	CIPEUNDEUY	PADALARANG		0	04	11	JL. BANYAKCIPTA KALER	000	00	\N	SAMMY YANSEN WONGSO	2016-01-20	\N	\N	\N	\N	\N	\N		08	19	\N	\N	\N	\N	\N
112	117	PITER JOVA	3204440207870004	SUKAMANAH	CANGKUANG	NAGRAK	KAB. BANDUNG				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3G	LEMBANG	GUDANGKAHURIPAN	KAB. BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 86	CITAPEN	CIHAMPELAS		0	02	05	JL ALAM KENARI 7	000	00	\N	PT. MULTI SANGGAR UTAMA	2016-01-25	\N	\N	\N	\N	\N	\N		000	00	\N	\N	\N	\N	\N
133	138	SRI YULIA NINGSIH	3217086107620008	KP. ANDIR	PADALARANG	PADALARANG	KAB. BANDUNG BARAT				HANDA	3217080308470001	GUNUNG BENTANG	PADALARANG	JAYAMEKAR	KABUPATEN BANDUNG BARAT				273.00	103000	0.00	0	28119000	0	28119000	AJB NO. 1357/2015	JAYAMEKAR	PADALARANG		0	02	14	KP. KANCAH NANGKUB	001	15	\N	ITING	2015-11-10	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	02	14	\N	\N	\N	\N	\N
92	97	MAMAN JANGGOT CS	3204050103420003	KP. CIKONENG 	CILEUNYI	CIBIRU WETAN	KAB. BANDUNG				KATMA	500/22/PEM	Jl. KP. BARUNEGRI Blok null Rt. 003 Rw. 03	CIKALONGWETAN	SUKAJAYA	KABUPATEN BANDUNG				4886.00	128000	0.00	0	625408000	0	625408000	593.21/01/PEM./2016	SUKAJAYA	LEMBANG	SURAT KETERANGAN SUSUNAN AKHLI WARIS NO:474.3/115/WRS/LBG/2006	0	03	02	KP. CIPARIUK	003	03	\N	UKAR M	2016-01-21	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	04	07	\N	\N	\N	\N	\N
93	98	IR. ARIF BUDIYONO,MT	3173051307710005	JL.DAMANI NO.5A KAMPUNGKECIL 	KEBON JERUK	SUKABUMI SELATAN	JAKARTA BARAT				MAMAN JANGGOT CS	3204050103420003	KP. CIKONENG II	CILEUNYI	CIBIRU WETAN	KABUPATEN BANDUNG				4886.00	128000	0.00	0	625408000	0	625408000	593.21/01/PEM./2016	SUKAJAYA	LEMBANG		0	05	02	KP. CIPARIUK	003	03	\N	KATMA	2016-01-21	\N	\N	\N	\N	\N	\N		003	02	\N	\N	\N	\N	\N
94	99	ELLY LINARLY	3217066805740011	PURI CIPAGERAN INDAH 2 BLOK C	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				WAWAN RUSFENDI	3204040607700015	Jl. KO. PURI CIPAGERAN INDAH II BLOK C	NGAMPRAH	TANIMULYA	KABUPATEN BANDUNG BARAT				60.00	916000	21.00	595000	54960000	12495000	67455000	HGB NO. 4177	TANIMULYA	NGAMPRAH		0	03	21	KO. PURI CIPAGERAN INDAH II	003	21	\N	PT. RAYA DEVINDO	2016-01-21	\N	\N	\N	\N	\N	\N		003	21	\N	\N	\N	\N	\N
96	101	DONNY KRISTIANTO	3273012409880001	JL. SETRASARI INDAH NO. 47	SUKASARI	SUKARASA	KOTA BANDUNG				TETET CAHYATI	3273016412630002	JL. TIRTASARI III NO.9	SUKASARI	SARIJADI	KOTA BANDUNG				329.00	200000	0.00	0	65800000	0	65800000	81 S.II KOHIR/C DESA	SARIWANGI	PARONGPONG		0	05	02	KP. PANGKALAN	002	11	\N	TETET CAHYATI	2016-01-21	\N	\N	\N	\N	\N	\N		12	09	\N	\N	\N	\N	\N
97	102	L SANDI KUSNADI	3173010609810002	JL. DAHLIA NO. 46	CENGKARENG	CENGKARENG BARAT	JAKARTA BARAT				YAYA KOSWARA	3217010709531001	Jl. KP POJOK	LEMBANG	CIKAHURIPAN	KABUPATEN BANDUNG BARAT				783.00	48000	0.00	0	37584000	0	37584000	SHM NO. 566	CIKAHURIPAN	LEMBANG		0	10	01	BL. POJOK	004	05	\N	YAYA KOSWARA	2016-01-22	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	004	05	\N	\N	\N	\N	\N
95	100	TANTI PUTRIANARIYANTI, SPD	3204386807860001	KP. SUKARASA 	PASIRJAMBU	PASIRJAMBU	KAB. BANDUNG				SUPARNO	3175091506510007	Jl. TB SIMATUPANG	CIRACAS	SUSUKAN 	JAKARTA TIMUR				86.00	243000	42.00	968000	20898000	40656000	61554000	HGB NO. 01203	CITAPEN	CIHAMPELAS		0	04	05	PESONA PRIMA CITAPEN MAHONI	000	00	\N	PT. KREASI PRIMA NUSANTARA	2016-01-21	\N	\N	\N	\N	\N	\N		02	05	\N	\N	\N	\N	\N
98	103	IKA MARYATI SYAMSUDIN	3217075107830022	KP. CISALADAH 	CIPATAT	GUNUNGMASIGIT	KAB. BANDUNG BARAT				PT. BELAPUTRA INTILAND	3173062210530001	Jl. JL.PANYAWANGAN BALEPARE	PADALARANG	KERTAJAYA	KABUPATEN BANDUNG BARAT				609.00	2352000	420.00	1516000	1432368000	636720000	2069088000	HGB NO. 00904	CIPEUNDEUY	PADALARANG		0	03	10	KO. KOTA BARU PARAHYANGAN	000	00	\N	PT. BELAPUTRA INTILAND	2016-01-22	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	000	00	\N	\N	\N	\N	\N
99	104	ANDRI PRIATNA KUSUMA S	3175021112740006	JL. GUNUNG RAHAYU RAYA NO. 18 A GUNUNG BATU	CIMAHI UTARA	PASIRKALIKI	KOTA CIMAHI				MAMAD SUTIANA	3217062312720001	GALUDRA	NGAMPRAH	GADOBANGKONG	KABUPATEN BANDUNG BARAT				452.00	48000	0.00	0	21696000	0	21696000	SHM NO. 82	CILAME	NGAMPRAH		0	03	10	KP. GALUDRA	002	08	\N	MAMAD SUTIANA	2016-01-22	\N	\N	\N	\N	\N	\N		02	08	\N	\N	\N	\N	\N
100	105	MUCHTAR SURYA SENJAYA	3273061906520001	JL. SEMAR NO. 24	CICENDO	ARJUNA	KOTA BANDUNG				ADE	3217040308570002	KP. CIGINTUNG	CIKALONGWETAN	CIPTAGUMATI	KABUPATEN BANDUNG BARAT				4500.00	48000	0.00	0	216000000	0	216000000	40/DS/226/I/2016	MANDALASARI	CIKALONG WETAN		0	14	05	KP. BANGBAYANG	005	02	\N	EPON KUSNADI	2016-01-22	\N	\N	\N	\N	\N	\N		04	07	\N	\N	\N	\N	\N
101	106	MUCHTAR SURYA SENJAYA	3273061906520001	JL. SEMAR NO. 24	CICENDO	ARJUNA	KOTA BANDUNG				DACE EDAH	3217040306560004	Jl. KP. CIGENTUR	CIKALONGWETAN	MANDALASARI	KABUPATEN BANDUNG BARAT				2150.00	48000	0.00	0	103200000	0	103200000	39/DS/220/I/2016	MANDALASARI	CIKALONG WETAN		0	14	05	KP. BANGBAYANG	004	17	\N	DACE EDAH	2016-01-22	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	17	\N	\N	\N	\N	\N
102	107	MUCHTAR SURYA SENJAYA	3273061906520001	JL. SEMAR NO. 24	CICENDO	ARJUNA	KOTA BANDUNG				ROJAK	3217040107520233	KP. CIGINTUNG	CIKALONGWETAN	CIPTAGUMATI	KABUPATEN BANDUNG BARAT				1870.00	20000	0.00	0	37400000	0	37400000	22/DS/226/I/2016	MANDALASARI	CIKALONG WETAN		0	14	05	BL. BANGBAYANG	005	02	\N	EPON KUSNADI	2016-01-22	\N	\N	\N	\N	\N	\N		04	07	\N	\N	\N	\N	\N
103	108	INA MARYANI	3217064810790023	GRAHA BUKIT RAYA F-6 NO. 26	NGAMPRAH	CILAME	KAB. BANDUNG BARAT				DEDI SUPRIADI	3277030407640011	Jl. KP. BOBOJONG TANAH	CIMAHI UTARA	CIPAGERAN	KOTA CIMAHI				60.00	802000	21.00	595000	48120000	12495000	60615000	HGB NO.01950	CILAME	NGAMPRAH		0	12	21	KO. GRAHA BUKIT RAYA	012	21	\N	DEDI SUPRIADI	2016-01-22	\N	\N	\N	\N	\N	\N		007	15	\N	\N	\N	\N	\N
104	109	VIDI TRI SATYA SURYA ADIPRADANA	3674040804870003	JL. NUSA INDAH 439 BNI 	CIPATAT	SERUA	KOTA TANGERANG SELATAN				EINER BULGAR HUTAGALUNG	1050230603573003	Jl. JL. MERDEKA NO. 48	SUMUR	BABAKAN CIAMIS	KOTA BANDUNG				212.00	2176000	145.00	968000	461312000	140360000	601672000	SHM NO. 4555	CIWARUGA	PARONGPONG		0	01	15	JL. GEGERKALONG TONGGOH VIII	006	05	\N	EINER BULGAR HUTAGALUNG	2016-01-22	\N	\N	\N	\N	\N	\N		002	06	\N	\N	\N	\N	\N
105	110	NANA SUMPENA	3217061808600006	PURI CIPAGERAN INDAH 2 BLOK C10-5	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				ACHMAD SYARIEF AGUS	1603070305650005	Jl. JL. CEMARA TOWN SITE	LAWANG KIDUL	TANJUNG ENIM	MUARA ENIM				159.00	916000	36.00	700000	145644000	25200000	170844000	SHM NO. 1186	TANIMULYA	NGAMPRAH		0	01	21	KO. PURI CIPAGERAN INDAH II	001	22	\N	ACHMAD SYARIEF AGUS	2016-01-22	\N	\N	\N	\N	\N	\N		002	08	\N	\N	\N	\N	\N
106	111	DENI SUPRIADI	3273072904830001	JL. SUKAGALIH GG.H.GOJALI NO. 168	SUKAJADI	CIPEDES	KOTA BANDUNG				SARI JULIANTI	3277026207690008	Jl. JL. HASANUDIN	CIMAHI TENGAH	BAROS	KOTA CIMAHI				60.00	802000	21.00	700000	48120000	14700000	62820000	SHM NO 2528	CILAME	NGAMPRAH		0	05	07	KO. GRAHA BUKIT RAYA	002	21	\N	SARI JULIANTI	2016-01-22	\N	\N	\N	\N	\N	\N		001	19	\N	\N	\N	\N	\N
107	112	FELICITAS DEVITA RIYANTI	3273097006690003	JL. TAMANSARI NO 5/59	BANDUNG WETAN	TAMANSARI	KOTA BANDUNG				MUMU KOMARO,DRS,MT	3217045612510002	Jl. KO.PURI CIPAGERAN INDAH II BLOK D-12	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				78.00	916000	36.00	505000	71448000	18180000	89628000	HGB NO : 04647	TANIMULYA	NGAMPRAH		0	07	13	KO. PURI CIPAGERAN INDAH II	003	22	\N	MUMU KOMARO,DRS,MT	2016-01-22	\N	\N	\N	\N	\N	\N		003	22	\N	\N	\N	\N	\N
108	113	SYARIF HIDAYAT	3277013006860020	JL. CIJERAH II BLOK SUKAASIH NO. 199	CIMAHI SELATAN	MELONG	KOTA CIMAHI				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3G	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				60.00	27000	31.00	968000	1620000	30008000	31628000	HGB NO.00198	TANJUNGWANGI	CIHAMPELAS		0	05	14	BL. IRIGASI	000	00	\N	GUNADI	2016-01-25	\N	\N	\N	\N	\N	\N		05	01	\N	\N	\N	\N	\N
109	114	KHOIROL YADI	3217080302730007	PERUM LAKSANA MEKAR ASRI BLOK F55	PADALARANG	LAKSANAMEKAR	KAB. BANDUNG BARAT				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3G	LEMBANG	GUDANGKAHURIPAN	KAB. BANDUNG BARAT				60.00	27000	31.00	968000	1620000	30008000	31628000	HGB NO. 00200	TANJUNGWANGI	CIHAMPELAS		0	005	009	BL. IRIGASI	000	00	\N	GUNADI	2016-01-25	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	05	01	\N	\N	\N	\N	\N
110	115	DANI KURNIAWAN	3273050811930012	JL. MALEBER UTARA	ANDIR	MALEBER	KOTA BANDUNG				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3G	LEMBANG	GUDANGKAHURIPAN	KABUPATEN BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 01413	CITAPEN	CIHAMPELAS		0	01	06	KO. ASI JL. ALAM SERUNI 6	000	00	\N	PT. MULTI SANGGAR UTAMA	2016-01-25	\N	\N	\N	\N	\N	\N		05	01	\N	\N	\N	\N	\N
111	116	ANDI ROSDANI	3273052205780002	JL. MALEBER UTARA NO. 42	ANDIR	GARUDA	KOTA BANDUNG				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3G	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				60.00	27000	31.00	968000	1620000	30008000	31628000	HGB NO. 00007	TANJUNGWANGI	CIHAMPELAS		0	04	03	BL. IRIGASI	000	00	\N	GUNADI	2016-01-25	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	05	01	\N	\N	\N	\N	\N
113	118	ANGGA DWI SAPUTRA	3217060301910004	PURI CIPAGERAN INDAH 2 BLOK E5-23	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3 G	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				72.00	243000	31.00	968000	17496000	30008000	47504000	HGB NO. 540	CITAPEN	CIHAMPELAS		0	005	021	KO. ASI JL. ALAM PINUS RAYA	000	00	\N	PT. MULTI SANGGAR UTAMA	2016-01-25	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	005	001	\N	\N	\N	\N	\N
114	119	ANDRI HERDIANSYAH	3277020310860011	KP. CIPUTRI	CIMAHI TENGAH	CIGUGURTENGAH	KOTA CIMAHI				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3G	LEMBANG	GUDANGKAHURIPAN	KAB. BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 89	CITAPEN	CIHAMPELAS		0	05	05	JL. ALAM KENARI 7	000	00	\N	PT. MULTI SANGGAR UTAMA	2016-01-25	\N	\N	\N	\N	\N	\N		05	01	\N	\N	\N	\N	\N
115	120	FINA AMALIA	3273096806860002	JL. DR. HATTA NO. 25/29B	BANDUNG WETAN	TAMANSARI	KOTA BANDUNG				DENIS NUGRAHA	3276042702850005	KOMPLEK BPK V BLOK E NO. 7 	CINERE	GANDUL	KOTA DEPOK				90.00	1862000	43.00	823000	167580000	35389000	202969000	SHM N0. 2051	CIWARUGA	PARONGPONG		0	05	17	KO. SETIA BUDHI REGENSI	000	00	\N	HEDDY SULAEMAN	2016-01-25	\N	\N	\N	\N	\N	\N		15	04	\N	\N	\N	\N	\N
116	121	ADITIAS SANDI	3277020907910001	KP. CIPUTRI NO.191	CIMAHI TENGAH	CIGUGUR TENGAH	KOTA CIMAHI				IR. ULLY MELANNY	3211701691151000	JL. RAYA LEMBANG 3 G	LEMBANG	GUDANG KAHURIPAN	KOTA CIMAHI				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 88	CITAPEN	CIHAMPELAS		0	005	005	JL. ALAM KENARI 7	000	00	\N	PT. MULTI SANGGAR UTAMA	2016-01-25	\N	\N	\N	\N	\N	\N	KOTA CIMAHI	005	001	\N	\N	\N	\N	\N
117	122	ANDRI SETIAWAN	3273051611860003	BOJONGKONENG	ANDIR	CAMPAKA	KOTA BANDUNG				IR ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3G	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				60.00	27000	31.00	968000	1620000	30008000	31628000	HGB NO. 00232	TANJUNGWANGI	CIHAMPELAS		0	03	06	BL. IRIGASI	000	00	\N	GUNADI	2016-01-25	\N	\N	\N	\N	\N	\N		05	01	\N	\N	\N	\N	\N
118	123	FAHMI SAIFULLOH	3273031812930003	JL. CARINGIN GG. LUMBUNG V NO. 9	BABAKAN CIPARAY	BABAKAN CIPARAY	KOTA BANDUNG				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3 G	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 01615	CITAPEN	CIHAMPELAS		0	002	005	PERUM SANGGAR INDAH	000	00	\N	PT. MULTI SANGGAR UTAMA	2016-01-25	\N	\N	\N	\N	\N	\N	KOTA BANDUNG	005	001	\N	\N	\N	\N	\N
119	124	TOMI PRAYOGA	3217061011930006	JL. ARJUNA NO. 24 BLOK 91	CICENDO	ARJUNA	KOTA BANDUNG				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3 G	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 00084	TANJUNGWANGI	CIHAMPELAS		0	007	002	BL. IRIGASI	000	00	\N	GUNADI	2016-01-25	\N	\N	\N	\N	\N	\N	KOTA BANDUNG	005	001	\N	\N	\N	\N	\N
120	125	ARIP DARYANTO	3273152112910002	JL. SOEKARNO HATTA	BANDUNG KULON	CIBUNTU	KOTA BANDUNG				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3 G	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 01500	CITAPEN	CIHAMPELAS		0	004	002	BL. CINTA KARYA	003	05	\N	PT. MULTI SANGGAR UTAMA	2016-01-25	\N	\N	\N	\N	\N	\N	KOTA BANDUNG	005	001	\N	\N	\N	\N	\N
121	126	NANO RUSKANO	3208170505930007	KP. SAMPORA 	MARGAHAYU	SUKAMENAK	KAB. BANDUNG				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3G	LEMBANG	GUDANGKAHURIPAN	KAB. BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 01491	CITAPEN	CIHAMPELAS		0	02	17	BL. CINTA KARYA	003	05	\N	PT. MULTI SANGGAR UTAMA	2016-01-25	\N	\N	\N	\N	\N	\N		05	01	\N	\N	\N	\N	\N
122	127	FAISAL MUTTAQIN	3273031808940003	SADANG BUNTU 	BABAKAN CIPARAY	MARGASUKA	KOTA BANDUNG				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3G	LEMBANG	GUDANGKAHURIPAN	BANDUNG				72.00	243000	31.00	968000	17496000	30008000	47504000	HGB NO. 01601	CITAPEN	CIHAMPELAS		0	01	09	PERUM SANGGAR INDAH	000	00	\N	PT. MULTI SANGGAR UTAMA	2016-01-25	\N	\N	\N	\N	\N	\N		05	01	\N	\N	\N	\N	\N
123	128	KELIK SUSANTO	3216021208840006	VILLA GADING HARAPAN BLOK D 2 NO. 09	BABELAN	BAHAGIA	KAB. BEKASI				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3 G	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 01621	CITAPEN	CIHAMPELAS		0	007	046	BL. CINTA KARYA	003	05	\N	PT. MULTI SANGGAR UTAMA	2016-01-25	\N	\N	\N	\N	\N	\N	KAB. BEKASI	005	001	\N	\N	\N	\N	\N
124	129	TRI TUNGGAL	3277022608750012	KP. MEKARSARI	CIMAHI TENGAH	PADASUKA	KOTA CIMAHI				IR ULLY MELANNY	3217016911510001	Jl. RAYA LEMBANG 3G	LEMBANG	GUDANG KAHURIPAN	KABUPATEN BANDUNG BARAT				72.00	27000	31.00	968000	1944000	30008000	31952000	HGB NO. 00147	TANJUNGWANGI	CIHAMPELAS		0	01	07	BL. IRIGASI	000	00	\N	GUNADI	2016-01-25	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	05	01	\N	\N	\N	\N	\N
125	130	MERZI DOHALIK	3217082106920003	PONDOK PADALARANG INDAH	PADALARANG	PADALARANG	KAB. BANDUNG BARAT				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3 G	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				72.00	243000	31.00	968000	17496000	30008000	47504000	HGB NO. 00145	TANJUNGWANGI	CIHAMPELAS		0	001	028	BL. IRIGASI	000	00	\N	GUNADI	2016-01-25	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	005	001	\N	\N	\N	\N	\N
127	132	AGUS HENDARSAH	3212562008850016	DUSUN PASIREUNGIT LANDEUH	PASEH	PASIREUNGIT	KAB. SUMEDANG				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3 G	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				72.00	243000	31.00	968000	17496000	30008000	47504000	HGB NO. 01159	CITAPEN	CIHAMPELAS		0	018	005	KO. ASI JL. ALAM ADENIUM RAYA	000	00	\N	PT. MULTI SANGGAR UTAMA	2016-01-25	\N	\N	\N	\N	\N	\N	KAB. SUMEDANG	005	001	\N	\N	\N	\N	\N
128	133	TEDY NURJAMAN	3277011512880001	KP. BABAKAN PESANTREN NO. 69	CIMAHI SELATAN	UTAMA	KOTA CIMAHI				IR ULLY MELANNY	3217016911510001	Jl. RAYA LEMBANG 3G	LEMBANG	GUDANGKAHURIPAN	KAB. BANDUNG BARAT				72.00	243000	31.00	968000	17496000	30008000	47504000	HGB NO. 01652	CITAPEN	CIHAMPELAS		0	02	02	PERUM SANGGAR INDAH	000	00	\N	PT. MULTI SANGGAR UTAMA	2016-01-25	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	05	01	\N	\N	\N	\N	\N
129	134	PRAMUDYA WICAKSANA	3517060310820001	JL. HAJI UNG GG MESJID NO. 12	KEMAYORAN	UTAN PANJANG	JAKARTA PUSAT				RD ELIN SOFIA AS	3217024809570001	Jl. KP. PARIGILAME NO. 70	PARONGPONG	CIWARUGA	KABUPATEN BANDUNG BARAT				91.00	1722000	36.00	968000	156702000	34848000	191550000	SHM NO. 5301	CIWARUGA	PARONGPONG		0	15	03	KP. BARU	005	07	\N	ONDO H	2016-01-25	\N	\N	\N	\N	\N	\N		02	07	\N	\N	\N	\N	\N
130	135	KUAT PURWONO	3217080609760011	KEBON KALAPA	PADALARANG	KERTAJAYA	KAB. BANDUNG BARAT				ANDI RUSWANDI	3217080611640003	KEBON KALAPA	PADALARANG	KERTAJAYA	KABUPATEN BANDUNG				69.00	200000	61.00	429000	13800000	26169000	39969000	SHM NO. 900	KERTAJAYA	PADALARANG		0	005	001	KP. KEBON KALAPA	002	01	\N	MUHAMAD YUSUP	2016-01-25	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	005	001	\N	\N	\N	\N	\N
126	131	OTONG SAKRI	3211250807630002	DUSUN UJUNGJAYA 	UJUNGJAYA	UJUNGJAYA	KAB. SUMEDANG				IR. ULLY MELANNY	3217016911510001	Jl. RAYA LEMBANG 3G	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 01616,01523	CITAPEN	CIHAMPELAS		0	04	03	PERUM SANGGAR INDAH	000	00	\N	PT. MULTI SANGGAR UTAMA	2016-01-25	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	05	01	\N	\N	\N	\N	\N
131	136	SANDRA ARIYANTI ,S.SOS	3273157101730001	JL. TERUSAN SURYANI NO.16	BANDUNG KULON	WARUNGMUNCANG	KOTA BANDUNG				RD ELIN SOFIA AS	3217024809570001	Jl. KP. PARIGILAME NO. 70	PARONGPONG	CIWARUGA	KABUPATEN BANDUNG BARAT				91.00	1722000	36.00	968000	156702000	34848000	191550000	SHM NO. 5321	CIWARUGA	PARONGPONG		0	07	03	KP. BARU	005	07	\N	ONDO H	2016-01-25	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	02	07	\N	\N	\N	\N	\N
132	137	FRANSISKA FITRIAWATI	3277014909640020	JL. LEUWIGAJAH NO. 37 	CIMAHI SELATAN	UTAMA	KOTA CIMAHI				BOWO K SUJARWADI	3217101705670007	KP. CIHAMPELAS	CIHAMPELAS	CIHAMPELAS	KABUPATEN BANDUNG BARAT				70.00	64000	62.00	823000	4480000	51026000	55506000	AJB NO.703/2014	CIHAMPELAS	CIHAMPELAS		0	03	05	BL. CIHAMPELAS	000	00	\N	FRANSISKA FITRIAWATI	2014-08-11	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	06	02	\N	\N	\N	\N	\N
134	139	H. SARIFUDIN H	3217081008540003	KP. RANCABALI 	PADALARANG	JAYAMEKAR	KAB. BANDUNG BARAT				DANA CS	3217081104550009	Jl. KP GANTUNGAN	PADALARANG	JAYAMEKAR	KABUPATEN BANDUNG BARAT				3990.00	36000	0.00	0	143640000	0	143640000	591/83/DES./2015	JAYAMEKAR	PADALARANG		0	04	04	KP. CITATAH	001	11	\N	IYOS	2016-01-25	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	07	\N	\N	\N	\N	\N
135	140	H. SARIFUDIN H	3217081008540003	KP. RANCABALI 	PADALARANG	JAYAMEKAR	KAB. BANDUNG BARAT				TONO	3217080103800034	KP. GUNUNG BENTANG	PADALARANG	JAYAMEKAR	KABUPATEN BANDUNG BARAT				2800.00	36000	0.00	0	100800000	0	100800000	591/81/DES/2015	JAYAMEKAR	PADALARANG		0	04	04	BL. GUNUNG NANGGEUH	004	10	\N	OBON	2016-01-25	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	14	\N	\N	\N	\N	\N
136	141	H. SARIFUDIN H	3217081008540003	KP. RANCABALI 	PADALARANG	JAYAMEKAR	KAB. BANDUNG BARAT				UJI	3217084607400004	Jl. KP POJOK	PADALARANG	JAYAMEKAR	KABUPATEN BANDUNG BARAT				3150.00	36000	0.00	0	113400000	0	113400000	591/82/DES/2015	JAYAMEKAR	PADALARANG		0	04	04	BL. GUNUNG NANGGEUH	004	10	\N	OBON	2016-01-25	\N	\N	\N	\N	\N	\N		001	10	\N	\N	\N	\N	\N
137	142	ANNI HARTINI	3217036108750003	KP. PASIRLANGU	CISARUA	PASIRLANGU	KAB. BANDUNG BARAT				IKAH	1016366903290001	Jl. KP. PASIRLANGU	CISARUA	PASIRLANGU	KABUPATEN BANDUNG BARAT				40.00	27000	40.00	365000	1080000	14600000	15680000	590/144/DS	PASIRLANGU	CISARUA		0	04	03	BL. PASIR LANGU	004	03	\N	ONDI	2016-01-25	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	004	03	\N	\N	\N	\N	\N
138	143	LILY LIANTY	1050125502403003	JL. PUNGKUR NO. 30	REGOL	PUNGKUR	KOTA BANDUNG				TATA SUWITA	107/UMUM/2012	JL. PUNGKUR	REGOL	PUNGKUR	KOTA BANDUNG				1140.00	64000	420.00	823000	72960000	345660000	418620000	HGB NO. 241	CIKALONG	CIKALONG WETAN	KETERANGAN HAK WARIS NO. 01/KHW/IV/2012	0	01	02	JL. CIKALONGWETAN	013	03	\N	THOMAS SUSANTO	2016-01-25	\N	\N	\N	\N	\N	\N	BANDUNG BARAT	01	02	\N	\N	\N	\N	\N
139	144	TAUFIK AKBAR TAN	3277012805860020	KOMPLEK CIBOGO PERMAI NO. 21	CIMAHI SELATAN	LEUWIGAJAH	KOTA CIMAHI				MULIA KARYADI USWANDI	3217061407820021	Jl. KO. BUMI PAKUSARAKAN I H-3 NO. 3A	NGAMPRAH	TANIMULYA	KABUPATEN BANDUNG BARAT				84.00	916000	21.00	595000	76944000	12495000	89439000	SHM NO.4667	TANIMULYA	NGAMPRAH		0	06	14	KO. BUMI PAKUSARAKAN II	005	11	\N	DOETO POESPOJOEDO	2016-01-25	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	005	21	\N	\N	\N	\N	\N
140	145	ANTON TEGUH ATMAJA	1471041204620002	JL. TG. DATUK KOMP. SUNGARDEN A 15	LIMA PULUH	PESISIR	KOTA PEKANBARU				SOFYAN AKWAN 	3275082005480009	BENING INDAH ESTATE BLOK B 4 NO. 27	PONDOKGEDE	JATIBENING	KOTA BEKASI				300.00	1032000	100.00	1200000	309600000	120000000	429600000	HGB NO.449	SUKAJAYA	LEMBANG		0	04	04	KO. GRAHA PUSPA	000	00	\N	KARLIANA	2016-01-25	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	04	04	\N	\N	\N	\N	\N
141	146	LUKMAN SUWITA	1016170505620006	JL. ALUN-ALUN UTARA NO. 35	MAJALAYA	MAJALAYA	KAB. BANDUNG				THOMAS SUSANTO	3217040101550004	Jl. KP. CIGINTUNG	CIKALONG WETAN	CIPTAGUMATI	KAB. BANDUNG BARAT				1139.00	64000	420.00	823000	72896000	345660000	418556000	AJB NO. 362/2008	CIKALONG	CIKALONG WETAN		0	002	006	JL. CIKALONGWETAN	013	03	\N	THOMAS SUSANTO	2016-01-25	\N	\N	\N	\N	\N	\N	KAB. BANDUNG	001	01	\N	\N	\N	\N	\N
142	147	GREG TONNY DAMAJANTO	3217010809510003	KP. BABAKAN LEUNGSIR 	LEMBANG	LANGENSARI	KAB. BANDUNG BARAT				DODI BAHAGIANI	3217012703660002	KP. SUKAMAH	LEMBANG	LANGENSARI	KABUPATEN BANDUNG BARAT				728.00	36000	0.00	0	26208000	0	26208000	SHM NO. 889	LANGENSARI	LEMBANG		0	01	02	BL. BABAKAN LEUNGSIR	001	02	\N	SUNARDI	2016-01-25	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	03	11	\N	\N	\N	\N	\N
143	148	RIPIN KAMIL	3204090709560002	KOPO PERMAI 1 B NO. 25	MARGAHAYU	SUKAMENAK	KOTA BANDUNG				RIYANTI YOGA	3273106107620001	JL. KARANGANYAR NO. 46	ASTANA ANYAR	KARANGANYAR	KOTA BANDUNG				450.00	1722000	0.00	0	774900000	0	774900000	HGB NO. 446	WANGUNSARI	LEMBANG		0	01	01	JL. MAGNOLIA	000	00	\N	KACHADI, KO	2016-01-26	\N	\N	\N	\N	\N	\N		002	05	\N	\N	\N	\N	\N
144	149	RIPIN KAMILR	3204090709560002	KOPO PERMAI 1 B NO. 25	MARGAHAYU	SUKAMENAK	KOTA BANDUNG			__.___.___._-___.___	RIYANTI YOGA	3273106107620001	KARANGANYAR	ASTANA ANYAR	KARANG	KOTA BANDUNG				450.00	1722000	0.00	0	774900000	0	774900000	HGB NO. 341/342/343	WANGUNSARI	LEMBANG		0	01	01	JL. MAGNOLIA	000	00	\N	KACHADI, KO	2016-01-26	\N	\N	\N	\N	\N	\N		002	05	\N	\N	\N	\N	\N
145	150	WAHYU GUNAWAN	3277030102760021	JL RAYA TIMUR 66 SUKAWARGI 1	CIMAHI UTARA	CIBABAT	KOTA CIMAHI			__.___.___._-___.___	LIEM NJUK KIAN	3273025411660004	JL DAGO ASRI II NO. 18	COBLONG	DAGO	KOTA BANDUNG				120.00	537000	68.00	1200000	64440000	81600000	146040000	HGB NO.00122	JAMBUDIPA	CISARUA		0	001	007	BL. JAMBUDIPA	002	01	\N	MELLYRIATI TJANDRADJAJA	2016-01-26	\N	\N	\N	\N	\N	\N		006	09	\N	\N	\N	\N	\N
146	151	ABDULLAH MA'ARIF	3217062706690004	BUMI PAKUSARAKAN BLOK XVII NO. 30 	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				SUNARSIH	32040544080001	ASPOL CIBIRU C/12	CILEUNYI	CIBIRU HILIR	KABUPATEN BANDUNG				60.00	916000	35.00	595000	54960000	20825000	75785000	HGB NO. 3044	TANIMULYA	NGAMPRAH		0	009	016	KO. BUMI PAKUSARAKAN	004	16	\N	SUNARSIH	2016-01-26	\N	\N	\N	\N	\N	\N		004	10	\N	\N	\N	\N	\N
147	152	LONCE SIREGAR	3217084605630012	KP POS KULON	PADALARANG	KERTAMULYA	KAB. BANDUNG BARAT				CHORIAH RANGKUTI	3204134404580001	KOMP SANGGAR MAS LESTARI BLOK C. 25 A	BANJARAN	TARAJUSARI	KABUPATEN BANDUNG				54.00	285000	21.00	310000	15390000	6510000	21900000	HGB NO. 207	CIPTAHARJA	CIPATAT		0	002	03	KO. CIPATAT ELOK E/23A	008	15	\N	E. SUPARDI	2016-01-26	\N	\N	\N	\N	\N	\N		009	12	\N	\N	\N	\N	\N
148	153	FELYNDA	3204095202820011	PERMATA KOPO BLOK EB NO. 19	MARGAHAYU	SAYATI	KAB. BANDUNG				IWAN WAHYUDI	3273102002440001	JL KALIPAH APO NO. 35	ASTANA ANYAR	KARANGANYAR	KOTA BANDUNG				321.00	1032000	100.00	823000	331272000	82300000	413572000	HAK MILIK NO. 02265	JAYAGIRI	LEMBANG		0	004	015	JL. RAYA LEMBANG	002	02	\N	IDJAH,NY	2016-01-26	\N	\N	\N	\N	\N	\N		007	07	\N	\N	\N	\N	\N
149	154	AFIF HASANUDIN	3277031202790019	PURI CIPAGERAN INDAHI BLOK H 2 NO.47-A	CIMAHI UTARA	CIPAGERAN	KOTA CIMAHI				SETYO BUDI LELONO	327702060650013	JL. SIMPANG NO G.4	CIMAHI TENGAH	KARANGMEKAR	KABUPATEN BANDUNG BARAT				73.00	916000	72.00	968000	66868000	69696000	136564000	HAK MILIK NO. 06281	TANIMULYA	NGAMPRAH		0	002	028	KO. PURI CIPAGERAN INDAH I	002	17	\N	SETYO BUDI LELONO	2016-01-26	\N	\N	\N	\N	\N	\N		004	15	\N	\N	\N	\N	\N
150	155	NI MADE PUTRI PARALASTINI	3273074801820008	ASPOL CIMAHI BLOK D NO 89	CIMAHI TENGAH	CIGUGUR TENGAH	KOTA CIMAHI				RIZKI WAHYUDI	32770307690001	JL BINA TARUNA NO. 17	CIMAHI UTARA	CITEUREUP	KOTA CIMAHI				64.00	82000	26.00	1200000	5248000	31200000	36448000	HAK MILIK NO. 819	PADAASIH	CISARUA		0	002	012	KP. PAMOYANAN	002	05	\N	ONI B ISANGI	2016-01-26	\N	\N	\N	\N	\N	\N		001	017	\N	\N	\N	\N	\N
151	156	NI MADE PUTRI PARALASTINI	3273074801820008	ASPOL CIMAHI BLOK D NO 89	CIMAHI TENGAH	CIGUGUR TENGAH	KOTA CIMAHI				RIZKI WAHYUDI	327703076900001	JL BINA TARUNA NO. 17	CIMAHI UTARA	CITEUREUP	KOTA CIMAHI				20.00	82000	10.00	1200000	1640000	12000000	13640000	HAK MILIK NO. 735	PADAASIH	CISARUA		0	002	012	KP. PAMOYANAN	002	05	\N	ONI B ISANGI	2016-01-26	\N	\N	\N	\N	\N	\N		001	017	\N	\N	\N	\N	\N
152	157	ENJANG WARSA	3217030906790004	PASIRLANGU	CISARUA	PASIRLANGU	KAB. BANDUNG BARAT				MASRI SUTAN SATI	3277021005560019	JALAN RAYA CIMINDI NO 223	CIMAHI TENGAH	CIGUGUR TENGAH	KOTA CIMAHI				2775.00	27000	0.00	0	74925000	0	74925000	HAK MILIK NO. 58	CIPADA	CISARUA		0	004	002	BL. PASIR CALUNG	001	05	\N	H. EMAN	2016-01-26	\N	\N	\N	\N	\N	\N		004	015	\N	\N	\N	\N	\N
153	158	A INDRA PERMANA	3273010903810002	ASPOL SARIJADI BLOK 18 NO. 25 	SUKASARI	SARIJADI	KOTA BANDUNG			__.___.___._-___.___	DIMASWARA PEBIANA	1017082002870001	Jl. DUSUN PASARIBU	RANCAKALONG	SUMEDANG	KOTA SUMEDANG				102.00	2013000	40.00	968000	205326000	38720000	244046000	HAK MILIK NO. 4892	SARIWANGI	PARONGPONG		0	013	006	KO. BUMI SARIWANGI	001	16	\N	DIMASWARA PEBIANA	2016-01-26	\N	\N	\N	\N	\N	\N		002	02	\N	\N	\N	\N	\N
154	159	TANWANTONO	3173062908620003	KOMP HARMONI MAS BLOK A NO. 23	PENJARINGAN	PEJAGALAN	JAKARTA UTARA				TOSIN SACA SEOMARNA	3217013012390002	KAMPUNG KARAMAT	LEMBANG	CIKAHURIPAN	KABUPATEN BANDUNG BARAT				1012.00	82000	0.00	0	82984000	0	82984000	593.21/PEM/2016	SUKAJAYA	LEMBANG		0	001	003	KP. BARUNAGRI	002	03	\N	KASA	2016-01-26	\N	\N	\N	\N	\N	\N		007	006	\N	\N	\N	\N	\N
155	160	SITI SURYANI	3273165108650004	BABAKN SARI III	KIARACONDONG	BABAKAN SARI	KOTA BANDUNG				E. RATNASIH	3217094411540001	Jl. BL. CITUNJUNG	BATUJAJAR	BATUJAJAR TIMUR	KABUPATEN BANDUNG				238.00	394000	40.00	505000	93772000	20200000	113972000	090/147/DS/1/2016	BATUJAJAR TIMUR	BATUJAJAR		0	001	009	BL. CITUNJUNG	000	03	\N	E. RATNASIH	2016-01-26	\N	\N	\N	\N	\N	\N		000	03	\N	\N	\N	\N	\N
156	161	RACHMAT iBNU	3171021003840005	JL SUNTER PARADISE RAYA VI BLK H/11	TANJUNG PRIOK	SUNTER AGUNG	JAKARTA UTARA			__.___.___._-___.___	PT. BELAPUTERA INTILAND	3674026009670001	SUTERA DELIMA 1/34	SERPONG UTARA	PONDOK JANGUNG	KOTA TANGERANG				162.00	2352000	97.00	1833000	381024000	177801000	558825000	HGB NO. 03804	CIPEUNDEUY	PADALARANG		0	011	019	KO. KOTA BARU PARAHYANGAN	000	00	\N	PT. BELAPUTERA INTILAND	2016-01-26	\N	\N	\N	\N	\N	\N		003	010	\N	\N	\N	\N	\N
157	162	GUGUN GUNAWAN	3217011512800024	KP PASIRWANGI	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				ONENG NURAISYAH	3217016909540003	Jl. KP. PASIRWANGI	LEMBANG	GUDANGKAHURIPAN	KABUPATEN BANDUNG			__.___.___._-___.___	203.00	64000	0.00	0	12992000	0	12992000	593.21/05/PEM/2016	GUDANGKAHURIPAN	LEMBANG		0	001	010	BL. PASIR WANGI	002	11	\N	SALPIA BP ADI	2016-01-26	\N	\N	\N	\N	\N	\N		001	010	\N	\N	\N	\N	\N
158	163	USEP TAJUDIN	640301011660002	KP TUGU 1	CISARUA	TUGUMUKTI	KAB. BANDUNG BARAT				GANDI	12345678910	Jl. KP TUGU	CISARUA	TUGUMUKTI	KABUPATEN BANDUNG				580.00	36000	40.00	429000	20880000	17160000	38040000	HAK MILIK NO. 16	TUGUMUKTI	CISARUA		1	002	008	BL. TUGU I	000	00	\N	GANDI	2016-01-26	\N	\N	\N	\N	\N	\N		002	08	\N	\N	\N	\N	\N
159	164	DRA LILI LEOSANTOSA	3204094405610006	TAMAN KOPO INDAH A 2 NO 150	MARGAHAYU	MARGAHAYU SEALATAN	KAB. BANDUNG				HERWATI SOBARI	3273135411520004	JL RAJAMANTRI KALER II NO.37B	LENGKONG	PASIRHALANGTURANGGA	KABUPATEN BANDUNG				488.00	48000	0.00	0	23424000	0	23424000	HAK MILIK NO. 211	PASIRHALANG	CISARUA		0	007	010	KP. PASIRHALANG	001	04	\N	HERWATI SOBARI	2016-01-26	\N	\N	\N	\N	\N	\N		009	04	\N	\N	\N	\N	\N
160	165	AMBARWATI	3273055710610001	JL ELANG VIII NO. 28	ANDIR	MALEBAR	KOTA BANDUNG				IR. SANUSI TANAWI	3173062210530001	PERUM CITRA BLOK G -11/12	KALIDERES	PEGADUNGAN	JAKARTABARAT				338.00	2352000	184.00	1516000	794976000	278944000	1073920000	HGB NO. 03979	CIPEUNDEUY	PADALARANG		0	004	010	KO. KOTA BARU PARAHYANGAN	000	00	\N	PT. BELAPUTERA INTILAND	2016-01-26	\N	\N	\N	\N	\N	\N		008	019	\N	\N	\N	\N	\N
161	166	DAVID KUSNADI	3276031107778009	PERUM PURI PRIMACOM BLOK DS	SAWANGUN	CINANGKA	KOTA DEPOK				PT. BELAPUTERA INTILAND	3173062210530001	Jl. JL. RAYA PADALARANG	PADALARANG	KERTAJAYA	KABUPATEN BANDUNG				198.00	2352000	114.00	1516000	465696000	172824000	638520000	HGB NO. 03778	CIPEUNDEUY	PADALARANG		0	003	005	KO. KOTA BARU PARAHYANGAN	000	00	\N	PT. BELAPUTERA INTILAND	2016-01-26	\N	\N	\N	\N	\N	\N		004	09	\N	\N	\N	\N	\N
162	167	VERA INTANIE DEWI	3217086304780010	JL JINGGA WIJAYA WETAN 	PADALARANG	CIPEUNDEUY	KAB. BANDUNG BARAT				PT. BELAPUTERA INTILAND	3273106107620001	Jl. JL. RAYA PADALARANG	PADALARANG	KERTAJAYA	KABUPATEN BANDUNG BARAT				162.00	2352000	97.00	1516000	381024000	147052000	528076000	HGB NO. 03712	CIPEUNDEUY	PADALARANG		0	003	011	KO. KOTA BARU PARAHYANGAN	000	00	\N	PT. BELAPUTERA INTILAND	2016-01-26	\N	\N	\N	\N	\N	\N		004	09	\N	\N	\N	\N	\N
163	168	LEE YA CHING	302690954	KP SEGRANG NO. 16	CIBOGO	PADAASIH	KAB. SUBANG				KURNIAWAN WIRAATMADJA	3217081405720009	JL WANGSAPUTRI WETAN NO. 7	PADALARANG	CIPEUNDEUY	KABUPATEN BANDUNG BARAT				162.00	2352000	96.00	1200000	381024000	115200000	496224000	HAK MILIK NO. 1519	CIPEUNDEUY	PADALARANG		0	13	06	JL. WANGSAPUTRI WETAN	000	00	\N	DEWI AULIA	2016-01-26	\N	\N	\N	\N	\N	\N		001	008	\N	\N	\N	\N	\N
164	169	FEMMY SUWANDI	3273055002850008	JL. TAMIM NO. 32 A	ANDIR	KEBON JERUK	KOTA BANDUNG			25.260.965.6-428.000	PERRY TRISTIANTO T	3273052202600001	JL. LMU. NURTANIO NO. 78	ANDIR	GARUDA	KOTA BANDUNG				1145.00	335000	0.00	0	383575000	0	383575000	SHM NO. 1027	CIHANJUANG	PARONGPONG		0	007	001	KP. CIBALIGO	001	01	\N	FERRY	2016-01-27	\N	\N	\N	\N	\N	\N	KOTA BANDUNG	003	005	\N	\N	\N	\N	\N
165	170	FEMMY SUWANDI	3273055002850008	JL. TAMIM NO. 32 A	ANDIR	KEBON JERUK	KOTA BANDUNG			25.260.965.6-428.000	PERRY TRISTIANTO T	3273052202600001	JL. LMU. NURTANIO NO. 78	ANDIR	GARUDA	KOTA BANDUNG				760.00	335000	0.00	0	254600000	0	254600000	SHM NO. 1026	CIHANJUANG	PARONGPONG		0	007	001	KP. CIBALIGO	001	01	\N	FERRY	2016-01-27	\N	\N	\N	\N	\N	\N		003	005	\N	\N	\N	\N	\N
166	171	HERAWATI	3277025712600004	JL. JEND. GATOT SUBROTO NO. H. 104	CIMAHI TENGAH	KARANGMEKAR	KOTA CIMAHI				MIFTAH SUNANDAR	3276061204810003	JL. PALAKALI NO. 75	BEJI	TANAH BARU	KOTA DEPOK				209.00	464000	45.00	823000	96976000	37035000	134011000	HGB NO. 1067	JAYAMEKAR	PADALARANG		0	003	011	JL. JEND. GATOT SUBROTO NO. H. 104	003	011	\N	PT. UZI KARYA PRESTASI	2016-01-27	\N	\N	\N	\N	\N	\N	KOTA CIMAHI	002	005	\N	\N	\N	\N	\N
167	172	KARINA UTAMI PUTRI	3273045101880006	JL. CURUG KENCANA	BOJONGLOA KALER	SUKAASIH	KOTA BANDUNG				UJANG YAYAT	3217010101600381	KP. BUNISARI	LEMBANG	MEKARWANGI	KABUPATEN BANDUNG BARAT				173.00	64000	80.00	823000	11072000	65840000	76912000	SHM NO. 1493	MEKARWANGI	LEMBANG		0	004	010	BL. BUNISARI			\N	RUKAYAT	2016-01-27	\N	\N	\N	\N	\N	\N	KOTA BANDUNG	003	006	\N	\N	\N	\N	\N
168	173	PAHANG SANTOSO	3217010503670007	KP. CIJERUK	LEMBANG	LEMBANG	KAB. BANDUNG BARAT				RIDA SUPIARSIH	3271064607610006	CIMANGGU ASRI JL. CENDANA II NO. 29	TANAH SAREAL	KEDUNGWARINGIN	KOTA BOGOR				774.00	243000	0.00	0	188082000	0	188082000	SHM NO. 4367	LEMBANG	LEMBANG		0	006	008	JL. CIJERUK DALAM	003	08	\N	DEDE ABDUL SYUKUR	2016-01-27	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	003	\N	\N	\N	\N	\N
169	174	YUNITA BUDIAWATI	3277015206900010	GG. SOSIAL NO. 22 B	CIMAHI SELATAN	CIBEUREUM	KOTA CIMAHI				CHANDRA TAMBAYONG	3273040205600005	JL. JAMIKA	BOJONGLOA KALER	JAMIKA	KABUPATEN BANDUNG BARAT				60.00	335000	22.00	1200000	20100000	26400000	46500000	HGB NO. 1451	JAYAMEKAR	PADALARANG		0	002	004	KO. PERMATA PADALARANG			\N	PT. SAUYUNAN ASRI SARANA	2016-01-27	\N	\N	\N	\N	\N	\N	KOTA CIMAHI	005	007	\N	\N	\N	\N	\N
170	175	YUNITA BUDIAWATI	3277015206900010	GG. SOSIAL NO. 22 B	CIMAHI SELATAN	CIBEUREUM	KOTA CIMAHI				CHANDRA TAMBAYONG	3273040205600005	JL. JAMIKA	BOJONGLOA KALER	JAMIKA	KOTA BANDUNG				60.00	335000	22.00	1200000	20100000	26400000	46500000	HGB NO. 1451	JAYAMEKAR	PADALARANG		0	002	004	KO. PERMATA PADALARANG			\N	PT. SAUYUNAN ASRI SARANA	2016-01-27	\N	\N	\N	\N	\N	\N	KOTA CIMAHI	005	007	\N	\N	\N	\N	\N
171	176	MEGARIA SALSIA	3277037105940003	JL. KAMARUNG GG PANELI 2	CIMAHI UTARA	CITEUREUP	KOTA CIMAHI			__.___.___._-___.___	CHANDRA TAMBAYONG	3273040205600005	JL. JAMIKA	BOJONGLOA KALER	JAMIKA	KOTA BANDUNG				60.00	335000	29.00	1200000	20100000	34800000	54900000	HGB NO. 1554	JAYAMEKAR	PADALARANG		0	005	004	KP. CITATAH	003	11	\N	DAYAT	2016-01-27	\N	\N	\N	\N	\N	\N	KOTA CIMAHI	005	007	\N	\N	\N	\N	\N
172	177	MIFTAHUL ARIFIN	3216193007790003	PERUM BUMI CIKARANG MAKMUR BLOK F-2 NO. 08	CIKARANG SELATAN	SUKADAMI	KAB. BEKASI				RD ELIN SOFIA AS	3217024809570001	KP. PARIGILAME NP. 70	PARONGPONG	CIWARUGA	KABUPATEN BANDUNG BARAT				91.00	1722000	36.00	968000	156702000	34848000	191550000	SHM NO. 5292	CIWARUGA	PARONGPONG		0	003	014	KP. BARU	005	07	\N	ONDO H	2016-01-27	\N	\N	\N	\N	\N	\N	KAB. BEKASI	002	007	\N	\N	\N	\N	\N
173	178	HERDIANA YUSUF PRASTOWO	3273230808830002	KOMPLEK BANDUNG INDAH RAYA C-5 NO. 8	RANCASARI	MEKARJAYA	KOTA BANDUNG				TOMY HENDARTO	3603171808740013	TAMAN UBUD LOKA VIII NO. 52	CURUG	BINONG	KAB. TANGERANG				84.00	702000	45.00	700000	58968000	31500000	90468000	SHM NO. 06492	TANIMULYA	NGAMPRAH		0	004	001	KP. RANDUKURUNG	001	09	\N	LADY GALINA IRENEKE,SH	2016-01-27	\N	\N	\N	\N	\N	\N	KOTA BANDUNG	0	0	\N	\N	\N	\N	\N
174	179	FREDDY SIREGAR	1273032409780001	KP. CISINTOK	PARONGPONG	CIHANJUANG	KAB. BANDUNG BARAT			__.___.___._-___.___	I PUTU YUDIANTARA	3277012503670007	PONDOK MAS BARAT I NO. 06 	CIMAHI SELATAN	LEUWIGAJAH	KOTA CIMAHI			07.715.486.2-803.000	119.00	160000	0.00	0	19040000	0	19040000	SHM NO. 03664	CIHANJUANG	PARONGPONG		0	002	004	KP. CISINTOK	001	04	\N	NUR ADLIN	2016-01-27	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	006	001	\N	\N	\N	\N	\N
175	180	FAJRI	1871111004850007	JL.TURI RAYA PERUM GRAHA MADU PESONA CLUSTER 3 N0. 34	TANJUNG SENANG	TANJUNG SENANG	KOTA. BANDAR LAMPUNG			59.637.260.7-307.000	IR. H. DADANG HIDAYAT	3273260610500001	JL. RAHAYU NO. 11 A CIJAMBE	UJUNGBERUNG	PASIR ENDAH	KOTA BANDUNG				149.00	103000	45.00	1200000	15347000	54000000	69347000	HGB NO. 06428	CILAME	NGAMPRAH		0	017	0	KP. CILOA	001	03	\N	TANTO HARTONO	2016-01-27	\N	\N	\N	\N	\N	\N	KOTA BANDAR LAMPUNG	002	008	\N	\N	\N	\N	\N
176	181	WATI NURHAYATI	3217085602770016	KP. BABAKAN PASIR ANGIN	PADALARANG	CIBURUY	KAB. BANDUNG BARAT				H. A. SUGANDI MUSLIM	3217040803410021	KP. CIPADA GIRANG	CIKALONG WETAN	MEKARJAYA	KABUPATEN BANDUNG				9575.00	27000	0.00	0	258525000	0	258525000	590/DS/8/03/2016	SADANGMEKAR	CISARUA		0	001	015	BL. CISARUA HILIR	004	03	\N	H. A. SUGANDI MUSLIM	2016-01-27	\N	\N	\N	\N	\N	\N		001	001	\N	\N	\N	\N	\N
177	182	RIKI VITRIYANTO	3217661606860011	ASRAMA BRIGIF 15 KUJANG II	CIMAHI TENGAH	BAROS	KOTA CIMAHI				MUHAMMAD RANGGA RAMADAN	3174051005880005	JL. MASJID NUR NO. 11	KEBAYORAN LAMA	GROGOL UTARA	PROV. DKI JAKARTA				72.00	48000	36.00	823000	3456000	29628000	33084000	HGB NO. 191	CITATAH	CIPATAT		0	003	023	BL. CIMERANG	004	12	\N	PT. BUMI INDAH PARAHYANGAN	2016-01-27	\N	\N	\N	\N	\N	\N	KOTA CIMAHI	006	010	\N	\N	\N	\N	\N
178	183	CECEP FIRMANSYAH	3217070909670016	KP. MEKARWANGI	CIPATAT	GUNUNG MASIGIT	KAB. BANDUNG BARAT				MUHAMMAD RANGGA RAMADAN	3174051005880005	JL. MASJID NUR NO. 11	KEBAYORAN LAMA	GROGOL UTARA	PROV. DKI JAKARTA				72.00	48000	36.00	823000	3456000	29628000	33084000	HGB NO. 199	CITATAH	CIPATAT		0	002	012	BL. CIMERANG	004	12	\N	PT. BUMI INDAH PARAHYANGAN	2016-01-27	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	000	00	\N	\N	\N	\N	\N
179	184	YENI SRI RAHMAWATI	3217064404810005	PURI CIPAGERAN INDAH 2BLOK C14-26	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				NIA KURNIASIH	3272016606470004	Jl. KABANDUNGAN NO. 37	GUNUNG PUYUH	KARAMAT	KOTA SUKABUMI				60.00	916000	0.00	0	54960000	0	54960000	HGB NO. 4111	TANIMULYA	NGAMPRAH		0	03	21	KO. PURI CIPAGERAN INDAH II	003	21	\N	PT. RAYA DEVINDO	2016-01-28	\N	\N	\N	\N	\N	\N		02	06	\N	\N	\N	\N	\N
181	186	DR. PUTRA KABAN, SH MH	3175091506590015	JL. INAYAH 	CIRACAS	KELAPADUAWETAN	JAKARTA TIMUR				AGUS SUKANA	3217011408600004	Jl. KP. PASAR AHAD	LEMBANG	CIKOLE	KABUPATEN BANDUNG BARAT				2022.00	36000	0.00	0	72792000	0	72792000	SHM NO. 646	CIKOLE	LEMBANG		0	03	08	BL. PASIR PANJANG	005	07	\N	AGUS SUKANA	2016-01-28	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	02	\N	\N	\N	\N	\N
182	187	AEP SURIYANA	3217081108650011	KP. RANCABALI	PADALARANG	PADALARANG	KAB. BANDUNG BARAT				WARTA MAEMUNAH	474.3/07/V/WRS/2	Jl. KP RANCA BALI	PADALARANG	PADALARANG	KABUPATEN BANDUNG BARAT				1390.00	335000	50.00	505000	465650000	25250000	490900000	187	PADALARANG	PADALARANG	SURAT KETERANGAN SUSUNAN AHLI WARIS NOMOR: 474.3/107/V/WRS/2015	1	005	004	KP. RANCABALI	002	04	\N	WARTA MAEMUNAH	2016-01-28	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	002	04	\N	\N	t	\N	\N
180	185	AEP SURIYANA	3217081108650011	KP. RANCABALI	PADALARANG	PADALARANG	KAB. BANDUNG BARAT				WARTA MAEMUNAH	474.3/07/V/WRS/2	Jl. KP RANCA BALI	PADALARANG	PADALARANG	KABUPATEN BANDUNG BARAT				833.00	335000	50.00	505000	279055000	25250000	304305000	187	PADALARANG	PADALARANG	SURAT KETERANGAN SUSUNAN AHLI WARIS NOMOR: 474.3/107/V/WRS/2015	1	005	004	KP. RANCABALI	002	04	\N	WARTA MAEMUNAH	2016-01-28	1390.00	50.00	\N	\N	\N	\N	KAB. BANDUNG BARAT	002	04	\N	\N	\N	\N	\N
183	188	DR. PUTRA KABAN, SH MH	3175091506590015	JL. INAYAH 	CIRACAS	KELAPADUAWETAN	JAKARTA TIMUR				WARYA	3217011903600002	Jl. KP. CIKOLE	LEMBANG	CIKOLE	KABUPATEN BANDUNG BARAT				1370.00	64000	0.00	0	87680000	0	87680000	973/13/PEM/2015	CIKOLE	LEMBANG		0	03	08	BL. CIKOLE	005	07	\N	WARYA	2016-01-28	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	02	07	\N	\N	\N	\N	\N
184	189	JULIANA MANIK	3277025505800051	JL. POJOK UTARA NO.47 	CIMAHI TENGAH	SETIAMANAH	KOTA CIMAHI				INA NUR EKA	3217064101710111	Jl.ZAMRUD  VIII D-5 NO. 4	NGAMPRAH	TANIMULYA	KABUPATEN BANDUNG BARAT				70.00	1032000	21.00	700000	72240000	14700000	86940000	SHM NO. 6521	TANIMULYA	NGAMPRAH		0	02	05	KO. PERMATA CIMAHI	002	13	\N	JADAR SIDIK	2016-01-28	\N	\N	\N	\N	\N	\N	BANDUNG BARAT	002	13	\N	\N	\N	\N	\N
185	190	SRI SAWALWATY	3217066109770018	GRAHA BUKIT RAYA 1 E-3 NO. 12	NGAMPRAH	CILAME	KAB. BANDUNG BARAT			49.695.603.8-421.000	RACHMANTO SUBEKTI, IR	3217602107480001	Jl. KO. GRAHA BUKIT RAYA BLOK F4 NO 33A	NGAMPRAH	CILAME	KAB. BANDUNG BARAT				75.00	802000	22.00	429000	60150000	9438000	69588000	HAK MILIK NO. 1339	CILAME	NGAMPRAH		0	011	021	KO. GRAHA BUKIT RAYA	003	21	\N	MOCHAMAD SYAIR	2016-01-28	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	010	21	\N	\N	\N	\N	\N
186	191	URBANUS ROMBOT	3217062511670006	BUKIT PERMATA CIMAHI E-4 NO. 3	NGAMPRAH	CILAME	KAB. BANDUNG BARAT				JUNIWATI WIBOWO	3273156010460002	Jl. JL. MELONG ASIH NO. 21	BANDUNG KULON	CIJERAH	KOTA BANDUNG				54.00	1032000	72.00	595000	55728000	42840000	98568000	SHM NO. 5906	TANIMULYA	NGAMPRAH		0	01	22	JL. PERMATA RAYA	006	12	\N	JUNIWATI WIBOWO	2016-01-28	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	007	03	\N	\N	\N	\N	\N
187	192	SUGIANTO	3215031605850004	DUSUN SAPTAMARGA	TELUKJAMBETIMUR	SIRNABAYA	KAB. KARAWANG				SANTI HARTINI	3277025208740054	Jl. KP.SINDANG SARI 	CIMAHI TENGAH	CIGUGURTENGAH	KOTA CIMAHI				308.00	27000	0.00	0	8316000	0	8316000	Akta Hibah no.31/2016	GALANGGANG	BATUJAJAR		0	19	03	KP. NEGLASARI	002	13	\N	ADI WIJAYA	2016-01-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	002	13	\N	\N	\N	\N	\N
189	194	ASEP USMAN	3217081609600007	KP RANCABALI GG KARANG SARI	PADALARANG	PADALARANG	KAB. BANDUNG BARAT				WARTA MAEMUNAH	4743/107/V/WRS	Jl. KP RANCA BALI	PADALARANG	PADALARANG	KABUPATEN BANDUNG				355.00	335000	30.00	365000	118925000	10950000	129875000	HAK MILIK NO. 1891	PADALARANG	PADALARANG	SURAT KETERANGAN AKHLI WARIS	1	002	004	KP. RANCABALI	002	04	\N	WARTA MAEMUNAH	2016-01-28	\N	\N	\N	\N	\N	\N		002	04	\N	\N	\N	\N	\N
188	193	CHELY GUNAWAN. OR. SP A	3578094201690002	GALAXI BUMI PERMAI BLOK H 03/05	SUKOLILO	SEMOLOWARU	KOTA SURABAYA			__.___.___._-___.___	LINA WATI GUNAWAN	3273105803450001	Jl. OTISTA NO. 360	ASTANA ANYAR	KARANG ANYAR	KOTA BANDUNG				505.00	2013000	0.00	0	1016565000	0	1016565000	SHM NO. 740	CIWARUGA	PARONGPONG		0	001	012	KO. GEGERKALONG PERMAI	000	00	\N	UTJOENG LIMARGANA	2016-01-28	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	002	009	\N	\N	\N	\N	\N
190	195	BOENTARAN JUSUF	3273033110560001	JL. SAKURA ELOK NO. 6	BABAKAN CIPARAY	SUKAHAJI	KOTA BANDUNG				TATO SEDYOHARTO	3217022408730004	KOMP. PONDOK HIJAU AZALEA NO. 2	PARONGPONG	CIWARUGA	KABUPATEN BANDUNG BARAT				357.00	82000	0.00	0	29274000	0	29274000	SHM NO. 01497	JAMBUDIPA	CISARUA		0	08	05	BL. JAMBUDIPA	001	01	\N	RUDIS	2016-01-28	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	04	10	\N	\N	\N	\N	\N
191	196	HERRI SUBIAKTO WIYOSO	3273272403630003	JL. RIUNG ARUM RAYA NO. 2	GEDEBAGE	CISARANTEUN KIDUL	KOTA BANDUNG				DIDI ACHDIYAT	3217060704680011	Jl. KO. GRAHA BUKIT RAYA F4 NO. 5A	NGAMPRAH	CILAME	KABUPATEN BANDUNG BARAT				75.00	802000	35.00	700000	60150000	24500000	84650000	HGB NO. 3312	CILAME	NGAMPRAH		0	07	10	KO. GRAHA BUKIT RAYA			\N	DIDI ACHDIYAT	2016-01-28	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	11	21	\N	\N	\N	\N	\N
192	197	MERY GUNAWAN	3277037009690018	PURI CIPAGERAN INDAH BLOK B NO. 13	CIMAHI UTARA	CIPAGERAN	KOTA CIMAHI				HERMAN PHANTONY	1671100907590003	JL. MP MANGKUNEGARA KOMP. VILLA TANJUNG HARAP	KALIDONI	BUKIT SANGKAL	KOTA PALEMBANG				126.00	2352000	63.00	823000	296352000	51849000	348201000	HGB NO.1893	CIPEUNDEUY	PADALARANG		0	06	26	JL. BANYAKPENEMU	000	00	\N	PUJI RAHAYU	2016-01-29	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	24	05	\N	\N	\N	\N	\N
193	198	MUHAMMAD JAFAR PAOTTONG	7371091208730007	KOMP. VILLA RACING CENTRE J/25	PANAKKUKANG	KARAMPUANG	KOOTA MAKASAR			72.638.494.4-805.000	IR. YUNUS HD RUKMANA	3273190309630001	JL. KEBON SIRIH NO. 36	SUMUR BANDUNG	BABAKAN CIAMIS	KOTA BANDUNG				238.00	916000	120.00	1516000	218008000	181920000	399928000	HGB NO.06317	CILAME	NGAMPRAH		0	03	09	KO. THE AWANI RESIDENCE	008	04	\N	PT. AWANI BANDUNG REALTY	2016-01-29	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	008	08	\N	\N	\N	\N	\N
194	199	DEDAH JUBAEDAH S	3217065609690006	BUKIT PERMATA B-1 NO. 10	NGAMPRAH	CILAME	KAB. BANDUNG BARAT				DEDEH JUBAEDAH	3217066212770012	Jl. KP. KEBON KALAPA	NGAMPRAH	TANIMULYA	KABUPATEN BANDUNG BARAT				78.00	82000	0.00	0	6396000	0	6396000	SHM NO. 3340	CILAME	NGAMPRAH		0	06	03	JL.RAYA CILAME	005	21	\N	DEDEH JUBAEDAH	2016-01-29	\N	\N	\N	\N	\N	\N	BANDUNG BARAT	003	02	\N	\N	\N	\N	\N
195	200	LIM ANGIE CHRISTINA	3172017105800001	TAMAN RESORT MEDITERANIA Z-3 /11	JAKARTA UTARA	PENJARINGAN	JAKARTA				ROBIN SITABA	3273010108600001	JL. SARIKASO VII NO. 2A	SUKASARI	SARIJADI	KOTA BANDUNG				2378.00	243000	0.00	0	577854000	0	577854000	SHM NO. 3158	SARIWANGI	PARONGPONG		0	02	08	BL. LEBAK CIGUGUR	001	12	\N	MIMIN AMISAH	2016-01-29	\N	\N	\N	\N	\N	\N		06	01	\N	\N	\N	\N	\N
196	201	LIM ANGIE CHRISTINA	3172017105800001	TAMAN RESORT MEDITERANIA Z-3 /11	JAKARTA UTARA	PENJARINGAN	JAKARTA				LIANA DEWI ROSLI	3273016508590004	JL. SARIKASO VII NO. 2A	SUKASARI	SARIJADI	KOTA BANDUNG				1768.00	243000	0.00	0	429624000	0	429624000	SHM NO.2722	SARIWANGI	PARONGPONG		0	02	08	BL. LEBAK CIGUGUR	003	13	\N	KARTIWI KIN KARTAWIJAYA	2016-01-29	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	06	01	\N	\N	\N	\N	\N
197	202	LIM ANGIE CHRISTINA	3172017105800001	TAMAN RESORT MEDITERANIA Z-3 /11	JAKARTA UTARA	PENJARINGAN	JAKARTA				ROBIN SITABA	3273010108600001	JL. SARIKASO VII NO. 2A	SUKASARI	SARIJADI	KOTA BANDUNG				2406.00	243000	0.00	0	584658000	0	584658000	SHM NO. 3083	SARIWANGI	PARONGPONG		0	02	08	BL. MEKARWANGI	001	12	\N	BOY PRAMUDJI, H.IR	2016-01-29	\N	\N	\N	\N	\N	\N		06	01	\N	\N	\N	\N	\N
198	203	LIM ANGIE CHRISTINA	3172017105800001	TAMAN RESORT MEDITERANIA Z-3 /11	JAKARTA UTARA	PENJARINGAN	JAKARTA				ROBIN SITABA	3273010108600001	JL. SARIKASO VII NO. 2A	SUKASARI	SARIJADI	KOTA BANDUNG				644.00	200000	105.00	823000	128800000	86415000	215215000	SHM NO. 3104	SARIWANGI	PARONGPONG		0	02	08	KP. MEKARWANGI	002	13	\N	TUTI SUTJIATI	2016-01-29	\N	\N	\N	\N	\N	\N		06	01	\N	\N	\N	\N	\N
199	204	RAHMA ZISKA	3277036108820031	JL. CIHANJUANG BABUT GIRANG GG. H. SUJAI NO. 8B	CIMAHI UTARA	CIBABAT	KOTA CIMAHI				EKANANDA MUHDIANI	3273195007660004	Jl. ERMAWAR NO. 4 	SUMURBANDUNG	MERDEKA	KOTA BANDUNG				60.00	285000	75.00	1200000	17100000	90000000	107100000	SHM NO. 5607	SARIWANGI	PARONGPONG		0	06	11	JL. SARIWANGI	001	10	\N	WAHYUDI IR	2016-01-29	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	04	\N	\N	\N	\N	\N
200	205	ASEP LILI SOLIHIN	3273051807710007	JL. DUNGUSCARIANG NO. 78C/79	ANDIR	DUNGUS CARIANG	KOTA BANDUNG				YASIH SITI ROHMAH	3277014404940022	Jl. JL. MAHAR MARTANEGARA NO. 71	CIMAHI SELATAN	UTAMA	KOTA CIMAHI			__.___.___._-___.___	105.00	702000	45.00	968000	73710000	43560000	117270000	SHM NO.1077	BATUJAJAR TIMUR	BATUJAJAR		0	06	07	JL. RAYA BATUJAJAR  KM.6,5	000	00	\N	YASIH SITI ROHMAH	2016-01-29	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	08	\N	\N	\N	\N	\N
201	206	YAYASAN PESANTREN PENDIDIKAN ISLAM MADANI(WILDAN HAKIM)	3217011703720012	KP. CIDADAP 	LEMBANG	CIBODAS	KAB. BANDUNG BARAT				IDA, NY	3217014709580012	Jl. KP. CIDADAP	LEMBANG	CIBODAS	KABUPATEN BANDUNG BARAT				1400.00	36000	0.00	0	50400000	0	50400000	PELAPASAN HAK  NO.213	CIBODAS	LEMBANG		0	04	04	BL. CIDADAP	004	04	\N	IDA, NY	2016-01-29	\N	\N	\N	\N	\N	\N		004	04	\N	\N	\N	\N	\N
202	207	YAYASAN PESANTREN PENDIDIKAN ISLAM MADANI(WILDAN HAKIM)	3217011703720012	KP. CIDADAP 	LEMBANG	CIBODAS	KAB. BANDUNG BARAT				WIWIN WINARTI	3217014805670010	Jl. KP. CIDADAP	LEMBANG	CIBODAS	KABUPATEN BANDUNG BARAT				700.00	36000	0.00	0	25200000	0	25200000	PELEPASANK HAK NO.141	CIBODAS	LEMBANG		0	04	04	BL. CIDADAP	004	04	\N	WIWIN, NY	2016-01-29	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	004	04	\N	\N	\N	\N	\N
203	208	LIEN MEYLINA	3273056105580008	JL. MALEBER BARAT NO. 213/187B	ANDIR	MALEBER	KOTA BANDUNG				TATI TUFIATY	3273056812520004	Jl. JEND. SUDIRMAN NO. 844	ANDIR	MALEBER	KOTA BANDUNG				84.00	702000	36.00	700000	58968000	25200000	84168000	HGB NO. 1512	PADALARANG	PADALARANG		0	06	03	KO. PONDOK PADALARANG INDAH	005	27	\N	TATI TUFIATY	2016-01-29	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	01	03	\N	\N	\N	\N	\N
204	209	SRI SANTOSONINGRUM	3174045008630005	KESATRIAN POLANTAS NO. 9	PASARMINGGU	PEJATEN BARAT	JAKARTA SELATAN				SRI HANDAJANI KERTORAHARDJO	3273084908520001	JL. CIPAKU INDAH I NO. 5	CIDADAP	LEDENG	KOTA BANDUNG				140.00	394000	36.00	700000	55160000	25200000	80360000	SHM NO. 00642	KAYUAMBON	LEMBANG		0	02	02	KO. PUSDIK AJEN	001	03	\N	MARKAM	2016-01-29	\N	\N	\N	\N	\N	\N		02	02	\N	\N	\N	\N	\N
205	210	SRI SANTOSONINGRUM	3174045008630005	KESATRIAN POLANTAS NO. 9	PASARMINGGU	PEJATEN BARAT	JAKARTA SELATAN				SRI HANDAJANI KERTORAHARDJO	3273084908520001	JL. CIPAKU INDAH I NO. 5	CIDADAP	LEDENG	KOTA BANDUNG				140.00	394000	40.00	429000	55160000	17160000	72320000	SHM NO. 00643	KAYUAMBON	LEMBANG		0	02	02	KO. PUSDIK AJEN	001	03	\N	DADANG,H	2016-01-29	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	02	02	\N	\N	\N	\N	\N
206	211	IWAN GANDAWIJAYA	3204100201710006	TAMAN KOPO INDAH III, RUKO C NO. 25 	MARGAASIH 	RAHAYU	KAB. BANDUNG				DRS. SUWARGO SUTEDJO	3273091908340001	JL. CITARUM NO. 14 	BANDUNG WETAN	CIHAPIT	KOTA BANDUNG				810.00	3745000	0.00	0	3033450000	0	3033450000	SHM NO. 02164	CIWARUGA	PARONGPONG		0	01	13	KO. SETRA DUTA	000	00	\N	ROSALIN	2016-02-01	\N	\N	\N	\N	\N	\N		01	03	\N	\N	\N	\N	\N
207	212	HARYANTO HALIM	3273171312610002	JL. INDRA WARMAN NO. 1	BOJONGLOA KIDUL	CIBADUYUT WETAN	KOTA BANDUNG				DR. TONY	3273071430640006	JL. GRIYA UTARA NO. 21	SUKAJADI	SUKAWARNA	KOTA BANDUNG				204.00	916000	100.00	1200000	186864000	120000000	306864000	HGB NO. 00345	KERTAJAYA	PADALARANG		0	010	002	KO. KOTA BALI JL. KUTA RAYA	000	00	\N	PT. PESONA JATI ABADI	2016-02-01	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	007	008	\N	\N	\N	\N	\N
208	213	KHARISMA MAHESA SEDANA	3273010109930001	PARAHYANGAN RUMAH VILLA B-39	SUKASARI	SARIJADI	KOTA BANDUNG				ARLANDA	3273010205730001	Jl. JL. NUSA INDAH NO. 174B 	SUKASARI	GEGERKALONG	 KOTA BANDUNG				84.00	1032000	40.00	823000	86688000	32920000	119608000	SHM NO. 4286	CIWARUGA	PARONGPONG		0	08	10	KO. GRIYA AMANDA 3	001	07	\N	ARLANDA	2016-02-01	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	009	02	\N	\N	\N	\N	\N
209	214	MARYANTO, ST	3214121412770001	JL. JINGGA KOMARA KULON NO. 12	PADALARANG	CIPEUNDEUY	KAB. BANDUNG BARAT				IR. SANUSI TANAWI	3173062210530001	PERUM CITRA II BLOK G 11/2	KALIDERES	PEGADUNGAN	JAKARTA BARAT				346.00	2352000	269.00	1516000	813792000	407804000	1221596000	HGB NO. 00834	CIPEUNDEUY	PADALARANG		0	02	11	KO. KOTA BARU PARAHYANGAN	000	00	\N	PT. BELAPUTERA INTILAND	2016-02-01	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	08	19	\N	\N	\N	\N	\N
210	215	IRFAN AFIANTO, SE. MM	3217082007760012	PERUM PPI BLOK C-9 NO. 27	PADALARANG	PADALARANG	KAB. BANDUNG BARAT			__.___.___._-___.___	TIEN SUHARTINI	3217085609520003	PERUM PPI JL. CEMPAKA B.10	PADALARANG	PADALARANG	KABUPATEN BANDUNG				189.00	64000	0.00	0	12096000	0	12096000	594/01/2016/05	PADALARANG	PADALARANG		0	002	028	KP. KEPUH	001	10	\N	SUHAYA	2016-02-01	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	004	022	\N	\N	\N	\N	\N
211	216	DINDIN TAHJUDIN	3217070303750011	KP. WARUNG TIWU	CIPATAT	RAJAMANDALAKULON	KAB. BANDUNG BARAT				EVA ARNAS	3217076303770011	GRIYA SUKARAME ASRI	CIPATAT	CIPTAHARJA	KABUPATEN BANDUNG BARAT				110.00	27000	36.00	505000	2970000	18180000	21150000	SHM NO. 835	CIPTAHARJA	CIPATAT		0	002	015	KP. SUKARAME	004	02	\N	ALIMUDIN, SPD	2016-02-01	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	006	016	\N	\N	\N	\N	\N
212	217	DRS. H. TATANG SUHERMAN	3217061702470001	JL. RAYA BATUJAJAR 95	NGAMPRAH	CIMAREME	KAB. BANDUNG BARAT				SUHARTINI, HJ., SE	3273016512490001	Jl. JL. PAK GATOT II NO. 13 G KPAD	SUKASARI	GEGERKALONG	KOTA BANDUNG				843.00	243000	0.00	0	204849000	0	204849000	SHM NO. 00909	GIRIASIH	BATUJAJAR		0	02	08	JL. RAYA BATUJAJAR	002	04	\N	SUHARTINI, HJ., SE	2016-02-01	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	32	\N	\N	\N	\N	\N
213	218	DRS. H. TATANG SUHERMAN	3217061702470001	JL. RAYA BATUJAJAR 95	NGAMPRAH	CIMAREME	KAB. BANDUNG BARAT				SUHARTINI, HJ., SE	3273016512490001	Jl. JL. PAK GATOT IINO. 13-G  KPAD	SUKASARI	GEGERKALONG	KOTA BANDUNG				508.00	243000	0.00	0	123444000	0	123444000	SHM NO. 00865	GIRIASIH	BATUJAJAR		0	02	08	JL. RAYA BATUJAJAR	002	04	\N	SUHARTINI, HJ., SE	2016-02-01	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	32	\N	\N	\N	\N	\N
214	219	LIA SITI ALIA	3273025912620006	JL. SETRA INDAH II NO. 17	SUKAJADI	SUKAGALIH	KOTA BANDUNG				RADEN NENENG HERLINA SOEKANDAR	3273186708460001	Jl. CIGADUNG RAYA TENGAH NO. 45	CIBEUNYING KALER	CIGADUNG	KOTA BANDUNG				705.00	537000	40.00	429000	378585000	17160000	395745000	SHM NO. 495	SUKAJAYA	LEMBANG		0	004	003	JL. KOLONEL MASTURI	001	01	\N	EDI SUPARDI	2016-02-01	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	002	006	\N	\N	\N	\N	\N
215	220	DRS. H. TATANG SUHERMAN	3217061702470001	JL. RAYA BATUJAJAR 95	NGAMPRAH	CIMAREME	KAB. BANDUNG BARAT				SUHARTINI, HJ, SE	3273016512490001	Jl. JL. PAK GATOTII NO. 13 G KPAD	SUKASARI	GEGERKALONG	KOTA BANDUNG			__.___.___._-___.___	764.00	243000	0.00	0	185652000	0	185652000	SHM NO. 00540	GIRIASIH	BATUJAJAR		0	02	08	JL. RAYA BATUJAJAR	000	00	\N	SUHARTINI, HJ, SE	2016-02-01	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	02	\N	\N	\N	\N	\N
216	221	LIA SITI ALIA	3273025912620006	JL. SETRA INDAH II NO. 17	SUKAJADI	SUKAGALIH	KOTA BANDUNG				RADEN NENENG HERLINA SOEKANDAR	3273186708460001	JL. CIGADUNG RAYA TENGAH NO. 45	CIBEUNYING KALER	CIGADUNG	KOTA BANDUNG				134.00	537000	0.00	0	71958000	0	71958000	SHM NO. 272	SUKAJAYA	LEMBANG		0	004	003	JL. KOLONEL MASTURI	001	01	\N	EDI SUPARDI	2016-02-01	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	002	006	\N	\N	\N	\N	\N
217	222	IRVAN GUMILAR	3204130309870006	KP. BATU NUMPUK 	BANJARAN	MEKARJAYA	KAB. BANDUNG				MA'MUN	3277031808600006	Jl. SENTRAL 	CIMAHI UTARA	CIBABAT	KOTA CIMAHI				98.00	394000	36.00	968000	38612000	34848000	73460000	SHM NO. 01854	CIGUGURGIRANG	PARONGPONG		0	02	02	PERUM KP. NIKMAT	000	00	\N	DIK DIK RELLA KHARDIANSYAH	2016-02-01	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	05	05	\N	\N	\N	\N	\N
218	223	VINDYA PRANATA,S.SOS	3273112101760007	JL. KEMBAR SARI INDAH II NO. 10 	REGOL	CIGERELENG	KOTA BANDUNG				ENI RODIAH	3217085111710010	Jl. TEMBOKAN	PADALARANG	CIPEUNDEUY	KABUPATEN BANDUNG BARAT				95.00	1032000	32.00	365000	98040000	11680000	109720000	SHM NO. 02122	CIPEUNDEUY	PADALARANG		0	05	06	JL. PADALARANG	001	01	\N	ENI RODIAH	2016-02-01	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	01	\N	\N	\N	\N	\N
219	224	ZANETHA LABIANKA	3174075005941001	JL. LANGSAT II NO. 6	KEBAYORAN BARU	KRAMAT PELA	JAKARTA SELATAN				NETRI ANDANIE	3404074408690009	DERO	DEPOK	CONDONGCATUR	KAB. SLEMAN				101.00	1862000	0.00	0	188062000	0	188062000	SHM NO. 5151	CIWARUGA	PARONGPONG		0	02	01	KO. SURILAME	003	07	\N	NONOH JUARIAH	2016-02-01	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	07	16	\N	\N	\N	\N	\N
220	225	YULIANI	3217084902770013	JINGGA KARTIA KULON NO. 58 KBP	PADALARANG	CIPEUNDEUY	KAB. BANDUNG BARAT				SELVIA ANNA	3674035609500002	KOMP. KARYA INDAH VILAGE C/8	PONDOK AREN	PONDOK KARYA	KOTA TANGERANG SELATAN				2540.00	27000	0.00	0	68580000	0	68580000	SHM NO. 205	CIKALONG	CIKALONG WETAN		0	03	11	KP. LAPANG	005	02	\N	OKA GUNAWAN, H	2016-02-01	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	04	03	\N	\N	\N	\N	\N
221	226	ENRICO HARYONO	3273083101800003	JL. HEGARMANAH TENGAH NO. 81	CIDADAP	HEGARMANAH	KOTA BANDUNG				ENTUN SUHANDRA	3217081509590003	KP. NEGLASARI	PADALARANG	TAGOGAPU	KABUPATEN BANDUNG BARAT				5000.00	64000	0.00	0	320000000	0	320000000	140/36/DS/II/2016	CIBURUY	PADALARANG		0	01	08	KP. CIKAMUNING	001	19	\N	WARDIAH MARTISAN	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	02	13	\N	\N	\N	\N	\N
222	227	GANOFI SAHRUDIN CS	3217031411630002	KP. BABAKAN MUNCANG 	CISARUA	PADAASIH	KAB. BANDUNG BARAT				JAFINAH H	31/KRM/VI/2007	TAMAN MUTIARA BLOK D 6 NO. 16 	CIMAHI TENGAH	KARANGMEKAR	KOTA CIMAHI				2605.00	36000	0.00	0	93780000	0	93780000	SHM NO. 475	KERTAWANGI	CISARUA	SURAT KETERANGAN SUSUNAN AHLI WARIS NO. 474.3/210/KC/VI/2007	1	01	12	BL. KEBON CAU	002	05	\N	JAPINAH H	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	03	16	\N	\N	\N	\N	\N
223	228	JOICE RIAN MAHARANI	3277026908780013	JL. POJOK UTARA I NO. 119, GG. KARYAMUDA II	CIMAHI TENGAH	SETIAMANAH	KOTA CIMAHI				HJ. UAT	1016375109340001	JL. H. MUKTI NO. 22	PARONGPONG	CIHANJUANG	KABUPATEN BANDUNG				910.00	243000	0.00	0	221130000	0	221130000	594/173/2015	CIHANJUANG	PARONGPONG		0	004	004	KP. CIBALIGO	003	02	\N	KOSASIH NATANEGARA,SH, H	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	008	001	\N	\N	\N	\N	\N
224	229	PRAHESTI INDRA,IR,MSC	3273026505650002	JL. BADAK SINGA NO. 17 	COBLONG	LEBAK SILIWANGI	KOTA BANDUNG				MAULUDIN SOFYAN	3277031207590001	Jl. KO. KCVRI KP TEGAL KAWUNG NO. 58	CIMAHI UTARA	CIPAGERAN	KOTA CIMAHI				19200.00	64000	0.00	0	1228800000	0	1228800000	SHM NO. 00576	PAKUHAJI	NGAMPRAH		0	06	04	BL. PAKUHAJI	001	10	\N	MAULUDIN SOFYAN	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	006	08	\N	\N	\N	\N	\N
225	230	UMMU ROBIAH 	3273065901720001	GANG GELATIK NO. 12	CICENDO	PAJAJARAN	KOTA BANDUNG				DR TONY	3273071910640006	JL. GRIYA UTARA  NO. 21	SUKAJADI	SUKAWARNA	KOTA BANDUNG				59.00	916000	110.00	1200000	54044000	132000000	186044000	HGB NO. 00209	KERTAJAYA	PADALARANG		0	01	02	KO. KOTA BALI JL. KUTA RAYA	000	00	\N	PT. PESONA JATI ABADI	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	07	03	\N	\N	\N	\N	\N
226	231	YATI NURHAYATI	3217084412680002	JL. TERATAI BLOK F NO. 8 BALOPER	PADALARANG	PADALARANG	KAB. BANDUNG BARAT				DR TONY	3273071910640006	JL. GRIYA UTARA NO. 21	SUKAJADI	SUKAWARNA	KOTA BANDUNG				115.00	916000	45.00	1200000	105340000	54000000	159340000	HGB NO. 00361	KERTAJAYA	PADALARANG		0	02	20	KOTA BALI	000	00	\N	PT. PESONA JATI ABADI	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	07	03	\N	\N	\N	\N	\N
227	232	DEDI SUHANDA	3211183004830011	JL. CIHANJUANG NO. 102	CIMAHI UTARA	CIBABAT	KOTA CIMAHI				IR. HANSEN TJUAT TJADARMA	3273190805650006	JL. RE. MARTADINATA NO. 144	SUMUR BANDUNG	MERDEKA	BANDUNG				78.00	702000	45.00	1200000	54756000	54000000	108756000	HGB NO. 1565	BATUJAJAR TIMUR	BATUJAJAR		0	003	018	KO. PURI INDAH LESTARI	000	00	\N	PT. DIMENSI PURI LESTARI	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	007	008	\N	\N	\N	\N	\N
228	233	ERIC TANUDJAJA	3175030206760011	CIPINANG ELOK BLOK AV NO. 23	JATINEGARA	CIPINANG MUARA	JAKARTA TIMUR				DR TONY	3273071910640006	JL. GRIYA UTARA NO. 21	SUKAJADI	SUKAWARNA	KOTA BANDUNG				100.00	916000	45.00	1200000	91600000	54000000	145600000	HGB NO. 00346	KERTAJAYA	PADALARANG		0	03	10	KOTA BALI 0	000	00	\N	PT. PESONA JATI ABADI	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	07	03	\N	\N	\N	\N	\N
230	235	DRG. JULIA HUSNY JACHYA	3273104607510001	JL. CIBADAK NO. 256	ASTANAANYAR	CIBADAK	KOTA. BANDUNG				IR.H.ABDUL RAUF KADIR	1050071710460001	JL. R.E MARTADINATANO. 177	BANDUNG WETAN	CIHAPIT	KOTA BANDUNG				610.00	48000	0.00	0	29280000	0	29280000	SHM NO. 59	WANGUNSARI	LEMBANG		0	02	01	BL. ARENG	004	05	\N	ADIS / FARWES SERVIA	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	06	07	\N	\N	\N	\N	\N
231	236	PHILIP ANDERSON LESMANA	3277021407800009	JL. GANDAWIJAYA NO. 106/122	CIMAHI TENGAH	SETIAMANAH	KOTA CIMAHI				DIDI	3217061506300001	Jl. KP. BABAKAN MEKAR	NGAMPRAH	BOJONGKONENG	KABUPATEN BANDUNG BARAT				2263.00	36000	0.00	0	81468000	0	81468000	593/2/DS/I/2016	BOJONGKONENG	NGAMPRAH		0	01	02	KP. LEGOK ANGKLUNG	000	00	\N	UJANG DIDI	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	02	06	\N	\N	\N	\N	\N
232	237	H. AYI ROHMAT AFFANDI	3273111506600022	JL KEMBAR TIMUR VIII NO. 8	REGOL	ANCOL	KOTA BANDUNG				HJ. NERSIH M	3217085609260002	Jl. KP. CIPONDOH	PADALARANG	CIPEUNDEUY	KABUPATEN BANDUNG BARAT				522.00	160000	0.00	0	83520000	0	83520000	594/DS/DS.2016	CIPEUNDEUY	PADALARANG		0	02	07	KP. CIPONDOH	004	12	\N	KARDILAH / ADI	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	02	14	\N	\N	\N	\N	\N
233	238	ADE CHANDRA NUGRAHA	3217022712720002	KP. PANGKALAN NO. 37 C	PARONGPONG	SARIWANGI	KAB. BANDUNG BARAT				H. GUNAWAN, SH. MM	3217022712590002	SETIABUDI REG WING V DIAMOND A-8	PARONGPONG	CIGUGUR GIRANG	KABUPATEN BANDUNG				150.00	1032000	100.00	968000	154800000	96800000	251600000	SHM NO. 3505	CIWARUGA	PARONGPONG		0	001	010	KO. PONDOK GRAHA LISTA			\N	GRAHA LISTA	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	014	\N	\N	\N	\N	\N
234	239	ARIS DWI RAHMANA	3175040504800009	JL. H. TAIMAN NO. 29	KRAMAT JATI	TENGAH	JAKARTA TIMUR				MAME SLAMET S	3273072303480002	Jl. JL. TRS SUTAMI 24	SUKAJADI	SUKAGALIH-SUKAJADI	KOTA BANDUNG				120.00	1573000	0.00	0	188760000	0	188760000	SHM NO. 05589	CIWARUGA	PARONGPONG		0	07	07	KO. SETRA REGENSI	002	04	\N	MAME SLAMET S	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	006	03	\N	\N	\N	\N	\N
235	240	H. GUNAWAN, SH. MM	3217022712590002	SETIABUDI REG WING V DIAMOND A-8	PARONGPONG	CIGUGUR GIRANG	KAB. BANDUNG BARAT			__.___.___._-___.___	JOGA	3277031808620001	TAMAN MUTIARA II BLOK 3 A NO. 18	CIMAHI TENGAH	KARANGMEKAR	KOTA CIMAHI				216.00	1862000	38.00	823000	402192000	31274000	433466000	HGB NO. 620	CIWARUGA	PARONGPONG		0	001	014	JL. SAFIR BIRU III	000	00	\N	ERDAWATI	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	005	016	\N	\N	\N	\N	\N
236	241	ELLA HERLIAH	3277014904830040	KOMP. PILAR MAS JL. PINANG MAS I BLOK E 7 NO. 61	CIMAHI SELATAN	UTAMA	KOTA CIMAHI				MAME SLAMET S	3273072303480002	Jl. JL. TRS SUTAMI 24	SUKAJADI	SUKAGALIH-SUKAJADI	KOTA BANDUNG				101.00	1573000	0.00	0	158873000	0	158873000	SHM NO. 05588	CIWARUGA	PARONGPONG		0	07	03	KO. SETRA REGENSI	002	04	\N	MAME SLAMET S	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	006	03	\N	\N	\N	\N	\N
237	242	NINA MULYANI	3217066909860001	KP. CIKANDANG 	NGAMPRAH	CIMAREME	KAB. BANDUNG BARAT				UNANG CS	3217061907600004	KP. PARAKAN 	NGAMPRAH	BOJONGKONENG	KABUPATEN BANDUNG BARAT				160.00	160000	0.00	0	25600000	0	25600000	590/1/DS/2016	CIMAREME	NGAMPRAH		0	02	07	KP. CIKANDANG	002	07	\N	AI RUKIYAH	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	03	08	\N	\N	\N	\N	\N
238	243	ANGGA KUNTO WIJAKSONO	3217060710830006	KOMP. PADASUKA INDAH II D.14	NGAMPRAH	GADOBANGKONG	KAB. BANDUNG BARAT				SARIMUN	3217061101550001	KOMP. PADASUKA INDAH II BLOK. C 21	NGAMPRAH	GADOBANGKONG	KAB. BANDUNG BARAT				92.00	1032000	68.00	505000	94944000	34340000	129284000	SHM NO. 00072	GADOBANGKONG	NGAMPRAH		0	003	009	KO. PADASUKA INDAH II	003	09	\N	HERU SUYOSO	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	004	009	\N	\N	\N	\N	\N
239	244	SUBADRI	3277030402590016	JL. ANYELIR NO. 3	CIMAHI UTAMA	CIBABAT	KOTA CIMAHI				AISAH	3217065010630013	KP. CIHARASHAS	NGAMPRAH	MARGAJAYA	KABUPATEN BANDUNG BARAT				97.00	243000	45.00	595000	23571000	26775000	50346000	100/01/DS/2016	CIMERANG	PADALARANG		0	02	10	KP. TIPAR BARAT	001	02	\N	ANDA	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	04	04	\N	\N	\N	\N	\N
240	245	BOBBY RINAL MAKMUN	3273092812700004	JL. SUREN NO. 2	BANDUNG WETAN	CIHAPIT	KOTA BANDUNG				ERMA FANNY SULIYANTI	3273027008770012	JL. IR.H.JUANDA NO. 144	COBLONG	LEBAKGEDE	KOTA BANDUNG				310.00	64000	0.00	0	19840000	0	19840000	SHM NO. 1574	MEKARWANGI	LEMBANG		0	07	06	BL. BUNIWANGI	001	04	\N	SIDIK UKAN	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	03	11	\N	\N	\N	\N	\N
241	246	KWEEK BENG TIE	3273080202520001	JL. HEGARMANAH NO. 18-A	CIDADAP	HEGARMANAH	KOTA BANDUNG				DRS. IBNU BANGSAWAN	3204410109300002	JL. RAYA LEMBANG NO. 44	LEMBANG	GUDANGKAHURIPAN	KABUPATEN BANDUNG BARAT				2000.00	243000	0.00	0	486000000	0	486000000	SHM NO. 01402	GUDANGKAHURIPAN	LEMBANG		0	03	08	BL. CIHIDEUNG	001	02	\N	DAYANG SUMBI/ RD TATA SUBARTA	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	02	\N	\N	\N	\N	\N
242	247	DEKKY SAFARI	3273112911830001	JL. PASUNDAN NO. 144 A	REGOL	PUNGKUR	KOTA BANDUNG				ENDEH SUPRIADI	3217060907660002	CIDAHU	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT			__.___.___._-___.___	73.00	702000	36.00	823000	51246000	29628000	80874000	SHM NO. 06451	TANIMULYA	NGAMPRAH		0	005	004	KP. CIDAHU	004	01	\N	KOL. SUHARBIYANTO	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	001	\N	\N	\N	\N	\N
243	248	EGA DADI ALAMSAH	3217062711830003	JL. SARIMANAH XII NO. 169	SUKASARI	SARIJADI	KOTA BANDUNG				WAHYUDIN	3217082106720013	KP. TIPAR BARAT	PADALARANG	LAKSANAMEKAR	KAB. BANDUNG BARAT				111.00	702000	36.00	823000	77922000	29628000	107550000	SHM NO. 06472	TANIMULYA	NGAMPRAH		0	007	008	KP. CIDAHU	004	01	\N	KOL. SUHARBIYANTO	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	002	002	\N	\N	\N	\N	\N
244	249	ASEP ROCHMAWAN	3273081309860001	JL. BUKIT JARIAN V	CIDADAP	HEGARMANAH	KOTA BANDUNG				MIFTAH SUNANDAR	3276061204810003	JL. PALAKALI NO. 75	BEJI	TANAH BARU	KOTA DEPOK				98.00	464000	22.00	823000	45472000	18106000	63578000	HGB NO. 01866	JAYAMEKAR	PADALARANG		0	006	001	KP. GANTUNGAN	003	09	\N	PT. UZI KARYA LESTARI	2016-02-03	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	002	005	\N	\N	\N	\N	\N
245	250	PIPIT ANGGRAENI DEWI	3173074708900003	PERUM BENTANG PADALARANG REGENSI BLOK E 3 NO. 8	PADALARANG	JAYAMEKAR	KAB. BANDUNG BARAT				MIFTAH SUNANDAR	3276061204810003	JL. PALAKALI NO. 75	BEJI	TANAH BARU	KOTA DEPOK			__.___.___._-___.___	170.00	464000	36.00	823000	78880000	29628000	108508000	HGB NO. 01827	JAYAMEKAR	PADALARANG		0	005	024	KP. GANTUNGAN	003	09	\N	PT. UZI KARYA LESTARI	2016-02-03	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	002	005	\N	\N	\N	\N	\N
246	251	NUNUY MAEMUNAH	3217084906750017	PERUM PPI BLOK E.3 NO. 8	PADALARANG	PADALARANG	KAB. BANDUNG BARAT				NY. ANE YUANA	3217085206740018	JL. RAYA PURWAKARTA NO. 404	PADALARANG	TAGOG APU	KABUPATEN BANDUNG BARAT				79.00	702000	21.00	595000	55458000	12495000	67953000	HGB NO. 01457	PADALARANG	PADALARANG		0	005	027	PERUM PPI	006	27	\N	UMI MAFTUHAFUL Z	2016-02-03	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	002	004	\N	\N	\N	\N	\N
247	252	FRANSISCA XAVERIA RINI W CS	3217015305600008	KP. SUKAMULYA 102	LEMBANG	LANGENSARI	KAB. BANDUNG BARAT				ANTONIUS PAMI HERNADI, DRS	4743./26/2015	Jl. KP. SUKAMULYA	LEMBANG	LANGENSARI	KABUPATEN BANDUNG BARAT				3081.00	48000	50.00	429000	147888000	21450000	169338000	HGB NO. 00135	LANGENSARI	LEMBANG	SURAT KETERANGAN SUSUNAN AKHLI WARIS NO. 474.3/44/WRS/PEM/LBG/2015	1	03	10	BL. GUNUNG BATU	001	10	\N	ANTONIUS PAHMI, DRS	2016-02-03	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	03	10	\N	\N	\N	\N	\N
248	253	TANTI WINARTI	3217024903930004	KP. PANYAIRAN NO. 65	PARONGPONG	CIHIDEUNG	KAB. BANDUNG BARAT				H AYUB KOSWARA	3217020212600001	Jl. JL. SERSAN BAJURI NO. 65	PARONGPONG	CIHIDEUNG	KABUPATEN BANDUNG BARAT				727.00	702000	56.00	700000	510354000	39200000	549554000	SHM NO. 614	CIHIDEUNG	PARONGPONG		0	02	10	JL. SERSAN BAJURI	002	10	\N	H AYUB KOSWARA	2016-02-03	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	002	10	\N	\N	\N	\N	\N
250	255	THIO HERMAWAN	3273060709820004	JL. GEDUNG DELAPAN NO. 6	CICENDO	ARJUNA	KOTA BANDUNG			25.215.260.8-428.000	YANA SURYANA, SE	3273060406560002	JL. PAJAJARAN NO. 112	CICENDO	PAJAJARAN	KOTA BANDUNG				350.00	2352000	234.00	1516000	823200000	354744000	1177944000	SHM NO. 1917	CIPEUNDEUY	PADALARANG		0	002	007	KO. KBP JL. NAGADIGDAYA	000	00	\N	JANUAR ARIFIN KOSASIH	2016-02-03	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	007	\N	\N	\N	\N	\N
251	256	ANDRI NURDIANSYAH	3273012110730007	JL. DR SETIABUDHI NO. 179	SUKASARI	GEGERKALONG	KOTA BANDUNG				DENI RUSTANDI	3273071609700010	JL. SUKAJADI GG. SUKAJADI II	SUKAJADI	PASTEUR	KOTA BANDUNG				84.00	802000	0.00	0	67368000	0	67368000	SHM NO. 05952	SARIWANGI	PARONGPONG		0	02	04	KP. PANGKALAN	001	11	\N	RINA MARYANI	2016-02-03	\N	\N	\N	\N	\N	\N	BANDUNG BARAT	06	11	\N	\N	\N	\N	\N
252	257	RIDWAN YUSUF	3205012803820002	KP. BABAKAN PAJAGALAN AL-FALAH 433	GARUT KOTA	SUKAMENTRI	KOTA GARUT				ASEP JUANDA	3217092909670003	JL. BLOK KAUM SELATAN	BATUJAJAR	BATUJAJAR BARAT	KABUPATEN BANDUNG BARAT				60.00	160000	36.00	823000	9600000	29628000	39228000	HGB NO. 18	BATUJAJAR BARAT	BATUJAJAR		0	001	005	JL. DESA	001	14	\N	TIA SUTIAMAH, HJ	2016-02-03	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	009	\N	\N	\N	\N	\N
253	258	PAULUS CIEPUTRA	3273072205820002	JL. KARANG LAYUNG NO. 29	SUKAJADI	CIPEDES	KOTA BANDUNG				NANDANG SAEHU FATAH	3204072503720001	KP. CIKOANG KALER	CILENGKRANG	JATIENDAH	KABUPATEN BANDUNG				142.00	14000	70.00	310000	1988000	21700000	23688000	SHM NO.00108	CINTAKARYA	SINDANGKERTA		0	04	02	BL. CIBURUY	001	03	\N	NANDANG SAEHU FATAH	2016-02-03	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	05	03	\N	\N	\N	\N	\N
254	259	SUPRAPTONO	3201070505870017	GRIYA ALAM SENTOSA BB. 4/6	NGAMPRAH	CILAME	KAB. BOGOR				SOELIMAH CS	3277026802250003	JL. SANUSI NO. 451	CIMAHI TENGAH	KARANGMEKAR	KOTA CIMAHI				90.00	916000	36.00	823000	82440000	29628000	112068000	SHM NO. 458	CILAME	NGAMPRAH		0	16	08	KO. CILAME INDAH	002	20	\N	R SUWARDI	2016-02-03	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	017	\N	\N	\N	\N	\N
255	260	MAYA CHRISTINA	3204076904820001	JL. LAHAN JATI NO. 48 BLOK II 	CILENGKRANG	JATIENDAH	KAB. BANDUNG			52.721.852.6-444.000	BENI RAHAYU	3204102606820003	Jl. KO. MARGAHAYU PERMAI 18 NO. 26	MARGAASIH	MEKARRAHAYU	KAB.BANDUNG				80.00	702000	29.00	968000	56160000	28072000	84232000	HGB NO. 3052	PADALARANG	PADALARANG		0	02	16	KO. GPI JL. GRAHA SAFIR 8	000	00	\N	BENI RAHAYU	2016-02-04	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	004	08	\N	\N	\N	\N	\N
256	261	MARYONO	3217062005580004	PERMATA CIMAHI G-3 NO. 21	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				BAMBANG SIHONO	3217063009590002	KOMP. AWANI RESIDENCE BLOK A4 NO. 46	NGAMPRAH	CIMAREME	KABUPATEN BANDUNG BARAT				60.00	1032000	21.00	595000	61920000	12495000	74415000	SHM NO. 1230	TANIMULYA	NGAMPRAH		0	04	14	KO. PERMATA CIMAHI	005	14	\N	BAMBANG SIHONO	2016-02-04	\N	\N	\N	\N	\N	\N	KAB.BANDUNG BARAT	06	05	\N	\N	\N	\N	\N
257	262	ROSI ROSMIATI	3217165803910002	KP. CIKANDE 	SAGULING	CIKANDE	KAB. BANDUNG BARAT				ENA DULAH	3217165608490001	Jl. KP. CIKANDE	SAGULING	CIKANDE	KABUPATEN BANDUNG BARAT				154.00	36000	80.00	595000	5544000	47600000	53144000	73/SKRT/DS/I/2016	CIKANDE	SAGULING		0	02	02	BL. CIKANDE	001	02	\N	ENA DULAH	2016-02-04	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	02	\N	\N	\N	\N	\N
258	263	LILIK NUR TRIYANTI	3172034410760004	JL. PATIMURA KP. WALANG 	KOJA	RAWA BADAK SELATAN	JAKARTA UTARA				RINI KOMALA	3217065812730011	Jl. PERMATA CIMAHI II N.22 NO. 3	NGAMPRAH	TANIMULYA	KABUPATEN BANDUNG BARAT				72.00	802000	70.00	968000	57744000	67760000	125504000	SHM NO. 2975	TANIMULYA	NGAMPRAH		0	08	03	KO. PERMATA CIMAHI II	005	24	\N	RINI KOMALA	2016-02-04	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	005	24	\N	\N	\N	\N	\N
259	264	JAMSER PASARIBU	3217072010770002	KP. CIRANGRANG 	CIPATAT	SUMUR BANDUNG	KAB. BANDUNG BARAT				SUMARDI	3217070708690024	KP. CIBONTENG	CIPATAT	SUMURBANDUNG	KABUPATEN BANDUNG BARAT				925.00	10000	0.00	0	9250000	0	9250000	SHM NO. 223	SUMURBANDUNG	CIPATAT		0	01	01	BL. SINGAPURA	000	12	\N	MAIN DARSIH	2016-02-05	\N	\N	\N	\N	\N	\N	KAB.BANDUNG BARAT	03	01	\N	\N	\N	\N	\N
260	265	CIPTO PAWITAN	3271031011580009	BOGOR BARU BLOK DI/1 	BOGOR TENGAH	TEGALLEGA	KOTA BOGOR				RD. ELIN SOFIA AS	3217024809570001	Jl. KP. PARIGILAME NO. 70	PARONGPONG	CIWARUGA	KABUPATEN BANDUNG BARAT				136.00	1722000	40.00	968000	234192000	38720000	272912000	SHM NO. 4797	CIWARUGA	PARONGPONG		0	07	01	KP. BARU	005	07	\N	ONDO H	2016-02-05	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	02	07	\N	\N	\N	\N	\N
261	266	ARIP	3217160304400001	KP. CIGARUKGAK 	SAGULING	CIKANDE	KAB. BANDUNG BARAT				OJAT	3217160608530081	KP. CIIWUR 	SAGULING	CIKANDE	KABUPATEN BANDUNG BARAT				6576.00	10000	0.00	0	65760000	0	65760000	593.2/114/5/2016	GIRIMUKTI	SAGULING		0	02	11	BL. JALUPANG KIDUL	001	05	\N	SARIP	2016-02-05	\N	\N	\N	\N	\N	\N	KAB.BANDUNG BARAT	02	10	\N	\N	\N	\N	\N
262	267	BAMBANG KURNIAWAN	3217032606710001	KP. PAMENGPEUK	CISARUA	PASIRHALANG	KAB. BANDUNG BARAT				LIEM NJUK KIAN	3273025411660004	JL. DAGO ASRI II NO. 18	COBLONG	DAGO	KOTA BANDUNG				105.00	48000	45.00	1200000	5040000	54000000	59040000	HGB NO. 51	JAMBUDIPA	CISARUA		0	002	012	BL. JAMBUDIPA	002	01	\N	MELLYRIATI TJANDRADJAJA	2016-02-05	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	006	009	\N	\N	\N	\N	\N
263	268	RIA ARIANI	3277016807830024	GG. UMJANI 	CIMAHI SELATAN	CIBEBER	KOTA CIMAHI				LIEM NJUK KIAN	3273025411660004	JL. DAGO ASRI II NO. 18	COBLONG	DAGO	KOTA BANDUNG				195.00	537000	68.00	1200000	104715000	81600000	186315000	HGB NO. 51	JAMBUDIPA	CISARUA		0	01	14	BL. JAMBUDIPA	002	01	\N	MELLYRIATI TJANDRADJAJA	2016-02-05	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	06	09	\N	\N	\N	\N	\N
264	269	MASDIANA SARI DEWI	3277016807830029	JL. RAYA CIMINDI NO. 236	CICENDO	SUKARAJA	KOTA BANDUNG				LIEM NJUK KIAN	3273025411660004	JL.DAGO ASRI II NO. 18	COBLONG	DAGO	KOTA BANDUNG				105.00	48000	45.00	1200000	5040000	54000000	59040000	HGB NO. 00174	JAMBUDIPA	CISARUA		0	002	010	BL. JAMBUDIPA	002	01	\N	MELLYRIATI TJANDRADJAJA	2016-02-05	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	006	009	\N	\N	\N	\N	\N
265	270	IMAS NANI KARTINI	3374144509570001	MIJEN	MIJEN	MIJEN	KOTA SEMARANG				JUANAH	3217085105250002	Jl. KP SUDIMAMPIR	PADALARANG	PADALARANG	KABUPATEN BANDUNG BARAT				222.00	243000	48.00	225000	53946000	10800000	64746000	SHM NO. 2002	PADALARANG	PADALARANG		0	02	02	KP. SUDIMAMPIR	005	01	\N	JUANAH	2016-02-05	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	02	24	\N	\N	\N	\N	\N
286	291	MAMAT SUTISNA	3277030602680005	JL. AMIR MACHMUD GG ABDULLAH NO. 63/126	CIMAHI UTARA	CIBABAT	KOTA CIMAHI				AGUS SOFYAN	3277022108720021	GG. BABAKAN ANYAR NO. 13	CIMAHI TENGAH	PADASUKA	KOTA CIMAHI				60.00	1032000	22.00	1200000	61920000	26400000	88320000	SHM NO. 539	MARGAJAYA	NGAMPRAH		0	002	006	KO. MARGAJAYA INDAH	000	00	\N	KOO PO CHU	2016-02-09	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	006	020	\N	\N	\N	\N	\N
287	292	REINALD SISWANTO	3273053008840001	JL. DADALI NO. 16 	ANDIR	GARUDA	KOTA BANDUNG				RIANATI YOGA	3273106107620001	JL. KARANGANYAR NO. 46 	ASTANA ANYAR	KARANGANYAR	KOTA BANDUNG				648.00	1722000	0.00	0	1115856000	0	1115856000	HGB NO. 177	WANGUNSARI	LEMBANG		0	01	03	JL. MAGNOLIA	000	00	\N	KACHADI, KO	2016-02-09	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	02	05	\N	\N	\N	\N	\N
249	254	HENDRA KURNIAWAN	3217081003800027	JL. TANJAKAN PANARIS NO. 28A	PADALARANG	KERTAJAYA	KAB. BANDUNG BARAT				KANTOR LELANG BANDUNG	1111111111111111	JL. AMBON NO. 1	BANDUNG	BANDUNG	KOTA BANDUNG				535.00	702000	0.00	0	375570000	0	375570000	SHM NO. 25, NO. 26,NO.649	KERTAJAYA	PADALARANG		0	01	06	JL. SIMPANG	005	06	\N	AHID UCAH	2016-02-03	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	00	00	\N	\N	\N	\N	\N
267	272	ERWIN KURNIAWAN	3674011908740004	VERSAILLES RESIDENCESEKT 1-6 BLOK F 56	SERPONG	RAWA BUNTU	KOTA TANGERANG			__.___.___._-___.___	KARSIH	3217045404460001	KP CIKUBANG	CIKALONG WETAN	MANDALAMUKTI	KAB. BANDUNG BARAT			__.___.___._-___.___	1735.00	14000	0.00	0	24290000	0	24290000	AJB NO. 089/2016	MANDALAMUKTI	CIKALONG WETAN		0	005	009	BL. CIKUBANG	001	09	\N	ADE ROCHMAN	2016-01-26	\N	\N	2016-01-26	089/2016	\N	\N	KAB. BANDUNG BARAT	004	017	\N	\N	\N	\N	\N
268	273	IR. HELFI HALIM	3217082806600003	PITARANI NO 34 KBP	PADALARANG	CIPENDEUY	KAB. BANDUNG BARAT				ENDIN	3217070507570001	KP. CIBIHBUL	CIPATAT	GUNUNGMASIGIT	KAB. BANDUNG BARAT				4506.00	20000	0.00	0	90120000	0	90120000	AJB NO. 1222/2015	RAJAMANDALA KULON	CIPATAT		0	001	011	BL. KUTA GANDOK	001	24	\N	ENDIN	2015-12-30	\N	\N	2015-12-30	1222/2015	\N	\N	KAB. BANDUNG BARAT	004	011	\N	\N	\N	\N	\N
269	274	DRS. DEDE SUMIATI	3217065205710001	PURI CIPAGERAN INDAH 2 C-14/16	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				DARMAWAN SETIABUDI BASIT	3217062404500011	PURI CIPAGERAN INDAH 2 C-14/16	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				159.00	916000	36.00	700000	145644000	25200000	170844000	SHM NO. 1186	TANIMULYA	NGAMPRAH		0	003	021	KO. PURI CIPAGERAN INDAH II	001	22	\N	ACHMAD SYARIEF AGUS	2016-02-05	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	021	\N	\N	\N	\N	\N
270	275	YANDI PEMISRA	3273231012620004	JL. CIPAMOKOLAN NO. 19	RANCASARI	CIPAMOKOLAN	KOTA BANDUNG				IMAS FATIMAH	3217025209550005	MEKARWANGI JL. SARIIWANGI NO. 25	PARONGPONG	SARIWANGI	KABUPATEN BANDUNG BARAT				158.00	394000	70.00	823000	62252000	57610000	119862000	SHM NO. 05860	SARIWANGI	PARONGPONG		0	05	01	KP. MEKARWANGI	001	12	\N	DEDI SOMANTRI	2016-02-05	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	12	\N	\N	\N	\N	\N
271	276	AI SUKAESIH	3217066708760007	CIMAREME	NGAMPRAH	CIMAREME	KAB. BANDUNG BARAT				UKA, H	3217061005480004	JL. SINDANGSARI	NGAMPRAH	CIMAREME	KABUPATEN BANDUNG BARAT				509.00	243000	0.00	0	123687000	0	123687000	590/I/DS/2016	CIMAREME	NGAMPRAH		0	01	06	KP. RANCABOGO	003	05	\N	UKA, H	2016-02-05	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	01	03	\N	\N	\N	\N	\N
272	277	IR. MISWAN HARIYADI	3217060312700014	PERMATA CIMAHI BLOK L2 NO. 03	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				IR. H. DADANG HIDAYAT	3273260610500001	JL. RAHAYU NO. 11 A CIJAMBE	UJUNGBERUNG	PASIR ENDAH	KOTA BANDUNG				147.00	103000	0.00	0	15141000	0	15141000	HGB NO. 06445	CILAME	NGAMPRAH		0	002	014	KP. CILOA	001	03	\N	TANTO HARTONO	2016-02-05	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	002	006	\N	\N	\N	\N	\N
273	278	IR. MISWAN HARIYADI	3217060312700014	PERMATA CIMAHI BLOK L2 NO. 03	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				IR. H. DADANG HIDAYAT	3273260610500001	JL. RAHAYU NO. 11 A CIJAMBE	UJUNGBERUNG	PASIR ENDAH	KOTA BANDUNG				137.00	103000	0.00	0	14111000	0	14111000	HGB NO. 06434	CILAME	NGAMPRAH		0	002	014	KP. CILOA	001	03	\N	TANTO HARTONO	2016-02-05	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	002	006	\N	\N	\N	\N	\N
274	279	IR. MISWAN HARIYADI	3217060312700014	PERMATA CIMAHI BLOK L2 NO. 03	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				IR. H. DADANG HIDAYAT	3273260610500001	JL. RAHAYU NO. 11 A CIJAMBE	UJUNGBERUNG	PASIR ENDAH	KOTA BANDUNG			__.___.___._-___.___	96.00	103000	0.00	0	9888000	0	9888000	HGB NO. 06435	CILAME	NGAMPRAH		0	002	014	KP. CILOA	001	03	\N	TANTO HARTONO	2016-02-05	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	002	006	\N	\N	\N	\N	\N
275	280	YAYAH	3217056405730001	KP. SUKARAPIH	CIPEUNDEUY	CIHARASHAS	KAB. BANDUNG BARAT				AGNES SUTANTO	3171014407520001	Jl. JL.PETOJO BINATU RAYA NO 28 B	GAMBIR	PETOJO UTARA	JAKARTA PUSAT				13115.00	27000	0.00	0	354105000	0	354105000	SHM NO. 36	RENDE	CIKALONG WETAN		0	003	010	KP. RENDE KIDUL	005	12	\N	AGNES SUTANTO	2016-02-05	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	004	007	\N	\N	\N	\N	\N
276	281	DARMA SETIAWAN	3277031106720005	JL. CIHANJUANG NO. 122	CIMAHI UTARA	CIBABAT	KOTA CIMAHI				IR. HANSEN TJUAT TJADARMA	3273190805650008	JL. RE. MARTADINATA NO. 144	SUMUR BANDUNG	MERDEKA	KOTA BANDUNG			__.___.___._-___.___	88.00	702000	33.00	1200000	61776000	39600000	101376000	HGB NO. 1544	BATUJAJAR TIMUR	BATUJAJAR		0	002	019	KO. PURI INDAH LESTARI	000	00	\N	PT. DIMENSI PURI LESTARI	2016-02-05	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	007	008	\N	\N	\N	\N	\N
277	282	SALLY WULANIA RINALDY	3671115503870007	CLUSTER MONACO BLOK FA 2 NO. 07	PINANG	PAKOJAN	KOTA TANGERANG				HJ. WULANSARI 	3204095907650003	KOPO PERMAI 35 AD/14	MARGAHAYU	SUKAMENAK	KABUPATEN BANDUNG				160.00	537000	0.00	0	85920000	0	85920000	SHM NO. 05925	SARIWANGI	PARONGPONG		0	004	002	KP. LEMBUR TENGAH	003	03	\N	M DULIMAN DRS	2016-02-09	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	011	\N	\N	\N	\N	\N
279	284	NOVAN PRASETYO WIBOWO	3277022211890007	JL, KAUM KULON NO. 61	CIMAHI TENGAH	CIMAHI	KOTA CIMAHI				DIRA K MOCHTAR MBA	3174062510670009	JL. EM ES DE B No. 7 A	CILANDAK	CIPETE SELATAN	JAKARTA SELATAN				91.00	1722000	0.00	0	156702000	0	156702000	SHM NO. 5309	CIWARUGA	PARONGPONG		0	001	006	KP. BARU	005	07	\N	ONDO H	2016-02-09	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	001	\N	\N	\N	\N	\N
280	285	EVI AVIANTI SST	3277035104710010	CLUSTER MULYA RESIDENCE NO. 05	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				YANO NUGROHO	3277021101580003	JL. PASIR KUMELI No. 65 B	CIMAHI TENGAH	BAROS	KOTA CIMAHI				95.00	464000	50.00	968000	44080000	48400000	92480000	SHM NO. 05997	TANIMULYA	NGAMPRAH		0	001	017	JL. CIDAHU	001	05	\N	YANO NUGROHO	2016-02-09	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	021	\N	\N	\N	\N	\N
281	286	BUDI SUWARDONO	3525102211710005	JL. MALEBER UTARA NO. 284	ANDIR	GARUDA	KOTA BANDUNG				DRS. TITO GARNITA	3217062809540003	Jl. JL. BUNISARI KULON NO. 45	NGAMPRAH	GADOBANGKONG	KABUPATEN BANDUNG BARAT				327.00	243000	54.00	595000	79461000	32130000	111591000	SHM NO. 01245	GADOBANGKONG	NGAMPRAH		0	07	04	JL. BUNISARI KULON	004	06	\N	FARIDA MUCHTAR	2016-02-09	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	004	06	\N	\N	\N	\N	\N
282	287	SAEPUDIN	3672022408630001	JL. ANGGREK C6 NO. 15	CILEGON	CIWEDUS	KOTA CILEGON				MUHAMMAD RANGGA RAMADAN	3174051005880005	JL. MASJID NUR No. 11	KEBAYORAN LAMA	GROGOL UTARA	PROV. DKI JAKARTA				72.00	48000	36.00	823000	3456000	29628000	33084000	HGB NO. 158	CITATAH	CIPATAT		0	004	004	BL. CIMERANG	004	12	\N	PT. BUMI INDAH PARAHYANGAN	2016-02-09	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	006	010	\N	\N	\N	\N	\N
283	288	MOCHAMAD PRIYADI	3277020402770020	KP. PANIISAN GG KARYA BAKTI 8 No. 226	CIMAHI TENGAH	CIGUGUR TENGAH	KOTA CIMAHI				MUHAMMAD RANGGA RAMADAN	3174051005880005	JL. MASJID NUR No. 11	KEBAYORAN LAMA	GROGOL UTARA	PROV. DKI JAKARTA				72.00	48000	36.00	823000	3456000	29628000	33084000	HGB NO. 176	CITATAH	CIPATAT		0	003	001	BL. CIMERANG	004	12	\N	PT. BUMI INDAH PARAHYANGAN	2016-02-09	\N	\N	\N	\N	\N	\N		006	010	\N	\N	\N	\N	\N
284	289	RULLY FAHRUL	3273013108780002	JL. SARIMANAH BLOK 18 NO. 106	SUKASARI	SARIJADI	KAB. BANDUNG BARAT				FERRY FERDHANY SE	3217021002680004	JL. HAJI 8 KP. CIBALIGO 	PARONGPONG	CIHANJUANG	KAB. BANDUNG BARAT			__.___.___._-___.___	110.00	200000	70.00	595000	22000000	41650000	63650000	SHM NO. 3232	CIHANJUANG	PARONGPONG		0	03	07	KP. CIBALIGO	004	01	\N	KRESNA PRIBADI S	2016-02-09	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	04	01	\N	\N	\N	\N	\N
285	290	MELIANA NOVITA SIHOMBING	3175075212800016	PONDOK KELAPA PERMAI BLOK II C2/5	DUREN SAWIT	PONDOK KELAPA	JAKARTA TIMUR				IR. SANUSI TANAWI	3173062210530001	PERUM CITRA II BLOK G11/2	KALIDERES	PEGADUNGAN	JAKARTA BARAT			__.___.___._-___.___	126.00	2352000	65.00	1516000	296352000	98540000	394892000	HGB NO. 04009	CIPEUNDEUY	PADALARANG		0	14	07	KO. KOTA BARU PARAHYANGAN	000	00	\N	PT. BELAPUTERA INTILAND	2016-02-09	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	08	19	\N	\N	\N	\N	\N
288	293	VINCENTIUS AAN	3217031201610011	KP. JAMBUDIPA 	CISARUA	JAMBUDIPA	KAB. BANDUNG BARAT			__.___.___._-___.___	NURHAYANI	3217034406830007	Jl. KP. PANAGELAN	CISARUA	JAMBUDIPA	KABUPATEN BANDUNG BARAT				1116.00	27000	0.00	0	30132000	0	30132000	SHM NO. 45	SADANGMEKAR	CISARUA		0	01	03	BL. PASIR BEKUNG	004	02	\N	NURHAYANI	2016-02-09	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	04	\N	\N	\N	\N	\N
289	294	SANTI TRIANA SISWANDINI	3277016209660002	JL. KEBON KOPI GG SALUYUDALAM NO. 124 A	CIMAHI SELATAN	CIBEUREUM	KOTA CIMAHI				AYI HAGARWATY	3277016209660002	JL. KEBON KOPI GG SALUYU DALAM NO. 124 A	CIMAHI SELATAN	CIBEUREUM	KOTA CIMAHI				60.00	537000	21.00	595000	32220000	12495000	44715000	HGB NO. 3709	TANIMULYA	NGAMPRAH		0	007	004	KO. PURI CIPAGERAN INDAH II	005	21	\N	AYI HAGARWATY	2016-02-09	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	007	004	\N	\N	\N	\N	\N
290	295	LIA YULIANA ELSIS YUNDA	3277016212800029	JL. MELONG NO. 170 BLOK CIKENDAL	CIMAHI SELATAN	MELONG	KOTA CIMAHI				ADE NAHDIYAR	3217021203520004	PARONGPONG	PARONGPONG	KARYAWANGI	KABUPATEN BANDUNG BARAT				388.00	614000	150.00	968000	238232000	145200000	383432000	SHM NO. 1569	CIHIDEUNG	PARONGPONG		0	04	05	JL. KOLONEL MASTURI	001	15	\N	JAELANI	2016-02-09	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	04	10	\N	\N	\N	\N	\N
291	296	DEDEN SUNARYA	3217060508620002	KP. CIJERAH	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				BAMBANG PANGARSO PUTRO	3273071812590002	JL. RIK RIK NO. 17	SUKAJADI	PASTEUR	KOTA BANDUNG				500.00	200000	0.00	0	100000000	0	100000000	SHM NO. 1670	TANIMULYA	NGAMPRAH		0	002	003	KP. KEBON KALAPA	001	02	\N	BAMBANG PANGARSO PUTRO	2016-02-09	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	008	\N	\N	\N	\N	\N
292	297	LIA YULIANA ELSIS YUNDA	3277016212800029	JL. MELONG NO. 170 BLOK CIKENDAL	CIMAHI SELATAN	MELONG	KOTA CIMAHI				ADE NAHDIYAR	3217021203520004	PARONGPONG	PARONGPONG	KARYAWANGI	KABUPATEN BANDUNG BARAT				982.00	394000	0.00	0	386908000	0	386908000	SHM NO. 464	KARYAWANGI	PARONGPONG		0	04	05	JL. KOLONEL MASTURI	004	10	\N	JAELANI	2016-02-09	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	04	10	\N	\N	\N	\N	\N
293	298	FIRAS HASNA	3217064501940008	JL. OKULASI 1 TANIMULYA INDAH	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				HENDRI SUFIAR	3276031411750003	KOMP. BUMI SAWANGAN INDAH BLOK G-3/15	SAWANGAN	BEDAHAN	KOTA DEPOK				60.00	916000	21.00	595000	54960000	12495000	67455000	SHM NO. 466	TANIMULYA	NGAMPRAH		0	006	015	KO. PURI CIPAGERAN INDAH II	002	18	\N	HENDRI SUFIAR	2016-02-09	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	001	\N	\N	\N	\N	\N
295	300	CUKUP MULYANA	3273010902550003	JL. SARI KASO III 35/177 B	SUKASARI	SARIJADI	KOTA BANDUNG			__.___.___._-___.___	TAGOR IBRAHIM, DRS	3674031009590004	Jl. PINGUIN VI NO. 13 A	PONDOK AREN	PONDOK BETUNG	KOTA TANGERANG SELATAN			__.___.___._-___.___	176.00	802000	0.00	0	141152000	0	141152000	SHM NO. 05382	CIWARUGA	PARONGPONG		0	01	01	BL. RANDU	000	00	\N	TAGOR IBRAHIM, DRS	2016-02-10	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	06	06	\N	\N	\N	\N	\N
294	299	RIMA IDHIA SEJATI	3273065204870002	PERUM CIPTA GRAHA C-8	CICENDO	SUKARAJA	KOTA BANDUNG				TAGOR IBRAHIM, DRS	3574031009590004	JL. PINGUIN VI NO. 13 A	PONDOK AREN	PONDOK BELITUNG	PROV. BANTEN  KOTA TANGERANG SELATAN				224.00	802000	0.00	0	179648000	0	179648000	SHM NO. 05378	CIWARUGA	PARONGPONG		0	009	003	BL. RANDU	000	00	\N	TAGOR IBRAHIM, DRS	2016-02-10	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	006	006	\N	\N	\N	\N	\N
296	301	LILIANA WILANDOUW SH DKK	3273061603440003	JL. PASIRKALIKI NO. 173	CICENDO	PAMOYANAN	KOTA BANDUNG				KAREL LEO WILANDOUW	526/1992	Jl. KO. LEMBANG ASRI	LEMBANG	SUKAJAYA	KABUPATEN BANDUNG BARAT				1496.00	802000	352.00	1200000	1199792000	422400000	1622192000	SHM NO. 136,NO. 127	SUKAJAYA	LEMBANG	SURAT KETERANGAN HAK WARIS NO. 2/III/1993	0	01	05	KO. LEMBANG ASRI	000	00	\N	ONGKY	2016-02-10	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	000	00	\N	\N	\N	\N	\N
297	302	AAN HASANAH	3217044205570006	KP. CIPARE	CIKALONG WETAN	CIPADA	KAB. BANDUNG BARAT				ASEP SAEPULOH	03/14/2014	Jl. KP. CIPARE	CIKALONG WETAN	CIPADA	KAB. BANDUNG BARAT				404.00	20000	25.00	429000	8080000	10725000	18805000	SHM NO. 211	CIPADA	CIKALONG WETAN	SURAT KETERANGAN AHLI WARIS NO : 474.3/08/WRS/2014/Tapem	0	002	006	BL. CIPARE	001	08	\N	ASEP SAEPULOH	2016-02-10	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	002	008	\N	\N	\N	\N	\N
298	303	YOSAPAT	3217060207770020	CIMAREME INDAH BLOK C -3 NO. 15 	NGAMPRAH	CIMAREME	KAB. BANDUNG BARAT				DEDEN GUNAWAN	3217062102740004	PERUM CIMAREME INDAH BLOK C2 NO. 11	NGAMPRAH	CIMAREME	KABUPATEN BANDUNG BARAT				72.00	1573000	29.00	823000	113256000	23867000	137123000	HGB NO. 301	CIMAREME	NGAMPRAH		0	03	09	KO. CIMAREME INDAH	008	22	\N	DEDEN GUNAWAN	2016-02-10	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	03	09	\N	\N	\N	\N	\N
299	304	DRS. AGUNG AMRIH GUNAWAN MPD	3217012411640011	KP. SUKAMAJU 	LEMBANG	KAYUAMBON	KAB. BANDUNG BARAT				YAYA	3217011104700001	KP. SUKARAME	LEMBANG	LANGENSARI	KABUPATEN BANDUNG BARAT			__.___.___._-___.___	308.00	243000	0.00	0	74844000	0	74844000	593.21/10/PEM./2016	LANGENSARI	LEMBANG		0	02	07	JL. MARIBAYA	003	02	\N	TATANG SUTISNA	2016-02-10	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	02	\N	\N	\N	\N	\N
300	305	ANNISA GUSTANTI	3273224612860001	JL. BUANA SARI IV NO. 21 B	BANDUNG KIDUL	KUJANGSARI	KOTA BANDUNG				ELVIRANI ASTHER	3217015702620004	KP CIBURIAL	LEMBANG	CIBOGO	KABUPATEN BANDUNG BARAT			__.___.___._-___.___	104.00	200000	0.00	0	20800000	0	20800000	SHM NO. 01385	CIBOGO	LEMBANG		0	008	004	BL. CIBURIAL	002	01	\N	EUTIK SUARNI, HJ	2016-02-10	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	002	\N	\N	\N	\N	\N
301	306	WAWAN WIHARJA	3217011904610008	ASRAMA BRIMOB CIKOLE 	LEMBANG	CIKOLE	KAB. BANDUNG BARAT				DEDEN SAEFUL HIDAYAT	3272030407690904	Jl. KP. CIJANGKAR	CITAMIANG	NANGGELENG	KOTA SUKABUMI				240.00	160000	0.00	0	38400000	0	38400000	593.21/007/PEM.2016	CIBOGO	LEMBANG		0	01	04	KP. CIBOGO	001	11	\N	DEDEN SAEFUL HIDAYAT	2016-02-10	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	002	02	\N	\N	\N	\N	\N
302	307	H. DEDI SURADI	3273062409540003	JL. KARTAMIHARJA NO. 44	CICENDO	SUKARAJA	KOTA BANDUNG				ENOK MARPUAH	3206125206450006	KP GUNUNG BUBUT	SODONGHILIR	PAKALONGAN	KAB. TASIKMALAYA				866.00	103000	0.00	0	89198000	0	89198000	100/PEM/DS/07707/2015	GUNUNGMASIGIT	CIPATAT		0	001	002	JL. RAYA GUNUNGMASIGIT	001	01	\N	SUARGA	2016-02-10	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	018	009	\N	\N	\N	\N	\N
303	308	NINA YUNIA NURHAYATI,S.Pd	3217087007670008	GG. H. MUSTOFA POS KIDUL	PADALARANG	KERTAMULYA	KAB. BANDUNG BARAT			__.___.___._-___.___	HJ. FITMARTINI AKBAR	3203015711510002	JL. RAYA SUKABUMI GG.H.AMIN NO, 35	CIANJUR	SAWAHGEDE	KABUPATEN CIANJUR				90.00	702000	36.00	700000	63180000	25200000	88380000	HGB NO. 01406	PADALARANG	PADALARANG		0	01	17	JL. G A MANULANG		22	\N	DADANG SALEH	2016-02-10	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	02	01	\N	\N	\N	\N	\N
304	309	EKA SONJAYA PERMANA	3273131201710002	JL. SURYALAYA III NO. 120	LENGKONG	CIJAGRA	KOTA BANDUNG				MOH. WAHYU PRIHARTA	3217020704710005	Jl. KO. BUMI SARIWANGI I BLOK F NO. 12	PARONGPONG	SARIWANGI	KABUPATEN BANDUNG BARAT				145.00	802000	0.00	0	116290000	0	116290000	SHM NO. 5553	SARIWANGI	PARONGPONG		0	006	005	KP. MEKARWANGI	003	12	\N	MOH. WAHYU PRIHARTA	2016-02-10	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	006	009	\N	\N	\N	\N	\N
305	310	VIVI PIRMAYANTI DESNITA	3277025312870003	JL. POJOK UTARA I 	CIMAHI TENGAH	SETIAMANAH	KOTA CIMAHI				DRA. HAZMA	3273234809640005	KO. BUMI HARAPAN CIBIRU BLOK CC. 2 NO. 16	CILEUNYI	CIBIRU HILIR	KABUPATEN BANDUNG				82.00	802000	27.00	700000	65764000	18900000	84664000	SHM NO. 3106	TANIMULYA	NGAMPRAH		0	01	04	KO. PESONA LEMBAH CIDAHU	002	01	\N	HARUN LEPPONG	2016-02-10	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	06	11	\N	\N	\N	\N	\N
306	311	IR. MOCHAMAD FARID TOMIK	3273210306860001	JL. JAKA MUSTIKA BLOK B-25	BANDUNG KIDUL	KUJANGSARI	KOTA BANDUNG			__.___.___._-___.___	YUSEN NATAWIJAYA	3217062802780013	JL. RAYA CIMAREME 183	NGAMPRAH	CIMAREME	KABUPATEN BANDUNG BARAT				14280.00	14000	0.00	0	199920000	0	199920000	SHM NO. 05	SARIMUKTI	CIPATAT		0	002	005	BL. CIJATI	001	01	\N	YUSEN NATAWIJAYA	2016-02-10	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	005	\N	\N	\N	\N	\N
307	312	BETSHEDA GUMILAR, SE	3204056709740006	JL. RINUS NO. 30 BUMI PANYAWANGAN 	CILEUNYI	CIMEKAR	KAB. BANDUNG			__.___.___._-___.___	BAMBANG SULISTYO,SH	3217080908710015	JL. MAYANG ASRI NO. 10	PADALARANG	CIPENDEUY	KAB. BANDUNG BARAT				126.00	2352000	106.00	1833000	296352000	194298000	490650000	HGB NO. 2447	CIPEUNDEUY	PADALARANG		0	004	003	JL. MAYANGASRI	000	00	\N	BAMBANG SULISTYO,SH	2016-02-10	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	005	011	\N	\N	\N	\N	\N
308	313	SANDY AYU LESTARI	3208135204900003	KOMP. SARIWANGI CITY VIEW BLOK C NO. 5	PARONGPONG	SARIWANGI	KAB. BANDUNG BARAT				M. IQRAR W TJAKRANINGRAT	3174051206700020	JL. PANJANG CIDODOL	KEBAYORAN LAMA	GROGOL SELATAN	JAKARTA SELATAN				743.00	128000	0.00	0	95104000	0	95104000	SHM NO. 00951	CIHANJUANG RAHAYU	PARONGPONG		0	005	012	KP. TUGU	002	06	\N	NENENG, H	2016-02-10	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	005	013	\N	\N	\N	\N	\N
309	314	DIANA RAHMAWATY	3273184712670004	JL. RERENG MANIS NO. 17	CIBEUNYING KALER	SUKALUYU	KOTA BANDUNG				YULIANA SUDRADJAT	3273096307660001	JL. CIMANUK NO. 24	BANDUNG WETAN	CITARUM	KOTA BANDUNG				153.00	82000	36.00	968000	12546000	34848000	47394000	HGB NO. 6177	CILAME	NGAMPRAH		0	06	11	GRAHA BUKIT RAYA	004	09	\N	DIANA RACHMAWATI	2016-02-10	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	02	07	\N	\N	\N	\N	\N
310	315	SOPIYAN	3217060904720002	MEKAR RAHAYU	NGAMPRAH	CILAME	KAB. BANDUNG BARAT				FRANKI CHRISTIANTO	3217061212720029	GRAHA BUKIT RAYA 3 C-6 NO. 63	NGAMPRAH	CILAME	KABUPATEN BANDUNG BARAT				60.00	802000	22.00	700000	48120000	15400000	63520000	SHM NO. 4106	CILAME	NGAMPRAH		0	001	002	KO. BUKIT GALUDRA	000	00	\N	PT. RAYA DEVINDO	2016-02-10	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	006	025	\N	\N	\N	\N	\N
311	316	LINGGAWATI HARDJADINATA	3207015503550006	JL. AMPERA II/16	CIAMIS	CIAMIS	KAB. CIAMIS				KENNETH NATHAN TEDY	1004/2000	Jl. HEGARMANAH	CIDADAP 	HEGARMANAH	KOTA BANDUNG				162.00	2352000	95.00	1200000	381024000	114000000	495024000	SHM NO. 2032	CIPEUNDEUY	PADALARANG		0	02	12	KO. KBP JL. NAGABUANA WETAN	000	00	\N	KENNETH NATHAN TEDY	2016-02-10	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	011	03	\N	\N	\N	\N	\N
312	317	HENDRA PRATIYAKSO	3273020312680010	JL. BONDOL NO. 8	COBLONG	SADANGSERANG	KOTA BANDUNG				IR. SANUSI TANAWI	3173062210530001	PERUM CITRA II BLOK G-11/2	KALI DERES	PEGADUNGAN	JAKARTA BARAT				290.00	2352000	144.00	1200000	682080000	172800000	854880000	HGB NO. 3166	CIMERANG	PADALARANG		0	01	08	MAYANGSEKAR	000	00	\N	HENDRA PRATIYAKSO	2016-02-11	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	08	019	\N	\N	\N	\N	\N
313	318	AGUS WIEDIYANTO	3273010401600001	JL. PADASALUYU UTARA I NO. 18 E	SUKASARI	ISOLA	KOTA BANDUNG				ROHANAH	3204434705450002	Jl. KP. KANCAH	PARONGPONG	CIHIDEUNG	KABUPATEN BANDUNG BARAT				516.00	243000	0.00	0	125388000	0	125388000	594/08/2016	CIHIDEUNG	PARONGPONG		0	02	03	KP. RANCAH	002	14	\N	ENTING ROHANAH	2016-02-11	\N	\N	\N	\N	\N	\N	KAB.BANDUNG BARAT	002	14	\N	\N	\N	\N	\N
314	319	ALFIAH AM	3217016201740001	KP. SUKALAKSANA	LEMBANG	CIKAHURIPAN	KAB. BANDUNG BARAT				ANI SETIANI	3277014701570007	JL. KEBON JERUK NO. 220	CIMAHI SELATAN	CIBEUREUM	KOTA CIMAHI				107.00	48000	0.00	0	5136000	0	5136000	SHM NO. 01003	CIKAHURIPAN	LEMBANG		0	006	002	BL. SUKALAKSANA	003	02	\N	ADIWARTA/AEP	2016-02-11	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	020	\N	\N	\N	\N	\N
315	320	FERI AFRIADY	3217080804700009	PONDOK CIPTA MAS 2 BLOK B 3 NO. 13	PADALARANG	LAKSANAMEKAR	KAB. BANDUNG BARAT				ACHMAD KAMIL ABDURAHMAN	3277021805690007	THE AWANY RESIDENCE B. 26	NGAMPRAH	CIMAREME	KABUPATEN BANDUNG BARAT				60.00	537000	21.00	700000	32220000	14700000	46920000	SHM NO. 2163	LAKSANAMEKAR	PADALARANG		0	01	11	KO. PONDOK CIPTA MAS II	001	11	\N	ACHMAD KAMIL	2016-02-11	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	02	05	\N	\N	\N	\N	\N
316	321	DWIKO UNGGUL PRABOWO	3276020706860002	PONDOK DUTA I JL. PUTRA III/60 BLOK F4	DEPOK	TUGU	KOTA DEPOK				DESHANDRA AFGA NAGARA	3273230512830015	JL. BATURNUB UTARA XV NO. 12 	RANCASARI	MANJAHLEGA	KOTA BANDUNG				85.00	394000	36.00	823000	33490000	29628000	63118000	SHM NO. 5427	SARIWANGI	PARONGPONG		0	13	14	KP. MEKARWANGI	001	12	\N	HANA MARIDIANA, HJ. DRA	2016-02-11	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	03	11	\N	\N	\N	\N	\N
317	322	HINDARTA HALIM	3273091807710001	JL. DIPONEGORO NO. 11 A 	BANDUNG WETAN	CITARUM	KOTA BANDUNG			09.351.083.2-423.000	INDRIE DWI MARLIA	3173057103780004	Jl. KO. PERTAMBANGAN I NO. 18	KEBON JERUK	KELAPA DUA	JAKARTA BARAT				480.00	2352000	269.00	1516000	1128960000	407804000	1536764000	SHM NO. 1908	CIPEUNDEUY	PADALARANG		0	05	04	LARANGPRABU	000	00	\N	INDRIE DWI MARLIA	2016-02-11	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	05	\N	\N	\N	\N	\N
318	323	YURI MEINDAR	3277012305840021	PONDOK CIPTA MAS BLOK D2 NO. 10	CIMAHI SELATAN	LEUWIGAJAH	KOTA CIMAHI				ALI ABUDAN	3273061708580012	JL. H. AKBAR NO. 2	CICENDO	PASIRKALIKI	KOTA BANDUNG				90.00	464000	29.00	823000	41760000	23867000	65627000	HGB NO. 01817	JAYAMEKAR	PADALARANG		0	04	16	KO. BENTANG PADALARANG	000	00	\N	PT. UZI KARYA PRESTASI	2016-02-11	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	006	006	\N	\N	\N	\N	\N
319	324	I MADE MERTHA YASA	3214011309770004	KP. GEDUK 	CIPANAS	PALASARI	KAB. CIANJUR				DR TONY	3273071910640006	JL. GRIYA UTARA NO. 21	SUKAJADI	SUKAWARNA	KOTA BANDUNG				162.00	916000	60.00	1200000	148392000	72000000	220392000	HGB NO. 00182	KERTAJAYA	PADALARANG		0	02	07	KO. KOTA BALI	000	00	\N	PT. PESONA JATI ABADI	2016-02-11	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	07	03	\N	\N	\N	\N	\N
321	326	DHIKA PANJI ASYOGI	3217051701880007	ASR. PUSDIKKAV BLOK D 27	PADALARANG	JAYAMEKAR	KAB. BANDUNG BARAT				ALI ABUDAN	3273061708580012	JL. H. AKBAR NO. 2	CICENDO	PASIRKALIKI	KOTA BANDUNG				120.00	464000	45.00	823000	55680000	37035000	92715000	HGB NO. 1374	JAYAMEKAR	PADALARANG		0	005	004	KO. BENTANG PADALARANG	000	00	\N	PT. UZI KARYA PRESTASI	2016-02-11	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	006	006	\N	\N	\N	\N	\N
322	327	TEDI SETIADI	3273052510820003	JL. KAKAP NO. 104/26	ANDIR 	CIROYOM	KOTA BANDUNG				ALI ABUDAN	3273061708580012	JL. H. AKBAR NO. 2	CICENDO 	PASIRKALIKI	KOTA BANDUNG				97.00	464000	36.00	823000	45008000	29628000	74636000	HGB NO. 1304	JAYAMEKAR	PADALARANG		0	01	05	KO. BENTANG PADALARANG	000	00	\N	PT. UZI KARYA PRESTASI	2016-02-11	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	06	06	\N	\N	\N	\N	\N
323	328	OKI WIBOWO	3217111204810018	KP CIGURUWIK	CILEUNYI	CINUNUK	KAB. BANDUNG				ALI ABUDAN	3273061708580012	JL. H. AKBAR NO. 2	CICENDO	PASIRKALIKI	KOTA BANDUNG				160.00	464000	65.00	823000	74240000	53495000	127735000	HGB NO. 1289	JAYAMEKAR	PADALARANG		0	003	004	KO. BENTANG PADALARANG	000	00	\N	PT. UZI KARYA PRESTASI	2016-02-11	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	006	006	\N	\N	\N	\N	\N
324	329	DAVID TJAHJADI	3273021807720007	JL. DAYANG SUMBI	COBLONG	LEBAK SILIWANGI	KOTA BANDUNG				SUKARYA	3273020508530013	JL. JAJAWAY 	COBLONG	DAGO	KOTA BANDUNG				238.00	48000	0.00	0	11424000	0	11424000	593.21/05/PEM. /2016	MEKARWANGI	LEMBANG		0	03	03	BL. BUNIWANGI	000	03	\N	IDI SUKARYA	2016-02-11	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	01	01	\N	\N	\N	\N	\N
325	330	SOPANDI	3273180801730002	JL. CIKUTRA GG. SUKASARI 1 NO 36	CIBEUNYING KALER	NEGLASARI	KOTA BANDUNG				ALI ABUDAN	3273061708580012	JL. H. AKBAR NO. 2	CICENDO	PASIRKALIKI	KOTA BANDUNG				120.00	464000	45.00	823000	55680000	37035000	92715000	HGB NO. 1375	JAYAMEKAR	PADALARANG		0	001	004	KO. BENTANG PADALARANG	000	00	\N	PT. UZI KARYA PRESTASI	2016-02-11	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	006	006	\N	\N	\N	\N	\N
326	331	DAENG ARDYPRADANA HIDAYATH	3217080408880009	KARYA BAKTI NO. 1 CIJEUNGJING	PADALARANG	KERTAMULTYA	KAB. BANDUNG BARAT				ADINAR DAHLAN	3201155403690004	KO. GRIYA SALAK ASRI BLOK C 4 NO 12	CIAMPEA	CINANGKA	KAB. BOGOR				60.00	702000	21.00	823000	42120000	17283000	59403000	SHM NO. 2904	PADALARANG	PADALARANG		0	005	022	JL. G A MANULANG		22	\N	PT. INTRA CIPTA MANDIRI	2016-02-11	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	009	\N	\N	\N	\N	\N
327	332	APIN KURNIAWAN	3173040404710001	JL. LAKSA IV NO. 62	TAMBORA 	JEMBATAN LIMA	JAKARTA BARAT				LINA MARYADI	3273076810620011	JL. BABAKAN JERUK II NO. 32	SUKAJADI	SUKAGALIH 	KOTA BANDUNG				519.00	285000	150.00	823000	147915000	123450000	271365000	SHM NO. 03203	KERTAMULYA	PADALARANG		0	09	02	KP. POS WETAN	003	13	\N	NY LILI FATINI	2016-02-11	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	006	\N	\N	\N	\N	\N
328	333	ACHSAN JUDYANTO	3275090303670012	JATIKRAMAT	JATIASIH	JATIKRAMAT	KOTA BEKASI				EKO WIDIANTO	3217062904680006	PCI 2 BLOK D-3 NO. 5 	NGAMPRAH	TANIMULYA	KABUPATEN BANDUNG BARAT				104.00	916000	36.00	700000	95264000	25200000	120464000	SHM NO. 4605	TANIMULYA	NGAMPRAH		0	05	09	KO. PURI CIPAGERAN INDAH II	001	22	\N	EKO WIDIANTO	2016-02-12	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	22	\N	\N	\N	\N	\N
329	334	TIKA SARTIKA	3217025505760012	KP. LEMBUR PANJANG	PARONGPONG	CIHANJUANG	KAB. BANDUNG BARAT				H. A. KOSWARA	3217020612500001	KP.  LEMBUR TENGAH NO. 04	PARONGPONG	SARIWANGI	KAB. BANDUNG BARAT				38.00	243000	20.00	429000	9234000	8580000	17814000	SHM NO. 03783	CIHANJUANG	PARONGPONG		0	001	008	KP. CIHANJUANG	001	08	\N	ILAH HAYATI	2016-02-12	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	007	\N	\N	\N	\N	\N
330	335	SJOCKIE SILVIANA	3273086409570001	JL. HEGARMANAH GG. PANJI	CIDADAP	HEGARMANAH	KOTA BANDUNG				H.A KOSWARA	3217020612500001	KP. LEMBUR TENGAH NO. 04	PARONGPONG	SARIWANGI	KABUPATEN BANDUNG BARAT				35.00	243000	25.00	429000	8505000	10725000	19230000	SHM NO. 03752	CIHANJUANG	PARONGPONG		0	03	03	KP. CIHANJUANG	001	08	\N	ILAH HAYATI	2016-02-12	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	007	\N	\N	\N	\N	\N
333	338	ADITYA PRATAMA	3217062606920010	BPS II G-1 NO. 08	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				AFFANDI PEPEN	3217062712680007	KP CIBATU	NGAMPRAH	CILAME	KABUPATEN BANDUNG BARAT				60.00	916000	21.00	595000	54960000	12495000	67455000	SHM NO. 6544	TANIMULYA	NGAMPRAH		0	005	011	KO. BUMI PAKUSARAKAN	005	11	\N	ASEP AFANDI	2016-02-12	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	004	006	\N	\N	\N	\N	\N
334	339	ANI NURAINI	3277016206720001	BLOK SAKOLA	CIMAHI SELATAN	MELONG	KOTA CIMAHI				M. MURZID HILMI AZIZ	3277032407650005	JL. CIDAHU CIPAGERAN NO. 164	CIMAHI UTARA	CIPAGERAN	KOTA CIMAHI				129.00	82000	45.00	1200000	10578000	54000000	64578000	SHM NO. 500	PADAASIH	CISARUA		0	03	07	BL. BONGKOK	000	00	\N	EWEN, H	2016-02-12	\N	\N	\N	\N	\N	\N	KAB.BANDUNG BARAT	05	15	\N	\N	\N	\N	\N
335	340	GEULIS KURNIATI	3217084204760029	PERUM BUKIT BERLIAN BLOK C-19	PADALARANG	KERTAMULTYA	KAB. BANDUNG BARAT				MAMAN R	3217080107540051	KP. GEMBOL SARI	PADALARANG	KERTAMULYA	KABUPATEN BANDUNG BARAT				840.00	160000	0.00	0	134400000	0	134400000	100/21/I/DES/2016	KERTAMULYA	PADALARANG		0	002	025	KP. PASIR GEMPOL	002	05	\N	GEULIS KURNIATI	2016-02-12	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	004	005	\N	\N	\N	\N	\N
336	341	FARA SAHARA 	3175014711870002	JL. KAYU MANIS IV BARU NO. 6	MATRAMAN	KAYU MANIS	JAKARTA TIMUR				IR. HANNY/EMAN SURAHMAN	1050015010543001	Jl. JL. TIRTASARI SELATAN NO. 4	SUKASARI	SARIJADI	KOTA BANDUNG				1400.00	20000	0.00	0	28000000	0	28000000	02/DS/1/2015	CIROYOM	CIPEUNDEUY		0	01	04	BL. TALAGA	003	01	\N	EMAN SURAHMAN	2016-02-12	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	11	08	\N	\N	\N	\N	\N
337	342	LIM HONG SENG	3273112601520002	JL. KEMBAR MAS UTARA NO.20	REGOL	PASIRLUYU	KOTA BANDUNG				YULI IRNAWATY MOSJASARI	3273246807710001	JL. MEGARAYA NO. 8	CICENDO	SUKARAJA	KOTA BANDUNG				5148.00	48000	221.00	823000	247104000	181883000	428987000	SHM NO. 00214,00118,00122,142	MANDALAMUKTI	CIKALONG WETAN		0	03	09	BL. BABAKAN	001	11	\N	YULI IRNAWATY MOSJASARI	2016-02-12	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	07	05	\N	\N	\N	\N	\N
338	343	JONSEN	3273211606830003	JL. BATUNUNGGAL ELOK II NO. 40	BANDUNG KIDUL	MENGGER	KOTA BANDUNG				FON LIN	3273015604730003	JL. SUKAHAJI NO. 40	SUKASARI	SUKARASA	KOTA BANDUNG				1076.00	1862000	389.00	1200000	2003512000	466800000	2470312000	HGB NO. 251	CIWARUGA	PARONGPONG		0	001	005	KO. SETIA BUDHI REGENSI	000	00	\N	LINA INDRAWATI KODIAT	2016-02-12	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	004	003	\N	\N	\N	\N	\N
339	344	SUKEMI	3273032808440001	JL. LEMBAYUNG NO. 10	BABAKAN CIPARAY	CIRANGRANG	KOTA BANDUNG				LILIS SUHARTINI	3275117103660006	IRIGASI DANITA D21/9	BEKASI TIMUR	BEKASI JAYA	KOTA BEKASI				658.00	243000	0.00	0	159894000	0	159894000	593/05/PEM/2016	TANIMULYA	NGAMPRAH		0	03	05	BL. RAWA GIRANG	001	08	\N	LILIS. W	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	03	14	\N	\N	\N	\N	\N
340	345	SUKEMI	3273032808440001	JL. LEMBAYUNG NO. 10	BABAKAN CIPARAY	CIRANGRANG	KOTA BANDUNG				CECEP MISBAH	3217060110630006	Jl. BL. RAWA TENGAH	NGAMPRAH	TANIMULYA	KABUPATEN BANDUNG BARAT				210.00	243000	0.00	0	51030000	0	51030000	593/06/PEM./2016	TANIMULYA	NGAMPRAH		0	03	05	BL. RAWA TENGAH	001	07	\N	CECEP MISBAH	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	07	\N	\N	\N	\N	\N
341	346	PT. COMBINED IMPERIAL PHARMACEUTICALS disingkat PT. COMBIPHAR	3174060911680003	GEDUNG OFFICE 8 LT.26, SCBD LOT 28, JL. JEND. SUDIRMAN KAV. 52-53	KEBAYORAN BARU	SENAYAN	JAKARTA SELATAN				KOMARIAH CS	3217045008490004	RENDE KIDUL	CIKALONG WETAN	RENDE	KABUPATEN BANDUNG BARAT				434.00	335000	162.00	595000	145390000	96390000	241780000	SHM NO. 00319	KERTAJAYA	PADALARANG		0	00	00	KP. SIMPANG	003	09	\N	SARTONO	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	002	012	\N	\N	\N	\N	\N
342	347	LINA SOPIANI. S. KEP	3217015105680005	JL. JAYAGIRI NO. 117	LEMBANG	JAYAGIRI	KAB. BANDUNG BARAT				KONATIANTI ROSINI	3217015511550000	MEKARLAKSANA	LEMBANG	JAYAGIRI	KABUPATEN BANDUNG BARAT				206.00	394000	100.00	595000	81164000	59500000	140664000	SHNM NO. 700	JAYAGIRI	LEMBANG		0	004	011	BL. BARU LAKSANA	002	15	\N	KONATIANTI ROSINI	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	002	015	\N	\N	\N	\N	\N
343	348	TITIN TRISNAWATI 	3217085506770026	JL. RAYA SIMPANG NO. 432	PADALARANG	KERTAJAYA	KAB. BANDUNG BARAT				DEDI HIDAYAT	474.3/56/DS-PEM	Jl. JL. SIMPANG	PADALARANG	KERTAJAYA	KABUPATEN BANDUNG BARAT				152.00	702000	120.00	595000	106704000	71400000	178104000	SHM NO. 271	KERTAJAYA	PADALARANG	SURAT KETERANGAN AKHLI WARIS NO. 474.3/033/PEM./2016	1	06	08	JL. SIMPANG	006	08	\N	DEDI HIDAYAT	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	006	08	\N	\N	\N	\N	\N
344	349	PITRI SUSILAWATI	3273136804810004	JL. BUAH BATU  NO. 197	LENGKONG	TURANGGA	KOTA BANDUNG				IMAS CARMINI	3217026905750001	JL. CIHANJUANG CIBALIGO 	PARONGPONG	CIHANJUANG	KABUPATEN BANDUNG BARAT				520.00	200000	60.00	505000	104000000	30300000	134300000	SHM NO. 1537	CIHANJUANG	PARONGPONG		0	01	05	KP. CIBALIGO	003	01	\N	OMAN	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	04	01	\N	\N	\N	\N	\N
346	351	SURIYADI	3273070307780002	JL. KARANG TINEUNG DALAM NO. 42/181	SUKAJADI	CIPEDES	KOTA BANDUNG				IR. YUNUS HD RUKMANA	3273190309630001	JL. KEBON SIRIH NO. 36	SUMUR BANDUNG	BABAKAN CIAMIS	KABUPATEN BANDUNG BARAT				105.00	1573000	50.00	1516000	165165000	75800000	240965000	HGB NO. 06354	CILAME	NGAMPRAH		0	004	003	KO. THE AWANI RESIDENCE	008	04	\N	PT. AWANI BANDUNG REALTY	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	008	008	\N	\N	\N	\N	\N
347	352	MAULANA HARRY	3217082506440002	JL. RAYA PADALARANG NO. 490	PADALARANG	KERTAMULTYA	KAB. BANDUNG BARAT				TJITJIH SUTARSIH CS	3217086811460002	JL. CIJEUNGJING	PADALARANG	KERTAMULYA	KAB. BANDUNG BARAT				3837.00	160000	0.00	0	613920000	0	613920000	100/XII/DES/2015	KERTAMULYA	PADALARANG		0	004	014	KP. POS WETAN	003	14	\N	ATING SETYADI ARDIWINATA	2016-01-05	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	001	019	\N	\N	\N	\N	\N
348	353	MAULANA HARRY	3217082506440002	JL. RAYA PADALARANG NO. 490	PADALARANG	KERTAMULTYA	KAB. BANDUNG BARAT				H.DAYAT SOPANDI	3217060210700001	KP. PASIR HUNI	NGAMPRAH	CIMANGGU	KABUPATEN BANDUNG BARAT				2050.00	160000	0.00	0	328000000	0	328000000	100/02/I/DES.2016	KERTAMULYA	PADALARANG		0	004	014	KP. CIKURAY	005	13	\N	H.DAYAT	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	01	01	\N	\N	\N	\N	\N
349	354	JUMADI	3217081606720005	KPAD SEJAHTERA	PADALARANG	PADALARANG	KAB. BANDUNG BARAT				AMIN JURDIN RUSDAYA	3277032105440001	JL. H. NUR BABUT TENGAH	CIMAHI UTARA	CIBABAT	KOTA CIMAHI				92.00	285000	27.00	823000	26220000	22221000	48441000	SHM NO. 2553	PADALARANG	PADALARANG		0	005	021	KPAD SEJAHTERA	005	21	\N	JUMADI	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	003	010	\N	\N	\N	\N	\N
350	355	MAULANA HARRY	3217082506440002	JL. RAYA PADALARANG NO. 490	PADALARANG	KERTAMULTYA	KAB. BANDUNG BARAT				AI /ATANG	3217085001410001	PADALARANG	PADALARANG	KERTAMULYA	KABUPATEN BANDUNG BARAT				1397.00	160000	0.00	0	223520000	0	223520000	SHM NO. 450	KERTAMULYA	PADALARANG		0	004	014	KP. CIKURAY	000	00	\N	AI HALIMAH	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	005	12	\N	\N	\N	\N	\N
351	356	MAULANA HARRY	3217082506440002	JL. RAYA PADALARANG NO. 490	PADALARANG	KERTAMULTYA	KAB. BANDUNG BARAT				H.DAYAT	3217060210700001	KP. PASIR HUNI	NGAMPRAH	CIMANGGU	KABUPATEN BANDUNG BARAT				2466.00	160000	0.00	0	394560000	0	394560000	100/04/IDES.2016	KERTAMULYA	PADALARANG		0	004	014	KP. CIKURAY	005	13	\N	H.DAYAT	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	01	01	\N	\N	\N	\N	\N
352	357	MAULANA HARRY	3217082506440002	JL. RAYA PADALARANG NO. 490	PADALARANG	KERTAMULTYA	KAB. BANDUNG BARAT				AI HALIMAH	3217085001410001	PADALARANG	PADALARANG	KERTAMULYA	KAB. BANDUNG BARAT				1545.00	160000	0.00	0	247200000	0	247200000	100/19/II/DES/2016	KERTAMULYA	PADALARANG		0	004	014	KP. CIKURAY	000	00	\N	AI HALIMAH	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	005	12	\N	\N	\N	\N	\N
353	358	MAULANA HARRY	3217082506440002	JL. RAYA PADALARANG NO. 490	PADALARANG	KERTAMULTYA	KAB. BANDUNG BARAT				AI HALIMAH	3217085001410001	PADALARANG	PADALARANG	KERTAMULYA	KAB. BANDUNG BARAT				1597.00	160000	0.00	0	255520000	0	255520000	100/18/II/DES/2016	KERTAMULYA	PADALARANG		0	004	014	KP. CIKURAY	000	00	\N	AI HALIMAH	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	005	012	\N	\N	\N	\N	\N
354	359	MAULANA HARRY	3217082506440002	JL. RAYA PADALARANG NO. 490	PADALARANG	KERTAMULTYA	KAB. BANDUNG BARAT				H.DAYAT SOPANDI	3217060210700001	KP. PASIR HUNI	NGAMPRAH	CIMANGGU	KABUPATEN BANDUNG BARAT				513.00	160000	0.00	0	82080000	0	82080000	100/03/I/DES./2016	KERTAMULYA	PADALARANG		0	004	014	KP. CIKURAY	005	13	\N	H.DAYAT	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	01	01	\N	\N	\N	\N	\N
355	360	MARALUS SINAGA	3277021404510001	POJOK TENGAH NO. 24	CIMAHI TENGAH	SETIAMANAH	KOTA CIMAHI				ATENG KOSASIH	3217041010650012	KP. CIGATROT GIRANG	CIKALONGWETAN	TENJOLAUT	KABUPATEN BANDUNG BARAT				11000.00	20000	0.00	0	220000000	0	220000000	AJB NO. 123/2016	TENJOLAUT	CIKALONG WETAN		0	01	16	BL. TENJOLAUT	001	06	\N	KOENTJORO	2016-02-04	\N	\N	2016-02-04	123/2016	\N	\N	KAB. BANDUNG BARAT	03	08	\N	\N	\N	\N	\N
356	361	VICTOR POSMAN	3273032606600003	KOPO MAS REGENCY L-9	BABAKAN CIPARAY	MARGASUKA	KOTA BANDUNG				ESIH DJUWARSIH	3273085809590001	JL. SETRA INDAH II NO. 16	SUKAJADI	SUKAGALIH	KOTA BANDUNG				664.00	243000	0.00	0	161352000	0	161352000	SHM NO.1325	CIHIDEUNG	PARONGPONG		0	002	001	KP. PANYAIRAN	003	10	\N	ESIH DJUWARSIH	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	004	003	\N	\N	\N	\N	\N
357	362	VICTOR POSMAN	3273032606600003	KOPO MAS REGENCY L-9	BABAKAN CIPARAY	MARGASUKA	KOTA BANDUNG				ESIH DJUWARSIH	3273085809590001	JL. SETRA INDAH II NO. 16 CIPEDES	SUKAJADI	SUKAGALIH	KOTA BANDUNG				663.00	243000	0.00	0	161109000	0	161109000	SHM NO. 1326	CIHIDEUNG	PARONGPONG		0	002	001	KP. PANYAIRAN	003	10	\N	ESIH DJUWARSIH	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	004	003	\N	\N	\N	\N	\N
358	363	SURATNO	3217080402740017	PPI. JL. ANGGREK B3/16	PADALARANG	PADALARANG	KAB. BANDUNG BARAT				YASMAN	3515182303710006	TAMAN EDEL WEIS I/10 GARDEN DIAN	WARU	TAMBAK SAWAH	KAB. SIDOARJO				60.00	702000	60.00	700000	42120000	42000000	84120000	SHM NO. 2876	PADALARANG	PADALARANG		0	04	22	JL. ANGGREK	004	22	\N	YASMAN LUTHER	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	02	08	\N	\N	\N	\N	\N
359	364	PAINGAT	3217012804740004	KP. CIREYOD	LEMBANG	CIKIDANG	KAB. BANDUNG BARAT			__.___.___._-___.___	DRS. UMAR MARJONO	3273151309530001	JL. HALIM	BANDUNG KULON	CIBUNTU	KOTA BANDUNG				125.00	464000	21.00	505000	58000000	10605000	68605000	SHM NO. 278	CIKOLE	LEMBANG		0	04	02	KO. BALITSA	003	15	\N	AGUNG TRIHONO	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	10	01	\N	\N	\N	\N	\N
360	365	ANDY MULYA HIDAYAT DAN FARIDA	3273040706740006	JL. CETARIP BARAT NO. 104	BOJONGLOA KALER	KOPO	KOTA BANDUNG				SIAW MIE	3204044809790007	PERMATA CIMAHI  BLOK G 6 NO. 33	NGAMPRAH	TANIMULYA	KABUPATEN BANDUNG BARAT				140.00	802000	48.00	595000	112280000	28560000	140840000	SHM NO. 3520	TANIMULYA	NGAMPRAH		0	04	07	KO. PERMATA CIMAHI	014	09	\N	SUHERYONO	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	06	14	\N	\N	\N	\N	\N
361	366	FRANSISCA XAVERIA RINI CS	3217015305600008	KP. SUKAMULYA 102	LEMBANG	LANGENSARI	KAB. BANDUNG BARAT				ANTONIUS PAMI HERNADI, DRS	474.3/26/2015	Jl. KP. SUKAMULYA	LEMBANG	LANGENSARI	KABUPATEN BANDUNG BARAT				1043.00	48000	0.00	0	50064000	0	50064000	HGB NO. 00134	LANGENSARI	LEMBANG	SURAT KETERANGAN SUSUNAN AKHLI WARIS NO. 474.3/44/WRS/PEM/LBG/2015	1	03	10	BL. GUNUNG BATU	001	10	\N	ANTONIUS PAHMI, DRS	2016-02-16	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	03	10	\N	\N	\N	\N	\N
362	367	FRANSISCA XAVERIA RINI CS	3217015305600008	KP. SUKAMULYA 102	LEMBANG	LANGENSARI	KAB. BANDUNG BARAT				ANTONIUS PAMI	474.3/26/2015	Jl. KP. SUKAMULYA	LEMBANG	LANGENSARI	KABUPATEN BANDUNG BARAT				1074.00	48000	0.00	0	51552000	0	51552000	HGB NO. 00133	LANGENSARI	LEMBANG	SURAT KETERANGAN SUSUNAN AKHLI WARIS NO : 474.3/44.WRS/PEM/LBG/2015	1	003	010	BL. GUNUNG BATU	001	10	\N	ANTONIUS PAHMI, DRS	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	010	\N	\N	\N	\N	\N
363	368	RICKY GIA DEFIANDA	3213071904920001	KP. KAPEK	PAGADEN	SUKAMULYA	KAB. SUBANG				TOMY HENDARTO	3603171808740013	TAMAN UBUD LOKA VIII NO. 52	CURUG	BINONG	KAB. TANGERANG				89.00	160000	0.00	0	14240000	0	14240000	SHM NO. 06100	TANIMULYA	NGAMPRAH		0	029	008	KP. RANDU KURUNG	001	09	\N	H. EPON TARMINI	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	000	000	\N	\N	\N	\N	\N
364	369	DEVID SUSENO	3217060908650002	BUKIT PERMATA CIMAHI F-1 NO. 44	NGAMPRAH	CILAME	KAB. BANDUNG BARAT				CYRUS SUSANTI	3277036206650015	JL. SENTRAL 412/B	CIMAHI UTARA	CIBABAT	KOTA CIMAHI				280.00	200000	0.00	0	56000000	0	56000000	SHM NO. 2695	CILAME	NGAMPRAH		0	07	22	KP. SUMUR BOR	000	00	\N	SUSANTI PURWANINGSIH CYRUS	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	03	04	\N	\N	\N	\N	\N
365	370	LILIK CRISTIANI	3204125805860001	JL. SAYURAN	DAYEUHKOLOT	CANGKUANG KULON	KAB. BANDUNG				H. ASEP ABDULLAH, SE	3273131611630002	JL. KARAWITAN NO. 121/123	LENGKONG	TURANGGA	KOTA BANDUNG				109.00	200000	40.00	968000	21800000	38720000	60520000	SHM NO. 3695	CIHANJUANG	PARONGPONG		0	002	008	KP. CISINTOK	004	03	\N	ASEP ABDULLAH, H	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	003	\N	\N	\N	\N	\N
366	371	A. MAPTU HIDAYAT	3217110101570045	KP. CICARIU	CILILIN	KARANGTANJUNG	KAB. BANDUNG BARAT				ALI MURTADO	3217110208510002	KP. KAUM	CILILIN	CILILIN	KABUPATEN BANDUNG BARAT				290.00	103000	120.00	595000	29870000	71400000	101270000	SHM NO. 260	CILILIN	CILILIN		0	001	006	KP. KAUM	003	07	\N	MOMO. H	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	007	\N	\N	\N	\N	\N
367	372	MOH. HAFIDH	3217080612680003	PERUMDIS PUSDIKTER	PADALARANG	LAKSANAMEKAR	KAB. BANDUNG BARAT				INDRI YUNI HANDAYANI	3471014706800002	KARANGWARU LOR TR.II/136	TEGALREJO	KARANGWARU	KOTA YOGYAKARTA				117.00	1032000	45.00	700000	120744000	31500000	152244000	SHM NO. 2075	TANIMULYA	NGAMPRAH		0	006	005	JL. PERMATA CIMAHI	003	12	\N	IWAN SETIADJI GUNAWAN	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	001	\N	\N	\N	\N	\N
266	271	ERWIN KURNIAWAN	3674011908740004	VERSAILLES RESIDENCE 1-6 BLOK F 56	SERPONG	RAWA BUNTU	KOTA TANGERANG SELATAN				ODANG NY NUNUNG	3217040810650002	Jl. KP. CIKUBANG	CIKALONGWETAN	MANDALAMUKTI	KABUPATEN BANDUNG BARAT				1827.00	64000	0.00	0	116928000	0	116928000	AJB NO. 087/2016	MANDALAMUKTI	CIKALONG WETAN		0	05	09	BL. CIDAPLANG	005	06	\N	ODANG NY NUNUNG	2016-01-26	\N	\N	2016-01-26	087/2016	\N	\N	KAB. BANDUNG BARAT	01	17	\N	\N	\N	\N	\N
368	373	DODO IRMANTO	6306053110690001	JL. RAYA PUPUTAN NO. G-29 DPS,BR/LINK.KIRANA	DENPASAR BARAT	DAUN PURI	KOTA DENPASAR			__.___.___._-___.___	NINING AYU LUTFIATI	3273015411630001	SARIJADI BLOK 04 NO. 123	SUKASARI	SARIJADI	KOTA BANDUNG				184.00	285000	0.00	0	52440000	0	52440000	SHM NO. 5255	CIWARUGA	PARONGPONG		0	000	000	KP. PARIGILAME	001	07	\N	MANSUR H	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	004	\N	\N	\N	\N	\N
370	375	SABANA PRAWIRA WIDJAJA	1050062011410001	JL. KYAI GEDE UTAMA NO. 7	COBLONG	LEBAK GEDE	KOTA BANDUNG				SOLEH RIDWAN	3277023010690015	Jl.JEND.H.AMIR MACHMUD NO.747	CIMAHI TENGAH	PADASUKA	KOTA CIMAHI				140.00	243000	0.00	0	34020000	0	34020000	005/2009/II/2016	GADOBANGKONG	NGAMPRAH		0	03	08	JL. BUNISARI	001	05	\N	WIWI WITARSIH	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	05	16	\N	\N	\N	\N	\N
369	374	DODO IRMANTO	6306053110690001	JL. RAYA PUPUTAN NO. G-29 DPS,BR/LINK.KIRANA	DENPASAR BARAT	DAUN PURI	KOTA DENPASAR				NINING AYU LUTFIATI	3273015411630001	SARIJADI BLOK 04 NO. 123	SUKASARI	SARIJADI	KOTA BANDUNG				20.00	285000	0.00	0	5700000	0	5700000	SHM NO. 5255	CIWARUGA	PARONGPONG		0	000	000	KP. PARIGILAME	001	07	\N	MANSUR H	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	004	\N	\N	\N	\N	\N
371	376	YULI ASMAWATI	3217014107760126	KP. PANORAMA 	LEMBANG	LEMBANG	KAB. BANDUNG BARAT				DADANG JUHANA	3217011506620001	Jl. KP. SUKAMAJU TIMUR	LEMBANG	KAYUAMBON	KABUPATEN BANDUNG BARAT				224.00	82000	0.00	0	18368000	0	18368000	SHM NO. 00705	KAYUAMBON	LEMBANG		0	03	03	BL. SUKAMAJU	001	11	\N	SUTARDI LINGGA P	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	01	11	\N	\N	\N	\N	\N
372	377	HENDRA BUDIAWAN	3273060303690002	GG. POLISI NO. 166/5A	CICENDO	PASIR KALIKI	KOTA BANDUNG				DADANG JUHANA	3217011506620001	KP. SUKAMAJU TIMUR	LEMBANG	KAYUAMBON	KABUPATEN BANDUNG BARAT				1554.00	82000	0.00	0	127428000	0	127428000	SHM NO. 00706	KAYUAMBON	LEMBANG		0	004	005	BL. SUKAMAJU	001	11	\N	SUTARDI LINGGA P	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	011	\N	\N	\N	\N	\N
373	378	ALIT SURYANA	3217011001650004	KP. SUKAMAJU TIMUR	LEMBANG	KAYUAMBON	KAB. BANDUNG BARAT				DADANG JUHANA	3217011506620001	KP. SUKAMAJU TIMUR	LEMBANG	KAYUAMBON	KAB. BANDUNG BARAT			__.___.___._-___.___	137.00	82000	0.00	0	11234000	0	11234000	SHM NO. 00704	KAYUAMBON	LEMBANG		0	001	011	BL. SUKAMAJU	001	11	\N	SUTARDI LINGGA P	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	011	\N	\N	\N	\N	\N
374	379	AGUNG CAHYADI	3273142005940004	JL. SUKASIRNA II	CIBEUNYING KIDUL	PADASUKA	KOTA BANDUNG				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 	LEMBANG	GUDANGKAHURIPAN	KAB. BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 00115	TANJUNGWANGI	CIHAMPELAS		0	05	12	BL. IRIGASI	000	00	\N	GUNADI	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	05	01	\N	\N	\N	\N	\N
375	380	YOGA FITRIADI	3217082306850019	PERUM PPI C7/02	PADALARANG	PADALARANG	KAB. BANDUNG BARAT			__.___.___._-___.___	IR ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				72.00	243000	31.00	968000	17496000	30008000	47504000	HGB NO. 663	CITAPEN	CIHAMPELAS		0	01	22	JL. ALAM ANGGREK I	000	00	\N	PT. MULTI SANGGAR UTAMA	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	05	01	\N	\N	\N	\N	\N
376	381	UJANG MULYANA	3273052511790001	JL. MALEBER UTARA  NO. 42	ANDIR	GARUDA	KOTA BANDUNG				IR ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 01488	CITAPEN	CIHAMPELAS		0	04	03	BL. CINTA KARYA	003	05	\N	PT. MULTI SANGGAR UTAMA	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	05	01	\N	\N	\N	\N	\N
377	382	YAYU SRI RAHAYU	3204095103910001	KOMP. MAGRAHAYU KENCANA BLOK D1 NO. 11	MARGAHAYU	MARGAHAYU SELATAN	KAB. BANDUNG				IR ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG	LEMBANG	GUDANGKAHURIPAN	KAB. BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 01684	CITAPEN	CIHAMPELAS		0	07	14	PERUM SANGGAR INDAH	000	00	\N	PT. MULTI SANGGAR UTAMA	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	05	01	\N	\N	\N	\N	\N
378	383	GUNAWAN JAYANA	3273032206860006	KP. CINTA KARYA 	CIHAMPELAS	CITAPEN	KAB. BANDUNG BARAT				IR ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG	LEMBANG	GUDANGKAHURIPAN	KAB. BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 01519	CITAPEN	CIHAMPELAS		0	01	05	BL. CINTA KARYA	003	05	\N	PT. MULTI SANGGAR UTAMA	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	05	01	\N	\N	\N	\N	\N
379	384	CORI HERNIASARI	3217097012740003	KP. BLOK JAMBU	BATUJAJAR	GALANGGANG	KAB. BANDUNG BARAT				I KETUT CATUR WIDANA	3277030101710051	PURI CIPAGERAN INDAH I BLOK E NO. 160	CIMAHI UTARA	CIPAGERAN	KOTA CIMAHI				96.00	702000	48.00	595000	67392000	28560000	95952000	HGB NO. 01787	BATUJAJAR TIMUR	BATUJAJAR		0	001	002	KO. PUSPA REGENCY			\N	I KETUT CATUR WIDANA	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	024	\N	\N	\N	\N	\N
380	385	MAMAN SUBARNA	3273062305830004	JL. JATAYU III NO. 92/72	CICENDO	HUSEN SASTRANEGARA	KOTA BANDUNG				IR ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG	LEMBANG	GUDANGKAHURIPAN	KAB. BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO.00237	TANJUNGWANGI	CIHAMPELAS		0	01	09	BL. IRIGASI	000	00	\N	GUNADI	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	05	01	\N	\N	\N	\N	\N
381	386	DEVIATUL ADHIYAH SOBARI	3273155108860003	JL. CIJERAH GG. PASANTREN NO. 79/189	BANDUNG KULON	CIBUNTU	KOTA BANDUNG				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3 G	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 01503	CITAPEN	CIHAMPELAS		0	005	006	BL. CINTA KARYA	003	05	\N	PT. MULTI SANGGAR UTAMA	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	001	\N	\N	\N	\N	\N
382	387	AGUS SUUD	3217011608690001	KP. BATUREOK	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				ERWIN SUMARNA CS	3217010502680008	KP. SUKASARI	LEMBANG	CIKOLE	KABUPATEN BANDUNG BARAT				170.00	128000	0.00	0	21760000	0	21760000	SHM NO. 37	CIKOLE	LEMBANG		0	001	008	BL. PASIR PANJANG	000	05	\N	AMAT	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	005	\N	\N	\N	\N	\N
383	388	SANDA FEBIANI	3273074402760006	JL. SARIMADU BARAT NO. 31	SUKAJADI	SUKAWARNA	KAB. BANDUNG BARAT				KORINA RUSLI	3217025709490001	JL. CATHALIA NO. 16 PONDOK HIJAU	PARONGPONG	CIWARUGA	KABUPATEN BANDUNG BARAT				144.00	1862000	80.00	1200000	268128000	96000000	364128000	SHM NO. 2716,1445	CIWARUGA	PARONGPONG		0	07	01	KP. CICARITA	001	10	\N	TAN ALI WIJAYA	2016-02-16	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	04	10	\N	\N	\N	\N	\N
384	389	PEPE SAEPUL AMAR	3217101002740020	BLOK JAMBU	BATUJAJAR	GALANGGANG	KAB. BANDUNG BARAT				HERAWATI	3217094310900010	KP. CIBEBER HILIR	BATUJAJAR	GIRIASIH	KAB. BANDUNG BARAT				79.00	64000	21.00	595000	5056000	12495000	17551000	SHM NO. 00554	GALANGGANG	BATUJAJAR		0	001	002	BL. JAMBU	001	02	\N	HERAWATI	2016-02-17	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	001	\N	\N	\N	\N	\N
278	283	AYUNINGSIH PURWANINGRUM	3201035005810007	JL. ATENG ILYAS KP. MUHARA 	CITEUREUP	CITEUREUP	KAB. BOGOR				LIEM NJUK KIAN	3273025411660004	JL. DAGO ASRI II NO. 18	COBLONG	DAGO	KOTA BANDUNG				105.00	537000	45.00	1200000	56385000	54000000	110385000	HGB NO. 00168	JAMBUDIPA	CISARUA		0	05	08	BL. JAMBUDIPA	002	01	\N	MELLYRIATI TJANDRADJAJA	2016-02-09	\N	\N	\N	\N	\N	\N		06	09	\N	\N	\N	\N	\N
385	390	YUPI SITI NURJANAH	3217085102810025	KP. CIJEUNGJING	PADALARANG	KERTAMULYA	KAB. BANDUNG BARAT				PIAH SUPRIATI	3217084606570007	JL. CIJEUNGJING NO. 23	PADALARANG	KERTAMULYA	KAB. BANDUNG BARAT				82.00	285000	50.00	700000	23370000	35000000	58370000	SHM NO. 1080	KERTAMULYA	PADALARANG		0	001	016	JL. CIJEUNGJING	000	16	\N	SUPIYATI B SAPTA	2016-02-17	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	016	\N	\N	\N	\N	\N
320	325	OKI DWI PRIYANTI	3277026510820024	WISMA ARMED NO. 29 JL. WARUNG CONTONG	CIMAHI TENGAH	SETIAMANAH	KOTA CIMAHI			57.495.662.9-421.000	ALI ABUDAN	3273061708580012	JL. H. AKBAR NO. 2	CICENDO	PASIRKALIKI	KOTA BANDUNG				96.00	464000	29.00	823000	44544000	23867000	68411000	HGB NO. 1231	JAYAMEKAR	PADALARANG		0	003	014	KO. BENTANG PADALARANG	000	00	\N	PT. UZI KARYA PRESTASI	2016-02-11	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	06	06	\N	\N	\N	\N	\N
386	391	ASEP KURNIA ABDULAH	3277030712800008	JL. SANGKURIANG NO. 22/62	CIMAHI UTARA	CIPAGERAN	KOTA CIMAHI				TUTI KURNIASIH	3277025204700021	Jl.KOTA MAS VIII NO. 2	CIMAHI TENGAH	PADASUKA	KOTA CIMAHI				95.00	916000	54.00	700000	87020000	37800000	124820000	SHM NO. 320	TANIMULYA	NGAMPRAH		0	07	05	KO. PURI CIPAGERAN INDAH II	002	20	\N	TUTI KURNIASIH	2016-02-17	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	11	10	\N	\N	\N	\N	\N
387	392	ADITI ERLANGI	3273094203850001	JL. CILIWUNG NO. 10	BANDUNG WETAN	CIHAPIT	KOTA BANDUNG				FERRY NUGROHO KURNIANTO	3402121107730003	SOSROWAJAN BARU 388	BANGUNTAPAN	BANGUNTAPAN	KAB. BANTUL				744.00	1573000	431.00	1200000	1170312000	517200000	1687512000	SHM NO. 238	CIWARUGA	PARONGPONG		0	002	004	BL. JAMIRANTA	000	00	\N	IDA RIDHAWATI	2016-02-17	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	019	000	\N	\N	\N	\N	\N
388	393	LIA NURHAMIDAH	3217105712720002	KP. GERANG	CIHAMPELAS	CITAPEN	KAB. BANDUNG BARAT				LIEM TJUN MIN	3273096611640001	JL. HARLAMBANG NO. 10	BANDUNG WETAN	TAMANSARI	KOTA BANDUNG				60.00	916000	29.00	823000	54960000	23867000	78827000	HGB NO. 06260	TANIMULYA	NGAMPRAH		0	002	002	KP. KEBON KALAPA	002	02	\N	PT. ANUGRAH MEGAH LESTARI IND	2016-02-17	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	006	008	\N	\N	\N	\N	\N
389	394	SONI SETIAWAN	3277021407800015	JL. CISANGKAN HILIR GG. BAKTI VI NO. 225	CIMAHINTENGAH	PADASUKA	KOTA CIMAHI				LIEM TJUN MIN	3273096611640001	JL. HARLAMBANG NO .10	BANDUNG WETAN	TAMANSARI	KOTA BANDUNG				60.00	916000	29.00	823000	54960000	23867000	78827000	HGB NO. 06260	TANIMULYA	NGAMPRAH		0	004	017	KP. KEBON KALAPA	002	02	\N	PT. ANUGRAH MEGAH LESTARI IND	2016-02-17	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	006	008	\N	\N	\N	\N	\N
390	395	KRIS SETYO ROSADI	3217080812860005	KP. PURABAYA	PADALARANG	JAYAMEKAR	KAB. BANDUNG BARAT				PRIMANSYAH PAHLEVI, SSN	3273022210750004	JL. SANGKURIANG J-1	COBLONG	DAGO	KOTA BANDUNG				129.00	702000	45.00	968000	90558000	43560000	134118000	HGB NO. 3111	PADALARANG	PADALARANG		0	005	006	KO. BUMI ASRI RESIDENCE	003	25	\N	PRIMANSYAH PAHLEVI, SSN	2016-02-17	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	012	\N	\N	\N	\N	\N
391	396	YENI MARLINA	3217085404820019	KP. POS KULON	PADALARANG	KERTAMULTYA	KAB. BANDUNG BARAT				GUNAWAN WIDJAJA	3174051909380003	PERMATA HIJAU BLOK FII/54	KEBAYORAN LAMA	GROGOL UTARA	JAKARTA SELATAN				162.00	2352000	97.00	1516000	381024000	147052000	528076000	HGB NO. 03803	CIPEUNDEUY	PADALARANG		0	001	003	KO. KOTA BARU PARAHYANGAN	000	00	\N	PT. BELAPUTERA INTILAND	2016-02-17	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	019	010	\N	\N	\N	\N	\N
392	397	DIAN NUGRAHJATI	3273015611800007	JL. ABADI III NO. 37	SUKASARI	GEGERKALONG	KOTA BANDUNG				MUNISH DETARAM MULANI	3273132612750002	JL. SURYALAYA ASRI II KAV-22	LENGKONG	CIJAGRA	KOTA BANDUNG				109.00	702000	40.00	1200000	76518000	48000000	124518000	SHM NO. 805	CIHANJUANG RAHAYU	PARONGPONG		0	006	001	KP. TUTUGAN	001	06	\N	MUNISH DETARAM MULANI	2016-02-17	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	010	004	\N	\N	\N	\N	\N
393	398	H. R ALIBASJAH BRATA	3217022012360001	VILA ISTANA BUNGA BLOK P 1-3	PARONGPONG	CIHANJUANG RAHAYU	KAB. BANDUNG BARAT				DUDI HERMAWAN, DRS	3273032501540003	SUMBER HEGAR VI/13-12	BABAKAN CIPARAY	BABAKAN	KOTA BANDUNG				250.00	1032000	90.00	1200000	258000000	108000000	366000000	HGB NO. 226	KARYAWANGI	PARONGPONG		0	001	015	KO. VILLA ISTANA BUNGA	001	11	\N	DUDI HERMAWAN, DRS	2016-02-17	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	006	011	\N	\N	\N	\N	\N
394	399	AMAN SARI	3277012412770003	KO. CIBACANG NO. 25	PADALARANG	CIPEUNDEUY	KAB. BANDUNG BARAT			__.___.___._-___.___	MUHTAR GOJALI	3217082004630006	CIBACANG	PADALARANG	CIPEUNDEUY	KABUPATEN BANDUNG BARAT				140.00	160000	0.00	0	22400000	0	22400000	594/07/DS	CIPEUNDEUY	PADALARANG		0	005	005	KP. CIBACANG	004	04	\N	DEVI MUHTAR	2016-02-17	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	004	005	\N	\N	\N	\N	\N
395	400	DRS. BUDI HARJO	3201071405660004	GRIYA ALAM SENTOSA C. 1/4	CILEUNGSI	PASIRANGIN	KAB. BOGOR				WISNU ANDAWA	3217021910850016	Jl. KP. BATU REOK	LEMBANG	GUDANG KAHURIPAN	KABUPATEN BANDUNG BARAT				157.00	82000	0.00	0	12874000	0	12874000	SHM NO. 01957	CIHIDEUNG	PARONGPONG		0	009	008	BL. CINANGKA	002	04	\N	RACHMANAYA	2016-02-17	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	009	\N	\N	\N	\N	\N
345	350	BAMBANG SULISTYONO	3217080908710015	JL. MAYANG ASRI NO. 10	PADALRANG	CIPEUNDEUY	KAB. BANDUNG BARAT				IR. SANUSI TANAWI	3173062210530001	PERUM CITRA II BLOK G 11/2	KALI DERES	PEGADUNGAN	JAKARTA BARAT				162.00	2352000	97.00	1516000	381024000	147052000	528076000	HGB NO. 03638	CIPEUNDEUY	PADALARANG		0	005	011	KO. KOTA BARU PARAHYANGAN	000	00	\N	PT. BELAPUTERA INTILAND	2016-02-15	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	008	019	\N	\N	\N	\N	\N
412	418	DIAH PRATIWI	3277036009720012	KOMP. GRIYA PRATAMA KAVLING 12	NGAMPRAH	CILAME	KAB. BANDUNG BARAT				MUHAMAD SALADIN	3217060508720026	PURI CIPAGERAN INDAH II C1 NO.23	NGAMPRAH	TANIMULYA	KABUPATEN BANDUNG BARAT				70.00	82000	0.00	0	5740000	0	5740000	SHM NO.3469	CILAME	NGAMPRAH		0	05	21	JL. RAYA CILAME	005	21	\N	DEDEH JUBAEDAH	2016-02-18	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	02	20	\N	\N	\N	\N	\N
413	419	HETTY RUSMIATI	3273174204690004	JL. KOPO GG. SETIAMANAH NO. 5	BOJONGLOA KIDUL	SITUSAEUR	KOTA BANDUNG				ETI KUSWATI	3217085302660006	CIHALIWUNG ATAS	PADALARANG	KERTAMULYA	KABUPATEN BANDUNG BARAT				119.00	702000	29.00	823000	83538000	23867000	107405000	HGB NO. 2474	PADALARANG	PADALARANG		0	001	006	JL. GRAHA PYRUS	000	00	\N	ETI KUSWATI	2016-02-18	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	004	007	\N	\N	\N	\N	\N
414	420	UWARIAH	3217085706570007	KP. TIPAR TIMUR	PADALARANG	LAKSANAMEKAR	KAB. BANDUNG BARAT				DEDEN RAHMAT	3217062208620001	KP TIPAR TIMUR	PADALARANG	LAKSANAMEKAR	KABUPATEN BANDUNG BARAT				280.00	64000	70.00	700000	17920000	49000000	66920000	AJB NO. 050/2012	LAKSANAMEKAR	PADALARANG		0	005	001	KP. TIPAR TIMUR	005	01	\N	KOMARA	2012-08-10	\N	\N	2012-08-10	050/2012	\N	\N	KABUPATEN BANDUNG BARAT	005	001	\N	\N	\N	\N	\N
403	409	KIKI MUHAMAD HIDAYATAULAH	3217011102900014	JL. SUNGAI BARITO HOP 4/48	BONTANG UTARA	GUNUNG ELAI	KOTA BONTANG				AGUS DJEDJE	3217010208420003	Jl. KP. KOSAMBI	LEMBANG	CIBODAS	KABUPATEN BANDUNG BARAT				399.00	160000	0.00	0	63840000	0	63840000	593.21/13/PEM.	CIBODAS	LEMBANG		0	024	000	BL. KOSAMBI	003	08	\N	AGUS DJEDJE	2016-02-18	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	008	\N	\N	\N	\N	\N
404	410	ENDIN SUGANDI	3217060309470002	KOMP. PAKUSARAKAN II G	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				YUNINGSIH	3273125206700003	JL. SUKABUMI DLM NO. 21/123	BATUNUNGGAL	KACAPIRING	KOTA BANDUNG				60.00	916000	21.00	595000	54960000	12495000	67455000	SHM NO. 5106	TANIMULYA	NGAMPRAH		0	005	011	KO. BUMI PAKUSARAKAN II	005	11	\N	YUNINGSIH	2016-02-18	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	008	006	\N	\N	\N	\N	\N
405	411	MOCHAMAD MAULANA	3273120411870008	JL. CIBANGKONG LOR	BATUNUNGGAL	CIBANGKONG	KOTA BANDUNG				MUHAMAD RANGGA RAMADAN	3174051005880005	JL. MASJID NUR NO. 11	KEBAYORAN LAMA	GROGOL UTARA	PROV. DKI JAKARTA				60.00	48000	30.00	823000	2880000	24690000	27570000	HGB NO. 141	CITATAH	CIPATAT		0	005	011	BL. CIMERANG	004	12	\N	PT. BUMI INDAH PARAHYANGAN	2016-02-18	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	006	000	\N	\N	\N	\N	\N
406	412	DESSY ATI RAHMAWATI	3674015812770003	WEDELIA BLOK E.3 PUSPITA LOKA	SERPONG	LENGKONG GUDANG	KOTA TANGERANG SELATAN				EDDY YUSUF	3172023012550030	Jl. PARADISE I BLOK F 1/8	TANJUNG PRIOK	SUNTER AGUNG	JAKARTA UTARA				547.00	1032000	100.00	0	564504000	0	564504000	HGB NO. 66	KARYAWANGI	PARONGPONG		0	02	05	KO. VILLA ISTANA BUNGA	001	11	\N	SANNY TANUMIHARJA	2015-10-29	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	01	12	\N	\N	t	\N	\N
400	405	TONI YUSANDI	3217082909700009	KP. POS WETAN	PADALARANG	KERTAMULTYA	KAB. BANDUNG BARAT				H. HIDAYAT CS	3204330502550001	KP. PANGKALAN	MAJALAYA	WANGISAGARA	KABUPATEN BANDUNG			__.___.___._-___.___	253.00	285000	108.00	595000	72105000	64260000	136365000	SHM NO. 208	KERTAMULYA	PADALARANG		0	002	011	KP. RANCABALI	003	02	\N	ADNAN	2016-02-18	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	007	\N	\N	\N	\N	\N
331	336	DESSY ATI RAHMAWATI	3674015812770003	WEDELIA BLOK E.3 PUSPITA LOKA	SERPONG	LENGKONG GUDANG	KOTA TANGERANG SELATAN				EDDY YUSUF	3172023012550030	Jl. PARADISE I BLOK F 1/8	TANJUNG PRIOK	SUNTER AGUNG	JAKARTA UTARA				547.00	1032000	0.00	0	564504000	0	564504000	HGB NO. 66	KARYAWANGI	PARONGPONG		0	02	05	KO. VILLA ISTANA BUNGA	001	11	\N	SANNY TANUMIHARJA	2015-10-29	547.00	100.00	2015-10-30	001	\N	\N	KAB. BANDUNG BARAT	01	12	\N	\N	\N	\N	\N
401	407	HERA RIZKIANI FITRI	3213265404920003	KP. SUKAMULYA	KASOMALANG	SINDANGSARI	KAB. SUBANG				DEDEH JUBAEDAH	3217066212770012	KEBON KALAPA	NGAMPRAH	TANIMULYA	KABUPATEN BANDUNG BARAT				70.00	82000	0.00	0	5740000	0	5740000	SHM NO. 04424	CILAME	NGAMPRAH		0	001	007	KP. CIBUNTU	004	09	\N	WAHYO	2016-02-18	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	002	\N	\N	\N	\N	\N
407	413	RULLYANTHI TRESNA MUNGGARAN	3277016003890030	JL. GAJAH 09 NO. 02 KOMP. SUAKA INDAH	CIMAHI SELATAN	LEUWIGAJAH	KOTA CIMAHI				MUHAMAD RANGGA RAMADAN	3174051005880005	JL. MASJID NUR NO. 11	KEBAYORAN LAMA	GROGOL UTARA	PROV. DKI JAKARTA				60.00	48000	30.00	823000	2880000	24690000	27570000	HGB NO. 123	CITATAH	CIPATAT		0	003	012	BL. CIMERANG	004	12	\N	PT. BUMI INDAH PARAHYANGAN	2016-02-18	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	006	010	\N	\N	\N	\N	\N
408	414	EDDY HARTADI	3273100204740005	JL. DARMAKUSUMA NO. 32 A	BOJONGLOA KIDUL	MEKARWANGI	KOTA BANDUNG				HADY GUNAWAN	3273171802750005	JL. KARANG KAMULYAN NO. 22	BOJONGLOA KIDUL	CIBADUYUT WETAN	KOTA BANDUNG				100.00	916000	45.00	1200000	91600000	54000000	145600000	HGB NO. 00348	KERTAJAYA	PADALARANG		0	001	004	KOTA BALI	000	00	\N	PT. PESONA JATI ABADI	2016-02-18	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	006	003	\N	\N	\N	\N	\N
409	415	ERIK NAVIRO WIDJAJA	3578212212920001	SIMPANG DARMO PERMAI UTARA 8/2	DUKUH PAKIS	PRADAHKALIKENDAL	KOTA SURABAYA				DR. TONY	3273071910640006	JL. GRIYA UTARA NO. 21	SUKAJADI	SUKAWANA	KOTA BANDUNG				64.00	916000	110.00	1200000	58624000	132000000	190624000	HGB NO. 00212	KERTAJAYA	PADALARANG		0	004	007	KO. KOTA BALI JL. KUTA RAYA	000	00	\N	PT. PESONA JATI ABADI	2016-02-18	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	007	003	\N	\N	\N	\N	\N
410	416	TN. DEDE SYARIFUDIN	3217061807650012	PERUM CIMAREME INDAH	NGAMPRAH	CIMAREME	KAB. BANDUNG BARAT				ADNAN	0950011906720294	JL PETOJO UTARA	GAMBIR	PETOJO UTARA	PROV. DKI JAKARTA			__.___.___._-___.___	72.00	1573000	36.00	700000	113256000	25200000	138456000	HGB NO. 139	CIMAREME	NGAMPRAH		0	002	009	KO. CIMAREME INDAH			\N	PT. WAHYUCITRA MEGAHSELARAS	2016-02-18	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	012	003	\N	\N	\N	\N	\N
411	417	SYLFIA NITHA	3273025406800001	JL. SADANG HEGAR II NO. 04	COBLONG	SEKELOA	KOTA BANDUNG				FENNY LUKMAN MIHARDJA	3273086007710803	Jl. HEGARMANAH NO. 22 A	CICADAS	HEGARMANAH	KOTA BANDUNG				162.00	2352000	95.00	1200000	381024000	114000000	495024000	SHM NO. 2030	CIPEUNDEUY	PADALARANG		0	004	013	KO. KBP JL. NAGABUANA WETAN	000	00	\N	KENNETH NATHAN TEDY	2016-02-18	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	011	003	\N	\N	\N	\N	\N
415	421	IVAN WIBAWA LINGGA CS	3273191801890007	JL. SUNDA NO. 55	SUMUR BANDUNG	KEBON PISANG	KOTA BANDUNG				IR. DERAJAT ISA	3273013110470001	JL. SETRASARI III NO. 17	SUKASARI	SUKARASA	KOTA BANDUNG			__.___.___._-___.___	15960.00	200000	0.00	0	3192000000	0	3192000000	SHM NO. 01994	CIPEUNDEUY	PADALARANG		0	010	007	KP. PANGKALAN	002	03	\N	TITI	2016-02-19	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	002	\N	\N	\N	\N	\N
416	422	FRANS SUSANTO	3273011207860001	JL. LEUWISARI RAYA NO, 18-20	BOJONGLOA KIDUL	KEBONLEGA	KOTA BANDUNG				IR. SANUSI TANAWI	3173062210530001	PERUM CIPTA II BLOK G. 11/2	KALI DERES	PEGADUNGAN	PROV. DKI JAKARTA				162.00	2352000	97.00	1516000	381024000	147052000	528076000	HGB NO. 03708	CIPEUNDEUY	PADALARANG		0	001	006	KO. KOTA BARU PARAHYANGAN	000	00	\N	PT. BELAPUTERA INTILAND	2016-02-19	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	008	019	\N	\N	\N	\N	\N
417	423	TILLY GUNAWAN	3273195807410001	JL.PATRAKOMALA NO. 54	SUMUR BANDUNG	MERDEKA	KOTA BANDUNG				IR. SANUSI TANAWI	3173062210530001	PERUM CITRA II BLOK G-11/2	KALI DERES	PEGADUNGAN	KABUPATEN BANDUNG BARAT				162.00	2352000	97.00	1516000	381024000	147052000	528076000	HGB NO. 3412	CIPEUNDEUY	PADALARANG		0	05	06	KO. KOTA BARU PARAHYANGAN	000	00	\N	PT. BELAPUTERA INTILAND	2016-02-19	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	08	19	\N	\N	\N	\N	\N
418	424	ALI HARNAWADI PUTRA CS	3217083101670006	POS KIDUL	PADALARANG	KERTAMULTYA	KAB. BANDUNG BARAT				LILY HARNAWADI OENTOENG	3277-08072015-00	JL. RAYA PADALARANG	PADALARANG	KERTAMULYA	KABUPATEN BANDUNG BARAT			__.___.___._-___.___	540.00	1032000	0.00	0	557280000	0	557280000	SHM NO. 3147	KERTAMULYA	PADALARANG	KETERANGAN HAK WARIS NO. 14/2016	0	002	017	JL. RAYA PADALARANG	002	17	\N	LILI HARNAWADI ASE	2016-02-19	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	17	\N	\N	\N	\N	\N
419	425	SIN LOIJ	3603123008690003	VILA REGENSI TNG II BLOK FD-23 NO. 22	PASIR KEMIS	GELAM JAYA	KAB. TANGERANG				SUMARTININGSH	3273016510710001	JL. SINDANG SIRNA NO. 6	SUKASARI	GEGERKALONG	KOTA BANDUNG				210.00	36000	185.00	36000	7560000	6660000	14220000	SHM NO. 1838	JAYAGIRI	LEMBANG		0	002	010	BL. GUNUNG PUTRI	002	10	\N	EVI SUARSA/PENGGARAP	2016-02-19	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	005	\N	\N	\N	\N	\N
420	426	MUHAMMAD ULIN NUHA	3277022704910015	JL. BAROS NO. 151 RATULANGI 	CIMAHI TENGAH	BAROS	KOTA CIMAHI				AMALIYAH	3277024601510003	Jl. JL. DR. SAM RATULANGI NO. G.139	CIMAHI TENGAH	BAROS	CIMAHI				60.00	27000	23.00	1200000	1620000	27600000	29220000	HGB NO. 00010	PANGAUBAN	BATUJAJAR		0	04	13	BL. BANUSARI	003	10	\N	PT. MITRA KARYA PROSPEKTA	2016-02-19	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	13	\N	\N	\N	\N	\N
421	427	DEDE BUDIMAN, S.PD,MSI	3217010603650005	KO. SESPIMPOLRI UB. 22	LEMBANG	KAYUAMBON	KAB. BANDUNG BARAT			__.___.___._-___.___	DEWI ASTUTI DARYANI	3217015112760006	SITU PPI	LEMBANG	LEMBANG	KABUPATEN BANDUNG BARAT				325.00	394000	0.00	0	128050000	0	128050000	SHM NO. 04473	LEMBANG	LEMBANG		0	002	005	KP. SUKAMANDI	001	05	\N	SUKAEDI	2016-02-19	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	007	005	\N	\N	\N	\N	\N
422	428	ACHMAD SOBAR SURURI	3174012101790005	TEBET BARAT DALAM IV/5	TEBET	TEBET BARAT	JAKARTA SELATAN				IYANG NUGROHO	3217010606550001	JL. GRAND HOTEL NO. 17	LEMBANG	LEMBANG	KABUPATEN BANDUNG BARAT				101.00	537000	0.00	0	54237000	0	54237000	SHM NO. 4096	LEMBANG	LEMBANG		0	004	003	JL. MUTIARA II	002	05	\N	RATIH KUMALA DEWI	2016-02-19	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	005	\N	\N	\N	\N	\N
424	430	IRAH	3273084908690002	JL. KARANG TINGGAL GG. H. DURAHMAN NO. 40-B	SUKAJADI	CIPEDES	KOTA BANDUNG				NENI TRIANA CS	3217015511690003	KOMP. PONDOK BUAH BATU	LEMBANG	JAYAGIRI	KABUPATEN BANDUNG BARAT				66.00	285000	0.00	0	18810000	0	18810000	SHM NO. 02293	JAYAGIRI	LEMBANG		0	003	011	KO. PONDOK BUAH BATU	004	09	\N	DJADJA	2016-02-19	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	009	\N	\N	\N	\N	\N
425	431	RUSTINI	3273225905750010	JL. KIARASARI ASRI RAYA NO. 3	BUAH BATU	MARGASARI	KOTA BANDUNG				AMAS SUPRIATNA / POPON	3217012210680001	Jl. KP. SUKAMAJU	LEMBANG	KAYUAMBON	KABUPATEN BANDUNG BARAT				103.00	160000	0.00	0	16480000	0	16480000	SHM NO. 00695	KAYUAMBON	LEMBANG		0	001	001	BL. SUKAMAJU	003	06	\N	AMAS SUPRIATNA / POPON	2016-02-19	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	011	\N	\N	\N	\N	\N
426	432	TUTI HARTATI	3217014802800003	KP. SUKAMAJU NO. 47	LEMBANG	KAYUAMBON	KAB. BANDUNG BARAT				AMAS SUPRIATNA / POPON	3217012210680001	KP. SUKAMAJU	LEMBANG	KAYUAMBON	KABUPATEN BANDUNG BARAT				33.00	160000	0.00	0	5280000	0	5280000	SHM NO. 00696	KAYUAMBON	LEMBANG		0	002	007	BL. SUKAMAJU	003	06	\N	AMAS SUPRIATNA / POPON	2016-02-19	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	011	\N	\N	\N	\N	\N
427	433	RANITA AGUSTINA	3217015307810015	KP. SUKAMAJU BARAT 	LEMBANG	KAYUAMBON	KAB. BANDUNG BARAT				EKO SUARTI YULIANI CS	3272034707630021	KP. PASIR MERKAH II NO. 21	CITAMIANG	NGANGGELENG	KOTA SUKABUMI				149.00	614000	70.00	595000	91486000	41650000	133136000	SHM NO. 02371	LEMBANG	LEMBANG		0	02	06	JL. CIJERUK	003	05	\N	SUWARDI	2016-02-19	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	01	06	\N	\N	\N	\N	\N
428	434	ELIS HANDAYANI	3217087108810008	PERUM GPI-JL. MUTIARA RAYA NO. 47 	PADALARANG	PADALARANG	KAB. BANDUNG BARAT				AGUS SUGIRI	3217063105720001	Jl. KO. PURI CIPAGERAN INDAH II BLOK C 13 NO. 39	NGAMPRAH	TANIMULYA	KABUPATEN BANDUNG BARAT				60.00	916000	21.00	595000	54960000	12495000	67455000	SHM NO. 6552	TANIMULYA	NGAMPRAH		0	01	29	KO. PURI CIPAGERAN INDAH II	003	21	\N	AGUS SUGIRI	2016-02-19	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	21	\N	\N	\N	\N	\N
429	435	DIDIT SUTRISNA	3217011603820013	KP. SUKAMANDI 	LEMBANG	LEMBANG	KAB. BANDUNG BARAT				HERI KUMALAWATI	3174084405570001	Jl. KH. MAHMUD V/16	PANCORAN	DUREN TIGA	JAKARTA SELATAN				25.00	537000	0.00	0	13425000	0	13425000	SHM NO. 4094	LEMBANG	LEMBANG		0	01	05	BL. SUKAMANDI	002	05	\N	SARAH DWI NUGRAHANI	2016-02-19	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	04	\N	\N	\N	\N	\N
430	436	SUPANDI	3217080501600005	KP. CITATAH	PADALARANG	JAYAMEKAR	KAB. BANDUNG BARAT				HJ. ENIH CS	3217084506400002	KP. CIPONDOH	PADALARANG	CIPENDEUY	KABUPATEN BANDUNG BARAT				515.00	160000	0.00	0	82400000	0	82400000	593/03/DS-PEM/2016	KERTAJAYA	PADALARANG		0	001	011	KP. TEGALHAJI	003	19	\N	SUGIMAN	2016-02-22	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	014	\N	\N	\N	\N	\N
431	437	DRS. IWAN PARMAL SAPUTRA	3273062008680001	JL. KOMUD SUPADIO CICUKANG II/72 NO. 164	CICENDO	HUSEN SASTRANEGARA	KOTA BANDUNG				RUDI JOKO SANTOSO	3204371411530002	GADING TUTUKA 1 G 3 NO. 3	SOREANG	CINGCIN	KAB. BANDUNG				60.00	243000	31.00	968000	14580000	30008000	44588000	SHM NO. 820	CITAPEN	CIHAMPELAS		0	006	007	PERUM ALAM SANGGAR INDAH	000	00	\N	PT. MULTI SANGGAR UTAMA	2016-02-22	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	018	\N	\N	\N	\N	\N
432	438	RESTI FAHMI ANJARI	3273014811820007	JL. SERSAN BAJURI NO.22	SUKASARI	ISOLA	KOTA BANDUNG				SARYANA	3217020312340001	KP. KEBON ACU	CISARUA	KERTAWANGI	KABUPATEN BANDUNG BARAT				220.00	160000	41.00	264000	35200000	10824000	46024000	SHM NO. 02034	CIHIDEUNG	PARONGPONG		0	01	04	KP. SUKAWANGI	002	02	\N	ICIH ADANG	2016-02-22	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	004	005	\N	\N	\N	\N	\N
433	439	KARMILA	3217024104800016	CIWARUGA	PARONGPONG	CIWARUGA	KAB. BANDUNG BARAT				SOPIAN	3217020505650007	KP. CIBALIGO	PARONGPONG	CIHANJUANG	KABUPATEN BANDUNG BARAT				84.00	802000	0.00	0	67368000	0	67368000	594/12/2016	CIHANJUANG	PARONGPONG		0	002	004	JL. CIHANJUANG	001	02	\N	WARIJAH	2016-02-22	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	002	\N	\N	\N	\N	\N
434	440	POLINA	3204105712730003	TAMAN KOPO INDAH II ,IIIC NO. 30	MAGRAASIH	RAHAYU	KAB. BANDUNG			__.___.___._-___.___	MARTHA RASHANDO	1050241810463001	JL. KARANGANYAR NO.47	ASTANA ANYAR	KARANGANYAR	KOTA BANDUNG			__.___.___._-___.___	1020.00	537000	0.00	0	547740000	0	547740000	593.21/08/PEM. 2016	SUKAJAYA	LEMBANG		0	04	11	JL. KOLONEL MASTURI	001	10	\N	ELLYSIANI P	2016-02-22	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	04	04	\N	\N	\N	\N	\N
435	441	SWANNY SUHADY PIELLOR	3273096204550001	JL. CIHAMPELAS NO. 114	BANDUNG WETAN	TAMANSARI	KOTA BANDUNG				WIRYANTO SAMITO	3471032311440001	JL. MELATI WETAN 1/07 YK	GONDOKUSUMAN	BACIRO	KOTA YOGYAKARTA				328.00	394000	42.00	429000	129232000	18018000	147250000	SHM NO. 587	KAYUAMBON	LEMBANG		0	001	007	KO. PUSDIK AJEN	001	03	\N	WIRYANTO	2016-02-22	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	079	019	\N	\N	\N	\N	\N
436	442	HENDRA SETIAWAN	3217021309520001	JL. MELATI NO. 8	PARONGPONG	CIHIDEUNG	KAB.BANDUNG BARAT			__.___.___._-___.___	MARTHA RASHANDO	1050241810463001	JL. KARANGANYAR NO. 47	ASTANA ANYAR	KARANGANYAR	KOTA BANDUNG			__.___.___._-___.___	1727.00	537000	0.00	0	927399000	0	927399000	593.21/09/PEM.2016	SUKAJAYA	LEMBANG		0	03	10	JL. KOLONEL MASTURI	001	10	\N	ELLYSIANI P	2016-02-22	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	04	04	\N	\N	\N	\N	\N
437	443	TEDY YULIANTO	3277021707790010	JL. GATOT SUBROTO NO. F. 7	CIMAHI TENGAH	KARANGMEKAR	KOTA CIMAHI			__.___.___._-___.___	DUDI SUANDI	3277030402780001	JL. BABAKAN LOA NO. 22	CIMAHI UTARA	PASIRKALIKI	KOTA CIMAHI				72.00	802000	27.00	823000	57744000	22221000	79965000	HGB NO. 5644	CILAME	NGAMPRAH		0	003	011	JL. GANESHA IV	002	02	\N	DUDI SUANDI	2016-02-22	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	002	\N	\N	\N	\N	\N
438	444	EMARINA CS	3217086203710008	JL. RAYA SIMPANG 424	PADALARANG	KERTAJAYA	KAB. BANDUNG BARAT				ASEP SETIA PERMANA	474.5/34/DS-PEM	JL. RAYA SIMPANG NO. 242	PADALARANG	KERTAJAYA	KABUPATEN BANDUNG BARAT				3860.00	243000	0.00	0	937980000	0	937980000	SHM NO. 00348	CIPEUNDEUY	PADALARANG	SURAT KETERANGAN SUSUNAN AKHLI WARIS NOMOR : 474.3/085.IV/WRS/2015	0	006	008	KP. CIPEUNDEUY	000	00	\N	ASEP SETIA PERMANA	2016-02-22	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	006	008	\N	\N	\N	\N	\N
229	234	IRIN TAUFIQ KURAHMAN	3217130201620003	KAWUNG LUWUK	RONGGA	SUKAMANAH	KAB. BANDUNG BARAT				IR. HANSEN TJUAT TJADARMA	3273190805650006	JL. RE. MARTADINATA NO. 144	SUMUR BANDUNG	MERDEKA	BANDUNG				72.00	702000	36.00	1200000	50544000	43200000	93744000	HGB NO. 798	BATUJAJAR TIMUR	BATUJAJAR		0	001	001	KO. PURI INDAH LESTARI	000	00	\N	PT. DIMENSI PURI LESTARI	2016-02-02	\N	\N	\N	\N	\N	\N	KAB. BANDUNG BARAT	007	008	\N	\N	\N	\N	\N
439	445	AGUS YANTO	3273062208710003	KL. BABAKAN CIANJUR NO. 8	CICENDO	SUKARAJA	KOTA BANDUNG				ANTONIUS APRIANTO	3217062504690007	PONDOK MAS LESTARI BLOK O 21	NGAMPRAH	PAKUHAJI	KABUPATEN BANDUNG BARAT				72.00	802000	27.00	823000	57744000	22221000	79965000	SHM NO. 5179	TANIMULYA	NGAMPRAH		0	011	002	KO. PERMATA CIMAHI	006	06	\N	NURCHOLIS	2016-02-22	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	006	\N	\N	\N	\N	\N
440	446	AINI	3173066807720001	CITRA 2 EXT BLOK BE 2/28	KALI DERES	PEGADUNGAN	JAKARTA BARAT				IR. SANUSI TANAWI	3173062210530001	PERUM CITRA II BLOK G11/2	KALI DERES	PEGADUNGAN	JAKARTA BARAT				209.00	2352000	113.00	1200000	491568000	135600000	627168000	HGB NO.03724	CIPEUNDEUY	PADALARANG		0	13	05	KO. KOTA BARU PARAHYANGAN	000	00	\N	PT. BELAPUTERA INTILAND	2016-02-22	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	08	19	\N	\N	\N	\N	\N
441	447	PT. ELITE PRIMA HUTAMA	3674033006500002	GD. PLAZA BLOK M JL. BULUNGAN NO. 76	KEBAYORAN BARU	KRAMAT	JAKARTA SELATAN				DADANG JUHANA, S.PD	3217011506620001	KP. SUKAMAJU TIMUR	LEMBANG	KAYUAMBON	KABUPATEN BANDUNG BARAT				1990.00	82000	0.00	0	163180000	0	163180000	SHM NO. 00708	KAYUAMBON	LEMBANG		0	000	000	BL. SUKAMAJU	001	11	\N	SUTARDI LINGGA P	2016-02-22	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	011	\N	\N	\N	\N	\N
442	448	BERI AKBAR	3273071212860001	ASPOL JL. SUKAGALIH NO. 61	SUKAJADI	CIPEDES	KOTA BANDUNG				RAMBERT GANDAPUTRA	3273170604670001	JL. MUARA SARI IVNO. 12 A	BOJONGLOA KIDUL	KEBONLEGA	KOTA BANDUNG				89.00	243000	0.00	0	21627000	0	21627000	SHM NO.5589	SARIWANGI	PARONGPONG		0	04	09	KP. MEKARWANGI	002	12	\N	AMANG RUKMANA	2016-02-22	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	05	11	\N	\N	\N	\N	\N
443	449	AMAN WARDANA	3217062209730005	PURI CIPAGERAN 2 C7 NO. 21	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				DEDE HARTONO	3217060702720015	CIMAREME INDAH B-1 NO. 12	NGAMPRAH	CIMAREME	KABUPATEN BANDUNG BARAT				75.00	916000	36.00	595000	68700000	21420000	90120000	SHM NO. 6547	TANIMULYA	NGAMPRAH		0	001	021	KO. PURI CIPAGERAN INDAH II	002	21	\N	DEDE HARTONO	2016-02-22	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	009	\N	\N	\N	\N	\N
444	450	NY. RD. PUPUN SUPARIJAH	327313551030001	JL. PANGARANG NO. 17	LENGKONG	CIKAWAO	KOTA BANDUNG			__.___.___._-___.___	ONIH	3217094101370051	BLOK RANCA	BATUJAJAR	BATUJAJAR BARAT	KABUPATEN BANDUNG BARAT				1820.00	82000	0.00	0	149240000	0	149240000	96/DS/2008/II/2016	BATUJAJAR BARAT	BATUJAJAR		0	002	009	JL. GUNUNG SANGGAR	001	01	\N	ROSID	2016-02-22	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	002	\N	\N	\N	\N	\N
445	451	YONAT ELIM ALLAN	1050241012735001	JL. PAGARSIH NO. 55	ASTANA ANYAR	CIBADAK	KOTA BANDUNG				YUYU YULIAWATI CS	3203016112570002	JL. KOMPLEK SMPN 2 NO. 37	CIANJUR	SAWAH GEDE	KAB. CIANJUR				440.00	103000	0.00	0	45320000	0	45320000	AJB NO. 353/2014	KERTAJAYA	PADALARANG		0	12	07	JL. KERTAJAYA	002	14	\N	LATIP HAJI	2014-03-10	\N	\N	2014-03-10	353/2014	\N	\N	KABUPATEN BANDUNG BARAT	003	002	\N	\N	\N	\N	\N
446	452	YONAT ELIM ALLAN	1050241012735001	JL. PAGARSIH NO. 55	ASTANA ANYAR	CIBADAK	KOTA BANDUNG				HJ. YUYU YULIAWATY CS	3203016112570002	JL. KOMPLEK SMPN 2 NO. 37	CIANJUR	SAWAHGEDE	KABUPATEN CIANJUR				122.00	103000	0.00	0	12566000	0	12566000	AJB NO. 351/2014	KERTAJAYA	PADALARANG		0	012	007	JL. KERTAJAYA	002	14	\N	LATIP HAJI	2014-03-10	\N	\N	2014-03-10	10-03-2014	\N	\N	KABUPATEN BANDUNG BARAT	003	002	\N	\N	\N	\N	\N
447	453	NITA	3273055411740004	JL. HALTEU UTARA 	ANDIR	DUNGUS CARIANG	KOTA BANDUNG				ENAN SUMPENA	3217021604460001	KP. KARANGSARI	PARONGPONG	CIHANJUANG	KABUPATEN BANDUNG BARAT				272.00	160000	0.00	0	43520000	0	43520000	AJB NO. 454/2010	CIHANJUANG	PARONGPONG		0	03	01	KP. CISINTOK	004	13	\N	YOYOH ONDI	2010-06-30	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	03	13	\N	\N	t	\N	\N
423	429	NITA	3273055411740004	JL. HALTEU UTARA 	ANDIR	DUNGUS CARIANG	KOTA BANDUNG				ENAN SUMPENA	3217021604460001	KP. KARANGSARI	PARONGPONG	CIHANJUANG	KABUPATEN BANDUNG BARAT				252.00	160000	0.00	0	40320000	0	40320000	AJB NO. 454/2010	CIHANJUANG	PARONGPONG		0	03	01	KP. CISINTOK	004	13	\N	YOYOH ONDI	2010-06-30	272.00	0.00	2010-10-30	454/2010	\N	\N	KABUPATEN BANDUNG BARAT	03	13	\N	\N	\N	\N	\N
448	455	MICHAEL LIE TJONG LEE	3217020306580003	PARAHYANGAN PERMAI BLOK I NO. 4	PARONGPONG	CIWARUGA	KAB. BANDUNG BARAT				DEWI INDRIANI	3273184202600004	JL. TERS. EKOLOGI NO. 11	CIBEUNYING KALER	CIGADUNG	KOTA BANDUNG				200.00	802000	0.00	0	160400000	0	160400000	SHM NO. 1484	CIWARUGA	PARONGPONG		0	001	008	BL. JAMIRANTA	000	00	\N	DEWI INDRIANI	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	008	\N	\N	\N	\N	\N
449	456	RAYMOND GAN	3273092207480002	JL. BAHUREKSA NO. 16	BANDUNG WETAN	CITARUM	KOTA BANDUNG				DEWI INDRIANI	3273184202600004	JL. TERS. EKOLOGI NO. 11	CIBEUNYING KALER	CIGADUNG	KOTA BANDUNG				300.00	802000	0.00	0	240600000	0	240600000	SHM NO. 1484	CIWARUGA	PARONGPONG		0	003	001	BL. JAMIRANTA	000	00	\N	DEWI INDRIANI	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	008	\N	\N	\N	\N	\N
450	457	RM RUSWANDI	3273092407710005	JL. RE MARTADINATA NO. 165	BANDUNG WETAN 	CIHAPIT	KOTA BANDUNG			__.___.___._-___.___	HARDJONO DHANUTIRTO	3276040801510001	JL. BUANA PESANGGRAHAN VI/4 BCI	CINERE	CINERE	KOTA DEPOK				231.00	1032000	0.00	0	238392000	0	238392000	SHM NO. 5295,5293	SARIWANGI	PARONGPONG		0	01	02	KP. SARIWANGI	002	08	\N	TIEN SUPARTINI	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	05	16	\N	\N	\N	\N	\N
451	458	IVAN WIBAWA LINGGA CS	3273191801890007	JL. SUNDA NO. 55	SUMUR BANDUNG	KEBON PISANG	KOTA BANDUNG				IR. DERAJAT ISA	3273013110470001	JL. SETRASARI III NO. 17	SUKASARI	SUKARASA	KOTA BANDUNG				1225.00	200000	0.00	0	245000000	0	245000000	SHM NO. 02088	CIPEUNDEUY	PADALARANG		0	010	007	KP. PANGKALAN	002	03	\N	TITI	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	002	\N	\N	\N	\N	\N
452	459	SIN LOIJ	3603123008690003	VILA REGENSI TNG II BLOK FD-23 NO. 22	PASIR KEMIS	GELAM JAYA	KAB. TANGERANG				SUMARTININGSIH	3273016510710001	JL. SINDANG SIRNA NO. 08	SUKASARI	GEGERKALONG	KOTA BANDUNG				213.00	36000	0.00	0	7668000	0	7668000	SHM NO. 1839	JAYAGIRI	LEMBANG		0	002	010	BL. GUNUNG PUTRI	002	10	\N	DEDEN KOSWARA/PENGGARAP	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	005	\N	\N	\N	\N	\N
453	460	ENDEN KARTIKA PRAJA	3271056407830014	KP. TANAH SEWA	KOTA BOGOR UTARA	CIPAGIRI	KOTA BOGOR			25.731.530.9-421.000	IR. SANUSI TANAWI	3173062210530001	PERUM CITRA II BLOK G 11/2	KALI DERES	PEGADUNGAN	JAKARTA BARAT				320.00	2352000	220.00	1516000	752640000	333520000	1086160000	HGB NO. 2984	CIPEUNDEUY	PADALARANG		0	004	003	KO. KOTA BARU PARAHYANGAN	000	00	\N	PT. BELAPUTERA INTILAND	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	008	019	\N	\N	\N	\N	\N
454	461	AMELIA	3174096402681001	JL. GARUDA MAS IV BLOK 03/19	JAGAKARSA	TANJUNG BARAT	JAKARTA SELATAN				ADA GUNAWAN	3217020306550005	KP. SUKAMAJU NO. 229	PARONGPONG	CIGUGURGIRANG	KABUPATEN BANDUNG BARAT				1160.00	128000	0.00	0	148480000	0	148480000	594/28/2015	CIGUGURGIRANG	PARONGPONG		0	002	001	KP. PANGSOR	001	11	\N	ADA GUNAWAN	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	007	005	\N	\N	\N	\N	\N
455	462	AMELIA	3174096402681001	JL. GARUDA MAS IV BLOK 03/19	JAGAKARSA	TANJUNG BARAT	JAKARTA SELATAN			__.___.___._-___.___	H. ABDULLAH GYMNASTIAR	3273012901620001	JL. GEGERKALONG GIRANG NO. 02-D	SUKASARI	ISOLA	KOTA BANDUNG				2455.00	128000	0.00	0	314240000	0	314240000	594/30/2015	CIGUGURGIRANG	PARONGPONG		0	002	001	KP. PANGSOR	001	11	\N	ECE	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	006	\N	\N	\N	\N	\N
456	463	AMELIA	3174096402681001	JL. GARUDA MAS IV BLOK 03/19	JAGAKARSA	TANJUNG BARAT	JAKARTA SELATAN				EUIS OTIH RATMITA	3217024402550006	Jl. KP. PANGSOR	PARONGPONG	CIGUGURGIRANG	KABUPATEN BANDUNG BARAT				1398.00	128000	0.00	0	178944000	0	178944000	594/29/2015	CIGUGURGIRANG	PARONGPONG		0	002	001	KP. PANGSOR	001	12	\N	EUIS OTIH	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	02	07	\N	\N	\N	\N	\N
458	465	REGA HERLIYAN	3211182303870012	KOMP. TAMAN CILEUNYI BLOK V-2 NO. 2	CILEUNYI	CILEUNYI KULON	KAB. BANDUNG				HERRY KRIDA	3217082303630012	JL. RATNA PAKSI NO. 31	PADALARANG	CIPEUNDEUY	KABUPATEN BANDUNG BARAT				120.00	160000	0.00	0	19200000	0	19200000	SHM NO. 02003	CIHIDEUNG	PARONGPONG		0	03	22	JL. GEGERKALONG HILIR	003	04	\N	R. ALI FAJAR SALEH,SH,MH	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	02	11	\N	\N	\N	\N	\N
459	466	ASMA SEMBIRING, SP	3271035309760007	JL. MALABAR UJUNG NO. 8	KOTA BOGOR TENGAH	TEGALEGA	KOTA BOGOR				HJ. MIMIN MARYAMAH, BA	3273225404620002	JL. YUPITER VII E-2 NO. 86 C	BUAHBATU	SEKEJATI	KOTA BANDUNG			__.___.___._-___.___	203.00	243000	0.00	0	49329000	0	49329000	SHM NO. 858	LANGENSARI	LEMBANG		0	004	002	BL. SINDANGHEULA	001	12	\N	MIMIN MARYAMAH, HJ., BA.	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	002	\N	\N	\N	\N	\N
460	467	GIOVAN JONATHAN	3217020807910003	JL. SETRA DUTA RAYA NO. 6	PARONGPONG	CIWARUGA	KAB. BANDUNG BARAT				RUDI KOMARA	3273011240553000	JL. SARITEM NO. 47	ANDIR	KEBONJERUK	KOTA BANDUNG				1015.00	3745000	0.00	0	3801175000	0	3801175000	SHM NO. 3264	SARIWANGI	PARONGPONG		0	001	001	KO. SETRA DUTA	000	14	\N	RUDI KOMARA	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	006	009	\N	\N	\N	\N	\N
461	468	DEDI RISYAHDI	3217032504500002	KP. BABAKAN CINTA	CISARUA	PASIRHALANG	KAB. BANDUNG BARAT			3_.___.___._-___.___	R. ADITYA GIWANGKARA	3209141007670005	BLOK NANGKA GEDE NO. 26	TALUN	KERANDON	KABUPATEN CIREBON				425.00	48000	0.00	0	20400000	0	20400000	590/18/DS/II/2016	PASIRHALANG	CISARUA		0	001	004	BL. CIKARANGMULYA	002	06	\N	SRI FATMAH SUKARTINI DRA	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	001	\N	\N	\N	\N	\N
462	469	LUCAS HAYASHI	3273090101890001	JL. SULTAN TIRTAYASA NO. 36	BANDUNG WETAN	CITARUM	KOTA BANDUNG				INDRA KUSUMA	3174011503560007	JL. TEBET BARAT VII NO. 19	TEBET	TEBET BARAT	JAKARTA SELATAN				533.00	1032000	0.00	0	550056000	0	550056000	SHM NO. 706	SARIWANGI	PARONGPONG		0	003	002	KO. SARIWANGI INDAH	005	08	\N	AGUS TRIHARNATO	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	004	004	\N	\N	\N	\N	\N
463	470	TOGAP SIHOMBING	3217080403850019	PERUMAHAN TAMAN BUNGA CILAME BLOK GI NO. II	NGAMPRAH	CILAME	KAB. BANDUNG BARAT				RODIAH PAKPAHAN	3217064101700044	KP. CIBURIAL	NGAMPRAH	MARGAJAYA	KABUPATEN BANDUNG BARAT				69.00	802000	27.00	595000	55338000	16065000	71403000	HGB NO. 4444	CILAME	NGAMPRAH		0	011	023	KO. TAMAN BUNGA CILAME			\N	RODIAH	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	011	\N	\N	\N	\N	\N
464	471	DEDI SUPRIATNA	3277013112790003	JL. PENDIDIKAN NO. 304	CIMAHI SELATAN	LEUWIGAJAH	KOTA CIMAHI				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3.G	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 01493	CITAPEN	CIHAMPELAS		0	009	009	BL. CINTA KARYA	003	05	\N	PT. MULTI SANGGAR UTAMA	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	001	\N	\N	\N	\N	\N
465	472	YUDI	3273161702750009	KP. CIJENGKOL	LEMBANG	WANGUNSARI	KAB. BANDUNG BARAT				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3.G	LEMBANG	GUDANG KAHURIPAN	KABUPATEN BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 01666	CITAPEN	CIHAMPELAS		0	003	003	PERUM SANGGAR INDAH	000	00	\N	PT. MULTI SANGGAR UTAMA	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	001	\N	\N	\N	\N	\N
466	473	FARIZ ZAHARI AKHMAD	3277010209930017	MELONG GREEN GARDEN JL. BOEING VII NO. 20	CIMAHI SELATAN	MELONG	KOTA CIMAHI				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3.G	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 01514	CITAPEN	CIHAMPELAS		0	004	028	PERUM SANGGAR INDAH	000	00	\N	PT. MULTI SANGGAR UTAMA	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	001	\N	\N	\N	\N	\N
467	474	RIKI GUMILAN	3217122103880006	KP/ BOJONG	CIPONGKOR	SARINAGEN	KAB. BANDUNG BARAT				IR. ULLY MELANNY	3217016911510001	JL. LEMBANG 3.G	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 01612	CITAPEN	CIHAMPELAS		0	001	004	PERUM SANGGAR INDAH	000	00	\N	PT. MULTI SANGGAR UTAMA	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	001	\N	\N	\N	\N	\N
468	475	DEDI DJUNAEDI	3277021008840017	KP. CIPUTRI	CIMAHI TENGAH	CIGUGUR TENGAH	KOTA CIMAHI				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3.G	LEMBANG	GUDANG KAHURIPAN	KABUPATEN BANDUNG BARAT				72.00	243000	31.00	968000	17496000	30008000	47504000	HGB NO. 00159	TANJUNGWANGI	CIHAMPELAS		0	004	005	BL. IRIGASI	000	00	\N	PT. MULTI SANGGAR UTAMA	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	001	\N	\N	\N	\N	\N
469	476	PRILIANA AYUNINGTYAS	3201405704830001	BTN MARGAASIH BLOK D. 12 NO. 11	MARGAASIH	MARGAASIH	KAB. BANDUNG				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3.G	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT			__.___.___._-___.___	72.00	243000	31.00	968000	17496000	30008000	47504000	HGB NO. 01653	CITAPEN	CIHAMPELAS		0	005	008	PERUM SANGGAR INDAH	000	00	\N	PT. MULTI SANGGAR UTAMA	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	001	\N	\N	\N	\N	\N
470	477	DIJONO	3273051601840007	JL. MALEBER UTARA	ANDIR	MALEBER	KOTA BANDUNG				IR. ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3.G	LEMBANG	GUDANG KAHURIPAN	KAB. BANDUNG BARAT				75.00	243000	22.00	968000	18225000	21296000	39521000	HGB NO. 01184	CITAPEN	CIHAMPELAS		0	006	006	PERUM ALAM SANGGAR INDAH	000	00	\N	RATIH PURWASIH	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	001	\N	\N	\N	\N	\N
471	478	WINARNO WIJAYA NUGRAHA	3273040310810004	JL. KOPO GG. MARAMIS I 72/198A	BOJONGLOA KALER	BABAKAN ASIH	KOTA BANDUNG			__.___.___._-___.___	IR.ULLY MELANNY	3217016911510001	Jl.RAYA LEMBANG 3 G	LEMBANG	GUDANGKAHURIPAN	KAB. BANDUNG BARAT				60.00	243000	31.00	968000	14580000	30008000	44588000	HGB NO. 01485	CITAPEN	CIHAMPELAS		0	08	07	BL. CINTA KARYA	003	05	\N	PT. MULTI SANGGAR UTAMA	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	05	01	\N	\N	\N	\N	\N
472	479	RIFKI RAMDANI PRATAMA	3217081504910004	POS WETAN	PADALARANG	KERTAMULYA	KAB. BANDUNG BARAT				IR.ULLY MELANNY	3217016911510001	JL. RAYA LEMBANG 3 G	LEMBANG	GUDANGKAHURIPAN	KAB. BANDUNG BARAT				60.00	243000	22.00	968000	14580000	21296000	35876000	HGB NO. 00929,00886	CITAPEN	CIHAMPELAS		0	05	13	PERUM ALAM SANGGAR INDAH	000	00	\N	RATIH PURWASIH	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	05	01	\N	\N	\N	\N	\N
473	480	HERU SOLEHAN	3277011105840018	JL. IBU SANGKI GG.H. ENUR	CIMAHI SELATAN	CIBEBER	KOTA CIMAHI			__.___.___._-___.___	IR. ULLY MELANNY	3217016911510001	JL RAYA LEMBANG 3 G	LEMBANG	GUDANG KAHURIPAN	KABUPATEN BANDUNG BARAT				60.00	103000	31.00	968000	6180000	30008000	36188000	HGB. NO00109	TANJUNGWANGI	CIHAMPELAS		0	01	13	BL. IRIGASI	000	00	\N	PT. MULTI SANGGAR UTAMA	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	05	01	\N	\N	\N	\N	\N
457	464	EVY JULIAWATY ,S.IP,M.SI	3217066507710005	CIMAREME INDAH BLOK A1 NO. 21	NGAMPRAH	CIMAREME	KAB. BANDUNG BARAT				ENYEK RASNYAH MOCHAMAD ILYAS	474.3/94/XII2015	Jl. KO. CIMAREME INDAH BLOK A1 NO. 21	NGAMPRAH	CIMAREME	KABUPATEN BANDUNG BARAT			__.___.___._-___.___	192.00	1573000	0.00	0	302016000	0	302016000	HGB NO. 342	CIMAREME	NGAMPRAH	SURAT KET. SUSUNAN AKHLI WARIS NO. 474.3/291/WRS/XII/2015	0	05	01	KO. CIMAREME INDAH			\N	PT. WAHYUCITRA MEGAHSELARAS	2016-02-23	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	05	01	\N	\N	\N	\N	\N
474	481	DADAN SUDARISMAN	3205010406630007	JL. JEND. SUDIRMAN BARAT GG. PASIR ANYAR	PURWOKERTO	REJASARI	KAB. BANYUMAS				HJ. ANNE DEWI ARIYANI, S.PD	3217065604670006	JL. MUTIARA 8 L-4 NO. 5	NGAMPRAH	TANIMULYA	KABUPATEN BANDUNG BARAT				327.00	160000	40.00	823000	52320000	32920000	85240000	SHM NO. 04049	CILAME	NGAMPRAH		0	004	001	KP. CILOA	003	03	\N	ANNE DEWI ARIYANI, HJ.,SPD	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	014	\N	\N	\N	\N	\N
476	483	PT KURNIA ARTHA PRATIWI	3217022306740001	JL. RAYA PAMUCAATAN KM. 22	PADALARANG	CIBURUY	KAB. BANDUNG BARAT			02.525.981.3-441.000	IVAN WIJONO	3217022306740001	SETRA DUTA MILENIA II NO. 06	PARONGPONG	SARIWANGI	KAB. BANDUNG BARAT				2060.00	48000	0.00	0	98880000	0	98880000	NO. 16/HGB/BPN.10.31/2016	CIBURUY	PADALARANG		0	000	000	KP. POJOK	000	00	\N	SLAMET WIJONO	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	014	\N	\N	\N	\N	\N
475	482	IRVAN	3273130408780001	JL. MATRAMAN NO. 10	LENGKONG	TURANGGA	KOTA BANDUNG				DEDE NURLAELA	3277024208640013	JL. KAMARUNG G.H BASAR NO. 65	CIMAHI UTARA	CITEREUP	KOTA CIMAHI				10908.00	36000	0.00	0	392688000	0	392688000	591/32/DES./2016	JAYAMEKAR	PADALARANG		0	07	10	JL. PURABAYA	002	03	\N	H JUBAEDAH	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	004	\N	\N	\N	\N	\N
478	485	DIKI DARMAWAN	1471123003820002	KOMPLEK GARDENIA NO. 307 CPI RUMBAI	RUMBAI PESISIR	LEMBAH DAMAI	KOTA PEKANBARU				WIDYA ARSA, DR	3273011007740003	 JL. SETRASARI VI NO. 2-A	SUKASARI	SUKARASA	KOTA BANDUNG				220.00	2176000	112.00	1516000	478720000	169792000	648512000	HGB NO. 550	CIMERANG	PADALARANG		0	001	003	JL MAYANGPADMI KIDUL	000	00	\N	WIDYA ARSA, DR	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	002	\N	\N	\N	\N	\N
479	486	T. SIMARMATA	3277021012390003	JL. JEND. SUDIRMAN NO. E. 65	CIMAHI TENGAH	BAROS	KOTA CIMAHI				DEDI SUNADI	3273082212660003	JL. CIPAKU INDAH II NO. 23	CIDADAP	LEDENG	KOTA BANDUNG				1386.00	36000	0.00	0	49896000	0	49896000	593/08/DS/II/2016	CIMANGGU	NGAMPRAH		0	002	015	KP. PASIR KEMBUNG	000	00	\N	ONENG AMI	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	004	002	\N	\N	\N	\N	\N
480	487	HENDRY	3277030606630019	TIRTA KENCANA D-03	CIMAHI UTARA	CIBABAT	KOTA CIMAHI				RUSTANDI	3217022903690002	KP. LEMBUR PANJANG	PARONGPONG	CIHANJUANG	KABUPATEN BANDUNG BARAT				188.00	243000	80.00	700000	45684000	56000000	101684000	SHM NO. 2243	CIHANJUANG	PARONGPONG		0	010	008	JL. CIHANJUANG	002	08	\N	RUSTANDI	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	008	\N	\N	\N	\N	\N
481	488	CECEP JUNAELI	3204090405840007	JL. SADANG NO. 120 C	MARGAHAYU	MARGAHAYU TENGAH	KAB. BANDUNG				ALI ABUDAN	3273081708560012	JL. H. AKBAR NO. 2	CICENDO	PASIRKALIKI	KOTA BANDUNG				72.00	200000	29.00	823000	14400000	23867000	38267000	HGB NO. 1806	JAYAMEKAR	PADALARANG		0	001	009	BL. GUNUNG TANJUNG	004	10	\N	SUNARYA	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	006	006	\N	\N	\N	\N	\N
482	489	MADA ARYA KUSUMAH	3217091407910018	KP. JALANTIR	BATUJAJAR	SELACAU	KAB. BANDUNG BARAT				IR. H. DADANG HIDAYAT	3273260610500001	JL. RAHAYU NO. 11 A CIJAMBE	UJUNGBERUNG	PASIR ENDAH	KOTA BANDUNG				96.00	103000	40.00	1200000	9888000	48000000	57888000	HGB NO. 06368	CILAME	NGAMPRAH		0	002	013	KP. SUKAMAJU	001	01	\N	AMAD	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	006	\N	\N	\N	\N	\N
483	490	MARTHA MARIA TUKIYEM	3217085604680011	KP. SIMPANG SARI	PADALARANG	KERTAJAYA	KAB. BANDUNG BARAT				IR. H. DADANG HIDAYAT	3273260610500001	JL RAHAYU NO. 11 A CIJAMBE	UJUNGBERUNG	PASIR ENDAH	KOTA BANDUNG				72.00	103000	40.00	1200000	7416000	48000000	55416000	HGB NO. 6086	CILAME	NGAMPRAH		0	004	007	KP. CIBATU	002	06	\N	KW. POLBAN	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	006	\N	\N	\N	\N	\N
484	491	LEONARDO	3217062706850002	JL. TUMOANG SARI 23	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				IR. H. DADANG HIDAYAT	3273260610500001	JL. RAHAYU NO. 11 A CIJAMBE	UJUNGBERUNG	PASIR ENDAH	KOTA BANDUNG				104.00	103000	45.00	1200000	10712000	54000000	64712000	HGB NO. 06430	CILAME	NGAMPRAH		0	004	015	KP. CILOA	001	03	\N	TANTO HARTONO	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	006	\N	\N	\N	\N	\N
485	492	HADI SUGIANTO	3217090502820022	PERUM GIRI ASIH C 5 NO. 7	BATUJAJAR	GIRIASIH	KAB. BANDUNG BARAT				IRWIN RIYADI	3273080201810006	JL. CIDADAP GIRANG BARU NO. 8	CIDADAP	LEDENG	KOTA BANDUNG				72.00	702000	36.00	968000	50544000	34848000	85392000	HGB NO. 1688	BATUJAJAR TIMUR	BATUJAJAR		0	04	14	JL. RAYA BATUJAJAR KM 6.5	001	03	\N	PT. PUTRA KENCANA DWITUNGGAL	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	005	\N	\N	\N	\N	\N
486	493	IWAN FAMUNGKAS	3277030202840044	JL. CIHANJUANG GG. WARTA	CIMAHI UTARA	CIBABAT	KOTA CIMAHI				IR. H. DADANG HIDAYAT	3273260610500001	JL. RAHAYU NO. 11 A CIJAMBE	UJUNGBERUNG	PASIR ENDAH	KOTA BANDUNG				96.00	103000	45.00	1200000	9888000	54000000	63888000	HGB NO. 06396	CILAME	NGAMPRAH		0	005	010	KP. CILOA	001	03	\N	TANTO HARTONO	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	006	\N	\N	\N	\N	\N
487	494	MUHAMMAD KHOLILURROHMAN	3217091709910007	KP. WARUNG PULUS	BATUJAJAR	GALANGGANG	KAB. BANDUNG BARAT				IRWIN RIYADI	3273080201810006	JL. CIDADAP GIRANG BARU NO. 8	CIDADAP	LEDENG	KOTA BANDUNG				132.00	702000	36.00	968000	92664000	34848000	127512000	HGB NO. 1711	BATUJAJAR TIMUR	BATUJAJAR		0	01	09	JL. RAYA BATUJAJAR KM 6.5	001	03	\N	PT. PUTRA KENCANA DWI TUNGGAL	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	05	\N	\N	\N	\N	\N
488	495	RADIA PURBAYATI	3273014711840002	JL. SARIJADI BLOK S. IV/6	SUKASARI	SARIJADI	KOTA BANDUNG				IR. H. DADANG HIDAYAT	3273260610500001	JL. RAHAYU NO. 11 A CIJAMBE	UJUNGBERUNG	PASIR ENDAH	KOTA BANDUNG				149.00	103000	45.00	1200000	15347000	54000000	69347000	HGB NO. 06400	CILAME	NGAMPRAH		0	012	006	KP. CILOA	001	03	\N	TANTO HARTONO	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	006	\N	\N	\N	\N	\N
489	496	SUGIONO	3217090910720005	BLOK SCUBA NO. 34	BATUJAJAR	GALANGGANG	KAB. BANDUNG BARAT				IRWIN RIYADI	3273080201810006	JJL. CIDADAP GIRANG BARU NO. 8	CIDADAP	LEDENG	KOTA BANDUNG				105.00	702000	54.00	968000	73710000	52272000	125982000	HGB NO.1585	BATUJAJAR TIMUR	BATUJAJAR		0	07	07	JL. RAYA BATUJAJAR KM 6.5	001	03	\N	PT. PUTRA KENCANA DWITUNGGAL	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	05	\N	\N	\N	\N	\N
490	497	YOEL FRANS ALFREDO	3273051108920003	JL. HALTEU SELATAN NO. 57/77	ANDIR	DUNGUS CARIANG	KOTA BANDUNG				IR. H. DADANG HIDAYAT	3273260610500001	JL. RAHAYU NO. 11 A CIJAMBE	UJUNGBERUNG	PASIR ENDAH	KOTA BANDUNG				122.00	103000	40.00	1200000	12566000	48000000	60566000	HGB NO. 06406	CILAME	NGAMPRAH		0	003	003	KP. CILOA	001	03	\N	TANTO HARTONO	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	006	\N	\N	\N	\N	\N
491	498	RENI SAN SAN	3173034508720005	JLN. CHALCE DONNY BARAT VI NO. 27	KELAPA DUA	CURUG SANGERENG	KAB. TANGERANG				DRA. MUNIROH BARABA., M. PD	3273185306510001	JL. SIMPANG PAHLAWAN 1 NO. 21	CIBEUNYING KALER	NEGLASARI	KOTA BANDUNG				1131.00	82000	0.00	0	92742000	0	92742000	SHM NO. 259	PASIRHALANG	CISARUA		0	000	000	BL. PAMEUNGPEUK	000	00	\N	H DIDIN SAEFUH BAHRI	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	001	\N	\N	\N	\N	\N
492	499	RENI SAN SAN	3173034508720005	JLN. CHALCE DONNY BARAT VI NO. 27	KELAPA DUA	CURUG SANGERENG	KAB. TANGERANG				DRA. MUNIROH BARABA., M. PD	3273185306510001	JL. SIMPANG PAHLAWAN 1 NO. 21	CIBEUNYING KALER	NEGLASARI	KOTA BANDUNG				209.00	82000	0.00	0	17138000	0	17138000	SHM NO. 263	PASIRHALANG	CISARUA		0	000	000	BL. PAMEUNGPEUK	000	00	\N	H DIDIN SAEFUH BAHRI	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	001	\N	\N	\N	\N	\N
493	500	RIZKI WAHYUDI	3277030706900001	JL. BINA TARUNA NO. 17 BUCIPER	CIMAHI UTARA	CITEUREUP	KOTA CIMAHI				ISNANTO AGUSPRIBADI	3374030408780004	Jl. SERAYU VI NO. 6	SEMARANG TIMUR 	BUGANGAN 	KOTA SEMARANG			__.___.___._-___.___	108.00	916000	45.00	700000	98928000	31500000	130428000	SHM NO. 3702	TANIMULYA	NGAMPRAH		0	01	17	KO. PURI CIPAGERAN INDAH I	001	17	\N	YOHANES WIBOWO	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	004	05	\N	\N	\N	\N	\N
494	501	RINA LUKMAWATI	3217084801770017	PERUM GPI-JL SAFIR I NO. 02	PADALARANG	PADALARANG	KAB. BANDUNG BARAT				YUWANTO UTOMO	3217081506720021	PERUM GPI-JL SAFIR I NO. 02	PADALARANG	PADALARANG	KABUPATEN BANDUNG BARAT				80.00	702000	29.00	823000	56160000	23867000	80027000	HGB NO. 2207	PADALARANG	PADALARANG	SURAT PERNYATAAN AHLI WARIS NO : 400/017/V/DS/2015	1	001	030	JL. GRAHA SAFIR I	000	00	\N	YUWANTO	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	030	\N	\N	\N	\N	\N
495	502	LANNY CAHYANA	3217064907650015	JL. H. GOFUR KP. CIJERAH NO. 37	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				ISE TJAHJANA	3273055501590002	GG. ALASIK BLK NO. 1	ANDIR	MALEBER	KOTA BANDUNG				160.00	285000	178.00	823000	45600000	146494000	192094000	SHM NO. 4198	TANIMULYA	NGAMPRAH		0	002	004	BL. CIJERAH	002	04	\N	PT. SAUYUNAN ASRI SARANA	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	004	009	\N	\N	\N	\N	\N
496	503	WINDY RALLY GIANA LESMANA	3273016607840001	JL. SERSAN SODIK NO. 149/170 B	SUKASARI	ISOLA	KOTA BANDUNG				MISRI	3277030808630025	KO. TAMAN BUNGA CILAME BLOK H-3 NO. 29 	NGAMPRAH	CILAME	KABUPATEN BANDUNG BARAT				72.00	614000	36.00	823000	44208000	29628000	73836000	HGB NO. 5272	CILAME	NGAMPRAH		0	002	003	KO. TAMAN BUNGA CILAME	000	00	\N	MISRI	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	007	\N	\N	\N	\N	\N
497	504	SITI ROHANAH	3275096811550002	KOMP. PEMDA A. 5/7 JL. CEMARA II	JATIASIH	JATIASIH	KOTA BEKASI				A. RAHMAN SANI	3277012508530001	JL. KEBON KOPI GG NURSALIM	CIMAHI SELATAN	CIBEUREUM	KOTA CIMAHI				98.00	1274000	50.00	823000	124852000	41150000	166002000	SHM NO. 2943	CIHANJUANG	PARONGPONG		0	001	002	KO. BUMI ASRI	002	03	\N	DEDEN DANI PURNAMA	2016-02-24	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	005	\N	\N	\N	\N	\N
498	505	SUHARTONO	3217061111740013	KP. CIHARASHAS	NGAMPRAH	MARGAJAYA	KAB. BANDUNG BARAT				AI MARYATI	3237065301550008	KP. CARINGIN BABAKAN 	NGAMPRAH	MARGAJAYA	KAB. BANDUNG BARAT				105.00	103000	100.00	595000	10815000	59500000	70315000	SHM NO. 00928	MARGAJAYA	NGAMPRAH		0	004	004	JL. PERUM	002	03	\N	KAHFI	2016-02-25	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	013	\N	\N	\N	\N	\N
499	506	NENDEN MAYA KUSUMAWATI	3277026602880013	KOMP. ASPOL CIBABAT BLOK J NO. 150	CIMAHI TENGAH	CIGUGUR TENGAH	KOTA CIMAHI				LIEM TJUN MIN	3273096611640001	JL. HARIANGBANGA  NO. 10	BANDUNG WETAN	TAMANSARI	KOTA BANDUNG				72.00	916000	36.00	823000	65952000	29628000	95580000	HGB NO. 06297	TANIMULYA	NGAMPRAH		0	03	12	KP. KEBON KALAPA	002	02	\N	PT. ANUGRAH MEGAH LESTARI IND	2016-02-25	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	06	08	\N	\N	\N	\N	\N
500	507	MED EFRIANDI	3277032202740009	JL. SENTRAL V NO. 27-30	CIMAHI UTARA	CIBABAT	KOTA CIMAHI				ISAK SULAEMAN	3217012208750010	 KP. LANGENSARI	LEMBANG	LANGENSARI	KABUPATEN BANDUNG BARAT				55.00	64000	36.00	429000	3520000	15444000	18964000	SHM NO. 01031	LANGENSARI	LEMBANG		0	001	012	BL. LANGENSARI	002	03	\N	ANA	2016-02-25	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	003	\N	\N	\N	\N	\N
501	508	BASUKI WALUYO	3217081204690002	KOMP. BUKIT BERLIAN BLOK C 54	PADALARANG	KERTAMULYA	KAB. BANDUNG BARAT				YAKUB	3217080504480005	Jl. KP. CIPADANG MANAH	PADALARANG	PADALARANG	KABUPATEN BANDUNG BARAT				87.00	200000	42.00	365000	17400000	15330000	32730000	SHM NO. 889	PADALARANG	PADALARANG		0	05	25	KP. CIPADANG MANAH	002	16	\N	AKUB	2016-02-25	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	16	\N	\N	\N	\N	\N
477	484	IRVAN	3273130408780001	JL. MATRAMAN NO. 10	LENGKONG	TURANGGA	KOTA BANDUNG				ANDENG SUDRAJAT CS	3217081807590002	PURABAYA	PADALARANG	JAYAMEKAR	KABUPATEN BANDUNG BARAT			__.___.___._-___.___	3164.00	48000	0.00	0	151872000	0	151872000	591/33/DES./2016	JAYAMEKAR	PADALARANG		0	07	10	JL. PURABAYA	003	06	\N	MANAN SUCAHYONO	2016-02-25	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	01	06	\N	\N	\N	\N	\N
502	509	ANDENG SUDRAJAT	3217081807590002	PURABAYA	PADALARANG	JAYAMEKAR	KAB. BANDUNG BARAT				USIH	474.3/05/DES	KP. PURABAYA 	PADALARANG	JAYAMEKAR	KABUPATEN BANDUNG BARAT				3164.00	48000	0.00	0	151872000	0	151872000	591/33/DES/2016	JAYAMEKAR	PADALARANG	SURAT KETERANGAN SUSUNAN AKHLI WARIS  NO. 474.3/46/WRS/PDL	1	01	06	JL. PURABAYA	003	06	\N	MANAN SUCAHYONO	2016-02-25	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	01	06	\N	\N	\N	\N	\N
503	510	SOEMARDJONO	3273072308600005	JL. SUKAMAJU DALAM	SUKAJADI	PASTEUR	KOTA BANDUNG				SURNIATI	1371046405580001	KOMPLEK VILLA HADIS PERMAI	PADANG UTARA	ULAK KARANG UTARA	KOTA PADANG				60.00	916000	21.00	505000	54960000	10605000	65565000	SHM NO. 4538	CILAME	NGAMPRAH		0	001	001	KO. CILAME PERMAI	008	19	\N	SUPARTIN K	2016-02-25	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	004	002	\N	\N	\N	\N	\N
504	511	RIDWAN NUGRAHA UTAMA	3273201209850005	JL. CIBATU IX NO. 15	ANTAPANI	ANTAPANI TENGAH	KOTA BANDUNG				H. YAYAT SUPRIATNA	6474031006580007	JL. MENJANGAN BLOK 03 NO. 06 BTN PKT	BONTANG BARAT	BELIMBING	KOTA BONTANG			__.___.___._-___.___	107.00	916000	36.00	823000	98012000	29628000	127640000	SHM NO. 5307	TANIMULYA	NGAMPRAH		0	005	016	KO. GRAHA NUANSA HIJAU CIDAHU	006	01	\N	YAYAT SUPRIATNA, H	2016-02-25	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	030	000	\N	\N	\N	\N	\N
507	514	JUFRON SIHOMBING	1272070202700002	JL. PEPAYA NO. 19	CILEGON	CIWADUK	KOTA CILEGON				ANDINA GITA KRISNAWATI	3217025509830022	Jl. KO. BUMI SARIWANGI 2 CLUSTER ANGGREK NO.A2	PARONGPONG	SARIWANGI	KABUPATEN BANDUNG BARAT				119.00	2013000	60.00	823000	239547000	49380000	288927000	SHM NO. 4501	SARIWANGI	PARONGPONG		0	05	08	KO. BUMI SARIWANGI 2 ANGGREK	004	08	\N	ANDINA GITA KRISNAWATI	2016-02-25	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	004	08	\N	\N	\N	\N	\N
508	515	RIDAMAYANTI NADEAK	3217065909780013	BENTANG PADALARANG REGENCY BLOK C-1 NO. 27	PADALARANG	JAYAMEKAR	KAB. BANDUNG BARAT				ALI ABUDAN	3273081708560012	JL. H. AKBAR NO. 2	CICENDO	PASIRKALIKI	KOTA BANDUNG				97.00	464000	36.00	823000	45008000	29628000	74636000	HGB NO. 1301	JAYAMEKAR	PADALARANG		0	003	024	KO. BENTANG PADALARANG	000	00	\N	PT. UZI KARYA PRESTASI	2016-02-25	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	006	006	\N	\N	\N	\N	\N
509	516	YULIASIH 	3274056109600003	HARAPAN MULYA 	KESAMBI	DRAJAT	KOTA CIREBON				ALI ABUDAN	3273081708580012	JL. H. AKBAR NO. 2	CICENDO	PASIRKALIKI	KOTA BANDUNG				85.00	464000	22.00	823000	39440000	18106000	57546000	HGB NP. 1287	JAYAMEKAR	PADALARANG		0	04	05	KO. BENTANG PADALARANG	000	00	\N	PT. UZI KARYA PRESTASI	2016-02-25	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	06	06	\N	\N	\N	\N	\N
510	517	FAUZI HAMZAH	3217041602800016	KP. MUNJUL	CIKALONG WETAN	CIKALONG	KAB. BANDUNG BARAT				ALI ABUDAN	3273081708560012	JL. H. AKBAR NO. 2	CICENDO	PASIRKALIKI	KOTA BANDUNG				72.00	464000	29.00	823000	33408000	23867000	57275000	HGB NO. 1171	JAYAMEKAR	PADALARANG		0	001	010	KO. BENTANG PADALARANG	000	00	\N	PT. UZI KARYA PRESTASI	2016-02-25	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	006	006	\N	\N	\N	\N	\N
511	518	RESTY WARDHANI	3217085104830027	BABAKAN TALANG	PADALARANG	KERTAMULYA	KAB. BANDUNG BARAT				ALI ABUDAN	3273081708580012	JL. H. AKBAR NO. 2	CICENDO	PASIRKALIKI	KOTA BANDUNG				112.00	464000	36.00	823000	51968000	29628000	81596000	HGB NO. 1377	JAYAMEKAR	PADALARANG		0	04	09	KO. BENTANG PADALARANG	000	00	\N	PT. UZI KARYA PRESTASI	2016-02-25	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	06	06	\N	\N	\N	\N	\N
512	519	FRANSISKA RENATA PALUPI	3674016303780004	GREEN COVE B. 8 NO. 09 B 50	SERPONG	CILENGGONG	KAB. TANGERANG SELATAN				TJIA SOAN TJENG	3277032202690002	SETRA DUTA CEMARA K2-16	CIMAHI UTARA	PASIRKALIKI	KOTA CIMAHI			__.___.___._-___.___	500.00	1032000	200.00	1516000	516000000	303200000	819200000	SHM NO. 1633	CIHIDEUNG	PARONGPONG		0	005	011	KO. GRAHA PUSPA	001	10	\N	ANNA CHANDRA	2016-02-25	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	005	\N	\N	\N	\N	\N
513	520	EVI SUGIARTI	3277034903730004	KP. CILEDUG NO. 223	CIMAHI UTARA	CIBABAT	KOTA CIMAHI				SEPTI ANGGOLA	3217080307770020	BANTAR BOLANG	BANTAR BOLANG	BANTAR BOLANG	KAB. PEMALANG				72.00	1032000	38.00	968000	74304000	36784000	111088000	SHM NO. 1686	LAKSANAMEKAR	PADALARANG		0	013	008	JL. BATUJAJAR REGENCY III	000	00	\N	PARDIANA PUPITA SARI	2016-02-25	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	004	\N	\N	\N	\N	\N
514	521	NURUL FITRI	3277024504920011	JL. RAYA CIMINDI	CIMAHI TENGAH	CIGUGUR TENGAH	KOTA CIMAHI				LIEM NJUK KIAN	3273025411660004	JL. DAGO ASRI II NO. 18	COBLONG	DAGO	KOTA BANDUNG				120.00	48000	68.00	1200000	5760000	81600000	87360000	HGB NO. 00115	JAMBUDIPA	CISARUA		0	004	015	BL. JAMBUDIPA	002	01	\N	MELLYRIATI TJANDRADJAJA	2016-02-26	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	006	009	\N	\N	\N	\N	\N
515	522	RONALD BAGJA SUTEJA	3204102509560002	JL. GRAHA CENDANA NO. 28	MARGAASIH	LAGADAR	KAB. BANDUNG				LASIYEM	3217065012410001	 KP. SINDANGSARI	NGAMPRAH	CIMAREME	KABUPATEN BANDUNG BARAT				266.00	200000	38.00	429000	53200000	16302000	69502000	590/4/DS	CIMAREME	NGAMPRAH		0	001	020	KP. SINDANGSARI	002	06	\N	LASIYEM	2016-02-26	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	006	\N	\N	\N	\N	\N
516	523	MOCH. YUSUF HADIANSYAH	3273010605790001	JL. SUKAJADI ATAS BLOK 227	SUKASARI	GEGERKALONG	KOTA BANDUNG				RYAN PRATAMA 	3174041101840010	Jl. LODAN RAYA NO. 11	PULO GADUNG	JATI	JAKARTA TIMUR				72.00	160000	0.00	0	11520000	0	11520000	SHM NO.5416	SARIWANGI	PARONGPONG		0	03	05	KP. MEKARWANGI	002	13	\N	IDI	2016-02-26	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	06	05	\N	\N	\N	\N	\N
517	524	CAHAYA DHAYA MULYONO	3217060309920002	TANIMULYA RAYA NO. 11	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				SUHARNO	3217060506640002	JL. TANIMULYA RAYA NO. 11	NGAMPRAH	TANIMULYA	KABUPATEN BANDUNG BARAT				65.00	916000	30.00	700000	59540000	21000000	80540000	SHM NO. 3001	TANIMULYA	NGAMPRAH		0	002	015	KO. TANIMULYA INDAH	002	15	\N	SUHARNO	2016-02-26	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	015	\N	\N	\N	\N	\N
518	525	MARULI HOTMA M SIHITE	3174060804700004	JL. CILANDAK DALAM 17	CILANDAK	CILANDAK BARAT	JAKARTA SELATAN				HARYANTI	3217086705670004	JL. RATNA PAKSI NO. 31	PADALARANG	CIPEUNDEUY	KABUPATEN BANDUNG BARAT				72.00	2352000	40.00	823000	169344000	32920000	202264000	HGB NO. 1726	CIPEUNDEUY	PADALARANG		0	004	013	JL. BANYAKPUSPA	000	00	\N	HARYANTI	2016-02-26	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	011	\N	\N	\N	\N	\N
519	526	PT. BETON ELEMENINDO PUTRA	3273081112710004	JL. RAYA BATUJAJAR KM. 5 NO. 8  	BATUJAJAR	GIRIASIH	KAB. BANDUNG BARAT				TJETJEP HARTONO, IR	3217020912500002	SETRADUTA HEGAR D2-1	PARONGPONG	SARIWANGI	KAB. BANDUNG BARAT				6713.00	103000	0.00	0	691439000	0	691439000	SHM NO. 857	GIRIASIH	BATUJAJAR		0	01	09	KP. CICANGKUANG	001	09	\N	TJETJEP HARTONO, IR	2016-02-26	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	14	\N	\N	\N	\N	\N
520	527	DIDIH	3217081808520002	KP. RANCABALI	PADALARANG	PADALARANG	KAB. BANDUNG BARAT				DEDY KOMARA	3217070104600005	KP. PARAKAN SALAM	CIPATAT	NYALINDUNG	KABUPATEN BANDUNG BARAT				60.00	1032000	21.00	505000	61920000	10605000	72525000	SHM NO. 6414	TANIMULYA	NGAMPRAH		0	004	005	KO. PERMATA CIMAHI	003	14	\N	DEDI KOMARA	2016-02-26	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	008	\N	\N	\N	\N	\N
522	529	FADZAR VIRA CARYANTO	3204062301670005	JL. LIGAR RAYA 84	CIMENYAN	CIBEUNYING	KAB. BANDUNG				DUDUNG	3217030107370026	KP. CIROYOM GIRANG	CISARUA	SADANGMEKAR	KABUPATEN BANDUNG BARAT				1594.00	27000	0.00	0	43038000	0	43038000	590/07/II/2016	SADANGMEKAR	CISARUA		0	004	007	BL. CISARUA HILIR	004	03	\N	DUDUNG	2016-02-26	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	004	\N	\N	\N	\N	\N
523	530	PT. BETON ELEMENINDO PUTRA	3273081112710004	JL. RAYA BATUJAJAR KM. 5 NO. 8  	BATUJAJAR	GIRIASIH	KAB. BANDUNG BARAT				TJETJEP HARTONO, IR	3217020912500002	SETRADUTA HEGAR D2-1	PARONGPONG	SARIWANGI	KABUPATEN BANDUNG BARAT				155.00	285000	0.00	0	44175000	0	44175000	SHM NO. 765	GIRIASIH	BATUJAJAR		0	01	09	KP. CANGKUANG	001	09	\N	TJETJEP HARTONO, IR	2016-02-26	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	14	\N	\N	\N	\N	\N
524	531	PT. BETON ELEMENINDO PUTRA	3273081112710004	JL. RAYA BATUJAJAR KM. 5 NO. 8  	BATUJAJAR	GIRIASIH	KAB. BANDUNG BARAT				TJETJEP HARTONO	3217020912500002	SETRADUTA HEGAR D2-1	PARONGPONG	SARIWANGI	KABUPATEN BANDUNG BARAT				1875.00	103000	0.00	0	193125000	0	193125000	SHM NO. 310	GIRIASIH	BATUJAJAR		0	01	09	KP. CICANGKUANG	001	09	\N	SUMIJATI TJITERA	2016-02-26	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	014	\N	\N	\N	\N	\N
525	532	PT. BETON ELEMENINDO PUTRA	3273081112710004	JL. RAYA BATUJAJAR KM. 5 NO. 8  	BATUJAJAR	GIRIASIH	KAB. BANDUNG BARAT				TJETJEP HARTONO, IR	3217020912500002	SETRADUTA HEGAR D2-1	PARONGPONG	SARIWANGI	KABUPATEN BANDUNG BARAT				2922.00	160000	0.00	0	467520000	0	467520000	SHM NO. 662	GIRIASIH	BATUJAJAR		0	01	09	KP. CICANGKUANG	001	09	\N	TJETJEP HARTONO, IR	2016-02-26	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	14	\N	\N	\N	\N	\N
526	533	PT. BETON ELEMENINDO PUTRA	3273081112710004	JL. RAYA BATUJAJAR KM. 5 NO. 8  	BATUJAJAR	GIRIASIH	KAB. BANDUNG BARAT				JULIUS DON	3273081112710004	JL. BUDI SARI NO. 35	CIDADAP	HEGARMANAH	KOTA BANDUNG				230.00	537000	0.00	0	123510000	0	123510000	SHM NO. 799	GIRIASIH	BATUJAJAR		0	01	09	JL. RAYA BATUJAJAR	001	09	\N	ROHMAT, H	2016-02-26	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	004	005	\N	\N	\N	\N	\N
521	528	PT. BETON ELEMENINDO PUTRA	3273081112710004	JL. RAYA BATUJAJAR KM. 5 NO. 8  	BATUJAJAR	GIRIASIH	KAB. BANDUNG BARAT				TJETJEP HARTONO, IR	3217020912500002	SETRADUTA HEGAR D2-1	PARONGPONG	SARIWANGI	KAB. BANDUNG BARAT				76.00	537000	0.00	0	40812000	0	40812000	SHM NO. 767	GIRIASIH	BATUJAJAR		0	01	09	KP. CICANGKUANG	001	09	\N	TJETJEP HARTONO, IR	2016-02-26	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	14	\N	\N	\N	\N	\N
528	535	HAYATI	3217095209730012	JL. RAYA BATUJAJAR NO. 275	BATUJAJAR	BATUJAJAR BARAT	KAB. BANDUNG BARAT				IRWIN RIYADI	3273080201810006	JL. CIDADAP GIRANG BARU NO. 8	CIDADAP	LEDENG	KOTA BANDUNG				105.00	702000	54.00	968000	73710000	52272000	125982000	HGB NO. 1580	BATUJAJAR TIMUR	BATUJAJAR		0	002	004	JL. RAYA BATUJAJAR KM 6.5	001	03	\N	PT. PUTRA KENCANA DWITUNGGAL	2016-02-29	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	005	\N	\N	\N	\N	\N
527	534	KOKO PRIYONO	3204080410790002	KP. LENGKONG	BOJONGSOANG	LENGKONG	KAB. BANDUNG				IRWIN RIYADI	3273080201810006	JL. CIDADAP GIRANG BARU NO. 8	CIDADAP	LEDENG	KOTA BANDUNG				72.00	702000	36.00	968000	50544000	34848000	85392000	HGB NO. 1658	BATUJAJAR TIMUR	BATUJAJAR		0	004	006	JL. RAYA BATUJAJAR KM 6.5	001	03	\N	PT. PUTRA KENCANA DWITUNGGAL	2016-02-29	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	005	\N	\N	\N	\N	\N
529	536	RANI MEGAWATI	3217065409650006	JL. TOPAS I NLOK P-6 NO. 2	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				NG KIAN KONG	3273050102540003	JL. TERI NO. 15	ANDIR	CIROYOM	KOTA BANDUNG				87.00	1032000	36.00	700000	89784000	25200000	114984000	SHM NO. 1150	TANIMULYA	NGAMPRAH		0	004	005	KO. PERMATA CIMAHI	000	00	\N	RUBBIANTO	2016-02-29	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	006	\N	\N	\N	\N	\N
531	543	UMAR WAHID HASIM	3604050407740004	GRIYA CILEGON BLOK D3 NO. 6	KRAMATWATU	HARJATANI	KAB. SERANG				HAMDANA	3273180607650006	RERENG WULUNG INDAH NO. A2	CIBEUNYINGKALER	SUKALUYU	KOTA BANDUNG				102.00	335000	45.00	1200000	34170000	54000000	88170000	HGB NO. 545	CIMAREME	NGAMPRAH		0	07	03	JL. BABAKAN CIANJUR	001	08	\N	PT. GRACIA ESTETIKA	2016-02-29	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	05	04	\N	\N	\N	\N	\N
532	544	WILDAN AVIANA 	3175070909690004	PULO GEBANG KIRANA XI BLOK C X/8	CAKUNG	PULO GEBANG	PROV. DKI JAKARTA				RUDI HERMAWAN	3273132009740003	JL. EMONG NO. 38	LENGKONG	BURANGRANG	KOTA BANDUNG				60.00	916000	36.00	595000	54960000	21420000	76380000	SHM NO. 6546	TANIMULYA	NGAMPRAH		0	018	006	KO. BUMI PAKUSARAKAN	003	19	\N	RUDI HERMAWAN	2016-02-29	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	002	\N	\N	\N	\N	\N
533	545	YOVITA CHRISTIAN ASSIKIN	3204096908940001	TAMAN KOPO INDAH I BLOK B-72	MARGAHAYU	MARGAHAYU SELATAN	KAB. BANDUNG				OTING	3206272010.00051	Jl. KP.CIBENGKUNG	CIKALONGWETAN	KANANGASARI	KABUPATEN BANDUNG BARAT				2500.00	10000	0.00	0	25000000	0	25000000	NO.140/36/DSII/2016	SUMURBANDUNG	CIPATAT		0	01	16	BL. LEGOK PEUNDEUY	001	02	\N	SARMAN	2016-02-29	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	09	\N	\N	\N	\N	\N
534	546	ASSIKIN	3204092306600002	TAMAN KOPO INDAH I BLOK B-72	MARGAHAYU	MARGAHAYU SELATAN	KAB. BANDUNG				NY. OTING	320627201000051	KP. CIBENGKUNG	CIKALONG WETAN	KANANGASARI	KABUPATEN BANDUNG				7240.00	14000	0.00	0	101360000	0	101360000	140/35/DS/2016	SUMURBANDUNG	CIPATAT		0	001	018	BL. LEGOK PEUNDEUY	001	02	\N	SARMAN	2016-02-29	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	009	\N	\N	\N	\N	\N
535	547	SUSAN ARDIANTO	3172026706830015	JL. CLOVER 3 BLOK BC NO. 22	CILINCING	SUKAPURA	JAKARTA UTARA				HERGAWATI HUSEIN	3273085509460001	JL. DR. SETIABUDHI NO. 120	CIDADAP	HEGARMANAH	KOTA BANDUNG				159.00	1032000	0.00	0	164088000	0	164088000	SHM NO. 05511	CIWARUGA	PARONGPONG		0	08	11	KP. PARIGILAME	001	06	\N	HERGAWATI HUSEIN	2016-02-29	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	004	004	\N	\N	\N	\N	\N
536	548	MUHAMMAD IQBAL 	3205120611900001	KP. CITAMBAL 	CIBATU	PADASUKA	KAB. GARUT				YACOB ANWAR LEWI	3217060505570018	PERMATA CIMAHI R-4NO. 06	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				75.00	537000	40.00	968000	40275000	38720000	78995000	HGB NO. 06487	CILAME	NGAMPRAH		0	04	02	KO. BATU ALAM I	002	02	\N	HERIJAN JULIANTO	2016-02-29	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	05	\N	\N	\N	\N	\N
537	549	SUNARSIH	3602024508500003	KP. GINTUNG	PANGGARANGAN	MEKARJAYA	KAB. LEBAK				SUNARSIH	195/41/DS/011/16	KP. GINTUNG	PANGGARANGAN	MEKARJAYA	KABUPATEN LEBAK				220.00	285000	72.00	823000	62700000	59256000	121956000	SHM NO. 1075	KERTAMULYA	PADALARANG	SURAT KETERANGAN WARIS NO : 195/41/DS.011/2016	1	001	002	KP. POS WETAN	004	12	\N	TETEH ELIS	2016-02-29	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	002	\N	\N	\N	\N	\N
538	550	ZEMMY SETIAWAN, SH., MH	3217082606740018	JL. RAYA PURWAKARTA NO. 14	PADALARANG	KERTAMULTYA	KAB. BANDUNG BARAT				SUNARSIH	3602024508500003	KP. GINTUNG	PANGGARANGAN	MEKARJAYA	KABUPATEN LEBAK				220.00	285000	72.00	823000	62700000	59256000	121956000	SHM NO. 1075	KERTAMULYA	PADALARANG		0	004	012	KP. POS WETAN	004	12	\N	TETEH ELIS	2016-02-29	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	002	\N	\N	\N	\N	\N
539	551	YANTO TANU	3277021801730005	JL. GATOT SUBROTO NO. 29	CIMAHI TENGAH	KARANGMEKAR	KOTA CIMAHI				WIEWIEK WAHYU WIDAYATI	3275055812590007	JL. NIAGA 9 BD 9	RAWALUMBU	BOJONG RAWALUMBU	KOTA BEKASI			__.___.___._-___.___	234.00	2352000	109.00	1200000	550368000	130800000	681168000	HGB NO. 00364	CIPEUNDEUY	PADALARANG		0	004	005	JL. WANGSAPUTRA KULON	000	00	\N	ARIEF D S	2016-02-29	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	004	020	\N	\N	\N	\N	\N
540	552	ALVIN WIBISANA	3278031408910006	JL. KOMARASARI II NO. 8 B	TAWANG	EMAPANGSARI	KOTA TASIKMALAYA				DR TONY	3273071410640006	JL. GRIYA UTARA NO. 21	SUKAJADI	SUKAWARNA	KOTA BANDUNG				93.00	916000	40.00	968000	85188000	38720000	123908000	HGB NO. 00427	KERTAJAYA	PADALARANG		0	01	02	KOTA BALI	000	00	\N	PT. PESONA JATI ABADI	2016-02-29	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	07	08	\N	\N	\N	\N	\N
541	553	SOFYAN DIWIRYA	3217090806910014	PERUM GRAHA BUKIT RAYA BLOK A4, NO. 15	NGAMPRAH	CILAME	KAB. BANDUNG BARAT				AMALIYAH	3277024601510003	JL. DR. SAM RATULANGI NO. G. 139	CIMAHI TENGAH	BAROS	KOTA CIMAHI				60.00	27000	23.00	1200000	1620000	27600000	29220000	HGB NO. 00021	PANGAUBAN	BATUJAJAR		0	008	025	BL. BANUSARI	003	10	\N	PT. MITRA KARYA PROSPEKTA	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	013	\N	\N	\N	\N	\N
542	554	ERWIN DARWIN	3217090702880012	JLN. SMP GANG MANDIRI	BATUJAJAR	BATUJAJAR BARAT	KAB. BANDUNG BARAT				AMALIYAH	3277024610151000	 JL. DR. SAM RATULANGI NO. G 139	CIMAHI TENGAH	BAROS	KOTA CIMAHI				60.00	27000	23.00	1200000	1620000	27600000	29220000	HGB NO. 00004	PANGAUBAN	BATUJAJAR		0	001	003	BL. BANUSARI	003	10	\N	PT. MITRA KARYA PROSPEKTA	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	013	\N	\N	\N	\N	\N
543	555	HASAN FAOZI	3321142104910003	BUMI PAKUSARAKAN II BLOK A3 NO. 13	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				AMALIYAH	3277024601510003	JL. DR. SAM RATULANGI NO. G 139	CIMAHI TENGAH	BAROS	KOTA CIMAHI				60.00	27000	23.00	1200000	1620000	27600000	29220000	HGB NO. 00005	PANGAUBAN	BATUJAJAR		0	001	023	BL. BANUSARI	003	10	\N	PT. MITRA KARYA PROSPEKTA	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	013	\N	\N	\N	\N	\N
544	556	DENI SUPARMAN	3277010212860003	JL. PADAT KARYA NO. 95	CIMAHI SELATAN	CIBEBER	KOTA CIMAHI				AMALIYAH	3277024601510003	JL. DR. SAM RATULANGI NO. G 139	CIMAHI TENGAH	BAROS	KOTA CIMAHI				60.00	27000	23.00	1200000	1620000	27600000	29220000	HGB NO. 00023	PANGAUBAN	BATUJAJAR		0	004	001	BL. BANUSARI	003	10	\N	PT. MITRA KARYA PROSPEKTA	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	013	\N	\N	\N	\N	\N
545	557	EEN ROHAYATI	3217065912710019	KP. CIKANDANG	NGAMPRAH	CIMAREME	KAB. BANDUNG BARAT				AMALIYAH	3277024601510003	JL. DR. SAM RATULANGI NO. G. 139	CIMAHI TENGAH	BAROS	KOTA CIMAHI				60.00	27000	23.00	1200000	1620000	27600000	29220000	HGB NO. 00006	PANGAUBAN	BATUJAJAR		0	001	006	BL. BANUSARI	003	10	\N	PT. MITRA KARYA PROSPEKTA	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	013	\N	\N	\N	\N	\N
546	558	IMAS MASITOH	3217105912660001	KP. BABAKAN CIANJUR 	CIHAMPELAS	CIHAMPELAS	KAB. BANDUNG BARAT				AMALIYAH	3277024601510003	JL. DR. SAM RATULANGI NO. G 139	CIMAHI TENGAH	BAROS	KOTA CIMAHI				60.00	27000	23.00	1200000	1620000	27600000	29220000	HGB NO. 00022	PANGAUBAN	BATUJAJAR		0	002	003	BL. BANUSARI	003	10	\N	PT. MITRA KARYA PROSPEKTA	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	013	\N	\N	\N	\N	\N
547	559	BENI HARSONO	3277022706830007	PERUMAHAN PURI INDAH LESTARI BLOK C2 NO. 22	BATUJAJAR	BATUJAJAR TIMUR	KAB. BANDUNG BARAT				AMALIYAH	3277024601510003	 JL. DR. SAM RATULANGI NO. G 139	CIMAHI TENGAH	BAROS	KOTA CIMAHI				60.00	27000	23.00	1200000	1620000	27600000	29220000	HGB NO. 00007	PANGAUBAN	BATUJAJAR		0	002	016	BL. BANUSARI	003	10	\N	PT. MITRA KARYA PROSPEKTA	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	013	\N	\N	\N	\N	\N
548	560	AGUS HIDAYAT	3277032009750017	JL. KOLONEL MATSURI GG. CIKENDAL NO. 52	CIMAHI UTARA	CIPAGERAN	KOTA CIMAHI				AMALIYAH	3277024601510003	 JL. DR. SAM RATULANGI NO. G 139	CIMAHI TENGAH	BAROS	KOTA CIMAHI				60.00	27000	23.00	1200000	1620000	27600000	29220000	HGB NO. 00008	PANGAUBAN	BATUJAJAR		0	002	004	BL. BANUSARI	003	10	\N	PT. MITRA KARYA PROSPEKTA	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	013	\N	\N	\N	\N	\N
549	561	DINA YUNITA INDAH	3277015206800031	JL. PENDIDIKAN NO. 310	CIMAHI SELATAN	LEUWIGAJAH	KOTA CIMAHI				AMALIYAH	3277024601510003	JL. DR. SAM RATULANGI NO. G 139	CIMAHI TENGAH	BAROS	KOTA CIMAHI				60.00	27000	23.00	1200000	1620000	27600000	29220000	HGB NO. 00020	PANGAUBAN	BATUJAJAR		0	009	009	BL. BANUSARI	003	10	\N	PT. MITRA KARYA PROSPEKTA	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	013	\N	\N	\N	\N	\N
550	562	NENI RUHAENI	3277014206800042	PERUMNAS II BLOK 2 GG MESJID NO 11/77	CIMAHI SELATAN	MELONG	KOTA CIMAHI				AMALIYAH	3277024601510003	 JL. DR. SAM RATULANGI NO. G 139	CIMAHI TENGAH	BAROS	KOTA CIMAHI				60.00	27000	23.00	1200000	1620000	27600000	29220000	HGB NO. 00009	PANGAUBAN	BATUJAJAR		0	001	011	BL. BANUSARI	003	10	\N	PT. MITRA KARYA PROSPEKTA	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	013	\N	\N	\N	\N	\N
551	563	EVA IRMA DHARMAWATI	3217065309840016	DUSUN MANABAYA	CIMANGGUNG	SINDANGPAKUON	KAB. SUMEDANG				AMALIYAH	3277024601510003	JL. DR. SAM RATULANGI NO. G 139	CIMAHI TENGAH	BAROS	KOTA CIMAHI				60.00	27000	23.00	1200000	1620000	27600000	29220000	HGB NO. 00019	PANGAUBAN	BATUJAJAR		0	002	006	BL. BANUSARI	003	10	\N	PT. MITRA KARYA PROSPEKTA	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	013	\N	\N	\N	\N	\N
552	564	YUGI KUSWARDANA	3273130604780005	JL. PANGARANG NO. 31/17B	LENGKONG	CIKAWAO	KOTA BANDUNG				AMALIYAH	3277024601510003	JL. DR. SAM RATULANGI NO. G 139	CIMAHI TENGAH	BAROS	KOTA CIMAHI				60.00	27000	23.00	1200000	1620000	27600000	29220000	HGB NO. 00018	PANGAUBAN	BATUJAJAR		0	003	008	BL. BANUSARI	003	10	\N	PT. MITRA KARYA PROSPEKTA	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	013	\N	\N	\N	\N	\N
553	565	YUDI NURHADI	3217061509890015	JL. BOTANI 2 NO. 13	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				AMALIYAH	3277024601510003	JL. DR. SAM RATULANGI NO. G 139	CIMAHI TENGAH	BAROS	KOTA CIMAHI				60.00	27000	23.00	1200000	1620000	27600000	29220000	HGB NO. 00011	PANGAUBAN	BATUJAJAR		0	005	015	BL. BANUSARI	003	10	\N	PT. MITRA KARYA PROSPEKTA	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	013	\N	\N	\N	\N	\N
554	566	M. HANRI MARTENDAI	3276021003660017	JL DAGO ASRI I NO. 1A 	COBLONG	DAGO	KOTA BANDUNG				UPIE NURHANY ASTIA, SE	3217035801680005	Jl. KP. CIPANAS NO. 11	CISARUA	PADAASIH	KABUPATEN BANDUNG BARAT				439.00	82000	35.00	505000	35998000	17675000	53673000	SHM NO. 01288	PADAASIH	CISARUA		0	07	09	KP. CIPANAS	001	04	\N	UPIE NURHANY ASTIA, SE	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	04	\N	\N	\N	\N	\N
555	567	ENDANG RAHMAT	3273061010420005	JL. RAMA NO. 12 BLK 	CICENDO	ARJUNA	KOTA BANDUNG				HERIS HERYADI	3217071006570002	PERUM CIPATAT ELOK BLOK N NO. 04	CIPATAT	CIPTAHARJA	KABUPATEN BANDUNG BARAT			__.___.___._-___.___	59.00	916000	21.00	595000	54044000	12495000	66539000	HGB NO. 04992	TANIMULYA	NGAMPRAH		0	01	02	KO. BUMI PAKUSARAKAN II	005	23	\N	JOHN FARIZAL	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	15	\N	\N	\N	\N	\N
556	568	IMAS SUPARMI	3217094504690010	KP. SUKASARI	BATUJAJAR	GALANGGANG	KAB. BANDUNG BARAT			__.___.___._-___.___	AMALIYAH	3377024601510003	 JL. DR. SAM RATULANGI NO. G 139	CIMAHI TENGAH	BAROS	KOTA CIMAHI			01.494.658.6-421.000	60.00	27000	23.00	1200000	1620000	27600000	29220000	HGB NO. 00017	PANGAUBAN	BATUJAJAR		0	004	016	BL. BANUSARI	003	10	\N	PT. MITRA KARYA PROSPEKTA	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	013	\N	\N	\N	\N	\N
557	569	SUSILOWATI	3217096806660006	KP. RESMIGALIH	BATUJAJAR	BATUJAJAR TIMUR	KAB. BANDUNG BARAT			__.___.___._-___.___	AMALIYAH	3277024601510003	JL. DR. SAM RATULANGI NO. G 139	CIMAHI TENGAH	BAROS	KOTA CIMAHI			01.494.658.6-421.000	60.00	27000	23.00	1200000	1620000	27600000	29220000	HGB NO. 00016	PANGAUBAN	BATUJAJAR		0	001	002	BL. BANUSARI	003	10	\N	PT. MITRA KARYA PROSPEKTA	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	013	\N	\N	\N	\N	\N
558	570	ASEP GUNARA	3277021407760019	KP. KALIDAM NO. 71 B	CIMAHI TENGAH	KARANGMEKAR	KOTA CIMAHI				AMALIYAH	3277024601510003	JL. DR. SAM RATULANGI NO. G 139	CIMAHI TENGAH	BAROS	KOTA CIMAHI			01.494.658.6-421.000	60.00	27000	23.00	1200000	1620000	27600000	29220000	HGB NO. 00012	PANGAUBAN	BATUJAJAR		0	001	010	BL. BANUSARI	003	10	\N	PT. MITRA KARYA PROSPEKTA	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	013	\N	\N	\N	\N	\N
559	571	SURYANINGSIH SALEH CS	3217066003610001	JL. ABIMANYU NO. 18 PONDUS	NGAMPRAH	GADOBANGKONG	KAB. BANDUNG BARAT			__.___.___._-___.___	R. HENDRA GUNAWAN, IR	474.3/09/WRS/VI/	Jl. KO. PONDOK DUSTIRA	NGAMPRAH	GADOBANGKONG	KABUPATEN BANDUNG BARAT				142.00	802000	65.00	505000	113884000	32825000	146709000	SHM NO. 664	GADOBANGKONG	NGAMPRAH	SURAT KETERANGAN AKHLI WARIS NO : 474.3/102/WRS/VI/2014	1	003	008	KO. PONDOK DUSTIRA	003	08	\N	R. HENDRA GUNAWAN, IR	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	008	\N	\N	\N	\N	\N
560	572	MASRI	3217061205630005	KP. RAWA TENGAH	NGAMPRAH	TANIMULYA	KAB. BANDUNG BARAT				MUKARMAN	3217061904720016	GRAHA BUKIT RAYA 3 C-1 NO. 12 A	NGAMPRAH	CILAME	KABUPATEN BANDUNG BARAT				60.00	802000	29.00	700000	48120000	20300000	68420000	HGB NO. 5594	CILAME	NGAMPRAH		0	002	007	KO. BUKIT GALUDRA			\N	PT. RAYA DEVINDO	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	009	025	\N	\N	\N	\N	\N
561	573	HIRMAN RAHAYU RIVANO	3273222710740001	JL. PALEM RAYA NO. 34	BUAHBATU	JATISARI	KOTA BANDUNG				HENDRA WIDJAJA	3204411909460001	KP. BUKANAGARA	LEMBANG	PAGERWANGI	KABUPATEN BANDUNG BARAT				1435.00	82000	0.00	0	117670000	0	117670000	SHM NO. 1555	PAGERWANGI	LEMBANG		0	001	007	KP. BUKANAGARA	005	01	\N	ANANG NATAMIHARDJA. RD	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	004	001	\N	\N	\N	\N	\N
562	574	YANTI HALIM	3173035806510001	JL. KEMENANGAN III NO. 58	TAMAN SARI	GLODOK	PROV DKI JAKARTA BARAT				IRMA JK	3273094403750002	JL. TAMANSARI BAWAH NO. 305/59	BANDUNG WETAN	TAMANSARI	KOTA BANDUNG				210.00	335000	0.00	0	70350000	0	70350000	SHM NO. 1424	CIHIDEUNG	PARONGPONG		0	010	003	KP. CIHIDEUNG	002	04	\N	IRMA JK	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	006	013	\N	\N	\N	\N	\N
563	575	ATRI NOPEL	3175071707770012	JL. LEMBAH NYIUR BLOK JI NO. 15	DUREN SAWIT	PONDOK KELAPA	JAKARTA TIMUR				BINSAR B PASARIBU	3273153112650003	JL. DIRGANTARA RAYA NO. 6A	BANDUNG KULON	GEMPOLSARI	KOTA BANDUNG				87.00	20000	54.00	429000	1740000	23166000	24906000	SHM NO. 00714	PATARUMAN	CIHAMPELAS		0	12	09	BL. BALAKASAP	003	09	\N	ODIK GATMA, H	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	07	05	\N	\N	\N	\N	\N
564	576	POSMAN MANURUNG	3275061404620016	PERUM HARAPAN INDAH BLOK NE/3	MEDAN SATRIA	PEJUANG	KOTA BEKASI				NONOK	3217034401650004	KP. BABAKAN CINTA	CISARUA	PASIRHALANG	KABUPATEN BANDUNG BARAT				979.00	48000	0.00	0	46992000	0	46992000	590/27/II/2016	PASIRHALANG	CISARUA		0	004	016	BL. BABAKAN CINTA	000	00	\N	ATUN RATNINGSIH	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	004	\N	\N	\N	\N	\N
565	577	MIRA MAYANGSARI	3273066402770004	GRAHA INDAH KAV 06	CICENDO	SUKARAJA	KOTA BANDUNG				DUDI RAHMAT SALAM, DRS	3174012302630003	Jl. TEBET BARAT DALAM VIII H NO.11	TEBET	TEBET BARAT	JAKARTA SELATAN				122.00	200000	65.00	823000	24400000	53495000	77895000	SHM NO. 2248	CIHANJUANG	PARONGPONG		0	01	03	BL. CIBALIGO	008	01	\N	DUDI RAHMAT SALAM, DRS	2016-03-01	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	05	\N	\N	\N	\N	\N
566	578	LEVINA ERICA	3217024211880003	SETIABUDI REGENSI A-7	PARONGPONG	CIGUGUR GIRANG	KAB. BANDUNG BARAT				NG GUAN HWA	3374016008590002	JL. SISINGAMANGARAJA NO. 14 PERUM GREEN CANDI SYDNEY 26	CANDISARI	KALIWIRU	KOTA SEMARANG				133.00	3745000	120.00	1200000	498085000	144000000	642085000	SHM NO. 01872	SARIWANGI	PARONGPONG		0	003	014	KO. SETRA DUTA	000	14	\N	OEY GIOK	2016-03-02	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	007	002	\N	\N	\N	\N	\N
567	579	JHON HABIBIE BARUS	3276010812820006	JL. TEBET TIMUR DALAM VIII L NO. 15	TEBET	TEBET TIMUR	JAKARTA SELATAN			47.844.132.2-412.000	ERWIN	3217021604790008	JL. ALMANDA III  NO. 10	PARONGPONG	CIWARUGA	KAB.BANDUNG BARAT				156.00	1862000	76.00	1200000	290472000	91200000	381672000	HGB NO. 01635	CIWARUGA	PARONGPONG		0	002	009	KO. PONDOK HIJAU PERMAI	000	00	\N	AHMAD YOKOSANO	2016-03-02	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	004	010	\N	\N	\N	\N	\N
568	580	RIANTO HAKSORO	3273150405490001	JL. JENDRAL SUDIRMAN NO. 679	BANDUNG KULON	CIBUNTU	KOTA BANDUNG				SUMIARTONY S	3273063112300002	JL. MUHAMAD NO. 32	CICENDO	PAMOYANAN	KOTA BANDUNG				755.00	2013000	0.00	0	0	0	0	SHM NO. 594	CIWARUGA	PARONGPONG		0	002	003	KO. GEGERKALONG PERMAI	005	06	\N	R SUMIARTONY S DRS	2016-03-02	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	006	\N	\N	\N	\N	\N
569	581	FIKRI HERDANI	3273131811890001	CIJAGRA ELOK NO. 1 	LENGKONG	CIJAGRA	KOTA BANDUNG				CECILIA KRISTINA	3174064811570004	BONA PERMAI RAYA B23	CILANDAK 	LEBAKBULUS	JAKARTA SELATAN				308.00	2176000	150.00	1200000	670208000	180000000	850208000	HGB NO. 189	CIGUGURGIRANG	PARONGPONG		0	06	04	KO. SETIA BUDI REGENSI	000	00	\N	HARRY H, IR	2016-03-02	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	007	006	\N	\N	\N	\N	\N
570	582	H. DEDEN NURDIN	3273150507750005	KARANGMULYA	BANDUNG KULON	CIGONDEWAH KALER	KOTA BANDUNG				DANDUNG PRIAMBODO	3277021304720015	JL. KALIDAM NO. G 44	CIMAHI TENGAH	KARANG MEKAR	KOTA CIMAHI				128.00	285000	36.00	823000	36480000	29628000	66108000	SHM NO. 2659	PADALARANG	PADALARANG		0	002	005	KO. TNI AD SEJAHTERA	006	11	\N	DANDUNG PRIAMBODO	2016-03-02	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	011	\N	\N	\N	\N	\N
572	584	KIMER SIPAYUNG	3277010706680021	JL. KATALINA II NO. 09	ANDIR	CAMPAKA	KOTA BANDUNG				DEDY	3173022911770002	JL. DR. SEMERU GG.I NO. 40	GROGOL PETAMBURAN	GROGOL	JAKARTA BARAT				1580.00	36000	0.00	0	56880000	0	56880000	SHM NO. 116	CIKOLE	LEMBANG		0	01	03	KP. GAMBLOK	000	00	\N	NANNY SUKARJA, SH	2016-03-02	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	14	07	\N	\N	\N	\N	\N
571	583	PT GRAHA ADICIPTA NUGRAHA	3273175807670004	JL. MUARA SARI IV NO.12 A	BOJONGLOA KIDUL	KEBONLEGA	KOTA BANDUNG			31.479.098.1-422.000	AMAS	3217080107430116	KP. SUDIMAMPIR	PADALARANG	KERTAJAYA	KABUPATEN BANDUNG BARAT				706.00	36000	0.00	0	25416000	0	25416000	590/68/DES	JAYAMEKAR	PADALARANG		0	005	011	JL. PURABAYA	003	03	\N	GEMI.	2016-03-02	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	017	\N	\N	\N	\N	\N
574	586	NANU WINARTO	3273140909710010	JL. YW PRAMUKA X NO. K-91	CIBEUNYING KIDUL	CICADAS	KOTA BANDUNG				CHANDRA TAMBAYONG	3273040203600005	JL. JAMIKA NO 88	BOJONGLOA KALER	JAMIKA	KOTA BANDUNG				102.00	335000	29.00	1200000	34170000	34800000	68970000	HGB NO. 1519	JAYAMEKAR	PADALARANG		0	10	13	KO. PERMATA PADALARANG			\N	PT. SAUYUNAN ASRI SARANA.	2016-03-02	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	05	07	\N	\N	\N	\N	\N
576	588	RAISA SUNGKAR	3174105108950006	JL. LAUSER I NO. 65 A	KEBAYORAN BARU	GUNUNG	JAKARTA SELATAN				UBAD DR	1810011010550007	Jl. A. YANI NO. 20 PRINGOMBO II	PRINGSEWU	PRINGSEWU TIMUR	KAB. PRINGSEWU				2530.00	160000	0.00	0	404800000	0	404800000	SHM NO. 456	MEKARWANGI	LEMBANG		0	09	08	BL. BUNIWANGI	004	04	\N	UBAD DR	2016-03-02	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	01	02	\N	\N	\N	\N	\N
577	589	RAISA SUNGKAR	3174105108950006	JL. LAUSER I NO. 65 A	KEBAYORAN BARU	GUNUNG	JAKARTA SELATAN				UBAD DR	1810011010550007	Jl. A. YANI NO. 20 PRINGOMBO II	PRINGSEWU	PRINGSEWU TIMUR	KAB. PRINGSEWU				2530.00	160000	0.00	0	404800000	0	404800000	SHM NO. 456	MEKARWANGI	LEMBANG		0	09	08	BL. BUNIWANGI	004	04	\N	UBAD DR	2016-03-02	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	01	02	\N	\N	\N	\N	\N
578	590	MEGIA ERIDA	3217016306940001	KP. SUKAMAJU TIMUR	LEMBANG	KAYUAMBON	KAB. BANDUNG BARAT				IR. JAAP OTOFANI	3273022103310001	JL. SURAPATI NO. 45	COBLONG	LEBAKGEDE	KOTA BANDUNG				1850.00	82000	0.00	0	151700000	0	151700000	SHM NO. 49	KAYUAMBON	LEMBANG		0	001	011	BL. SUKAMAJU	002	07	\N	MAMAD	2016-03-02	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	009	007	\N	\N	\N	\N	\N
579	591	INDRAJATI SAMALI	3204106210690004	TAMAN KOPO INDAH II, D 5/3	MARGAASIH	MEKARRAHAYU	KAB. BANDUNG				IR. SANUSI TANAWI	3173062210530001	PERUM CITRA II BLOK G. 11/2	KALI DERES	PEGADUNGAN	JAKARTA BARAT				126.00	2352000	65.00	1516000	296352000	98540000	394892000	HGB NO. 04130	CIPEUNDEUY	PADALARANG		0	005	019	KO. KOTA BARU PARAHYANGAN	000	00	\N	PT. BELAPUTERA INTILAND	2016-03-02	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	008	019	\N	\N	\N	\N	\N
580	592	LINA	1271185410800004	JL. SUTOMO BARU NO. 2	MEDAN PERJUANGAN	PANDAU HILIR	KOTA MEDAN				IR. SANUSI TANAWI	3173062210530001	PERUM CITRA II BLOK G. 11/2	KALI DERES	PEGADUNGAN	JAKARTA BARAT			__.___.___._-___.___	162.00	2352000	97.00	1516000	381024000	147052000	528076000	HGB NO. 03802	CIPEUNDEUY	PADALARANG		0	000	000	KO. KOTA BARU PARAHYANGAN	000	00	\N	PT. BELAPUTERA INTILAND	2016-03-02	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	008	019	\N	\N	\N	\N	\N
581	593	SABANA PRAWIRA WIDJAJA	1050062011410001	JL. KYAI GEDE UTAMA NO. 7	COBLONG	LEBAK GEDE	KOTA BANDUNG				CUCU BADRIAH	3277026909790037	KP. BUNISARI	NGAMPRAH	GADOBANGKONG	KABUPATEN BANDUNG BARAT				293.00	243000	0.00	0	71199000	0	71199000	SHM NO. 896	GADOBANGKONG	NGAMPRAH		0	03	08	JL. BUNISARI	001	05	\N	DIDI SURYADI	2016-03-02	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	005	\N	\N	\N	\N	\N
575	587	PT GRAHA ADICIPTA NUGRAHA	3273175807670004	JL. MUARA SARI IV NO.12 A	BOJONGLOA KIDUL	KEBONLEGA	KOTA BANDUNG			31.479.098.1-422.000	SENO HIDAYAT	3204101207730009	JL. ARWANA BARAT Q 3 NO. 20	MARGAASSIH	MARGAASIH	KAB. BANDUNG				280.00	64000	0.00	0	17920000	0	17920000	470/76/PEM	PATARUMAN	CIHAMPELAS		0	005	011	BL. BALAKASAP	004	05	\N	OMBAH B HASAN	2016-03-02	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	017	\N	\N	\N	\N	\N
583	595	KO FAI HSIANG	3273032809710003	KL. SATRIA RAYA III/2A	BABAKAN CIPARAY	MARGAHAYU UTARA	KOTA BANDUNG				FRANK LEE	3172010310530006	TMN RESORT MEDITERANIA BLK Z. I NO. 1	PENJARINGAN	KAPUK MUARA	JAKARTA UTARA				1045.00	200000	0.00	0	209000000	0	209000000	SHM NO. 471	KAYUAMBON	LEMBANG		0	004	009	BL. PANGRAGAJIAN	001	09	\N	INE MAYAWATI TEDJA	2016-03-02	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	008	\N	\N	\N	\N	\N
573	585	PT GRAHA ADICIPTA NUGRAHA	3273175807670004	JL. MUARA SARI IV NO.12 A	BOJONGLOA KIDUL	KEBONLEGA	KOTA BANDUNG			31.479.098.1-422.000	HJ. R. EMMA SITI RACHMANI	3175104501390002	KOMPLEK BINA MARGA NO. 41	CIPAYUNG	CIPAYUNG	PROV DKI JAKARTA				2078.00	36000	0.00	0	74808000	0	74808000	590/69/DES	JAYAMEKAR	PADALARANG		0	005	011	JL. PURABAYA	003	03	\N	IBU EMA	2016-03-02	\N	\N	2016-03-02		\N	\N	KABUPATEN BANDUNG BARAT	002	005	\N	\N	\N	\N	\N
582	594	OPIK RAMADHAN	3204050101700006	JL. CIBIRU HILIR NO. 39	CILEUNYI	CIBIRU HILIR	KAB. BANDUNG				KOMARUDIN	1016370107500013	Jl. KP. CISASAWI	PARONGPONG	CIHANJUANG	KABUPATEN BANDUNG BARAT				294.00	82000	0.00	0	24108000	0	24108000	AJB NO.553/2010	CIHANJUANG	PARONGPONG		0	03	01	KP. CISASAWI	001	05	\N	KOKOM	2010-07-27	294.00	0.00	2010-07-27	553/2010	\N	\N	KABUPATEN BANDUNG BARAT	02	05	\N	\N	\N	\N	\N
584	598	ATY YANUARTI 	3204445801710003	GADING TUTUKA 2 P-5 NO. 08	CANGKUANG	CILUNCAT	KAB . BANDUNG				RANNIE HEINEKE	3173026709730006	RAWA BAHAGIA RAYA NO. 7	GROGOL PETAMBURAN	GROGOL	KABUPATEN BANDUNG BARAT				280.00	64000	0.00	0	17920000	0	17920000	SHM NO. 727	KERTAWANGI	CISARUA		0	02	12	BL. PASIR IPIS	001	03	\N	SRI MULYANI	2016-03-03	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	006	02	\N	\N	\N	\N	\N
585	599	LYDIA THAMRIN	3204104511650001	JL. ASRAMA KIPAL	ANDIR	CAMPAKA	KOTA BANDUNG				MAS TOTIH BINTI MADJA	1056015301440001	Jl. JL H HARIS NO. 99	CIMAHI TENGAH	BAROS	KOTA CIMAHI				169.00	2352000	60.00	1516000	397488000	90960000	488448000	SHM NO. 1443	CIMAREME	NGAMPRAH		0	05	04	KO. THE AWANI RESIDENCE	002	05	\N	MAS TOTIH BINTI MADJA	2016-03-03	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	09	\N	\N	\N	\N	\N
586	600	SHANDY RAHMAT	3171041407860008	JL. PERCETAKAN NEGARA XI NO. 19	CEMPAKA PUTIH	RAWASARI	JAKARTA PUSAT			__.___.___._-___.___	MUHAMAD RANGGA RAMADHAN	3174051005880005	JL .MASJID NUR NO. 11 	KEBAYORAN LAMA	GROGOL UTARA	KABUPATEN BANDUNG BARAT				60.00	48000	30.00	823000	2880000	24690000	27570000	HGB NO. 147	CITATAH	CIPATAT		0	04	05	BL. CIMERANG	004	12	\N	PT. BUMI INDAH PARAHYANGAN	2016-03-03	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	06	10	\N	\N	\N	\N	\N
587	601	TAUFIK HABIB PULLAN 	3217071502910011	GRIYA SUKARAME ASRI BLOK G 14	CIPATAT	CIPTAHARJA	KAB. BANDUNG BARAT				MUHAMAD RANGGA RAMADHAN	3174051005880005	JL. MASJID NUR NO. 11	KEBAYORAN LAMA	GROGOL UTARA	JAKARTA SELATAN				60.00	48000	30.00	823000	2880000	24690000	27570000	HGB NO. 163	CITATAH	CIPATAT		0	04	16	BL. CIMERANG	004	12	\N	PT. BUMI INDAH PARAHYANGAN	2016-03-03	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	06	10	\N	\N	\N	\N	\N
588	602	RANA DIREKSA	3509276602930001	PERUM BALOPER F-34 JL. CEMPAKA	PADALARANG	PADALARANG	KAB. BANDUNG BARAT				MUHAMAD RANGGA RAMADHAN	3174051005880005	JL. MASJID NUR NO .11	KEBAYORAN LAMA	GROGOL UTARA	JAKARTA SELATAN				60.00	48000	30.00	823000	2880000	24690000	27570000	HGB NO. 137	CITATAH	CIPATAT		0	03	20	BL. CIMERANG	004	12	\N	PT. BUMI INDAH PARAHYANGAN	2016-03-03	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	06	10	\N	\N	\N	\N	\N
589	603	H. ACENG HUSNA	3217013004650001	KP. TEGALMANTRI	LEMBANG	LEMBANG	KAB. BANDUNG BARAT				H. IID	3217010203300004	KP. SUKAJADI	LEMBANG	LEMBANG	KAB. BANDUNG BARAT				4700.00	82000	0.00	0	385400000	0	385400000	593.21/010/PEM	KAYUAMBON	LEMBANG		0	003	012	BL. SUKAMAJU	005	07	\N	IID AKAM ISKANDAR	2016-03-03	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	002	\N	\N	\N	\N	\N
590	604	LILIH SJUSFINA SINAULAN	3276056308620005	PERUM PERMATA PURI BLOK B3 NO. 4	CIMANGGIS	CISALAK PASAR	KOTA DEPOK				NON SULU	3217095208350003	BLOK SMP NO. 23	BATUJAJAR	BATUJAJAR BARAT	KABUPATEN BANDUNG BARAT				364.00	160000	100.00	429000	58240000	42900000	101140000	SHM NO. 01017	BATUJAJAR BARAT	BATUJAJAR		0	001	009	JL. SMP	001	03	\N	NON SULU	2016-03-03	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	001	003	\N	\N	\N	\N	\N
591	605	DWI SETYO NARASTININGRUM	3217066611810008	PADASUKA INDAH II F4 NO. 2	NGAMPRAH	GADOBANGKONG	KAB. BANDUNG BARAT				IR. H. AHMAD SOFANDI	3217062204660002	PADASUKA INDAH II F-4 NO. 2	NGAMPRAH	GADOBANGKONG	KABUPATEN BANDUNG BARAT				81.00	916000	57.00	700000	74196000	39900000	114096000	SHM NO. 1981	TANIMULYA	NGAMPRAH		0	007	009	KO. PURI CIPAGERAN INDAH II	001	18	\N	NOVI HERDIAN	2016-03-03	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	007	009	\N	\N	\N	\N	\N
592	606	MOCHAMAD HARI ISPUTRANTO	3273012502710003	DARMO PERMAI SELATAN 9/2	DUKUHPAKIS	PRADAHKALIKENDAL	KOTA SURABAYA				ADE HARIANA	3273222906580003	JL. SARI ASIH BLOK III NO. 39	SUKASARI	SARIJADI	KOTA BANDUNG		40559		70.00	160000	36.00	1200000	11200000	43200000	54400000	SHM NO. 1629	CIGUGURGIRANG	PARONGPONG		0	00	005	KP. SINDANGPALAY	001	06	\N	KARTIKA	2016-03-03	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	006	000	\N	\N	\N	\N	\N
593	607	IKRARUDDIN RAFNI	3217021703700004	KP. KANCAH	PARONGPONG	CIHIDEUNG	KAB. BANDUNG BARAT				SUANDANA CS	3204431608520002	KP. SUKAWANA	PARONGPONG	KARYAWANGI	KABUPATEN BANDUNG BARAT				137.00	243000	45.00	900000	33291000	40500000	73791000	SHM NO. 02025	CIHIDEUNG	PARONGPONG		0	001	017	JL. SUKAWARNA	002	17	\N	SUHENDA	2016-03-03	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	013	\N	\N	\N	\N	\N
594	608	NENY DEVIANY	3217014312820012	BIB LEMBANG JL. KAYUAMBON NO. 78	LEMBANG	KAYUAMBON	KAB. BANDUNG BARAT				DYAH UMIYATI	3273016909550001	 JL PAK GATOT IV NO. 52-G KPAD	SUKASARI	GEGERKALONG	KOTA BANDUNG			__.___.___._-___.___	129.00	1032000	0.00	0	133128000	0	133128000	SHM NO. 05575	CIWARUGA	PARONGPONG		0	003	002	KP. CIWARUGA	003	06	\N	DYAH UMIYATI	2016-03-03	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	002	\N	\N	\N	\N	\N
595	609	SRI YULI WINARTI SIHOMBING	3273135907790010	JL. PALEDANG NO. 11 A	LENGKONG	PALEDANG	KOTA BANDUNG				DYAH UMIYATI	3273016909550001	JL PAK GATOT IV NO. 52-G KPAD	SUKASARI	GEGERKALONG	KOTA BANDUNG				128.00	1032000	0.00	0	132096000	0	132096000	SHM NO. 05576	CIWARUGA	PARONGPONG		0	003	001	KP. CIWARUGA	003	06	\N	DYAH UMIYATI	2016-03-03	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	003	002	\N	\N	\N	\N	\N
597	611	ASEP DAUD YUSUF	3217012308750005	KP. SUKAMANDI 	LEMBANG	LEMBANG	KAB. BANDUNG BARAT				HERI KUMALAWATI CS	3174084405570001	Jl. JL. KH MAHMUD V/16	PANCORAN	DUREN TIGA	JAKARTA SELATAN				124.00	537000	0.00	0	66588000	0	66588000	SHM NO. 4095	LEMBANG	LEMBANG		0	01	05	JL. MUTIARA II	002	05	\N	ACHMAD ZAKKI HERDANU	2016-03-03	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	04	\N	\N	\N	\N	\N
596	610	HIDAYAT	3217082011590003	POS WETAN	PADALARANG	KERTAMULYA	KAB. BANDUNG BARAT				HIDAYAT	3217082011590003	POS WETAN	PADALARANG	KERTAMULYA	KABUPATEN BANDUNG BARAT				94.00	285000	40.00	429000	26790000	17160000	43950000	SHM NO. 2157	KERTAMULYA	PADALARANG	SURAT KETERANGAN AKHLI WARIS NO : 474.3/04/WRS/PDL	0	002	013	KP. POS WETAN	002	13	\N	RUKMINI	2016-03-03	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	013	\N	\N	\N	\N	\N
530	542	PT GRAHA ADICIPTA NUGRAHA	3273175807670004	JL. MUARA SARI IV NO. 12 A	BOJONGLOA KIDUL	KEBONLEGA	KOTA BANDUNG			31.479.098.1-422.000	LYDIA JULIANI WIDHARMA	3273175807670004	JL. MUARA SARI IV NO. 12 A	BOJONGLOA KIDUL	KEBONLEGA	KOTA BANDUNG			__.___.___._-___.___	9024.00	64000	0.00	0	577536000	0	577536000	NO : 12/HGB/BPN.10.31/2016	PATARUMAN	CIHAMPELAS		0	005	011	BL. BALAKASAP	004	05	\N	OMBAH B HASAN	2016-02-29	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	005	011	\N	\N	\N	\N	\N
598	612	SANDI PURNAMA	3217061401850004	KOMPLEK GBR 1 BLOK F1 NO. 16A	NGAMPRAH	CILAME	KAB. BANDUNG BARAT				ASMAT	3217060507720012	JL. CIPEDES PESANTREN NO. 38	CICENDO	PAJAJARAN	KOTA BANDUNG				60.00	802000	22.00	595000	48120000	13090000	61210000	HGB NO. 4238	CILAME	NGAMPRAH		0	001	021	KO. BUKIT GALUDRA			\N	PT. RAYA DEVINDO	2016-03-03	\N	\N	\N	\N	\N	\N	KABUPATEN BANDUNG BARAT	002	003	\N	\N	\N	\N	\N
\.


--
-- Name: t_detailsptbphtb_t_iddetailsptbphtb_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailsptbphtb_t_iddetailsptbphtb_seq', 598, true);


--
-- Data for Name: t_pembayaranspt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_pembayaranspt (t_idpembayaranspt, t_idspt, t_kohirpembayaran, t_periodepembayaran, t_tanggalpembayaran, t_objekspt, t_idnotaris, t_ketetapanspt, t_nilaipembayaranspt, t_idkorekspt, t_kodebayarspt, t_verifikasispt, t_tglverifikasispt, t_pejabatverifikasispt, t_statusbayarspt, t_kodebayarbanksppt, t_dendabulan, t_pejabatpembayaranspt, t_idds, t_dendaspt) FROM stdin;
93	93	\N	\N	\N	\N	58	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-21	40	\N	201600015	\N	\N	\N	\N
94	94	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-21	40	\N	201600016	\N	\N	\N	\N
95	95	\N	\N	\N	\N	113	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-21	40	\N	201600017	\N	\N	\N	\N
96	96	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-21	40	\N	201600018	\N	\N	\N	\N
98	98	\N	\N	\N	\N	68	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-21	40	\N	201600020	\N	\N	\N	\N
99	99	\N	\N	\N	\N	59	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-21	40	\N	201600021	\N	\N	\N	\N
101	101	\N	\N	\N	\N	52	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-21	40	\N	201600023	\N	\N	\N	\N
100	100	\N	\N	\N	\N	95	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-21	40	\N	201600022	\N	\N	\N	\N
102	102	\N	\N	\N	\N	93	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-22	40	\N	201600024	\N	\N	\N	\N
97	97	\N	\N	\N	\N	115	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-01-21	40	\N	201600019	\N	\N	\N	\N
103	103	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-22	40	\N	201600025	\N	\N	\N	\N
104	104	\N	\N	\N	\N	60	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-22	40	\N	201600026	\N	\N	\N	\N
105	105	\N	\N	\N	\N	115	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-22	40	\N	201600027	\N	\N	\N	\N
106	106	\N	\N	\N	\N	115	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-22	40	\N	201600028	\N	\N	\N	\N
107	107	\N	\N	\N	\N	115	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-22	40	\N	201600029	\N	\N	\N	\N
108	108	\N	\N	\N	\N	59	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-22	40	\N	201600030	\N	\N	\N	\N
109	109	\N	\N	\N	\N	117	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-22	40	\N	201600031	\N	\N	\N	\N
110	110	\N	\N	\N	\N	109	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-22	40	\N	201600032	\N	\N	\N	\N
111	111	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-22	40	\N	201600033	\N	\N	\N	\N
112	112	\N	\N	\N	\N	101	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-22	40	\N	201600034	\N	\N	\N	\N
113	113	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600035	\N	\N	\N	\N
114	114	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600036	\N	\N	\N	\N
115	115	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600037	\N	\N	\N	\N
116	116	\N	\N	\N	\N	66	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600038	\N	\N	\N	\N
117	117	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600039	\N	\N	\N	\N
118	118	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	119	\N	201600040	\N	\N	\N	\N
119	119	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600041	\N	\N	\N	\N
120	120	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600042	\N	\N	\N	\N
121	121	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	119	\N	201600043	\N	\N	\N	\N
122	122	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600044	\N	\N	\N	\N
123	123	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	119	\N	201600045	\N	\N	\N	\N
124	124	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	119	\N	201600046	\N	\N	\N	\N
125	125	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	119	\N	201600047	\N	\N	\N	\N
126	126	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600048	\N	\N	\N	\N
127	127	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600049	\N	\N	\N	\N
128	128	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	119	\N	201600050	\N	\N	\N	\N
129	129	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600051	\N	\N	\N	\N
130	130	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	119	\N	201600052	\N	\N	\N	\N
131	131	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600053	\N	\N	\N	\N
132	132	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	119	\N	201600054	\N	\N	\N	\N
133	133	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600055	\N	\N	\N	\N
134	134	\N	\N	\N	\N	42	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600056	\N	\N	\N	\N
135	135	\N	\N	\N	\N	45	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	119	\N	201600057	\N	\N	\N	\N
136	136	\N	\N	\N	\N	42	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600058	\N	\N	\N	\N
137	137	\N	\N	\N	\N	121	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600059	\N	\N	\N	\N
138	138	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600060	\N	\N	\N	\N
78	76	\N	\N	\N	\N	104	\N	\N	\N	\N	["13","14","15","16","17","18"]	2016-01-20	40	\N	201600001	\N	\N	\N	\N
79	77	\N	\N	\N	\N	42	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-20	40	\N	201600002	\N	\N	\N	\N
80	78	\N	\N	\N	\N	106	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-01-20	40	\N	201600003	\N	\N	\N	\N
81	79	\N	\N	\N	\N	107	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-20	40	\N	201600004	\N	\N	\N	\N
139	139	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600061	\N	\N	\N	\N
140	140	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600062	\N	\N	\N	\N
84	84	\N	\N	\N	\N	108	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-20	40	\N	201600006	\N	\N	\N	\N
85	85	\N	\N	\N	\N	108	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-20	40	\N	201600007	\N	\N	\N	\N
86	86	\N	\N	\N	\N	89	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-20	40	\N	201600008	\N	\N	\N	\N
87	87	\N	\N	\N	\N	109	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-20	40	\N	201600009	\N	\N	\N	\N
88	88	\N	\N	\N	\N	109	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-20	40	\N	201600010	\N	\N	\N	\N
89	89	\N	\N	\N	\N	110	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-20	40	\N	201600011	\N	\N	\N	\N
83	80	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-20	40	\N	201600005	\N	\N	\N	\N
90	90	\N	\N	\N	\N	111	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-20	40	\N	201600012	\N	\N	\N	\N
91	91	\N	\N	\N	\N	42	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-20	40	\N	201600013	\N	\N	\N	\N
92	92	\N	\N	\N	\N	72	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-20	40	\N	201600014	\N	\N	\N	\N
141	141	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600063	\N	\N	\N	\N
142	142	\N	\N	\N	\N	122	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600064	\N	\N	\N	\N
143	143	\N	\N	\N	\N	71	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-01-25	40	\N	201600065	\N	\N	\N	\N
144	144	\N	\N	\N	\N	60	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600066	\N	\N	\N	\N
145	145	\N	\N	\N	\N	123	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600067	\N	\N	\N	\N
146	146	\N	\N	\N	\N	71	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	119	\N	201600068	\N	\N	\N	\N
147	147	\N	\N	\N	\N	90	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-25	40	\N	201600069	\N	\N	\N	\N
148	148	\N	\N	\N	\N	55	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-26	119	\N	201600070	\N	\N	\N	\N
149	149	\N	\N	\N	\N	55	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-26	119	\N	201600071	\N	\N	\N	\N
150	150	\N	\N	\N	\N	93	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-26	119	\N	201600072	\N	\N	\N	\N
151	151	\N	\N	\N	\N	56	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-26	119	\N	201600073	\N	\N	\N	\N
152	152	\N	\N	\N	\N	72	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-26	119	\N	201600074	\N	\N	\N	\N
153	153	\N	\N	\N	\N	113	\N	\N	\N	\N	["13","14","15","16","17","18"]	2016-01-26	119	\N	201600075	\N	\N	\N	\N
154	154	\N	\N	\N	\N	80	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-26	119	\N	201600076	\N	\N	\N	\N
155	155	\N	\N	\N	\N	56	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-26	119	\N	201600077	\N	\N	\N	\N
156	156	\N	\N	\N	\N	56	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-26	119	\N	201600078	\N	\N	\N	\N
157	157	\N	\N	\N	\N	46	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-26	119	\N	201600079	\N	\N	\N	\N
158	158	\N	\N	\N	\N	124	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-26	119	\N	201600080	\N	\N	\N	\N
159	159	\N	\N	\N	\N	125	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-26	119	\N	201600081	\N	\N	\N	\N
160	160	\N	\N	\N	\N	107	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-26	119	\N	201600082	\N	\N	\N	\N
161	161	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-26	119	\N	201600083	\N	\N	\N	\N
162	162	\N	\N	\N	\N	90	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-26	119	\N	201600084	\N	\N	\N	\N
163	163	\N	\N	\N	\N	122	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-01-26	119	\N	201600085	\N	\N	\N	\N
164	164	\N	\N	\N	\N	48	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-26	119	\N	201600086	\N	\N	\N	\N
165	165	\N	\N	\N	\N	42	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-26	119	\N	201600087	\N	\N	\N	\N
166	166	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-26	119	\N	201600088	\N	\N	\N	\N
167	167	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-26	119	\N	201600089	\N	\N	\N	\N
168	168	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-26	119	\N	201600090	\N	\N	\N	\N
169	169	\N	\N	\N	\N	58	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-27	119	\N	201600091	\N	\N	\N	\N
170	170	\N	\N	\N	\N	58	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-27	119	\N	201600092	\N	\N	\N	\N
171	171	\N	\N	\N	\N	108	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-27	119	\N	201600093	\N	\N	\N	\N
172	172	\N	\N	\N	\N	102	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-27	119	\N	201600094	\N	\N	\N	\N
173	173	\N	\N	\N	\N	90	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-27	119	\N	201600095	\N	\N	\N	\N
174	175	\N	\N	\N	\N	52	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-27	119	\N	201600096	\N	\N	\N	\N
175	176	\N	\N	\N	\N	52	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-27	119	\N	201600097	\N	\N	\N	\N
176	177	\N	\N	\N	\N	52	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-27	119	\N	201600098	\N	\N	\N	\N
177	178	\N	\N	\N	\N	108	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-27	119	\N	201600099	\N	\N	\N	\N
178	179	\N	\N	\N	\N	72	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-27	119	\N	201600100	\N	\N	\N	\N
179	180	\N	\N	\N	\N	42	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-27	119	\N	201600101	\N	\N	\N	\N
180	181	\N	\N	\N	\N	122	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-27	119	\N	201600102	\N	\N	\N	\N
181	182	\N	\N	\N	\N	57	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-27	119	\N	201600103	\N	\N	\N	\N
182	183	\N	\N	\N	\N	57	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-27	119	\N	201600104	\N	\N	\N	\N
183	184	\N	\N	\N	\N	127	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-28	40	\N	201600105	\N	\N	\N	\N
184	185	\N	2016	2016-01-15	\N	112	1	215250	\N	\N	["25","26","27","28","29","30","31"]	2016-01-15	2	t	201600106	\N	\N	\N	0
185	186	\N	\N	\N	\N	128	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-28	40	\N	201600107	\N	\N	\N	\N
186	187	\N	\N	\N	\N	112	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-01-15	2	\N	201600000	\N	\N	\N	\N
187	188	\N	\N	\N	\N	128	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-28	40	\N	201600109	\N	\N	\N	\N
188	189	\N	\N	\N	\N	85	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-28	40	\N	201600110	\N	\N	\N	\N
189	190	\N	\N	\N	\N	56	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-28	129	\N	201600111	\N	\N	\N	\N
190	191	\N	\N	\N	\N	130	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-28	40	\N	201600112	\N	\N	\N	\N
191	192	\N	\N	\N	\N	107	\N	\N	\N	\N	["13","14","15","16","17","18"]	2016-01-28	40	\N	201600113	\N	\N	\N	\N
192	193	\N	\N	\N	\N	89	\N	\N	\N	\N	["13","14","15","16","17","18"]	2016-01-28	40	\N	201600114	\N	\N	\N	\N
193	194	\N	\N	\N	\N	112	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-01-28	129	\N	201600115	\N	\N	\N	\N
194	195	\N	\N	\N	\N	45	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-28	40	\N	201600116	\N	\N	\N	\N
195	196	\N	\N	\N	\N	89	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-28	40	\N	201600117	\N	\N	\N	\N
196	197	\N	\N	\N	\N	93	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-29	40	\N	201600118	\N	\N	\N	\N
197	198	\N	\N	\N	\N	42	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-29	40	\N	201600119	\N	\N	\N	\N
198	199	\N	\N	\N	\N	72	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-29	40	\N	201600120	\N	\N	\N	\N
199	200	\N	\N	\N	\N	63	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-29	40	\N	201600121	\N	\N	\N	\N
200	201	\N	\N	\N	\N	63	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-29	40	\N	201600122	\N	\N	\N	\N
201	202	\N	\N	\N	\N	63	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-29	40	\N	201600123	\N	\N	\N	\N
202	203	\N	\N	\N	\N	63	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-29	40	\N	201600124	\N	\N	\N	\N
203	204	\N	\N	\N	\N	113	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-29	40	\N	201600125	\N	\N	\N	\N
204	205	\N	\N	\N	\N	94	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-29	40	\N	201600126	\N	\N	\N	\N
205	206	\N	\N	\N	\N	106	\N	\N	\N	\N	["38","39","40","41","42","43"]	2016-01-29	40	\N	201600127	\N	\N	\N	\N
206	207	\N	\N	\N	\N	106	\N	\N	\N	\N	["38","39","40","41","42","43"]	2016-01-29	40	\N	201600128	\N	\N	\N	\N
207	208	\N	\N	\N	\N	130	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-29	40	\N	201600129	\N	\N	\N	\N
208	209	\N	\N	\N	\N	99	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-29	40	\N	201600130	\N	\N	\N	\N
209	210	\N	\N	\N	\N	99	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-29	40	\N	201600131	\N	\N	\N	\N
210	211	\N	\N	\N	\N	93	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-01	40	\N	201600132	\N	\N	\N	\N
211	212	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-01	119	\N	201600133	\N	\N	\N	\N
212	213	\N	\N	\N	\N	49	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-01	40	\N	201600134	\N	\N	\N	\N
213	214	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-01	40	\N	201600135	\N	\N	\N	\N
214	215	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-01	119	\N	201600136	\N	\N	\N	\N
215	216	\N	\N	\N	\N	131	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-01	119	\N	201600137	\N	\N	\N	\N
216	217	\N	\N	\N	\N	132	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-01	40	\N	201600138	\N	\N	\N	\N
217	218	\N	\N	\N	\N	132	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-01	40	\N	201600139	\N	\N	\N	\N
218	219	\N	\N	\N	\N	93	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-01	119	\N	201600140	\N	\N	\N	\N
219	220	\N	\N	\N	\N	132	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-01	40	\N	201600141	\N	\N	\N	\N
220	221	\N	\N	\N	\N	93	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-01	119	\N	201600142	\N	\N	\N	\N
221	222	\N	\N	\N	\N	104	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-01	40	\N	201600143	\N	\N	\N	\N
222	223	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-01	40	\N	201600144	\N	\N	\N	\N
223	224	\N	\N	\N	\N	93	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-01	40	\N	201600145	\N	\N	\N	\N
224	225	\N	\N	\N	\N	59	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-01	40	\N	201600146	\N	\N	\N	\N
225	226	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	40	\N	201600147	\N	\N	\N	\N
226	227	\N	\N	\N	\N	122	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-02-02	40	\N	201600148	\N	\N	\N	\N
227	228	\N	\N	\N	\N	124	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	119	\N	201600149	\N	\N	\N	\N
228	229	\N	\N	\N	\N	98	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	40	\N	201600150	\N	\N	\N	\N
229	230	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	40	\N	201600151	\N	\N	\N	\N
230	231	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	40	\N	201600152	\N	\N	\N	\N
231	232	\N	\N	\N	\N	108	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	119	\N	201600153	\N	\N	\N	\N
232	233	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	40	\N	201600154	\N	\N	\N	\N
233	234	\N	\N	\N	\N	108	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	119	\N	201600155	\N	\N	\N	\N
234	235	\N	\N	\N	\N	89	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	40	\N	201600156	\N	\N	\N	\N
235	236	\N	\N	\N	\N	127	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	40	\N	201600157	\N	\N	\N	\N
236	237	\N	\N	\N	\N	91	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	40	\N	201600158	\N	\N	\N	\N
237	238	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	119	\N	201600159	\N	\N	\N	\N
238	239	\N	\N	\N	\N	66	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	40	\N	201600160	\N	\N	\N	\N
239	240	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	119	\N	201600161	\N	\N	\N	\N
240	241	\N	\N	\N	\N	66	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	40	\N	201600162	\N	\N	\N	\N
241	242	\N	\N	\N	\N	71	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	40	\N	201600163	\N	\N	\N	\N
242	243	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	119	\N	201600164	\N	\N	\N	\N
243	244	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	40	\N	201600165	\N	\N	\N	\N
244	245	\N	\N	\N	\N	90	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	40	\N	201600166	\N	\N	\N	\N
245	246	\N	\N	\N	\N	90	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	40	\N	201600167	\N	\N	\N	\N
246	247	\N	\N	\N	\N	60	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	119	\N	201600168	\N	\N	\N	\N
247	248	\N	\N	\N	\N	60	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-02	119	\N	201600169	\N	\N	\N	\N
248	249	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-03	119	\N	201600170	\N	\N	\N	\N
249	250	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-03	119	\N	201600171	\N	\N	\N	\N
250	251	\N	\N	\N	\N	105	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-03	119	\N	201600172	\N	\N	\N	\N
251	252	\N	\N	\N	\N	106	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-02-03	40	\N	201600173	\N	\N	\N	\N
253	254	\N	\N	\N	\N	134	\N	\N	\N	\N	["44","45","46","47","48","49"]	2016-02-03	40	\N	201600175	\N	\N	\N	\N
252	253	\N	\N	\N	\N	124	\N	\N	\N	\N	["13","14","15","16","17","18"]	2016-02-03	40	\N	201600174	\N	\N	\N	\N
254	255	\N	\N	\N	\N	113	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-03	119	\N	201600176	\N	\N	\N	\N
255	256	\N	\N	\N	\N	82	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-03	40	\N	201600177	\N	\N	\N	\N
256	257	\N	\N	\N	\N	60	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-03	119	\N	201600178	\N	\N	\N	\N
257	258	\N	\N	\N	\N	109	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-03	40	\N	201600179	\N	\N	\N	\N
258	259	\N	\N	\N	\N	109	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-03	119	\N	201600180	\N	\N	\N	\N
259	260	\N	\N	\N	\N	94	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-04	40	\N	201600181	\N	\N	\N	\N
260	261	\N	\N	\N	\N	135	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-04	40	\N	201600182	\N	\N	\N	\N
261	262	\N	\N	\N	\N	136	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-04	40	\N	201600183	\N	\N	\N	\N
262	263	\N	\N	\N	\N	43	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-04	40	\N	201600184	\N	\N	\N	\N
263	264	\N	\N	\N	\N	126	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-05	40	\N	201600185	\N	\N	\N	\N
264	265	\N	\N	\N	\N	42	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-05	40	\N	201600186	\N	\N	\N	\N
265	266	\N	\N	\N	\N	136	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-05	40	\N	201600187	\N	\N	\N	\N
267	268	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-05	40	\N	201600189	\N	\N	\N	\N
268	269	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-05	119	\N	201600190	\N	\N	\N	\N
266	267	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-05	119	\N	201600188	\N	\N	\N	\N
269	270	\N	\N	\N	\N	111	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-05	40	\N	201600191	\N	\N	\N	\N
303	304	\N	\N	\N	\N	125	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-10	40	\N	201600224	\N	\N	\N	\N
282	283	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-09	40	\N	201600203	\N	\N	\N	\N
271	272	\N	\N	\N	\N	115	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-05	40	\N	201600192	\N	\N	\N	\N
273	274	\N	\N	\N	\N	80	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-05	119	\N	201600194	\N	\N	\N	\N
274	275	\N	\N	\N	\N	63	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-05	40	\N	201600195	\N	\N	\N	\N
275	276	\N	\N	\N	\N	71	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-05	40	\N	201600196	\N	\N	\N	\N
276	277	\N	\N	\N	\N	108	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-05	119	\N	201600197	\N	\N	\N	\N
277	278	\N	\N	\N	\N	108	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-05	119	\N	201600198	\N	\N	\N	\N
278	279	\N	\N	\N	\N	108	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-05	119	\N	201600199	\N	\N	\N	\N
279	280	\N	\N	\N	\N	110	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-05	119	\N	201600200	\N	\N	\N	\N
280	281	\N	\N	\N	\N	108	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-05	119	\N	201600201	\N	\N	\N	\N
281	282	\N	\N	\N	\N	82	\N	\N	\N	\N	["13","14","15","16","17","18"]	2016-02-09	119	\N	201600202	\N	\N	\N	\N
283	284	\N	\N	\N	\N	108	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-09	119	\N	201600204	\N	\N	\N	\N
284	285	\N	\N	\N	\N	110	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-09	119	\N	201600205	\N	\N	\N	\N
285	286	\N	\N	\N	\N	98	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-09	40	\N	201600206	\N	\N	\N	\N
286	287	\N	\N	\N	\N	57	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-09	119	\N	201600207	\N	\N	\N	\N
287	288	\N	\N	\N	\N	57	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-09	119	\N	201600208	\N	\N	\N	\N
288	289	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-09	40	\N	201600209	\N	\N	\N	\N
289	290	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-09	40	\N	201600210	\N	\N	\N	\N
290	291	\N	\N	\N	\N	109	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-09	119	\N	201600211	\N	\N	\N	\N
291	292	\N	\N	\N	\N	55	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-09	40	\N	201600212	\N	\N	\N	\N
292	293	\N	\N	\N	\N	66	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-09	40	\N	201600213	\N	\N	\N	\N
293	294	\N	\N	\N	\N	127	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-09	119	\N	201600214	\N	\N	\N	\N
294	295	\N	\N	\N	\N	138	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-09	40	\N	201600215	\N	\N	\N	\N
295	296	\N	\N	\N	\N	127	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-09	119	\N	201600216	\N	\N	\N	\N
296	297	\N	\N	\N	\N	138	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-09	40	\N	201600217	\N	\N	\N	\N
297	298	\N	\N	\N	\N	127	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-09	119	\N	201600218	\N	\N	\N	\N
298	300	\N	\N	\N	\N	104	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-10	40	\N	201600219	\N	\N	\N	\N
299	299	\N	\N	\N	\N	104	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-10	119	\N	201600220	\N	\N	\N	\N
300	301	\N	\N	\N	\N	106	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-02-10	40	\N	201600221	\N	\N	\N	\N
301	302	\N	\N	\N	\N	106	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-02-10	119	\N	201600222	\N	\N	\N	\N
302	303	\N	\N	\N	\N	91	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-10	40	\N	201600223	\N	\N	\N	\N
304	305	\N	\N	\N	\N	90	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-10	119	\N	201600225	\N	\N	\N	\N
305	306	\N	\N	\N	\N	111	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-10	40	\N	201600226	\N	\N	\N	\N
306	307	\N	\N	\N	\N	126	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-10	119	\N	201600227	\N	\N	\N	\N
307	308	\N	\N	\N	\N	91	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-10	40	\N	201600228	\N	\N	\N	\N
308	309	\N	\N	\N	\N	89	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-10	119	\N	201600229	\N	\N	\N	\N
309	310	\N	\N	\N	\N	139	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-10	40	\N	201600230	\N	\N	\N	\N
310	311	\N	\N	\N	\N	92	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-10	119	\N	201600231	\N	\N	\N	\N
311	312	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-10	119	\N	201600232	\N	\N	\N	\N
312	313	\N	\N	\N	\N	96	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-10	119	\N	201600233	\N	\N	\N	\N
313	314	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-10	40	\N	201600234	\N	\N	\N	\N
314	315	\N	\N	\N	\N	127	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-10	119	\N	201600235	\N	\N	\N	\N
315	316	\N	\N	\N	\N	105	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-10	40	\N	201600236	\N	\N	\N	\N
316	317	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-11	40	\N	201600237	\N	\N	\N	\N
317	318	\N	\N	\N	\N	124	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-11	40	\N	201600238	\N	\N	\N	\N
318	319	\N	\N	\N	\N	99	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-11	119	\N	201600239	\N	\N	\N	\N
319	320	\N	\N	\N	\N	89	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-11	40	\N	201600240	\N	\N	\N	\N
270	271	\N	\N	\N	\N	115	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-05	40	\N	201600293	\N	\N	\N	\N
320	321	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-11	40	\N	201600241	\N	\N	\N	\N
321	323	\N	\N	\N	\N	50	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-11	119	\N	201600242	\N	\N	\N	\N
322	322	\N	\N	\N	\N	140	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-11	40	\N	201600243	\N	\N	\N	\N
323	325	\N	\N	\N	\N	50	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-11	119	\N	201600244	\N	\N	\N	\N
324	324	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-11	40	\N	201600245	\N	\N	\N	\N
325	326	\N	\N	\N	\N	50	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-11	119	\N	201600246	\N	\N	\N	\N
326	327	\N	\N	\N	\N	50	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-11	40	\N	201600247	\N	\N	\N	\N
327	328	\N	\N	\N	\N	50	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-11	119	\N	201600248	\N	\N	\N	\N
328	329	\N	\N	\N	\N	111	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-11	40	\N	201600249	\N	\N	\N	\N
329	330	\N	\N	\N	\N	50	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-11	119	\N	201600250	\N	\N	\N	\N
330	331	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-11	119	\N	201600251	\N	\N	\N	\N
331	332	\N	\N	\N	\N	60	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-11	40	\N	201600252	\N	\N	\N	\N
332	333	\N	\N	\N	\N	54	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-12	40	\N	201600253	\N	\N	\N	\N
333	334	\N	\N	\N	\N	133	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-12	119	\N	201600254	\N	\N	\N	\N
334	335	\N	\N	\N	\N	133	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-12	40	\N	201600255	\N	\N	\N	\N
335	336	\N	2015	2015-10-29	\N	141	1	25225200	\N	\N	["1","2","3","4","5","6"]	2015-10-29	40	t	201600256	\N	\N	\N	0
336	338	\N	\N	\N	\N	120	\N	\N	\N	\N	["13","14","15","16","17","18"]	2016-02-12	119	\N	201600258	\N	\N	\N	\N
337	339	\N	\N	\N	\N	42	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-12	40	\N	201600259	\N	\N	\N	\N
338	340	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-12	119	\N	201600260	\N	\N	\N	\N
339	341	\N	\N	\N	\N	71	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-12	40	\N	201600261	\N	\N	\N	\N
340	342	\N	\N	\N	\N	94	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-12	40	\N	201600262	\N	\N	\N	\N
341	343	\N	\N	\N	\N	102	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-12	119	\N	201600263	\N	\N	\N	\N
342	344	\N	\N	\N	\N	127	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	40	\N	201600264	\N	\N	\N	\N
343	345	\N	\N	\N	\N	127	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	40	\N	201600265	\N	\N	\N	\N
344	346	\N	\N	\N	\N	104	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	119	\N	201600266	\N	\N	\N	\N
345	347	\N	\N	\N	\N	46	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	119	\N	201600267	\N	\N	\N	\N
346	348	\N	\N	\N	\N	41	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-02-15	40	\N	201600268	\N	\N	\N	\N
347	349	\N	\N	\N	\N	96	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	40	\N	201600269	\N	\N	\N	\N
348	350	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	119	\N	201600270	\N	\N	\N	\N
349	351	\N	\N	\N	\N	42	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	119	\N	201600271	\N	\N	\N	\N
350	352	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-01-05	119	\N	201600272	\N	\N	\N	\N
351	353	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	40	\N	201600273	\N	\N	\N	\N
352	354	\N	\N	\N	\N	110	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	119	\N	201600274	\N	\N	\N	\N
353	355	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	40	\N	201600275	\N	\N	\N	\N
354	356	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	40	\N	201600276	\N	\N	\N	\N
355	357	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	40	\N	201600277	\N	\N	\N	\N
356	358	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	119	\N	201600278	\N	\N	\N	\N
357	359	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	40	\N	201600279	\N	\N	\N	\N
272	273	\N	\N	\N	\N	126	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-05	119	\N	201600193	\N	\N	\N	\N
358	360	\N	\N	\N	\N	115	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	40	\N	201600280	\N	\N	\N	\N
359	361	\N	\N	\N	\N	80	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	119	\N	201600281	\N	\N	\N	\N
360	362	\N	\N	\N	\N	80	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	119	\N	201600282	\N	\N	\N	\N
361	363	\N	\N	\N	\N	45	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	40	\N	201600283	\N	\N	\N	\N
362	364	\N	\N	\N	\N	131	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	40	\N	201600284	\N	\N	\N	\N
363	365	\N	\N	\N	\N	72	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-15	40	\N	201600285	\N	\N	\N	\N
364	366	\N	\N	\N	\N	106	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-02-16	40	\N	201600286	\N	\N	\N	\N
365	367	\N	\N	\N	\N	106	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-02-16	119	\N	201600287	\N	\N	\N	\N
366	368	\N	\N	\N	\N	109	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	119	\N	201600288	\N	\N	\N	\N
367	369	\N	\N	\N	\N	109	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	40	\N	201600289	\N	\N	\N	\N
368	370	\N	\N	\N	\N	72	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	119	\N	201600290	\N	\N	\N	\N
369	371	\N	\N	\N	\N	60	\N	\N	\N	\N	["38","39","40","41","42","43"]	2016-02-16	119	\N	201600291	\N	\N	\N	\N
370	372	\N	\N	\N	\N	63	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	119	\N	201600292	\N	\N	\N	\N
371	373	\N	\N	\N	\N	49	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	119	\N	201600294	\N	\N	\N	\N
372	375	\N	\N	\N	\N	71	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	40	\N	201600295	\N	\N	\N	\N
373	374	\N	\N	\N	\N	49	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	119	\N	201600296	\N	\N	\N	\N
374	376	\N	\N	\N	\N	89	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	40	\N	201600297	\N	\N	\N	\N
375	377	\N	\N	\N	\N	89	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	119	\N	201600298	\N	\N	\N	\N
376	378	\N	\N	\N	\N	89	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	119	\N	201600299	\N	\N	\N	\N
377	379	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	40	\N	201600300	\N	\N	\N	\N
378	380	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	40	\N	201600301	\N	\N	\N	\N
379	381	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	40	\N	201600302	\N	\N	\N	\N
380	382	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	40	\N	201600303	\N	\N	\N	\N
381	383	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	40	\N	201600304	\N	\N	\N	\N
382	384	\N	\N	\N	\N	142	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	119	\N	201600305	\N	\N	\N	\N
383	385	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	40	\N	201600306	\N	\N	\N	\N
384	386	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	119	\N	201600307	\N	\N	\N	\N
385	387	\N	\N	\N	\N	142	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	119	\N	201600308	\N	\N	\N	\N
386	388	\N	\N	\N	\N	108	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-16	40	\N	201600309	\N	\N	\N	\N
387	389	\N	\N	\N	\N	61	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-17	119	\N	201600310	\N	\N	\N	\N
388	390	\N	\N	\N	\N	45	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-17	119	\N	201600311	\N	\N	\N	\N
389	391	\N	\N	\N	\N	84	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-17	40	\N	201600312	\N	\N	\N	\N
390	392	\N	\N	\N	\N	102	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-17	119	\N	201600313	\N	\N	\N	\N
391	393	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-17	119	\N	201600314	\N	\N	\N	\N
392	394	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-17	119	\N	201600315	\N	\N	\N	\N
393	395	\N	\N	\N	\N	113	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-17	119	\N	201600316	\N	\N	\N	\N
394	396	\N	\N	\N	\N	42	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-17	119	\N	201600317	\N	\N	\N	\N
395	397	\N	\N	\N	\N	117	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-17	119	\N	201600318	\N	\N	\N	\N
396	398	\N	\N	\N	\N	46	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-17	119	\N	201600319	\N	\N	\N	\N
397	399	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-17	119	\N	201600320	\N	\N	\N	\N
398	400	\N	\N	\N	\N	143	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-17	119	\N	201600321	\N	\N	\N	\N
402	405	\N	\N	\N	\N	46	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-18	119	\N	201600322	\N	\N	\N	\N
403	407	\N	\N	\N	\N	72	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-18	119	\N	201600323	\N	\N	\N	\N
404	408	\N	\N	\N	\N	141	\N	\N	\N	\N	["1","2","3","4","5","6"]	2015-10-29	2	\N	201600257	\N	\N	\N	\N
405	409	\N	\N	\N	\N	125	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-18	119	\N	201600324	\N	\N	\N	\N
406	410	\N	\N	\N	\N	109	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-18	40	\N	201600325	\N	\N	\N	\N
407	411	\N	\N	\N	\N	57	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-18	119	\N	201600326	\N	\N	\N	\N
408	413	\N	\N	\N	\N	57	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-18	119	\N	201600327	\N	\N	\N	\N
409	412	\N	\N	\N	\N	141	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-18	40	\N	201600328	\N	\N	\N	\N
410	414	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-18	119	\N	201600329	\N	\N	\N	\N
411	415	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-18	119	\N	201600330	\N	\N	\N	\N
412	416	\N	\N	\N	\N	42	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-18	119	\N	201600331	\N	\N	\N	\N
413	417	\N	\N	\N	\N	47	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-18	119	\N	201600332	\N	\N	\N	\N
414	418	\N	\N	\N	\N	66	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-18	40	\N	201600333	\N	\N	\N	\N
415	419	\N	\N	\N	\N	72	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-18	119	\N	201600334	\N	\N	\N	\N
416	420	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-19	119	\N	201600335	\N	\N	\N	\N
417	421	\N	\N	\N	\N	104	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-19	119	\N	201600336	\N	\N	\N	\N
418	422	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-19	119	\N	201600337	\N	\N	\N	\N
419	423	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-19	40	\N	201600338	\N	\N	\N	\N
420	424	\N	\N	\N	\N	58	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-02-19	119	\N	201600339	\N	\N	\N	\N
421	425	\N	\N	\N	\N	58	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-19	119	\N	201600340	\N	\N	\N	\N
422	426	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-19	119	\N	201600341	\N	\N	\N	\N
423	427	\N	\N	\N	\N	131	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-19	119	\N	201600342	\N	\N	\N	\N
424	428	\N	\N	\N	\N	131	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-19	119	\N	201600343	\N	\N	\N	\N
425	430	\N	\N	\N	\N	131	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-19	119	\N	201600344	\N	\N	\N	\N
426	431	\N	\N	\N	\N	131	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-19	119	\N	201600345	\N	\N	\N	\N
427	432	\N	\N	\N	\N	131	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-19	119	\N	201600346	\N	\N	\N	\N
428	433	\N	\N	\N	\N	93	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-19	40	\N	201600347	\N	\N	\N	\N
429	434	\N	\N	\N	\N	56	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-19	40	\N	201600348	\N	\N	\N	\N
430	435	\N	\N	\N	\N	131	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-19	40	\N	201600349	\N	\N	\N	\N
431	436	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-22	119	\N	201600350	\N	\N	\N	\N
432	437	\N	\N	\N	\N	46	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-22	119	\N	201600351	\N	\N	\N	\N
433	438	\N	\N	\N	\N	104	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-22	40	\N	201600352	\N	\N	\N	\N
434	439	\N	\N	\N	\N	124	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-22	119	\N	201600353	\N	\N	\N	\N
435	440	\N	\N	\N	\N	130	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-22	40	\N	201600354	\N	\N	\N	\N
436	441	\N	\N	\N	\N	130	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-22	119	\N	201600355	\N	\N	\N	\N
437	442	\N	\N	\N	\N	130	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-22	40	\N	201600356	\N	\N	\N	\N
438	443	\N	\N	\N	\N	109	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-22	119	\N	201600357	\N	\N	\N	\N
439	444	\N	\N	\N	\N	112	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-02-22	119	\N	201600358	\N	\N	\N	\N
440	445	\N	\N	\N	\N	72	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-22	40	\N	201600359	\N	\N	\N	\N
441	446	\N	\N	\N	\N	42	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-22	40	\N	201600360	\N	\N	\N	\N
442	447	\N	\N	\N	\N	123	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-22	40	\N	201600361	\N	\N	\N	\N
443	448	\N	\N	\N	\N	95	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-22	40	\N	201600362	\N	\N	\N	\N
444	449	\N	\N	\N	\N	100	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-22	40	\N	201600363	\N	\N	\N	\N
445	450	\N	\N	\N	\N	107	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-22	40	\N	201600364	\N	\N	\N	\N
446	451	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-22	119	\N	201600365	\N	\N	\N	\N
447	452	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-22	119	\N	201600366	\N	\N	\N	\N
448	429	\N	2010	2010-06-23	\N	124	1	1016000	\N	\N	["1","2","3","4","5","6"]	2010-06-23	40	t	201600367	\N	\N	\N	0
449	453	\N	\N	\N	\N	124	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-22	40	\N	201600369	\N	\N	\N	\N
450	455	\N	\N	\N	\N	93	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	119	\N	201600370	\N	\N	\N	\N
451	456	\N	\N	\N	\N	93	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	119	\N	201600371	\N	\N	\N	\N
452	457	\N	\N	\N	\N	130	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	40	\N	201600372	\N	\N	\N	\N
453	458	\N	\N	\N	\N	104	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	119	\N	201600373	\N	\N	\N	\N
454	459	\N	\N	\N	\N	58	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	119	\N	201600374	\N	\N	\N	\N
455	460	\N	\N	\N	\N	42	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	119	\N	201600375	\N	\N	\N	\N
456	461	\N	\N	\N	\N	124	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	119	\N	201600376	\N	\N	\N	\N
457	462	\N	\N	\N	\N	124	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	119	\N	201600377	\N	\N	\N	\N
458	463	\N	\N	\N	\N	124	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	40	\N	201600378	\N	\N	\N	\N
459	464	\N	\N	\N	\N	106	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-02-23	40	\N	201600379	\N	\N	\N	\N
460	465	\N	\N	\N	\N	68	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	40	\N	201600380	\N	\N	\N	\N
461	466	\N	\N	\N	\N	124	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	119	\N	201600381	\N	\N	\N	\N
462	467	\N	\N	\N	\N	94	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	119	\N	201600382	\N	\N	\N	\N
463	468	\N	\N	\N	\N	122	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	119	\N	201600383	\N	\N	\N	\N
464	469	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	119	\N	201600384	\N	\N	\N	\N
465	470	\N	\N	\N	\N	109	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	119	\N	201600385	\N	\N	\N	\N
466	471	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	119	\N	201600386	\N	\N	\N	\N
467	472	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	119	\N	201600387	\N	\N	\N	\N
468	473	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	119	\N	201600388	\N	\N	\N	\N
469	474	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	119	\N	201600389	\N	\N	\N	\N
470	475	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	119	\N	201600390	\N	\N	\N	\N
471	476	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	119	\N	201600391	\N	\N	\N	\N
472	477	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	119	\N	201600392	\N	\N	\N	\N
473	478	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	40	\N	201600393	\N	\N	\N	\N
474	479	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	40	\N	201600394	\N	\N	\N	\N
475	480	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-23	40	\N	201600395	\N	\N	\N	\N
476	481	\N	\N	\N	\N	59	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	119	\N	201600396	\N	\N	\N	\N
477	482	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	40	\N	201600397	\N	\N	\N	\N
478	483	\N	\N	\N	\N	106	\N	\N	\N	\N	["38","39","40","41","42","43"]	2016-02-24	119	\N	201600398	\N	\N	\N	\N
479	485	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	119	\N	201600399	\N	\N	\N	\N
480	486	\N	\N	\N	\N	127	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	119	\N	201600400	\N	\N	\N	\N
481	487	\N	\N	\N	\N	57	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	119	\N	201600401	\N	\N	\N	\N
482	488	\N	\N	\N	\N	52	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	119	\N	201600402	\N	\N	\N	\N
483	489	\N	\N	\N	\N	108	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	119	\N	201600403	\N	\N	\N	\N
484	490	\N	\N	\N	\N	108	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	119	\N	201600404	\N	\N	\N	\N
485	491	\N	\N	\N	\N	108	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	119	\N	201600405	\N	\N	\N	\N
486	492	\N	\N	\N	\N	44	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	40	\N	201600406	\N	\N	\N	\N
487	493	\N	\N	\N	\N	108	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	119	\N	201600407	\N	\N	\N	\N
488	494	\N	\N	\N	\N	44	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	40	\N	201600408	\N	\N	\N	\N
489	495	\N	\N	\N	\N	108	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	119	\N	201600409	\N	\N	\N	\N
490	496	\N	\N	\N	\N	44	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	40	\N	201600410	\N	\N	\N	\N
491	497	\N	\N	\N	\N	108	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	119	\N	201600411	\N	\N	\N	\N
492	498	\N	\N	\N	\N	98	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	119	\N	201600412	\N	\N	\N	\N
493	499	\N	\N	\N	\N	98	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	119	\N	201600413	\N	\N	\N	\N
494	500	\N	\N	\N	\N	56	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	40	\N	201600414	\N	\N	\N	\N
495	501	\N	\N	\N	\N	106	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-02-24	119	\N	201600415	\N	\N	\N	\N
496	502	\N	\N	\N	\N	63	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	119	\N	201600416	\N	\N	\N	\N
497	503	\N	\N	\N	\N	143	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	119	\N	201600417	\N	\N	\N	\N
498	504	\N	\N	\N	\N	143	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-24	119	\N	201600418	\N	\N	\N	\N
499	505	\N	\N	\N	\N	127	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-25	119	\N	201600419	\N	\N	\N	\N
500	506	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-25	40	\N	201600420	\N	\N	\N	\N
501	507	\N	\N	\N	\N	72	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-25	119	\N	201600421	\N	\N	\N	\N
502	508	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-25	40	\N	201600422	\N	\N	\N	\N
503	484	\N	\N	\N	\N	112	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-25	40	\N	201600423	\N	\N	\N	\N
504	509	\N	\N	\N	\N	112	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-02-25	40	\N	201600424	\N	\N	\N	\N
505	510	\N	\N	\N	\N	42	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-25	119	\N	201600425	\N	\N	\N	\N
506	511	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-25	119	\N	201600426	\N	\N	\N	\N
507	514	\N	\N	\N	\N	98	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-25	40	\N	201600427	\N	\N	\N	\N
508	515	\N	\N	\N	\N	139	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-25	119	\N	201600428	\N	\N	\N	\N
509	516	\N	\N	\N	\N	139	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-25	40	\N	201600429	\N	\N	\N	\N
510	517	\N	\N	\N	\N	139	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-25	119	\N	201600430	\N	\N	\N	\N
511	518	\N	\N	\N	\N	139	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-25	40	\N	201600431	\N	\N	\N	\N
512	519	\N	\N	\N	\N	144	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-25	119	\N	201600432	\N	\N	\N	\N
513	520	\N	\N	\N	\N	48	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-25	119	\N	201600433	\N	\N	\N	\N
514	521	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-26	119	\N	201600434	\N	\N	\N	\N
515	522	\N	\N	\N	\N	71	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-26	119	\N	201600435	\N	\N	\N	\N
516	523	\N	\N	\N	\N	89	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-26	40	\N	201600436	\N	\N	\N	\N
517	524	\N	\N	\N	\N	60	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-26	119	\N	201600437	\N	\N	\N	\N
518	525	\N	\N	\N	\N	102	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-26	119	\N	201600438	\N	\N	\N	\N
519	526	\N	\N	\N	\N	93	\N	\N	\N	\N	["38","39","40","41","42","43"]	2016-02-26	40	\N	201600439	\N	\N	\N	\N
520	527	\N	\N	\N	\N	141	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-26	119	\N	201600440	\N	\N	\N	\N
521	528	\N	\N	\N	\N	93	\N	\N	\N	\N	["38","39","40","41","42","43"]	2016-02-26	40	\N	201600441	\N	\N	\N	\N
522	529	\N	\N	\N	\N	122	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-26	119	\N	201600442	\N	\N	\N	\N
523	530	\N	\N	\N	\N	93	\N	\N	\N	\N	["38","39","40","41","42","43"]	2016-02-26	40	\N	201600443	\N	\N	\N	\N
524	531	\N	\N	\N	\N	93	\N	\N	\N	\N	["38","39","40","41","42","43"]	2016-02-26	119	\N	201600444	\N	\N	\N	\N
525	532	\N	\N	\N	\N	93	\N	\N	\N	\N	["38","39","40","41","42","43"]	2016-02-26	40	\N	201600445	\N	\N	\N	\N
526	533	\N	\N	\N	\N	93	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-26	119	\N	201600446	\N	\N	\N	\N
527	534	\N	\N	\N	\N	93	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-29	119	\N	201600447	\N	\N	\N	\N
528	535	\N	\N	\N	\N	93	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-29	119	\N	201600448	\N	\N	\N	\N
529	536	\N	\N	\N	\N	56	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-29	119	\N	201600449	\N	\N	\N	\N
530	542	\N	\N	\N	\N	106	\N	\N	\N	\N	["38","39","40","41","42","43"]	2016-02-29	119	\N	201600450	\N	\N	\N	\N
531	543	\N	\N	\N	\N	60	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-29	40	\N	201600451	\N	\N	\N	\N
532	544	\N	\N	\N	\N	61	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-29	119	\N	201600452	\N	\N	\N	\N
533	545	\N	\N	\N	\N	126	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-29	40	\N	201600453	\N	\N	\N	\N
534	546	\N	\N	\N	\N	126	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-29	119	\N	201600454	\N	\N	\N	\N
535	547	\N	\N	\N	\N	105	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-29	40	\N	201600455	\N	\N	\N	\N
536	548	\N	\N	\N	\N	95	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-29	40	\N	201600456	\N	\N	\N	\N
537	549	\N	\N	\N	\N	45	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-02-29	119	\N	201600457	\N	\N	\N	\N
538	550	\N	\N	\N	\N	45	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-29	119	\N	201600458	\N	\N	\N	\N
539	551	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-29	119	\N	201600459	\N	\N	\N	\N
540	552	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-02-29	40	\N	201600460	\N	\N	\N	\N
541	553	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600461	\N	\N	\N	\N
542	566	\N	\N	\N	\N	93	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	40	\N	201600462	\N	\N	\N	\N
543	564	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600463	\N	\N	\N	\N
544	563	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600464	\N	\N	\N	\N
545	567	\N	\N	\N	\N	100	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	40	\N	201600465	\N	\N	\N	\N
546	562	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600466	\N	\N	\N	\N
547	561	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600467	\N	\N	\N	\N
548	560	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600468	\N	\N	\N	\N
549	559	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600469	\N	\N	\N	\N
550	558	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600470	\N	\N	\N	\N
551	557	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600471	\N	\N	\N	\N
552	556	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600472	\N	\N	\N	\N
553	555	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600473	\N	\N	\N	\N
554	554	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600474	\N	\N	\N	\N
555	565	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600475	\N	\N	\N	\N
556	568	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600476	\N	\N	\N	\N
557	569	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600477	\N	\N	\N	\N
558	570	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600478	\N	\N	\N	\N
559	571	\N	\N	\N	\N	106	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-03-01	119	\N	201600479	\N	\N	\N	\N
560	572	\N	\N	\N	\N	109	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600480	\N	\N	\N	\N
561	573	\N	\N	\N	\N	89	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600481	\N	\N	\N	\N
562	574	\N	\N	\N	\N	145	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600482	\N	\N	\N	\N
563	575	\N	\N	\N	\N	118	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	40	\N	201600483	\N	\N	\N	\N
564	576	\N	\N	\N	\N	122	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	119	\N	201600484	\N	\N	\N	\N
565	577	\N	\N	\N	\N	57	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-01	40	\N	201600485	\N	\N	\N	\N
566	578	\N	\N	\N	\N	93	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-02	119	\N	201600486	\N	\N	\N	\N
567	579	\N	\N	\N	\N	93	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-02	40	\N	201600487	\N	\N	\N	\N
568	580	\N	\N	\N	\N	120	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-02	119	\N	201600488	\N	\N	\N	\N
569	581	\N	\N	\N	\N	42	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-02	40	\N	201600489	\N	\N	\N	\N
570	582	\N	\N	\N	\N	146	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-02	40	\N	201600490	\N	\N	\N	\N
571	583	\N	\N	\N	\N	95	\N	\N	\N	\N	["38","39","40","41","42","43"]	2016-03-02	119	\N	201600491	\N	\N	\N	\N
572	584	\N	\N	\N	\N	55	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-02	40	\N	201600492	\N	\N	\N	\N
573	585	\N	\N	\N	\N	95	\N	\N	\N	\N	["38","39","40","41","42","43"]	2016-03-02	119	\N	201600493	\N	\N	\N	\N
574	586	\N	\N	\N	\N	52	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-02	40	\N	201600494	\N	\N	\N	\N
575	587	\N	\N	\N	\N	95	\N	\N	\N	\N	["38","39","40","41","42","43"]	2016-03-02	119	\N	201600495	\N	\N	\N	\N
576	589	\N	\N	\N	\N	90	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-02	40	\N	201600496	\N	\N	\N	\N
577	590	\N	\N	\N	\N	93	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-02	119	\N	201600497	\N	\N	\N	\N
578	591	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-02	119	\N	201600498	\N	\N	\N	\N
579	592	\N	\N	\N	\N	41	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-02	119	\N	201600499	\N	\N	\N	\N
580	593	\N	\N	\N	\N	71	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-02	119	\N	201600500	\N	\N	\N	\N
581	594	\N	2010	2010-07-26	\N	124	1	205400	\N	\N	["1","2","3","4","5","6"]	2010-07-26	40	t	201600501	\N	\N	\N	0
582	595	\N	\N	\N	\N	48	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-02	119	\N	201600501	\N	\N	\N	\N
583	598	\N	\N	\N	\N	113	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-03	40	\N	201600503	\N	\N	\N	\N
584	599	\N	\N	\N	\N	42	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-03	40	\N	201600504	\N	\N	\N	\N
585	600	\N	\N	\N	\N	57	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-03	40	\N	201600505	\N	\N	\N	\N
586	601	\N	\N	\N	\N	57	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-03	40	\N	201600506	\N	\N	\N	\N
587	602	\N	\N	\N	\N	57	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-03	40	\N	201600507	\N	\N	\N	\N
588	603	\N	\N	\N	\N	125	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-03	119	\N	201600508	\N	\N	\N	\N
589	604	\N	\N	\N	\N	91	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-03	119	\N	201600509	\N	\N	\N	\N
590	605	\N	\N	\N	\N	109	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-03	119	\N	201600510	\N	\N	\N	\N
591	606	\N	\N	\N	\N	59	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-03	40	\N	201600511	\N	\N	\N	\N
592	607	\N	\N	\N	\N	59	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-03	119	\N	201600512	\N	\N	\N	\N
593	608	\N	\N	\N	\N	59	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-03	119	\N	201600513	\N	\N	\N	\N
594	609	\N	\N	\N	\N	59	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-03	119	\N	201600514	\N	\N	\N	\N
595	610	\N	\N	\N	\N	59	\N	\N	\N	\N	["25","26","27","28","29","30","31"]	2016-03-03	119	\N	201600515	\N	\N	\N	\N
596	611	\N	\N	\N	\N	131	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-03	40	\N	201600516	\N	\N	\N	\N
597	612	\N	\N	\N	\N	43	\N	\N	\N	\N	["1","2","3","4","5","6"]	2016-03-03	119	\N	201600517	\N	\N	\N	\N
\.


--
-- Name: t_pembayaranspt_t_idpembayaranspt_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_pembayaranspt_t_idpembayaranspt_seq', 597, true);


--
-- Data for Name: t_pemeriksaan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_pemeriksaan (p_idpemeriksaan, p_idpembayaranspt, p_luastanah, p_luasbangunan, p_njoptanah, p_njopbangunan, p_totalnjoptanah, p_totalnjopbangunan, p_grandtotalnjop, p_nilaitransaksispt, p_potonganspt, p_ketwaris, p_terbukti, p_idjenistransaksi, p_idjenishaktanah, p_totalspt, p_nilaipembayaranspt, p_nilaikurangbayar, p_kohirskpdkb, p_pembayaranskpdkb) FROM stdin;
19	370	105.00	45.00	537000	1200000	56385000	54000000	110385000	397500000	60000000	\N	\N	\N	\N	16875000	\N	\N	\N	\N
20	404	547.00	100.00	1032000	1200000	564504000	120000000	684504000	550000000	60000000	\N	\N	\N	\N	31225200	\N	\N	\N	\N
21	409	547.00	100.00	1032000	1200000	564504000	120000000	684504000	550000000	60000000	\N	\N	\N	\N	31225200	\N	\N	\N	\N
\.


--
-- Name: t_pemeriksaan_p_idpemeriksaan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_pemeriksaan_p_idpemeriksaan_seq', 21, true);


--
-- Data for Name: t_penerimawaris; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_penerimawaris (t_idpenerima, t_idspt, t_namapenerima, t_alamatpenerima, t_nikpenerima) FROM stdin;
667	76			
668	76			
669	77			
670	78	TINA ROSTARI	SARIWANGI- PARONGPONG	3217025608820014
671	79			
672	79	TINA ROSTARI	SARIWANGI- PARONGPONG	3217025608820014
673	80			
674	80			
675	80	TINA ROSTARI	SARIWANGI- PARONGPONG	3217025608820014
676	84			
677	84			
678	85			
679	86			
680	87			
681	88			
682	89			
683	90			
684	91			
685	92			
686	93			
687	94			
688	94			
689	94			
690	94			
691	95			
692	96			
693	97			
694	97			
695	98			
696	99			
697	100			
698	101			
699	102			
700	102			
701	103			
702	104			
703	105			
704	106			
705	107			
706	108			
707	108			
708	109			
709	110			
710	111			
711	112			
712	113			
713	114			
714	115			
715	116			
716	117			
717	118			
718	119			
719	120			
720	121			
721	122			
722	123			
723	124			
724	125			
725	126			
726	127			
727	128			
728	129			
729	130			
730	131			
731	132			
732	133			
733	134			
734	135			
735	135			
736	136			
737	137			
738	138			
739	139			
740	140			
741	141			
742	142			
743	143	LILY LIANTY	PUNGKUR- REGOL	1050125502403003
744	143	LILY LIANTY	PUNGKUR- REGOL	1050125502403003
745	144			
746	145			
747	146			
748	147			
749	148			
750	149			
751	150			
752	151			
753	152			
754	153			
755	154			
756	155			
757	156			
758	156			
759	157			
760	158			
761	158			
762	159			
763	160			
764	161			
765	161			
766	162			
767	163	USEP TAJUDIN	KP TUGU 1	6403031011660002
768	164			
769	165			
770	166			
771	167			
772	168			
773	169			
774	170			
775	171			
776	172			
777	173			
778	174			
779	175			
780	176			
781	177			
782	178			
783	179			
784	179			
785	180			
786	181			
787	182			
788	183			
789	184			
790	185	AEP AEP SURIYANA	PADALARANG	3217081108650011
791	186			
792	188			
793	189			
794	190			
795	191			
796	192			
797	193			
798	194	ASEP USMAN 	KP RANCABALI GG KARANG SARI	3217081609600007
799	194	ASEP SURIYANA	KP RANCABALI	3217081108650011
800	194	EUIS SURYATI	KP RANCABALI	321708408650011
801	194	NANANG SUMARNA	KP RANCABALI	3217081008670001
802	194	CEP DERMAWAN	KP RANCABALI	3217081104700015
803	194	LILIS DARYATI	KP RANCABALI	3217087004730006
804	194			
805	195			
806	196			
807	197			
808	198			
809	199			
810	200			
811	201			
812	202			
813	203			
814	204			
815	205			
816	206			
817	207			
818	208			
819	209			
820	210			
821	211			
822	212			
823	213			
824	214			
825	215			
826	216			
827	217			
828	218			
829	219			
830	220			
831	221			
832	222			
833	223			
834	224			
835	225			
836	226			
837	227	GANOFI SAHRUDIN CS	PADAASIH- CISARUA	3217031411630002
838	228			
839	229			
840	230			
841	231			
842	232			
843	233			
844	234			
845	235			
846	236			
847	237			
848	238			
849	239			
850	240			
851	241			
852	242			
853	243			
854	244			
855	245			
856	246			
857	247			
858	248			
859	249			
860	249			
861	250			
862	251			
863	252	FRANSISCA XAVERIA RINI CS	LANGENSARI- LEMBANG	3217015305600008
864	253			
865	254			
866	255			
867	256			
868	257			
869	258			
870	259			
871	260			
872	261			
873	262			
874	263			
875	264			
876	265			
877	266			
878	267			
879	268			
880	269			
881	270			
882	271			
883	272			
884	272			
885	273			
886	274			
887	275			
888	276			
889	277			
890	278			
891	279			
892	280			
893	281			
894	282			
895	283			
896	284			
897	285			
898	286			
899	287			
900	288			
901	289			
902	290			
903	291			
904	292			
905	293			
906	294			
907	295			
908	296			
909	297			
910	298			
911	299			
912	300			
913	300			
914	301	LILIANA WILANDOUW SH DKK	PAMOYANAN-CICENDO	3273061603440003
915	302	AI MASROHAH CS	KP. CIPARE	3217044311760003
916	303			
917	304			
918	305			
919	306			
920	307			
921	308			
922	309			
923	310			
924	311			
925	312			
926	313			
927	314			
928	315			
929	316			
930	317			
931	318			
932	319			
933	320			
934	321			
935	322			
936	323			
937	324			
938	325			
939	326			
940	327			
941	328			
942	329			
943	330			
944	331			
945	332			
946	333			
947	334			
948	335			
949	336			
950	338			
951	339			
952	340			
953	341			
954	341			
955	342			
956	343			
957	344			
958	345			
959	346			
960	347			
961	348	TITIN TRISNAWATI	KERTAJAYA- PADALARANG	3217085506770026
962	348	TITIN TRISNAWATI	KERTAJAYA- PADALARANG	3217085506770026
963	349			
964	350			
965	350			
966	351			
967	352			
968	353			
969	354			
970	355			
971	356			
972	357			
973	358			
974	359			
975	360			
976	361			
977	362			
978	363			
979	364			
980	365			
981	366	FRANSISCA XAVERIA RINI CS	LANGENSARI-LEMBANG	3217015305600008
982	367	FRANSISCA XAVERIA RINI CS	KP. SUKAMULYA 102	3217015305600008
983	368			
984	369			
985	370			
986	371			
987	372			
988	372			
989	373			
990	373			
991	374			
992	375			
993	375			
994	376			
995	377			
996	378			
997	379			
998	380			
999	381			
1000	382			
1001	383			
1002	384			
1003	385			
1004	386			
1005	387			
1006	388			
1007	389			
1008	389			
1009	390			
1010	390			
1011	391			
1012	392			
1013	393			
1014	394			
1015	395			
1016	396			
1017	397			
1018	398			
1019	399			
1020	400			
1021	400			
1022	400			
1023	400			
1024	405			
1025	407			
1026	409			
1027	410			
1028	411			
1029	413			
1030	414			
1031	415			
1032	416			
1033	417			
1034	418			
1035	419			
1036	420			
1037	421			
1038	421			
1039	422			
1040	423			
1041	424	ALI HARNAWADI PUTRA CS	POS KIDUL	3217083101670006
1042	425			
1043	425			
1044	426			
1045	427			
1046	427			
1047	428			
1048	429			
1049	430			
1050	431			
1051	432			
1052	433			
1053	433			
1054	434			
1055	435			
1056	436			
1057	437			
1058	438			
1059	439			
1060	440			
1061	441			
1062	442			
1063	443			
1064	444	EMARINA CS	JL. RAYA SIMPANG 424	3217086203710008
1065	444			
1066	445			
1067	446			
1068	447			
1069	448			
1070	449			
1071	450			
1072	451			
1073	451			
1074	452			
1075	455			
1076	456			
1077	457			
1078	458			
1079	459			
1080	460			
1081	461			
1082	462			
1083	462			
1084	462			
1085	462			
1086	463			
1087	464	EVY JULIAWATY ,SIP,M.SI		3217066507710005
1088	465			
1089	466			
1090	467			
1091	468			
1092	469			
1093	470			
1094	471			
1095	472			
1096	473			
1097	474			
1098	475			
1099	476			
1100	477			
1101	478			
1102	479			
1103	480			
1104	480	EVY JULIAWATY ,SIP,M.SI		3217066507710005
1105	481			
1106	482			
1107	483			
1108	484			
1109	484			
1110	485			
1111	486			
1112	487			
1113	488			
1114	489			
1115	490			
1116	491			
1117	492			
1118	493			
1119	494			
1120	495			
1121	496			
1122	497			
1123	498			
1124	499			
1125	500			
1126	501	RINA LUKMAWATI	PERUM GPI-JL SAFIR NO. 02	3217084801770017
1127	502			
1128	503			
1129	504			
1130	505			
1131	506			
1132	507			
1133	508			
1134	508			
1135	508			
1136	509	ANDENG SUDRAJAT	JAYAMEKAR- PADALARANG	3217081807590002
1137	510			
1138	511			
1139	512			
1140	513			
1141	514			
1142	515			
1143	516			
1144	517			
1145	518			
1146	519			
1147	520			
1148	521			
1149	522			
1150	523			
1151	524			
1152	525			
1153	526			
1154	527			
1155	528			
1156	529			
1157	530			
1158	531			
1159	532			
1160	533			
1161	533			
1162	534			
1163	535			
1164	535			
1165	536			
1166	542			
1167	543			
1168	544			
1169	545			
1170	546			
1171	547			
1172	548			
1173	549	SUNARSIH	KP. GINTUNG	3602024508500003
1174	550			
1175	551			
1176	552			
1177	553			
1178	554			
1179	555			
1180	556			
1181	557			
1182	558			
1183	559			
1184	560			
1185	561			
1186	562			
1187	563			
1188	564			
1189	564			
1190	565			
1191	566			
1192	567			
1193	568			
1194	569			
1195	570			
1196	571			
1197	572			
1198	573			
1199	574			
1200	575			
1201	576			
1202	577			
1203	578			
1204	579			
1205	579			
1206	580			
1207	581			
1208	582			
1209	583			
1210	584			
1211	585			
1212	585			
1213	586			
1214	587			
1215	588			
1216	589			
1217	590			
1218	591			
1219	592			
1220	593			
1221	594			
1222	594			
1223	595			
1224	597			
1225	597			
1226	597			
1227	597			
1228	597			
1229	598			
1230	599			
1231	600			
1232	601			
1233	602			
1234	603			
1235	604			
1236	605			
1237	606			
1238	607			
1239	608			
1240	609			
1241	609			
1242	610	HIDAYAT	POS WETAN	3217082011590003
1243	610			
1244	611			
1245	611			
1246	611			
1247	612			
1248	612			
1249	612			
\.


--
-- Name: t_penerimawaris_t_idpenerima_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_penerimawaris_t_idpenerima_seq', 1249, true);


--
-- Data for Name: t_spt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_spt (t_idspt, t_kohirspt, t_kohirketetapanspt, t_tglprosesspt, t_periodespt, t_idnotarisspt, t_objekspt, t_idtarifspt, t_ketetapanspt, t_tglketetapanspt, t_tgljatuhtempospt, t_nopbphtbsppt, t_kodebayarbanksppt, t_idjenistransaksi, t_idjenishaktanah, t_idrefspt, t_pejabatverifikasispt, t_dasarspt, t_totalspt, t_nilaitransaksispt, t_potonganspt, t_thnsppt, t_persyaratan, t_idjenisdoktanah, t_idsptsebelumnya, t_dendaspt, t_bulandendaspt, t_tglprosesspttime) FROM stdin;
515	424	428	2016-02-25	2016	139	\N	\N	\N	\N	\N	32.06.320.005.011.0001.0	\N	1	3	\N	\N	\N	731800	49000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-25 01:46:02
526	435	439	2016-02-26	2016	93	\N	\N	\N	\N	\N	32.06.210.008.010.0306.0	\N	7	1	\N	\N	\N	64130000	1342600000	60000000	2016	["38","39","40","41","42","43"]	1	\N	0	0	2016-02-26 03:02:52
537	446	\N	2016-02-29	2016	106	\N	\N	\N	\N	\N	32.06.171.004.004.0302.0	\N	7	7	\N	\N	\N	25876800	577536000	60000000	2016	["38","39","40","41","42","43"]	6	\N	0	0	2016-02-29 11:19:37
548	457	456	2016-02-29	2016	95	\N	\N	\N	\N	\N	32.06.310.004.016.2003.0	\N	1	3	\N	\N	\N	7756000	215120000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-29 01:41:21
559	468	469	2016-03-01	2016	120	\N	\N	\N	\N	\N	32.06.210.003.006.0177.0	\N	1	3	\N	\N	\N	500000	70000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 07:50:32
570	479	478	2016-03-01	2016	120	\N	\N	\N	\N	\N	32.06.210.003.006.0177.0	\N	1	3	\N	\N	\N	500000	70000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 09:33:33
581	490	489	2016-03-02	2016	42	\N	\N	\N	\N	\N	32.06.760.007.009.0297.0	\N	1	3	\N	\N	\N	57000000	1200000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-02 10:49:45
592	501	499	2016-03-02	2016	41	\N	\N	\N	\N	\N	32.06.320.003.027.1130.0	\N	1	3	\N	\N	\N	41235000	884700000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-02 02:24:28
603	509	508	2016-03-03	2016	125	\N	\N	\N	\N	\N	32.06.290.010.004.0018.0	\N	1	7	\N	\N	\N	16270000	275000000	60000000	2016	["1","2","3","4","5","6"]	2	\N	0	0	2016-03-03 01:22:01
76	1	1	2016-01-20	2016	105	\N	\N	\N	\N	\N	32.06.310.003.003.2408.0	\N	3	1	\N	\N	\N	2000000	100000000	60000000	2015	["13","14","15","16","17","18"]	1	\N	0	0	2016-01-20 00:00:00
516	425	429	2016-02-25	2016	139	\N	\N	\N	\N	\N	32.06.320.005.011.0001.0	\N	1	3	\N	\N	\N	0	32000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-25 01:47:39
527	436	440	2016-02-26	2016	141	\N	\N	\N	\N	\N	32.06.310.003.015.0087.0	\N	1	1	\N	\N	\N	626250	13780000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-26 03:07:35
538	447	\N	2016-02-29	2016	106	\N	\N	\N	\N	\N	32.06.171.004.004.0302.0	\N	7	7	\N	\N	\N	25876800	577536000	60000000	2016	["38","39","40","41","42","43"]	6	\N	0	0	2016-02-29 11:20:35
549	458	457	2016-02-29	2016	45	\N	\N	\N	\N	\N	32.06.320.007.007.0246.0	\N	5	1	\N	\N	\N	-8000000	140000000	300000000	2016	["25","26","27","28","29","30","31"]	1	\N	0	0	2016-02-29 01:45:56
560	469	468	2016-03-01	2016	120	\N	\N	\N	\N	\N	32.06.210.003.006.0177.0	\N	1	3	\N	\N	\N	500000	70000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 07:53:39
571	480	479	2016-03-01	2016	106	\N	\N	\N	\N	\N	32.06.310.002.008.0028.0	\N	5	1	\N	\N	\N	-4313350	213733000	300000000	2016	["25","26","27","28","29","30","31"]	1	\N	0	0	2016-03-01 10:07:42
582	491	490	2016-03-02	2016	146	\N	\N	\N	\N	\N	32.06.320.006.021.0184.0	\N	1	1	\N	\N	\N	3250000	125000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-02 10:59:01
593	502	500	2016-03-02	2016	71	\N	\N	\N	\N	\N	32.06.310.002.009.0106.0	\N	1	1	\N	\N	\N	8100000	162000000	0	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-02 02:44:00
604	510	509	2016-03-03	2016	91	\N	\N	\N	\N	\N	32.06.210.005.004.0063.0	\N	1	1	\N	\N	\N	3500000	130000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-03 01:42:33
123	45	45	2016-01-25	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.1057.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
517	426	430	2016-02-25	2016	139	\N	\N	\N	\N	\N	32.06.320.005.011.0001.0	\N	1	3	\N	\N	\N	0	39000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-25 01:51:24
539	448	\N	2016-02-29	2016	106	\N	\N	\N	\N	\N	32.06.171.004.004.0302.0	\N	7	7	\N	\N	\N	25876800	577536000	60000000	2016	["38","39","40","41","42","43"]	6	\N	0	0	2016-02-29 11:21:56
550	459	458	2016-02-29	2016	45	\N	\N	\N	\N	\N	32.06.320.007.007.0246.0	\N	1	1	\N	\N	\N	4000000	140000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-29 01:51:37
561	470	467	2016-03-01	2016	120	\N	\N	\N	\N	\N	32.06.210.003.006.0177.0	\N	1	3	\N	\N	\N	500000	70000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 07:56:19
572	481	480	2016-03-01	2016	109	\N	\N	\N	\N	\N	32.06.310.004.016.1479.0	\N	1	3	\N	\N	\N	2000000	100000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 10:58:09
528	437	441	2016-02-26	2016	93	\N	\N	\N	\N	\N	32.06.210.008.010.0328.0	\N	7	1	\N	\N	\N	3047600	60952000	0	2016	["38","39","40","41","42","43"]	1	\N	0	0	2016-02-26 03:13:28
594	2	501	2010-07-26	2010	124	\N	\N	\N	\N	\N	32.06.760.002.004.0313.0	\N	1	7	\N	\N	\N	205400	24108000	20000000	2010	["1","2","3","4","5","6"]	5	\N	0	0	2016-03-02 02:50:41
583	492	491	2016-03-02	2016	95	\N	\N	\N	\N	\N	32.06.320.005.003.0078.0	\N	15	7	\N	\N	\N	8577900	171558000	0	2016	["80","81","82","83","84"]	2	\N	0	0	2016-03-02 11:37:09
605	511	510	2016-03-03	2016	109	\N	\N	\N	\N	\N	32.06.310.003.003.1888.0	\N	1	1	\N	\N	\N	7000000	200000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-03 01:56:18
168	90	90	2016-01-26	2016	41	\N	\N	\N	\N	\N	32.06.320.003.027.0247.0	\N	1	1	\N	\N	\N	53500000	1130000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-26 00:00:00
518	427	431	2016-02-25	2016	139	\N	\N	\N	\N	\N	32.06.320.005.011.0001.0	\N	1	3	\N	\N	\N	1079800	58000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-25 01:53:07
529	438	442	2016-02-26	2016	122	\N	\N	\N	\N	\N	32.06.300.001.009.0310.0	\N	1	7	\N	\N	\N	1000000	80000000	60000000	2016	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-26 03:14:42
540	449	\N	2016-02-29	2016	106	\N	\N	\N	\N	\N	32.06.171.004.004.0302.0	\N	7	7	\N	\N	\N	25876800	577536000	60000000	2016	["38","39","40","41","42","43"]	6	\N	0	0	2016-02-29 11:23:08
551	460	459	2016-02-29	2016	41	\N	\N	\N	\N	\N	32.06.320.003.027.0296.0	\N	1	3	\N	\N	\N	57000000	1200000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-29 02:04:01
562	471	466	2016-03-01	2016	120	\N	\N	\N	\N	\N	32.06.210.003.006.0177.0	\N	1	3	\N	\N	\N	500000	70000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 07:59:28
573	482	481	2016-03-01	2016	89	\N	\N	\N	\N	\N	32.06.290.003.002.0239.0	\N	1	1	\N	\N	\N	14000000	340000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 11:15:06
584	493	492	2016-03-02	2016	55	\N	\N	\N	\N	\N	32.06.290.012.007.0143.0	\N	1	1	\N	\N	\N	9650000	253000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-02 11:37:44
595	503	501	2016-03-02	2016	48	\N	\N	\N	\N	\N	32.06.290.010.007.0024.0	\N	1	1	\N	\N	\N	27000000	600000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-02 03:04:56
606	512	511	2016-03-03	2016	59	\N	\N	\N	\N	\N	32.06.760.007.006.0186.0	\N	1	1	\N	\N	\N	2000000	100000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-03 02:10:16
213	135	134	2016-02-01	2016	49	\N	\N	\N	\N	\N	32.06.760.005.007.0373.0	\N	1	1	\N	\N	\N	12000000	300000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-01 00:00:00
519	428	432	2016-02-25	2016	144	\N	\N	\N	\N	\N	32.06.760.004.010.0158.0	\N	1	1	\N	\N	\N	72000000	1500000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-25 02:28:28
530	439	443	2016-02-26	2016	93	\N	\N	\N	\N	\N	32.06.210.008.010.0329.0	\N	7	1	\N	\N	\N	3596000	71920000	0	2016	["38","39","40","41","42","43"]	1	\N	0	0	2016-02-26 03:21:00
541	450	\N	2016-02-29	2016	106	\N	\N	\N	\N	\N	32.06.171.004.004.0302.0	\N	7	7	\N	\N	\N	25876800	577536000	60000000	2016	["38","39","40","41","42","43"]	6	\N	0	0	2016-02-29 11:25:10
552	461	460	2016-02-29	2016	41	\N	\N	\N	\N	\N	32.06.320.004.009.1221.0	\N	1	3	\N	\N	\N	18396000	427920000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-29 02:13:55
563	472	464	2016-03-01	2016	120	\N	\N	\N	\N	\N	32.06.210.003.006.0177.0	\N	1	3	\N	\N	\N	500000	70000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 08:03:17
574	483	482	2016-03-01	2016	145	\N	\N	\N	\N	\N	32.06.760.004.018.0129.0	\N	1	1	\N	\N	\N	4350000	147000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 11:44:56
596	3	502	2016-03-02	2016	124	\N	\N	\N	\N	\N	32.06.760.002.004.0313.0	\N	1	7	\N	\N	\N	209500	24108000	20000000	2010	["1","2","3","4","5","6"]	5	594	\N	\N	\N
607	513	512	2016-03-03	2016	59	\N	\N	\N	\N	\N	32.06.760.004.002.0121.0	\N	1	1	\N	\N	\N	750000	75000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-03 02:15:21
585	494	493	2016-03-02	2016	95	\N	\N	\N	\N	\N	32.06.320.005.003.0212.0	\N	15	7	\N	\N	\N	25497700	509954000	0	2016	["80","81","82","83","84"]	2	\N	509954	1	2016-03-02 11:43:54
258	180	179	2016-02-03	2016	109	\N	\N	\N	\N	\N	32.06.180.007.007.0646.0	\N	1	1	\N	\N	\N	500000	70000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-03 00:00:00
520	429	433	2016-02-25	2016	48	\N	\N	\N	\N	\N	32.06.320.002.010.0652.0	\N	1	1	\N	\N	\N	10000000	260000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-25 03:03:50
531	440	444	2016-02-26	2016	93	\N	\N	\N	\N	\N	32.06.210.008.010.0307.0	\N	7	1	\N	\N	\N	18750000	375000000	0	2016	["38","39","40","41","42","43"]	1	\N	0	0	2016-02-26 03:24:52
553	462	461	2016-03-01	2016	120	\N	\N	\N	\N	\N	32.06.210.003.006.0177.0	\N	1	3	\N	\N	\N	500000	70000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 07:26:02
564	473	463	2016-03-01	2016	120	\N	\N	\N	\N	\N	32.06.210.003.006.0177.0	\N	1	3	\N	\N	\N	500000	70000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 08:07:05
575	484	483	2016-03-01	2016	118	\N	\N	\N	\N	\N	32.06.171.004.005.0004.0	\N	1	1	\N	\N	\N	7500000	210000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 11:51:58
586	495	494	2016-03-02	2016	52	\N	\N	\N	\N	\N	32.06.320.005.002.0870.0	\N	1	3	\N	\N	\N	6680000	193600000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-02 11:46:03
597	3	502	2016-03-02	2016	124	\N	\N	\N	\N	\N	32.06.760.002.004.0313.0	\N	1	7	\N	\N	\N	209500	24108000	20000000	2010	["1","2","3","4","5","6"]	5	594	\N	\N	\N
608	514	513	2016-03-03	2016	59	\N	\N	\N	\N	\N	32.06.760.005.013.0392.0	\N	1	1	\N	\N	\N	3750000	135000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-03 02:20:18
542	451	450	2016-02-29	2016	106	\N	\N	\N	\N	\N	32.06.171.004.004.0302.0	\N	15	7	\N	\N	\N	28876800	577536000	0	2016	["80","81","82","83","84"]	6	\N	0	0	2016-02-29 11:25:45
303	225	223	2016-02-10	2016	91	\N	\N	\N	\N	\N	32.06.310.001.001.0385.0	\N	1	3	\N	\N	\N	6000000	180000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-10 00:00:00
304	226	224	2016-02-10	2016	125	\N	\N	\N	\N	\N	32.06.290.009.009.0136.0	\N	1	7	\N	\N	\N	742200	74844000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-10 00:00:00
521	430	434	2016-02-26	2016	118	\N	\N	\N	\N	\N	32.06.300.006.005.0492.0	\N	1	3	\N	\N	\N	31000000	680000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-26 09:27:03
532	441	445	2016-02-26	2016	93	\N	\N	\N	\N	\N	32.06.210.008.010.0143.0	\N	7	1	\N	\N	\N	41638500	832770000	0	2016	["38","39","40","41","42","43"]	1	\N	0	0	2016-02-26 03:25:06
349	269	269	2016-02-15	2016	96	\N	\N	\N	\N	\N	32.06.760.002.010.0083.0	\N	1	1	\N	\N	\N	22250000	505000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-15 00:00:00
543	452	451	2016-02-29	2016	60	\N	\N	\N	\N	\N	32.06.310.001.007.0309.0	\N	1	3	\N	\N	\N	9700000	254000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-29 11:31:29
554	463	474	2016-03-01	2016	120	\N	\N	\N	\N	\N	32.06.210.003.006.0177.0	\N	1	3	\N	\N	\N	500000	70000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 07:35:53
565	474	475	2016-03-01	2016	120	\N	\N	\N	\N	\N	32.06.210.003.006.0177.0	\N	1	3	\N	\N	\N	500000	70000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 08:12:20
576	485	484	2016-03-01	2016	122	\N	\N	\N	\N	\N	32.06.300.005.012.0125.0	\N	1	7	\N	\N	\N	4500000	150000000	60000000	2016	["1","2","3","4","5","6"]	2	\N	0	0	2016-03-01 02:31:05
587	496	495	2016-03-02	2016	95	\N	\N	\N	\N	\N	32.06.171.004.004.0302.0	\N	15	7	\N	\N	\N	4690000	93800000	0	2016	["80","81","82","83","84"]	2	\N	0	0	2016-03-02 11:57:02
598	504	503	2016-03-03	2016	113	\N	\N	\N	\N	\N	32.06.300.015.009.0690.0	\N	1	1	\N	\N	\N	1650000	93000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-03 11:35:52
609	515	514	2016-03-03	2016	59	\N	\N	\N	\N	\N	32.06.760.005.013.0392.0	\N	1	1	\N	\N	\N	3725000	134500000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-03 02:24:32
522	431	435	2016-02-26	2016	71	\N	\N	\N	\N	\N	32.06.310.001.003.0054.0	\N	1	7	\N	\N	\N	4500000	150000000	60000000	2016	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-26 10:38:11
533	442	446	2016-02-26	2016	93	\N	\N	\N	\N	\N	32.06.210.008.010.0142.0	\N	7	1	\N	\N	\N	9223000	184460000	0	2016	["38","39","40","41","42","43"]	1	\N	0	0	2016-02-26 03:29:58
544	453	452	2016-02-29	2016	61	\N	\N	\N	\N	\N	32.06.310.003.003.0602.0	\N	1	1	\N	\N	\N	1250000	85000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-29 11:39:47
566	475	462	2016-03-01	2016	93	\N	\N	\N	\N	\N	32.06.300.007.003.0046.0	\N	1	1	\N	\N	\N	9540000	250800000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 08:43:02
555	464	473	2016-03-01	2016	120	\N	\N	\N	\N	\N	32.06.210.003.006.0177.0	\N	1	3	\N	\N	\N	500000	70000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 07:39:36
577	486	485	2016-03-01	2016	57	\N	\N	\N	\N	\N	32.06.760.002.010.0382.0	\N	1	1	\N	\N	\N	6500000	190000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 03:13:25
588	497	\N	2016-03-02	2016	90	\N	\N	\N	\N	\N	32.06.290.004.005.0031.0	\N	1	1	\N	\N	\N	39377500	847550000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-02 11:57:55
599	505	504	2016-03-03	2016	42	\N	\N	\N	\N	\N	32.06.310.001.002.0661.0	\N	1	1	\N	\N	\N	25625000	572500000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-03 11:47:35
610	516	515	2016-03-03	2016	59	\N	\N	\N	\N	\N	32.06.320.007.007.0354.0	\N	5	1	\N	\N	\N	0	43950000	300000000	2016	["25","26","27","28","29","30","31"]	1	\N	0	0	2016-03-03 02:30:13
393	313	314	2016-02-17	2016	118	\N	\N	\N	\N	\N	32.06.310.003.010.0019.0	\N	1	3	\N	\N	\N	4450000	149000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-17 00:00:00
523	432	436	2016-02-26	2016	89	\N	\N	\N	\N	\N	32.06.760.006.002.0147.0	\N	1	1	\N	\N	\N	5500000	170000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-26 10:38:59
534	443	447	2016-02-29	2016	93	\N	\N	\N	\N	\N	32.06.210.007.017.0292.0	\N	1	3	\N	\N	\N	6750000	195000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-29 08:51:48
545	454	453	2016-02-29	2016	126	\N	\N	\N	\N	\N	32.06.330.008.002.0135.0	\N	1	7	\N	\N	\N	200000	64000000	60000000	2016	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-29 12:32:41
567	476	465	2016-03-01	2016	100	\N	\N	\N	\N	\N	32.06.310.003.003.2110.0	\N	1	3	\N	\N	\N	750000	75000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 08:52:43
556	465	472	2016-03-01	2016	120	\N	\N	\N	\N	\N	32.06.210.003.006.0177.0	\N	1	3	\N	\N	\N	500000	70000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 07:42:29
578	487	486	2016-03-02	2016	93	\N	\N	\N	\N	\N	32.06.760.006.014.0731.0	\N	1	1	\N	\N	\N	53775750	1135515000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-02 08:55:48
589	498	496	2016-03-02	2016	90	\N	\N	\N	\N	\N	32.06.290.004.005.0031.0	\N	1	1	\N	\N	\N	39377500	847550000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-02 11:57:59
600	506	505	2016-03-03	2016	57	\N	\N	\N	\N	\N	32.06.330.004.016.0199.0	\N	1	3	\N	\N	\N	1350000	87000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-03 11:56:32
611	517	516	2016-03-03	2016	131	\N	\N	\N	\N	\N	32.06.290.014.010.0327.0	\N	1	1	\N	\N	\N	2000000	100000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-03 02:39:52
444	356	358	2016-02-22	2016	112	\N	\N	\N	\N	\N	32.06.320.003.014.0001.0	\N	5	1	\N	\N	\N	15949500	937980000	300000000	2016	["25","26","27","28","29","30","31"]	1	\N	0	0	2016-02-22 00:00:00
524	433	437	2016-02-26	2016	60	\N	\N	\N	\N	\N	32.06.310.003.008.0446.0	\N	1	1	\N	\N	\N	3000000	120000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-26 10:58:02
535	444	448	2016-02-29	2016	93	\N	\N	\N	\N	\N	32.06.210.007.017.0314.0	\N	1	3	\N	\N	\N	13125000	322500000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-29 08:57:14
546	455	454	2016-02-29	2016	126	\N	\N	\N	\N	\N	32.06.330.008.002.0135.0	\N	1	7	\N	\N	\N	6300000	186000000	60000000	2016	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-29 12:36:59
557	466	471	2016-03-01	2016	120	\N	\N	\N	\N	\N	32.06.210.003.006.0177.0	\N	1	3	\N	\N	\N	500000	70000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 07:45:08
568	477	476	2016-03-01	2016	120	\N	\N	\N	\N	\N	32.06.210.003.006.0177.0	\N	1	3	\N	\N	\N	500000	70000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 09:24:18
579	488	487	2016-03-02	2016	93	\N	\N	\N	\N	\N	32.06.760.005.009.0302.0	\N	1	3	\N	\N	\N	43272727	925454545	60000000	2016	["1","2","3","4","5","6"]	2	\N	0	0	2016-03-02 09:02:07
590	499	497	2016-03-02	2016	93	\N	\N	\N	\N	\N	32.06.290.010.004.0056.0	\N	1	1	\N	\N	\N	15500000	370000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-02 02:03:24
601	507	506	2016-03-03	2016	57	\N	\N	\N	\N	\N	32.06.330.004.016.0199.0	\N	1	3	\N	\N	\N	1350000	87000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-03 12:06:16
612	518	517	2016-03-03	2016	43	\N	\N	\N	\N	\N	32.06.310.004.016.0747.0	\N	1	3	\N	\N	\N	1000000	80000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-03 02:53:56
77	2	2	2016-01-20	2016	42	\N	\N	\N	\N	\N	32.06.310.001.001.0438.0	\N	1	3	\N	\N	\N	10610000	272200000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-20 00:00:00
94	16	16	2016-01-21	2016	112	\N	\N	\N	\N	\N	32.06.320.005.006.0025.0	\N	1	7	\N	\N	\N	0	40000000	60000000	2011	["1","2","3","4","5","6"]	5	\N	0	24	2016-01-21 00:00:00
78	3	3	2016-01-20	2016	106	\N	\N	\N	\N	\N	32.06.760.006.006.0933.0	\N	5	1	\N	\N	\N	699400	313988000	300000000	2015	["25","26","27","28","29","30","31"]	1	\N	0	0	2016-01-20 00:00:00
84	6	6	2016-01-20	2016	108	\N	\N	\N	\N	\N	32.06.310.004.018.0256.0	\N	1	2	\N	\N	\N	7000000	200000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-20 00:00:00
79	4	4	2016-01-20	2016	107	\N	\N	\N	\N	\N	32.06.210.007.017.0027.0	\N	1	7	\N	\N	\N	0	16000000	60000000	2015	["1","2","3","4","5","6"]	5	\N	0	3	2016-01-20 00:00:00
85	7	7	2016-01-20	2016	108	\N	\N	\N	\N	\N	32.06.310.004.018.0256.0	\N	1	3	\N	\N	\N	9250000	245000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-20 00:00:00
95	17	17	2016-01-21	2016	113	\N	\N	\N	\N	\N	32.06.330.002.007.0397.0	\N	1	1	\N	\N	\N	765300	75306000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-21 00:00:00
96	18	18	2016-01-21	2016	112	\N	\N	\N	\N	\N	32.06.320.007.007.0399.0	\N	1	7	\N	\N	\N	500000	70000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-01-21 00:00:00
105	27	27	2016-01-22	2016	115	\N	\N	\N	\N	\N	32.06.350.002.009.0318.0	\N	1	7	\N	\N	\N	13875000	337500000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-01-22 00:00:00
97	19	19	2016-01-21	2016	68	\N	\N	\N	\N	\N	32.06.290.016.004.0077.0	\N	5	7	\N	\N	\N	16270400	625408000	300000000	2015	["25","26","27","28","29","30","31"]	2	\N	0	0	2016-01-21 00:00:00
80	5	5	2016-01-20	2016	41	\N	\N	\N	\N	\N	32.06.760.006.010.0388.0	\N	1	1	\N	\N	\N	33100000	722000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-20 00:00:00
106	28	28	2016-01-22	2016	115	\N	\N	\N	\N	\N	32.06.350.002.009.0749.0	\N	1	7	\N	\N	\N	8062500	161250000	0	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-01-22 00:00:00
86	8	8	2016-01-20	2016	89	\N	\N	\N	\N	\N	32.06.300.006.004.0070.0	\N	1	1	\N	\N	\N	1000000	80000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-20 00:00:00
87	9	9	2016-01-20	2016	109	\N	\N	\N	\N	\N	32.06.310.004.024.0713.0	\N	1	3	\N	\N	\N	4500000	150000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-20 00:00:00
88	10	10	2016-01-20	2016	109	\N	\N	\N	\N	\N	32.06.310.004.016.0705.0	\N	1	1	\N	\N	\N	4500000	150000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-20 00:00:00
89	11	11	2016-01-20	2016	110	\N	\N	\N	\N	\N	32.06.310.003.003.1083.0	\N	1	3	\N	\N	\N	4239800	144796000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-20 00:00:00
90	12	12	2016-01-20	2016	111	\N	\N	\N	\N	\N	32.06.320.007.008.0216.0	\N	1	1	\N	\N	\N	500000	70000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-20 00:00:00
489	399	403	2016-02-24	2016	108	\N	\N	\N	\N	\N	32.06.310.004.015.0256.0	\N	1	3	\N	\N	\N	7850000	217000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-24 00:00:00
490	400	404	2016-02-24	2016	108	\N	\N	\N	\N	\N	32.06.310.004.018.0151.0	\N	1	3	\N	\N	\N	6000000	180000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-24 00:00:00
491	401	405	2016-02-24	2016	108	\N	\N	\N	\N	\N	32.06.310.004.018.0256.0	\N	1	3	\N	\N	\N	8550000	231000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-24 00:00:00
492	402	406	2016-02-24	2016	44	\N	\N	\N	\N	\N	32.06.210.007.017.0358.0	\N	1	3	\N	\N	\N	6487500	189750000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-24 00:00:00
112	34	34	2016-01-22	2016	101	\N	\N	\N	\N	\N	32.06.310.003.003.1075.0	\N	1	3	\N	\N	\N	8205000	224100000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-22 00:00:00
92	14	14	2016-01-20	2016	72	\N	\N	\N	\N	\N	32.06.310.003.002.0781.0	\N	1	3	\N	\N	\N	3500000	130000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-20 00:00:00
93	15	15	2016-01-21	2016	58	\N	\N	\N	\N	\N	32.06.760.004.004.0393.0	\N	1	1	\N	\N	\N	17500000	410000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-21 00:00:00
98	20	20	2016-01-21	2016	68	\N	\N	\N	\N	\N	32.06.290.016.004.0077.0	\N	1	7	\N	\N	\N	57000000	1200000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-01-21 00:00:00
99	21	21	2016-01-21	2016	59	\N	\N	\N	\N	\N	32.06.310.003.003.3213.0	\N	1	3	\N	\N	\N	372750	38000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-21 00:00:00
101	23	23	2016-01-21	2016	52	\N	\N	\N	\N	\N	32.06.760.006.005.0094.0	\N	1	7	\N	\N	\N	6500000	190000000	60000000	2015	["1","2","3","4","5","6"]	4	\N	0	0	2016-01-21 00:00:00
107	29	29	2016-01-22	2016	115	\N	\N	\N	\N	\N	32.06.350.002.011.0259.0	\N	1	7	\N	\N	\N	7012500	140250000	0	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-01-22 00:00:00
102	24	24	2016-01-22	2016	93	\N	\N	\N	\N	\N	32.06.290.015.009.0019.0	\N	1	1	\N	\N	\N	8000000	220000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-22 00:00:00
100	22	22	2016-01-21	2016	95	\N	\N	\N	\N	\N	32.06.171.006.004.0769.0	\N	1	3	\N	\N	\N	3675000	133500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-21 00:00:00
103	25	25	2016-01-22	2016	41	\N	\N	\N	\N	\N	32.06.320.003.027.1083.0	\N	1	3	\N	\N	\N	100454400	427839984	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-22 00:00:00
104	26	26	2016-01-22	2016	60	\N	\N	\N	\N	\N	32.06.310.004.017.0052.0	\N	1	1	\N	\N	\N	1000000	80000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-22 00:00:00
108	30	30	2016-01-22	2016	59	\N	\N	\N	\N	\N	32.06.310.004.024.1859.0	\N	1	3	\N	\N	\N	30750	19000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-22 00:00:00
91	13	13	2016-01-20	2016	42	\N	\N	\N	\N	\N	32.06.320.003.027.2071.0	\N	1	3	\N	\N	\N	12169800	206704000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-20 00:00:00
109	31	31	2016-01-22	2016	117	\N	\N	\N	\N	\N	32.06.760.005.010.0561.0	\N	1	1	\N	\N	\N	53450000	1129000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-22 00:00:00
110	32	32	2016-01-22	2016	109	\N	\N	\N	\N	\N	32.06.310.003.003.1338.0	\N	1	1	\N	\N	\N	5750000	175000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-22 00:00:00
111	33	33	2016-01-22	2016	118	\N	\N	\N	\N	\N	32.06.310.004.024.1765.0	\N	1	1	\N	\N	\N	3000000	120000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-22 00:00:00
113	35	35	2016-01-25	2016	118	\N	\N	\N	\N	\N	32.06.171.002.002.0196.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
114	36	36	2016-01-25	2016	118	\N	\N	\N	\N	\N	32.06.171.002.002.0196.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
115	37	37	2016-01-25	2016	118	\N	\N	\N	\N	\N	32.06.171.006.008.1400.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
116	38	38	2016-01-25	2016	66	\N	\N	\N	\N	\N	32.06.171.002.002.0196.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
117	39	39	2016-01-25	2016	118	\N	\N	\N	\N	\N	32.06.171.006.008.0776.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
118	40	40	2016-01-25	2016	118	\N	\N	\N	\N	\N	32.06.171.006.008.1063.0	\N	1	3	\N	\N	\N	2500000	110000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
119	41	41	2016-01-25	2016	118	\N	\N	\N	\N	\N	32.06.171.006.008.0773.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
120	42	42	2016-01-25	2016	41	\N	\N	\N	\N	\N	32.06.760.005.003.0442.0	\N	1	1	\N	\N	\N	16000000	380000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
121	43	43	2016-01-25	2016	118	\N	\N	\N	\N	\N	32.06.171.006.008.0774.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
122	44	44	2016-01-25	2016	118	\N	\N	\N	\N	\N	32.06.171.002.002.0196.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
124	46	46	2016-01-25	2016	120	\N	\N	\N	\N	\N	32.06.171.002.002.0196.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
125	47	47	2016-01-25	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.0238.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
126	48	48	2016-01-25	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.0238.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
127	49	49	2016-01-25	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.1057.0	\N	1	3	\N	\N	\N	2500000	110000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
128	50	50	2016-01-25	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.0238.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
129	51	51	2016-01-25	2016	120	\N	\N	\N	\N	\N	32.06.171.002.002.0196.0	\N	1	3	\N	\N	\N	2500000	110000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
130	52	52	2016-01-25	2016	120	\N	\N	\N	\N	\N	32.06.171.002.002.0196.0	\N	1	3	\N	\N	\N	2500000	110000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
144	66	66	2016-01-25	2016	60	\N	\N	\N	\N	\N	32.06.310.003.001.0425.0	\N	1	1	\N	\N	\N	2500000	110000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
132	54	54	2016-01-25	2016	118	\N	\N	\N	\N	\N	32.06.171.006.008.0895.0	\N	1	3	\N	\N	\N	2500000	110000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
133	55	55	2016-01-25	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.1057.0	\N	1	3	\N	\N	\N	2500000	110000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
134	56	56	2016-01-25	2016	42	\N	\N	\N	\N	\N	32.06.760.005.001.0097.0	\N	1	1	\N	\N	\N	17293787	405875744	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
135	57	57	2016-01-25	2016	45	\N	\N	\N	\N	\N	32.06.320.004.001.0219.0	\N	1	1	\N	\N	\N	2000000	100000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
131	53	53	2016-01-25	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.1057.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
136	58	58	2016-01-25	2016	42	\N	\N	\N	\N	\N	32.06.760.005.001.0097.0	\N	1	1	\N	\N	\N	17293787	405875744	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
137	59	59	2016-01-25	2016	121	\N	\N	\N	\N	\N	32.06.171.007.019.0191.0	\N	1	7	\N	\N	\N	0	40000000	60000000	2015	["1","2","3","4","5","6"]	5	\N	0	0	2016-01-25 00:00:00
138	60	60	2016-01-25	2016	112	\N	\N	\N	\N	\N	32.06.320.005.005.0358.0	\N	1	7	\N	\N	\N	0	35000000	60000000	2015	["1","2","3","4","5","6"]	5	\N	0	0	2016-01-25 00:00:00
139	61	61	2016-01-25	2016	112	\N	\N	\N	\N	\N	32.06.320.005.002.0129.0	\N	1	7	\N	\N	\N	6576000	191520000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-01-25 00:00:00
140	62	62	2016-01-25	2016	112	\N	\N	\N	\N	\N	32.06.320.005.001.0196.0	\N	1	7	\N	\N	\N	6720000	134400000	0	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-01-25 00:00:00
141	63	63	2016-01-25	2016	112	\N	\N	\N	\N	\N	32.06.320.005.001.0196.0	\N	1	7	\N	\N	\N	7560000	151200000	0	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-01-25 00:00:00
142	64	64	2016-01-25	2016	122	\N	\N	\N	\N	\N	32.06.300.003.011.0108.0	\N	1	7	\N	\N	\N	562000	71240000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-01-25 00:00:00
143	65	65	2016-01-25	2016	71	\N	\N	\N	\N	\N	32.06.350.008.014.0098.0	\N	5	3	\N	\N	\N	5931000	418620000	300000000	2015	["25","26","27","28","29","30","31"]	1	\N	0	0	2016-01-25 00:00:00
145	67	67	2016-01-25	2016	123	\N	\N	\N	\N	\N	32.06.290.016.010.0024.0	\N	1	3	\N	\N	\N	32000000	700000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
146	68	68	2016-01-25	2016	71	\N	\N	\N	\N	\N	32.06.350.008.014.0098.0	\N	1	1	\N	\N	\N	17927800	377000000	60000000	2015	["1","2","3","4","5","6"]	5	\N	0	0	2016-01-25 00:00:00
147	69	69	2016-01-25	2016	90	\N	\N	\N	\N	\N	32.06.290.009.009.0175.0	\N	1	1	\N	\N	\N	2000000	100000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-25 00:00:00
148	70	70	2016-01-26	2016	55	\N	\N	\N	\N	\N	32.06.290.002.017.0074.0	\N	1	3	\N	\N	\N	66750000	1395000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-26 00:00:00
149	71	71	2016-01-26	2016	55	\N	\N	\N	\N	\N	32.06.290.002.017.0074.0	\N	1	3	\N	\N	\N	69750000	1395000000	0	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-26 00:00:00
150	72	72	2016-01-26	2016	93	\N	\N	\N	\N	\N	32.06.300.006.005.0492.0	\N	1	3	\N	\N	\N	32750000	715000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-26 00:00:00
151	73	73	2016-01-26	2016	56	\N	\N	\N	\N	\N	32.06.310.003.003.0486.0	\N	1	3	\N	\N	\N	789250	58000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-26 00:00:00
152	74	74	2016-01-26	2016	72	\N	\N	\N	\N	\N	32.06.330.002.007.0302.0	\N	1	3	\N	\N	\N	1148700	82974000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-26 00:00:00
153	75	75	2016-01-26	2016	113	\N	\N	\N	\N	\N	32.06.290.013.014.0033.0	\N	3	1	\N	\N	\N	17678600	413572000	60000000	2015	["13","14","15","16","17","18"]	1	\N	0	0	2016-01-26 00:00:00
154	76	76	2016-01-26	2016	80	\N	\N	\N	\N	\N	32.06.310.003.002.0867.0	\N	1	1	\N	\N	\N	5250000	165000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-26 00:00:00
155	77	77	2016-01-26	2016	56	\N	\N	\N	\N	\N	32.06.300.007.008.0113.0	\N	1	1	\N	\N	\N	1500000	90000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-26 00:00:00
159	81	81	2016-01-26	2016	125	\N	\N	\N	\N	\N	32.06.290.016.004.0266.0	\N	1	7	\N	\N	\N	2000000	100000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-01-26 00:00:00
156	78	78	2016-01-26	2016	56	\N	\N	\N	\N	\N	32.06.300.007.008.0113.0	\N	1	1	\N	\N	\N	682000	12168000	0	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-26 00:00:00
157	79	79	2016-01-26	2016	46	\N	\N	\N	\N	\N	32.06.300.002.012.0014.0	\N	1	1	\N	\N	\N	7000000	200000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-26 00:00:00
158	80	80	2016-01-26	2016	124	\N	\N	\N	\N	\N	32.06.760.006.008.0199.0	\N	1	1	\N	\N	\N	9250000	245000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-26 00:00:00
160	82	82	2016-01-26	2016	107	\N	\N	\N	\N	\N	32.06.210.007.010.0018.0	\N	1	7	\N	\N	\N	7000000	200000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-01-26 00:00:00
161	83	83	2016-01-26	2016	41	\N	\N	\N	\N	\N	32.06.320.003.027.1130.0	\N	1	3	\N	\N	\N	42000000	900000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-26 00:00:00
162	84	84	2016-01-26	2016	90	\N	\N	\N	\N	\N	32.06.290.001.005.0109.0	\N	1	7	\N	\N	\N	1250000	85000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-01-26 00:00:00
163	85	85	2016-01-26	2016	122	\N	\N	\N	\N	\N	32.06.300.004.002.0244.0	\N	5	1	\N	\N	\N	0	38040000	300000000	2015	["25","26","27","28","29","30","31"]	1	\N	0	0	2016-01-26 00:00:00
164	86	86	2016-01-26	2016	48	\N	\N	\N	\N	\N	32.06.300.005.009.0405.0	\N	1	1	\N	\N	\N	12250000	305000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-26 00:00:00
165	87	87	2016-01-26	2016	42	\N	\N	\N	\N	\N	32.06.320.003.027.1128.0	\N	1	3	\N	\N	\N	126889800	2597796000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-26 00:00:00
166	88	88	2016-01-26	2016	41	\N	\N	\N	\N	\N	32.06.320.003.027.1130.0	\N	1	3	\N	\N	\N	90110700	1862214000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-26 00:00:00
167	89	89	2016-01-26	2016	41	\N	\N	\N	\N	\N	32.06.320.003.027.1124.0	\N	1	3	\N	\N	\N	59076200	1241524000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-26 00:00:00
169	91	91	2016-01-27	2016	58	\N	\N	\N	\N	\N	32.06.760.002.011.0128.0	\N	1	1	\N	\N	\N	56100000	1182000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-27 00:00:00
170	92	92	2016-01-27	2016	58	\N	\N	\N	\N	\N	32.06.760.002.011.0128.0	\N	1	1	\N	\N	\N	39216000	784320000	0	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-27 00:00:00
171	93	93	2016-01-27	2016	108	\N	\N	\N	\N	\N	32.06.320.005.011.0001.0	\N	1	3	\N	\N	\N	3700550	134011000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-27 00:00:00
172	94	94	2016-01-27	2016	102	\N	\N	\N	\N	\N	32.06.290.004.006.0378.0	\N	1	1	\N	\N	\N	5603100	172062000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-27 00:00:00
173	95	95	2016-01-27	2016	90	\N	\N	\N	\N	\N	32.06.290.014.009.0152.0	\N	1	1	\N	\N	\N	14500000	350000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-27 00:00:00
174	96	\N	2016-01-27	2016	52	\N	\N	\N	\N	\N	32.06.320.005.002.1104.0	\N	1	3	\N	\N	\N	2092500	101850000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-27 00:00:00
175	97	96	2016-01-27	2016	52	\N	\N	\N	\N	\N	32.06.320.005.002.1104.0	\N	1	3	\N	\N	\N	2092500	101850000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-27 00:00:00
176	98	97	2016-01-27	2016	52	\N	\N	\N	\N	\N	32.06.320.005.002.0252.0	\N	1	3	\N	\N	\N	2150000	103000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-27 00:00:00
177	99	98	2016-01-27	2016	52	\N	\N	\N	\N	\N	32.06.760.005.001.0097.0	\N	1	1	\N	\N	\N	17293787	405875744	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-27 00:00:00
178	100	99	2016-01-27	2016	108	\N	\N	\N	\N	\N	32.06.310.003.005.0230.0	\N	1	1	\N	\N	\N	1523400	90468000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-27 00:00:00
179	101	100	2016-01-27	2016	72	\N	\N	\N	\N	\N	32.06.760.002.007.0409.0	\N	1	1	\N	\N	\N	3140400	122808000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-27 00:00:00
180	102	101	2016-01-27	2016	42	\N	\N	\N	\N	\N	32.06.310.004.018.0256.0	\N	1	3	\N	\N	\N	10000000	260000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-27 00:00:00
181	103	102	2016-01-27	2016	122	\N	\N	\N	\N	\N	32.06.300.001.009.0017.0	\N	1	7	\N	\N	\N	10250000	265000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-01-27 00:00:00
182	104	103	2016-01-27	2016	57	\N	\N	\N	\N	\N	32.06.330.004.016.0199.0	\N	1	3	\N	\N	\N	2250000	105000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-27 00:00:00
183	105	104	2016-01-27	2016	57	\N	\N	\N	\N	\N	32.06.330.004.016.0199.0	\N	1	3	\N	\N	\N	2250000	105000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-27 00:00:00
184	106	105	2016-01-28	2016	127	\N	\N	\N	\N	\N	32.06.310.003.003.3243.0	\N	1	3	\N	\N	\N	3525000	130500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-28 00:00:00
185	107	106	2016-01-15	2016	112	\N	\N	\N	\N	\N	32.06.320.006.009.0085.0	\N	5	1	\N	\N	\N	215250	304305000	300000000	2015	["25","26","27","28","29","30","31"]	1	\N	0	0	2016-01-15 00:00:00
186	108	107	2016-01-28	2016	128	\N	\N	\N	\N	\N	32.06.290.012.002.0034.0	\N	1	1	\N	\N	\N	7413300	208266000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-28 00:00:00
187	109	108	2016-01-28	2016	112	\N	\N	\N	\N	\N	32.06.320.006.009.0085.0	\N	5	1	\N	\N	\N	4772500	304305000	300000000	2015	["25","26","27","28","29","30","31"]	1	185	\N	\N	2016-01-28 00:00:00
188	110	109	2016-01-28	2016	128	\N	\N	\N	\N	\N	32.06.290.012.001.0037.0	\N	1	7	\N	\N	\N	9932500	198650000	0	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-01-28 00:00:00
189	111	110	2016-01-28	2016	85	\N	\N	\N	\N	\N	32.06.310.003.015.0422.0	\N	1	1	\N	\N	\N	4500000	150000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-28 00:00:00
190	112	111	2016-01-28	2016	56	\N	\N	\N	\N	\N	32.06.310.004.024.0278.0	\N	1	1	\N	\N	\N	5631900	172638000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-28 00:00:00
191	113	112	2016-01-28	2016	130	\N	\N	\N	\N	\N	32.06.310.003.014.0747.0	\N	1	1	\N	\N	\N	7512000	210240000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-28 00:00:00
192	114	113	2016-01-28	2016	107	\N	\N	\N	\N	\N	32.06.210.004.004.0109.0	\N	3	7	\N	\N	\N	0	25256000	60000000	2015	["13","14","15","16","17","18"]	5	\N	0	0	2016-01-28 00:00:00
200	122	121	2016-01-29	2016	63	\N	\N	\N	\N	\N	32.06.760.006.004.0277.0	\N	1	1	\N	\N	\N	77000000	1600000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-29 00:00:00
194	116	115	2016-01-28	2016	112	\N	\N	\N	\N	\N	32.06.320.006.009.0106.0	\N	5	1	\N	\N	\N	-8506250	129875000	300000000	2015	["25","26","27","28","29","30","31"]	1	\N	0	0	2016-01-28 00:00:00
193	115	114	2016-01-28	2016	89	\N	\N	\N	\N	\N	32.06.760.005.010.0442.0	\N	3	1	\N	\N	\N	47828250	1016565000	60000000	2015	["13","14","15","16","17","18"]	1	\N	0	0	2016-01-28 00:00:00
195	117	116	2016-01-28	2016	45	\N	\N	\N	\N	\N	32.06.300.006.010.0262.0	\N	1	1	\N	\N	\N	2000000	100000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-28 00:00:00
196	118	117	2016-01-28	2016	89	\N	\N	\N	\N	\N	32.06.310.004.024.0317.0	\N	1	3	\N	\N	\N	2000000	100000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-28 00:00:00
197	119	118	2016-01-29	2016	93	\N	\N	\N	\N	\N	32.06.320.003.027.1888.0	\N	1	3	\N	\N	\N	22000000	500000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-29 00:00:00
198	120	119	2016-01-29	2016	42	\N	\N	\N	\N	\N	32.06.310.004.021.0065.0	\N	1	3	\N	\N	\N	46525000	990500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-29 00:00:00
199	121	120	2016-01-29	2016	72	\N	\N	\N	\N	\N	32.06.310.004.023.3370.0	\N	1	1	\N	\N	\N	572400	71448000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-29 00:00:00
201	123	122	2016-01-29	2016	63	\N	\N	\N	\N	\N	32.06.760.006.004.0283.0	\N	1	1	\N	\N	\N	50000000	1000000000	0	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-29 00:00:00
202	124	123	2016-01-29	2016	63	\N	\N	\N	\N	\N	32.06.760.006.004.0253.0	\N	1	1	\N	\N	\N	75000000	1500000000	0	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-29 00:00:00
203	125	124	2016-01-29	2016	63	\N	\N	\N	\N	\N	32.06.760.006.002.0101.0	\N	1	1	\N	\N	\N	25000000	500000000	0	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-29 00:00:00
204	126	125	2016-01-29	2016	113	\N	\N	\N	\N	\N	32.06.760.006.007.0112.0	\N	1	1	\N	\N	\N	5500000	170000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-29 00:00:00
205	127	126	2016-01-29	2016	94	\N	\N	\N	\N	\N	32.06.210.007.017.0325.0	\N	1	1	\N	\N	\N	9250000	245000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-29 00:00:00
206	128	127	2016-01-29	2016	106	\N	\N	\N	\N	\N	32.06.290.006.004.0036.0	\N	7	7	\N	\N	\N	1000000	80000000	60000000	2015	["38","39","40","41","42","43"]	5	\N	0	0	2016-01-29 00:00:00
207	129	128	2016-01-29	2016	106	\N	\N	\N	\N	\N	32.06.290.006.004.0038.0	\N	7	7	\N	\N	\N	1500000	30000000	0	2015	["38","39","40","41","42","43"]	5	\N	0	0	2016-01-29 00:00:00
208	130	129	2016-01-29	2016	130	\N	\N	\N	\N	\N	32.06.320.006.013.1197.0	\N	1	3	\N	\N	\N	2000000	100000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-29 00:00:00
209	131	130	2016-01-29	2016	99	\N	\N	\N	\N	\N	32.06.290.010.008.0150.0	\N	1	1	\N	\N	\N	3500000	130000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-29 00:00:00
210	132	131	2016-01-29	2016	99	\N	\N	\N	\N	\N	32.06.290.010.008.0151.0	\N	1	1	\N	\N	\N	6500000	130000000	0	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-01-29 00:00:00
211	133	132	2016-02-01	2016	93	\N	\N	\N	\N	\N	32.06.760.005.017.0539.0	\N	1	1	\N	\N	\N	262000000	5300000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-01 00:00:00
212	134	133	2016-02-01	2016	41	\N	\N	\N	\N	\N	32.06.320.004.009.1140.0	\N	1	3	\N	\N	\N	49364000	1047280000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-01 00:00:00
214	136	135	2016-02-01	2016	41	\N	\N	\N	\N	\N	32.06.320.003.027.1122.0	\N	1	3	\N	\N	\N	58079800	284312182	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-01 00:00:00
215	137	136	2016-02-01	2016	112	\N	\N	\N	\N	\N	32.06.320.006.014.0263.0	\N	1	7	\N	\N	\N	0	50000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-01 00:00:00
216	138	137	2016-02-01	2016	131	\N	\N	\N	\N	\N	32.06.330.002.002.0137.0	\N	1	1	\N	\N	\N	250000	65000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-01 00:00:00
217	139	138	2016-02-01	2016	132	\N	\N	\N	\N	\N	32.06.210.008.005.0376.0	\N	1	1	\N	\N	\N	15546000	370920000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-01 00:00:00
218	140	139	2016-02-01	2016	132	\N	\N	\N	\N	\N	32.06.210.008.005.0376.0	\N	1	1	\N	\N	\N	11176000	223520000	0	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-01 00:00:00
219	141	140	2016-02-01	2016	93	\N	\N	\N	\N	\N	32.06.290.016.009.0080.0	\N	1	1	\N	\N	\N	29500000	650000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-01 00:00:00
220	142	141	2016-02-01	2016	132	\N	\N	\N	\N	\N	32.06.210.008.005.0035.0	\N	1	1	\N	\N	\N	16808000	336160000	0	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-01 00:00:00
221	143	142	2016-02-01	2016	93	\N	\N	\N	\N	\N	32.06.290.016.009.0080.0	\N	1	1	\N	\N	\N	5000000	100000000	0	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-01 00:00:00
222	144	143	2016-02-01	2016	104	\N	\N	\N	\N	\N	32.06.760.007.010.0913.0	\N	1	1	\N	\N	\N	7000000	200000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-01 00:00:00
223	145	144	2016-02-01	2016	120	\N	\N	\N	\N	\N	32.06.320.003.015.0018.0	\N	1	1	\N	\N	\N	7920000	218400000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-01 00:00:00
224	146	145	2016-02-01	2016	93	\N	\N	\N	\N	\N	32.06.760.005.003.0289.0	\N	1	1	\N	\N	\N	7000000	200000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-01 00:00:00
225	147	146	2016-02-01	2016	59	\N	\N	\N	\N	\N	32.06.350.008.008.0124.0	\N	1	1	\N	\N	\N	3000000	120000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-01 00:00:00
226	148	147	2016-02-02	2016	112	\N	\N	\N	\N	\N	32.06.320.008.001.0214.0	\N	1	7	\N	\N	\N	17500000	410000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-02 00:00:00
227	149	148	2016-02-02	2016	122	\N	\N	\N	\N	\N	32.06.300.015.007.0107.0	\N	5	1	\N	\N	\N	5840000	416800000	300000000	2015	["25","26","27","28","29","30","31"]	1	\N	0	0	2016-02-02 00:00:00
228	150	149	2016-02-02	2016	124	\N	\N	\N	\N	\N	32.06.760.002.009.0298.0	\N	1	7	\N	\N	\N	12925000	318500000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-02 00:00:00
229	151	150	2016-02-02	2016	98	\N	\N	\N	\N	\N	32.06.310.011.005.0068.0	\N	1	1	\N	\N	\N	75720000	1574400000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-02 00:00:00
230	152	151	2016-02-02	2016	118	\N	\N	\N	\N	\N	32.06.320.004.009.1062.0	\N	1	3	\N	\N	\N	31380000	687600000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-02 00:00:00
231	153	152	2016-02-02	2016	118	\N	\N	\N	\N	\N	32.06.320.004.009.1271.0	\N	1	3	\N	\N	\N	21980000	499600000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-02 00:00:00
232	154	153	2016-02-02	2016	108	\N	\N	\N	\N	\N	32.06.210.007.012.0142.0	\N	1	3	\N	\N	\N	9000000	240000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-02 00:00:00
233	155	154	2016-02-02	2016	118	\N	\N	\N	\N	\N	32.06.320.004.009.1256.0	\N	1	3	\N	\N	\N	19860000	457200000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-02 00:00:00
235	157	156	2016-02-02	2016	89	\N	\N	\N	\N	\N	32.06.290.002.005.0083.0	\N	1	1	\N	\N	\N	1880000	97600000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-02 00:00:00
236	158	157	2016-02-02	2016	127	\N	\N	\N	\N	\N	32.06.310.009.023.0035.0	\N	1	7	\N	\N	\N	9500000	250000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-02 00:00:00
237	159	158	2016-02-02	2016	91	\N	\N	\N	\N	\N	32.06.320.003.003.0031.0	\N	1	7	\N	\N	\N	3500000	130000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-02 00:00:00
238	160	159	2016-02-02	2016	118	\N	\N	\N	\N	\N	32.06.760.005.012.0416.0	\N	1	1	\N	\N	\N	17000000	400000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-02 00:00:00
239	161	160	2016-02-02	2016	66	\N	\N	\N	\N	\N	32.06.760.005.016.0369.0	\N	1	1	\N	\N	\N	6600000	192000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-02 00:00:00
240	162	161	2016-02-02	2016	118	\N	\N	\N	\N	\N	32.06.760.005.003.0745.0	\N	1	3	\N	\N	\N	32000000	700000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-02 00:00:00
241	163	162	2016-02-02	2016	66	\N	\N	\N	\N	\N	32.06.760.005.016.0369.0	\N	1	1	\N	\N	\N	7175000	203500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-02 00:00:00
242	164	163	2016-02-02	2016	71	\N	\N	\N	\N	\N	32.06.310.001.008.0056.0	\N	1	7	\N	\N	\N	1296000	85920000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-02 00:00:00
243	165	164	2016-02-02	2016	41	\N	\N	\N	\N	\N	32.06.310.002.007.0261.0	\N	1	1	\N	\N	\N	4500000	150000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-02 00:00:00
244	166	165	2016-02-02	2016	112	\N	\N	\N	\N	\N	32.06.320.001.006.0029.0	\N	1	7	\N	\N	\N	1762800	95256000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-02 00:00:00
245	167	166	2016-02-02	2016	90	\N	\N	\N	\N	\N	32.06.290.004.005.0191.0	\N	1	1	\N	\N	\N	766500	75330000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-02 00:00:00
246	168	167	2016-02-02	2016	90	\N	\N	\N	\N	\N	32.06.290.001.016.0086.0	\N	1	1	\N	\N	\N	147000000	3000000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-02 00:00:00
247	169	168	2016-02-02	2016	60	\N	\N	\N	\N	\N	32.06.310.003.003.0040.0	\N	1	1	\N	\N	\N	3750000	135000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-02 00:00:00
248	170	169	2016-02-02	2016	60	\N	\N	\N	\N	\N	32.06.310.003.003.0040.0	\N	1	1	\N	\N	\N	4500000	150000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-02 00:00:00
249	171	170	2016-02-03	2016	120	\N	\N	\N	\N	\N	32.06.320.005.006.0003.0	\N	1	3	\N	\N	\N	178900	49000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-03 00:00:00
250	172	171	2016-02-03	2016	120	\N	\N	\N	\N	\N	32.06.320.005.006.0003.0	\N	1	3	\N	\N	\N	2425400	58000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-03 00:00:00
251	173	172	2016-02-03	2016	105	\N	\N	\N	\N	\N	32.06.320.006.013.2150.0	\N	1	3	\N	\N	\N	397650	60000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-03 00:00:00
252	174	173	2016-02-03	2016	106	\N	\N	\N	\N	\N	32.06.290.009.010.0155.0	\N	5	3	\N	\N	\N	5790900	415818000	300000000	2015	["25","26","27","28","29","30","31"]	1	\N	0	0	2016-02-03 00:00:00
253	175	174	2016-02-03	2016	124	\N	\N	\N	\N	\N	32.06.760.004.009.0253.0	\N	3	1	\N	\N	\N	24477700	549554000	60000000	2015	["13","14","15","16","17","18"]	1	\N	0	0	2016-02-03 00:00:00
234	156	155	2016-02-02	2016	108	\N	\N	\N	\N	\N	32.06.210.007.012.0317.0	\N	1	3	\N	\N	\N	2681818	113636363	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-02 00:00:00
255	177	176	2016-02-03	2016	113	\N	\N	\N	\N	\N	32.06.320.003.027.3476.0	\N	1	1	\N	\N	\N	97000000	2000000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-03 00:00:00
256	178	177	2016-02-03	2016	82	\N	\N	\N	\N	\N	32.06.760.006.006.0250.0	\N	1	1	\N	\N	\N	1000000	80000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-03 00:00:00
257	179	178	2016-02-03	2016	60	\N	\N	\N	\N	\N	32.06.210.005.001.0018.0	\N	1	3	\N	\N	\N	2000000	100000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-03 00:00:00
254	176	175	2016-02-03	2016	134	\N	\N	\N	\N	\N	32.06.320.004.004.0170.0	\N	8	1	\N	\N	\N	54600000	1152000000	60000000	2015	["44","45","46","47","48","49"]	1	\N	0	0	2016-02-03 00:00:00
259	181	180	2016-02-03	2016	109	\N	\N	\N	\N	\N	32.06.310.004.022.0184.0	\N	1	1	\N	\N	\N	5000000	160000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-03 00:00:00
260	182	181	2016-02-04	2016	94	\N	\N	\N	\N	\N	32.06.320.006.023.0657.0	\N	1	3	\N	\N	\N	6500000	190000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-04 00:00:00
261	183	182	2016-02-04	2016	135	\N	\N	\N	\N	\N	32.06.310.003.015.0067.0	\N	1	1	\N	\N	\N	6924750	198495000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-04 00:00:00
262	184	183	2016-02-04	2016	136	\N	\N	\N	\N	\N	32.06.211.002.006.0002.0	\N	1	7	\N	\N	\N	3000000	120000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-04 00:00:00
263	185	184	2016-02-04	2016	43	\N	\N	\N	\N	\N	32.06.310.003.007.0313.0	\N	1	1	\N	\N	\N	4500000	150000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-04 00:00:00
264	186	185	2016-02-05	2016	126	\N	\N	\N	\N	\N	32.06.330.008.014.0262.0	\N	1	1	\N	\N	\N	0	17500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-05 00:00:00
265	187	186	2016-02-05	2016	42	\N	\N	\N	\N	\N	32.06.760.005.001.0097.0	\N	1	1	\N	\N	\N	24200000	544000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-05 00:00:00
266	188	187	2016-02-05	2016	136	\N	\N	\N	\N	\N	32.06.211.006.005.0009.0	\N	1	7	\N	\N	\N	3000000	120000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-05 00:00:00
267	189	188	2016-02-05	2016	118	\N	\N	\N	\N	\N	32.06.300.006.005.0492.0	\N	1	3	\N	\N	\N	19000000	440000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-05 00:00:00
268	190	189	2016-02-05	2016	118	\N	\N	\N	\N	\N	32.06.300.006.005.0492.0	\N	1	3	\N	\N	\N	29887500	657750000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-05 00:00:00
269	191	190	2016-02-05	2016	118	\N	\N	\N	\N	\N	32.06.300.006.005.0492.0	\N	1	3	\N	\N	\N	19000000	440000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-05 00:00:00
270	192	191	2016-02-05	2016	111	\N	\N	\N	\N	\N	32.06.320.006.011.0201.0	\N	1	1	\N	\N	\N	7707600	214152000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-05 00:00:00
280	202	200	2016-02-05	2016	110	\N	\N	\N	\N	\N	32.06.350.009.012.0115.0	\N	1	1	\N	\N	\N	37000000	800000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-05 00:00:00
272	194	192	2016-02-05	2016	115	\N	\N	\N	\N	\N	32.06.350.006.005.0103.0	\N	1	7	\N	\N	\N	2500000	50000000	0	2015	["1","2","3","4","5","6"]	5	\N	50000	1	2016-02-05 00:00:00
273	195	193	2016-02-05	2016	126	\N	\N	\N	\N	\N	32.06.330.001.001.0005.0	\N	1	7	\N	\N	\N	1506000	50000000	60000000	2015	["1","2","3","4","5","6"]	5	\N	60240	2	2016-02-05 00:00:00
274	196	194	2016-02-05	2016	80	\N	\N	\N	\N	\N	32.06.310.003.003.1338.0	\N	1	1	\N	\N	\N	5542200	170844000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-05 00:00:00
275	197	195	2016-02-05	2016	63	\N	\N	\N	\N	\N	32.06.760.006.003.0065.0	\N	1	1	\N	\N	\N	7000000	200000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-05 00:00:00
276	198	196	2016-02-05	2016	71	\N	\N	\N	\N	\N	32.06.310.001.004.0154.0	\N	1	7	\N	\N	\N	7000000	200000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-05 00:00:00
277	199	197	2016-02-05	2016	108	\N	\N	\N	\N	\N	32.06.310.004.018.0256.0	\N	1	3	\N	\N	\N	2512500	110250000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-05 00:00:00
278	200	198	2016-02-05	2016	108	\N	\N	\N	\N	\N	32.06.310.004.018.0256.0	\N	1	3	\N	\N	\N	5137500	102750000	0	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-05 00:00:00
279	201	199	2016-02-05	2016	108	\N	\N	\N	\N	\N	32.06.310.004.018.0256.0	\N	1	3	\N	\N	\N	3600000	72000000	0	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-05 00:00:00
281	203	201	2016-02-05	2016	108	\N	\N	\N	\N	\N	32.06.210.007.012.0145.0	\N	1	3	\N	\N	\N	7837200	216744000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-05 00:00:00
282	204	202	2016-02-09	2016	82	\N	\N	\N	\N	\N	32.06.760.006.016.0158.0	\N	3	1	\N	\N	\N	2000000	100000000	60000000	2015	["13","14","15","16","17","18"]	1	\N	0	0	2016-02-09 00:00:00
284	206	204	2016-02-09	2016	108	\N	\N	\N	\N	\N	32.06.760.005.001.0097.0	\N	1	1	\N	\N	\N	16990000	399800000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-09 00:00:00
285	207	205	2016-02-09	2016	110	\N	\N	\N	\N	\N	32.06.310.003.002.0927.0	\N	1	1	\N	\N	\N	1750000	95000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-09 00:00:00
286	208	206	2016-02-09	2016	98	\N	\N	\N	\N	\N	32.06.310.002.011.0092.0	\N	1	1	\N	\N	\N	8000000	220000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-09 00:00:00
287	209	207	2016-02-09	2016	57	\N	\N	\N	\N	\N	32.06.330.004.016.0199.0	\N	1	3	\N	\N	\N	2250000	105000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-09 00:00:00
288	210	208	2016-02-09	2016	57	\N	\N	\N	\N	\N	32.06.330.004.016.0199.0	\N	1	3	\N	\N	\N	2250000	105000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-09 00:00:00
289	211	209	2016-02-09	2016	41	\N	\N	\N	\N	\N	32.06.760.002.008.0131.0	\N	1	1	\N	\N	\N	4500000	150000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-09 00:00:00
290	212	210	2016-02-09	2016	41	\N	\N	\N	\N	\N	32.06.320.003.027.1130.0	\N	1	3	\N	\N	\N	30845900	676918000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-09 00:00:00
291	213	211	2016-02-09	2016	109	\N	\N	\N	\N	\N	32.06.310.005.007.0534.0	\N	1	1	\N	\N	\N	1500000	90000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-09 00:00:00
292	214	212	2016-02-09	2016	55	\N	\N	\N	\N	\N	32.06.290.002.017.0074.0	\N	1	3	\N	\N	\N	138381818	2827636364	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-09 00:00:00
293	215	213	2016-02-09	2016	66	\N	\N	\N	\N	\N	32.06.300.001.009.0448.0	\N	1	1	\N	\N	\N	13250000	325000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-09 00:00:00
294	216	214	2016-02-09	2016	127	\N	\N	\N	\N	\N	32.06.310.003.003.3358.0	\N	1	3	\N	\N	\N	400000	68000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-09 00:00:00
295	217	215	2016-02-09	2016	138	\N	\N	\N	\N	\N	32.06.760.004.005.0001.0	\N	1	1	\N	\N	\N	17000000	400000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-09 00:00:00
296	218	216	2016-02-09	2016	127	\N	\N	\N	\N	\N	32.06.310.003.009.0155.0	\N	1	1	\N	\N	\N	2000000	100000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-09 00:00:00
297	219	217	2016-02-09	2016	138	\N	\N	\N	\N	\N	32.06.760.003.002.0019.0	\N	1	1	\N	\N	\N	20000000	400000000	0	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-09 00:00:00
298	220	218	2016-02-09	2016	127	\N	\N	\N	\N	\N	32.06.310.003.003.2959.0	\N	1	1	\N	\N	\N	2000000	100000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-09 00:00:00
300	222	219	2016-02-10	2016	104	\N	\N	\N	\N	\N	32.06.760.005.010.0547.0	\N	1	1	\N	\N	\N	5060800	161216000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-10 00:00:00
299	221	220	2016-02-10	2016	104	\N	\N	\N	\N	\N	32.06.760.005.010.0547.0	\N	1	1	\N	\N	\N	7259200	205184000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-10 00:00:00
301	223	221	2016-02-10	2016	106	\N	\N	\N	\N	\N	32.06.290.016.011.0067.0	\N	5	1	\N	\N	\N	66109600	1622192000	300000000	2015	["25","26","27","28","29","30","31"]	1	\N	0	0	2016-02-10 00:00:00
302	224	222	2016-02-10	2016	106	\N	\N	\N	\N	\N	32.06.350.004.011.0056.0	\N	5	1	\N	\N	\N	0	18805000	300000000	2015	["25","26","27","28","29","30","31"]	1	\N	0	0	2016-02-10 00:00:00
283	205	203	2016-02-09	2016	118	\N	\N	\N	\N	\N	32.06.300.006.005.0492.0	\N	1	3	\N	\N	\N	16850000	397000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-09 00:00:00
271	193	293	2016-02-05	2016	115	\N	\N	\N	\N	\N	32.06.350.006.004.0043.0	\N	1	7	\N	\N	\N	3500000	130000000	60000000	2015	["1","2","3","4","5","6"]	5	\N	70000	1	2016-02-05 00:00:00
305	227	225	2016-02-10	2016	90	\N	\N	\N	\N	\N	32.06.290.011.012.0138.0	\N	1	1	\N	\N	\N	750000	75000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-10 00:00:00
306	228	226	2016-02-10	2016	111	\N	\N	\N	\N	\N	32.06.290.011.005.0116.0	\N	1	7	\N	\N	\N	2400000	108000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-10 00:00:00
307	229	227	2016-02-10	2016	126	\N	\N	\N	\N	\N	32.06.330.005.014.0002.0	\N	1	7	\N	\N	\N	9500000	250000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-10 00:00:00
308	230	228	2016-02-10	2016	91	\N	\N	\N	\N	\N	32.06.320.006.013.0990.0	\N	1	3	\N	\N	\N	3250000	125000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-10 00:00:00
309	231	229	2016-02-10	2016	89	\N	\N	\N	\N	\N	32.06.760.006.004.1196.0	\N	1	1	\N	\N	\N	2900000	118000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-10 00:00:00
310	232	230	2016-02-10	2016	139	\N	\N	\N	\N	\N	32.06.310.003.002.0789.0	\N	1	1	\N	\N	\N	6198300	183966000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-10 00:00:00
311	233	231	2016-02-10	2016	92	\N	\N	\N	\N	\N	32.06.330.010.009.0219.0	\N	1	1	\N	\N	\N	22000000	500000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-10 00:00:00
312	234	232	2016-02-10	2016	41	\N	\N	\N	\N	\N	32.06.320.003.027.2368.0	\N	1	3	\N	\N	\N	64500000	1350000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-10 00:00:00
313	235	233	2016-02-10	2016	96	\N	\N	\N	\N	\N	32.06.760.001.009.0195.0	\N	1	1	\N	\N	\N	4500000	150000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-10 00:00:00
314	236	234	2016-02-10	2016	118	\N	\N	\N	\N	\N	32.06.310.004.023.3376.0	\N	1	3	\N	\N	\N	2000000	100000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-10 00:00:00
315	237	235	2016-02-10	2016	127	\N	\N	\N	\N	\N	32.06.310.004.016.1129.0	\N	1	1	\N	\N	\N	2000000	100000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-10 00:00:00
316	238	236	2016-02-10	2016	105	\N	\N	\N	\N	\N	32.06.320.003.027.3469.0	\N	1	1	\N	\N	\N	37000000	800000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-10 00:00:00
317	239	237	2016-02-11	2016	41	\N	\N	\N	\N	\N	32.06.320.001.023.0237.0	\N	1	3	\N	\N	\N	49178000	1043560000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-11 00:00:00
318	240	238	2016-02-11	2016	124	\N	\N	\N	\N	\N	32.06.760.004.004.0083.0	\N	1	7	\N	\N	\N	12000000	300000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-11 00:00:00
319	241	239	2016-02-11	2016	99	\N	\N	\N	\N	\N	32.06.290.015.007.0060.0	\N	1	1	\N	\N	\N	2521200	110424000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-11 00:00:00
320	242	240	2016-02-11	2016	89	\N	\N	\N	\N	\N	32.06.320.002.011.0352.0	\N	1	1	\N	\N	\N	750000	75000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-11 00:00:00
321	243	241	2016-02-11	2016	41	\N	\N	\N	\N	\N	32.06.760.006.004.0196.0	\N	1	1	\N	\N	\N	2750000	115000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-11 00:00:00
323	245	242	2016-02-11	2016	50	\N	\N	\N	\N	\N	32.06.320.005.011.0001.0	\N	1	3	\N	\N	\N	281350	45000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-11 00:00:00
322	244	243	2016-02-11	2016	140	\N	\N	\N	\N	\N	32.06.320.003.027.3050.0	\N	1	1	\N	\N	\N	97000000	2000000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-11 00:00:00
324	246	245	2016-02-11	2016	118	\N	\N	\N	\N	\N	32.06.320.004.009.1096.0	\N	1	3	\N	\N	\N	32800000	716000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-11 00:00:00
326	248	246	2016-02-11	2016	50	\N	\N	\N	\N	\N	32.06.320.005.011.0001.0	\N	1	3	\N	\N	\N	1635750	63000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-11 00:00:00
327	249	247	2016-02-11	2016	50	\N	\N	\N	\N	\N	32.06.320.005.011.0001.0	\N	1	3	\N	\N	\N	731800	49000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-11 00:00:00
328	250	248	2016-02-11	2016	50	\N	\N	\N	\N	\N	32.06.320.005.011.0001.0	\N	1	3	\N	\N	\N	3386750	87000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-11 00:00:00
329	251	249	2016-02-11	2016	111	\N	\N	\N	\N	\N	32.06.290.004.004.0113.0	\N	1	7	\N	\N	\N	986500	79730000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-11 00:00:00
330	252	250	2016-02-11	2016	50	\N	\N	\N	\N	\N	32.06.320.005.011.0001.0	\N	1	3	\N	\N	\N	1635750	63000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-11 00:00:00
331	253	251	2016-02-11	2016	112	\N	\N	\N	\N	\N	32.06.320.006.013.1277.0	\N	1	1	\N	\N	\N	1000000	80000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-11 00:00:00
332	254	252	2016-02-11	2016	60	\N	\N	\N	\N	\N	32.06.320.007.006.0212.0	\N	1	1	\N	\N	\N	17150000	403000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-11 00:00:00
333	255	253	2016-02-12	2016	54	\N	\N	\N	\N	\N	32.06.310.003.003.1835.0	\N	1	1	\N	\N	\N	4100000	142000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-12 00:00:00
334	256	254	2016-02-12	2016	133	\N	\N	\N	\N	\N	32.06.760.002.001.0333.0	\N	1	1	\N	\N	\N	250000	65000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-12 00:00:00
335	257	255	2016-02-12	2016	133	\N	\N	\N	\N	\N	32.06.760.002.001.0333.0	\N	1	1	\N	\N	\N	0	60000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-12 00:00:00
336	1	256	2015-10-29	2015	141	\N	\N	\N	\N	\N	32.06.760.003.001.0595.0	\N	1	3	\N	\N	\N	25225200	550000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2015-10-29 00:00:00
338	258	258	2016-02-12	2016	120	\N	\N	\N	\N	\N	32.06.310.003.001.0441.0	\N	3	1	\N	\N	\N	372750	67455000	60000000	2015	["13","14","15","16","17","18"]	1	\N	0	0	2016-02-12 00:00:00
339	259	259	2016-02-12	2016	42	\N	\N	\N	\N	\N	32.06.300.007.011.0038.0	\N	1	1	\N	\N	\N	5608200	172164000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-12 00:00:00
340	260	260	2016-02-12	2016	112	\N	\N	\N	\N	\N	32.06.320.007.002.1076.0	\N	1	7	\N	\N	\N	3720000	120000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-12 00:00:00
341	261	261	2016-02-12	2016	71	\N	\N	\N	\N	\N	32.06.340.012.002.0001.0	\N	1	7	\N	\N	\N	1750000	95000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-12 00:00:00
342	262	262	2016-02-12	2016	94	\N	\N	\N	\N	\N	32.06.350.006.007.0352.0	\N	1	1	\N	\N	\N	24500000	550000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-12 00:00:00
343	263	263	2016-02-12	2016	102	\N	\N	\N	\N	\N	32.06.760.005.003.0318.0	\N	1	3	\N	\N	\N	152000000	3100000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-12 00:00:00
344	264	264	2016-02-15	2016	127	\N	\N	\N	\N	\N	32.06.310.003.006.0045.0	\N	1	7	\N	\N	\N	4994700	159894000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-15 00:00:00
345	265	265	2016-02-15	2016	127	\N	\N	\N	\N	\N	32.06.310.003.006.0278.0	\N	1	7	\N	\N	\N	2600000	52000000	0	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-15 00:00:00
346	266	266	2016-02-15	2016	104	\N	\N	\N	\N	\N	32.06.320.004.006.0221.0	\N	1	1	\N	\N	\N	300800000	6076000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-15 00:00:00
347	267	267	2016-02-15	2016	46	\N	\N	\N	\N	\N	32.06.290.013.010.0028.0	\N	1	1	\N	\N	\N	6000000	180000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-15 00:00:00
325	247	244	2016-02-11	2016	50	\N	\N	\N	\N	\N	32.06.320.005.011.0001.0	\N	1	3	\N	\N	\N	420550	46000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-11 00:00:00
348	268	268	2016-02-15	2016	41	\N	\N	\N	\N	\N	32.06.320.004.005.0209.0	\N	5	1	\N	\N	\N	300000	306000000	300000000	2015	["25","26","27","28","29","30","31"]	1	\N	0	0	2016-02-15 00:00:00
369	289	289	2016-02-16	2016	109	\N	\N	\N	\N	\N	32.06.310.004.019.0632.0	\N	1	1	\N	\N	\N	250000	65000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-16 00:00:00
351	271	271	2016-02-15	2016	42	\N	\N	\N	\N	\N	32.06.310.004.021.0065.0	\N	1	3	\N	\N	\N	16850000	397000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-15 00:00:00
352	272	272	2016-01-05	2016	112	\N	\N	\N	\N	\N	32.06.320.007.006.0275.0	\N	1	7	\N	\N	\N	64100000	1342000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-01-05 00:00:00
353	273	273	2016-02-15	2016	112	\N	\N	\N	\N	\N	32.06.320.007.006.0245.0	\N	1	7	\N	\N	\N	20500000	410000000	0	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-15 00:00:00
354	274	274	2016-02-15	2016	110	\N	\N	\N	\N	\N	32.06.320.006.021.0454.0	\N	1	1	\N	\N	\N	250000	65000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-15 00:00:00
355	275	275	2016-02-15	2016	112	\N	\N	\N	\N	\N	32.06.320.007.006.0268.0	\N	1	1	\N	\N	\N	13970000	279400000	0	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-15 00:00:00
356	276	276	2016-02-15	2016	112	\N	\N	\N	\N	\N	32.06.320.007.006.0245.0	\N	1	7	\N	\N	\N	24660000	493200000	0	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-15 00:00:00
357	277	277	2016-02-15	2016	112	\N	\N	\N	\N	\N	32.06.320.007.006.0266.0	\N	1	7	\N	\N	\N	15450000	309000000	0	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-15 00:00:00
358	278	278	2016-02-15	2016	112	\N	\N	\N	\N	\N	32.06.320.007.006.0266.0	\N	1	7	\N	\N	\N	15970000	319400000	0	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-15 00:00:00
359	279	279	2016-02-15	2016	112	\N	\N	\N	\N	\N	32.06.320.007.006.0245.0	\N	1	7	\N	\N	\N	5130000	102600000	0	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-15 00:00:00
360	280	280	2016-02-15	2016	115	\N	\N	\N	\N	\N	32.06.350.011.011.0140.0	\N	1	7	\N	\N	\N	13500000	330000000	60000000	2015	["1","2","3","4","5","6"]	5	\N	270000	1	2016-02-15 00:00:00
361	281	281	2016-02-15	2016	80	\N	\N	\N	\N	\N	32.06.760.004.004.0300.0	\N	1	1	\N	\N	\N	8250000	225000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-15 00:00:00
362	282	282	2016-02-15	2016	80	\N	\N	\N	\N	\N	32.06.760.004.004.0301.0	\N	1	1	\N	\N	\N	11250000	225000000	0	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-15 00:00:00
363	283	283	2016-02-15	2016	45	\N	\N	\N	\N	\N	32.06.320.006.013.1914.0	\N	1	1	\N	\N	\N	2000000	100000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-15 00:00:00
364	284	284	2016-02-15	2016	131	\N	\N	\N	\N	\N	32.06.290.012.017.0040.0	\N	1	1	\N	\N	\N	900000	78000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-15 00:00:00
365	285	285	2016-02-15	2016	72	\N	\N	\N	\N	\N	32.06.310.003.007.0786.0	\N	1	1	\N	\N	\N	7350000	207000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-15 00:00:00
366	286	286	2016-02-16	2016	106	\N	\N	\N	\N	\N	32.06.290.009.010.0155.0	\N	5	3	\N	\N	\N	0	113504000	300000000	2015	["25","26","27","28","29","30","31"]	1	\N	0	0	2016-02-16 00:00:00
367	287	287	2016-02-16	2016	106	\N	\N	\N	\N	\N	32.06.290.009.010.0155.0	\N	5	3	\N	\N	\N	0	137472000	300000000	2015	["25","26","27","28","29","30","31"]	1	\N	0	0	2016-02-16 00:00:00
368	288	288	2016-02-16	2016	109	\N	\N	\N	\N	\N	32.06.310.003.005.0214.0	\N	1	1	\N	\N	\N	250000	65000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-16 00:00:00
370	290	290	2016-02-16	2016	72	\N	\N	\N	\N	\N	32.06.760.002.006.1047.0	\N	1	1	\N	\N	\N	9500000	250000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-16 00:00:00
371	291	291	2016-02-16	2016	60	\N	\N	\N	\N	\N	32.06.170.007.012.0013.0	\N	7	1	\N	\N	\N	2063500	101270000	60000000	2015	["38","39","40","41","42","43"]	1	\N	0	0	2016-02-16 00:00:00
372	292	292	2016-02-16	2016	63	\N	\N	\N	\N	\N	32.06.310.003.015.0704.0	\N	1	1	\N	\N	\N	14500000	350000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-16 00:00:00
373	293	294	2016-02-16	2016	49	\N	\N	\N	\N	\N	32.06.760.005.007.0140.0	\N	1	1	\N	\N	\N	7000000	200000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-16 00:00:00
375	295	295	2016-02-16	2016	71	\N	\N	\N	\N	\N	32.06.310.002.009.0107.0	\N	1	7	\N	\N	\N	3000000	120000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-16 00:00:00
379	299	300	2016-02-16	2016	120	\N	\N	\N	\N	\N	32.06.171.002.002.0196.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-16 00:00:00
374	294	296	2016-02-16	2016	49	\N	\N	\N	\N	\N	32.06.760.005.007.0140.0	\N	1	1	\N	\N	\N	1050000	21000000	0	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-16 00:00:00
376	296	297	2016-02-16	2016	89	\N	\N	\N	\N	\N	32.06.290.010.004.0118.0	\N	1	1	\N	\N	\N	192000	63840000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-16 00:00:00
377	297	298	2016-02-16	2016	89	\N	\N	\N	\N	\N	32.06.290.010.004.0118.0	\N	1	1	\N	\N	\N	18144500	422890000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-16 00:00:00
378	298	299	2016-02-16	2016	89	\N	\N	\N	\N	\N	32.06.290.010.004.0118.0	\N	1	1	\N	\N	\N	0	39000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-16 00:00:00
380	300	301	2016-02-16	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.0817.0	\N	1	3	\N	\N	\N	2500000	110000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-16 00:00:00
381	301	302	2016-02-16	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.0238.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-16 00:00:00
382	302	303	2016-02-16	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.1057.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-16 00:00:00
383	303	304	2016-02-16	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.0238.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-16 00:00:00
384	304	305	2016-02-16	2016	142	\N	\N	\N	\N	\N	32.06.210.007.011.0594.0	\N	1	3	\N	\N	\N	1797600	83000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-16 00:00:00
385	305	306	2016-02-16	2016	120	\N	\N	\N	\N	\N	32.06.171.002.002.0196.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-16 00:00:00
386	306	307	2016-02-16	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.0238.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-16 00:00:00
387	307	308	2016-02-16	2016	142	\N	\N	\N	\N	\N	32.06.290.012.002.0020.0	\N	1	1	\N	\N	\N	2000000	100000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-16 00:00:00
388	308	309	2016-02-16	2016	108	\N	\N	\N	\N	\N	32.06.760.005.006.0155.0	\N	1	1	\N	\N	\N	22008000	500160000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-16 00:00:00
389	309	310	2016-02-17	2016	61	\N	\N	\N	\N	\N	32.06.210.004.012.0090.0	\N	1	1	\N	\N	\N	1000000	80000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-17 00:00:00
390	310	311	2016-02-17	2016	45	\N	\N	\N	\N	\N	32.06.320.007.010.0182.0	\N	1	1	\N	\N	\N	1500000	90000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-17 00:00:00
391	311	312	2016-02-17	2016	84	\N	\N	\N	\N	\N	32.06.310.003.003.0067.0	\N	1	1	\N	\N	\N	10075000	261500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-17 00:00:00
392	312	313	2016-02-17	2016	102	\N	\N	\N	\N	\N	32.06.760.005.010.0052.0	\N	1	1	\N	\N	\N	97000000	2000000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-17 00:00:00
350	270	270	2016-02-15	2016	41	\N	\N	\N	\N	\N	32.06.320.003.027.1130.0	\N	1	3	\N	\N	\N	36841050	796821000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-15 00:00:00
394	314	315	2016-02-17	2016	118	\N	\N	\N	\N	\N	32.06.310.003.010.0019.0	\N	1	3	\N	\N	\N	4450000	149000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-17 00:00:00
395	315	316	2016-02-17	2016	113	\N	\N	\N	\N	\N	32.06.320.006.007.0942.0	\N	1	3	\N	\N	\N	8311200	226224000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-17 00:00:00
396	316	317	2016-02-17	2016	42	\N	\N	\N	\N	\N	32.06.320.003.027.1130.0	\N	1	3	\N	\N	\N	44500000	950000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-17 00:00:00
397	317	318	2016-02-17	2016	117	\N	\N	\N	\N	\N	32.06.760.001.014.0653.0	\N	1	1	\N	\N	\N	7000000	200000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-17 00:00:00
398	318	319	2016-02-17	2016	46	\N	\N	\N	\N	\N	32.06.760.003.001.0583.0	\N	1	3	\N	\N	\N	32000000	700000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-17 00:00:00
399	319	320	2016-02-17	2016	112	\N	\N	\N	\N	\N	32.06.320.003.025.2211.0	\N	1	7	\N	\N	\N	250000	65000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-17 00:00:00
400	320	321	2016-02-17	2016	143	\N	\N	\N	\N	\N	32.06.760.004.018.0109.0	\N	1	1	\N	\N	\N	1000000	80000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-17 00:00:00
405	321	322	2016-02-18	2016	46	\N	\N	\N	\N	\N	32.06.320.007.008.0224.0	\N	1	1	\N	\N	\N	5750000	175000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-18 00:00:00
407	322	323	2016-02-18	2016	72	\N	\N	\N	\N	\N	32.06.310.004.023.0276.0	\N	1	1	\N	\N	\N	612000	72240000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-18 00:00:00
417	330	332	2016-02-18	2016	47	\N	\N	\N	\N	\N	32.06.320.003.027.3468.0	\N	1	1	\N	\N	\N	57850000	1217000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-18 00:00:00
409	323	324	2016-02-18	2016	125	\N	\N	\N	\N	\N	32.06.290.006.012.0017.0	\N	1	7	\N	\N	\N	1850000	97000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-18 00:00:00
410	324	325	2016-02-18	2016	109	\N	\N	\N	\N	\N	32.06.310.003.001.0432.0	\N	1	1	\N	\N	\N	372750	60000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-18 00:00:00
411	325	326	2016-02-18	2016	57	\N	\N	\N	\N	\N	32.06.330.004.016.0199.0	\N	1	3	\N	\N	\N	1350000	87000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-18 00:00:00
413	326	327	2016-02-18	2016	57	\N	\N	\N	\N	\N	32.06.330.004.016.0199.0	\N	1	3	\N	\N	\N	1350000	87000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-18 00:00:00
412	2	328	2016-02-18	2016	141	\N	\N	\N	\N	\N	32.06.760.003.001.0595.0	\N	1	3	\N	\N	\N	25225200	550000000	60000000	2015	["1","2","3","4","5","6"]	1	336	\N	\N	2016-02-18 00:00:00
414	327	329	2016-02-18	2016	118	\N	\N	\N	\N	\N	32.06.320.004.009.1258.0	\N	1	3	\N	\N	\N	21000000	480000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-18 00:00:00
415	328	330	2016-02-18	2016	118	\N	\N	\N	\N	\N	32.06.320.004.009.1059.0	\N	1	3	\N	\N	\N	34840000	756800000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-18 00:00:00
416	329	331	2016-02-18	2016	42	\N	\N	\N	\N	\N	32.06.310.001.001.0668.0	\N	1	3	\N	\N	\N	3922800	70000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-18 00:00:00
418	331	333	2016-02-18	2016	66	\N	\N	\N	\N	\N	32.06.310.004.023.3367.0	\N	1	1	\N	\N	\N	625000	72500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-18 00:00:00
419	332	334	2016-02-18	2016	72	\N	\N	\N	\N	\N	32.06.320.006.023.0643.0	\N	1	3	\N	\N	\N	2370250	45000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-18 00:00:00
420	333	335	2016-02-19	2016	112	\N	\N	\N	\N	\N	32.06.320.002.002.0223.0	\N	1	7	\N	\N	\N	346000	10000000	60000000	2012	["1","2","3","4","5","6"]	5	\N	166080	24	2016-02-19 00:00:00
421	334	336	2016-02-19	2016	104	\N	\N	\N	\N	\N	32.06.320.003.012.0046.0	\N	1	1	\N	\N	\N	224430000	4548600000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-19 00:00:00
422	335	337	2016-02-19	2016	41	\N	\N	\N	\N	\N	32.06.320.003.027.1124.0	\N	1	3	\N	\N	\N	59076200	1241524000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-19 00:00:00
423	336	338	2016-02-19	2016	41	\N	\N	\N	\N	\N	32.06.320.003.027.1130.0	\N	1	3	\N	\N	\N	43578350	931567000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-19 00:00:00
424	337	339	2016-02-19	2016	58	\N	\N	\N	\N	\N	32.06.320.007.009.0235.0	\N	5	1	\N	\N	\N	12864000	557280000	300000000	2015	["25","26","27","28","29","30","31"]	1	\N	0	0	2016-02-19 00:00:00
428	341	343	2016-02-19	2016	131	\N	\N	\N	\N	\N	32.06.290.014.010.0326.0	\N	1	1	\N	\N	\N	2500000	110000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-19 00:00:00
425	338	340	2016-02-19	2016	58	\N	\N	\N	\N	\N	32.06.290.013.004.0228.0	\N	1	1	\N	\N	\N	4750000	155000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-19 00:00:00
426	339	341	2016-02-19	2016	120	\N	\N	\N	\N	\N	32.06.210.003.006.0177.0	\N	1	3	\N	\N	\N	500000	70000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-19 00:00:00
427	340	342	2016-02-19	2016	131	\N	\N	\N	\N	\N	32.06.290.014.010.0272.0	\N	1	1	\N	\N	\N	5125000	162500000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-19 00:00:00
430	342	344	2016-02-19	2016	131	\N	\N	\N	\N	\N	32.06.290.013.005.0137.0	\N	1	1	\N	\N	\N	0	45000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-19 00:00:00
431	343	345	2016-02-19	2016	131	\N	\N	\N	\N	\N	32.06.290.010.005.0119.0	\N	1	1	\N	\N	\N	0	35000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-19 00:00:00
432	344	346	2016-02-19	2016	131	\N	\N	\N	\N	\N	32.06.290.010.005.0119.0	\N	1	1	\N	\N	\N	0	25000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-19 00:00:00
433	345	347	2016-02-19	2016	93	\N	\N	\N	\N	\N	32.06.290.014.010.0053.0	\N	1	1	\N	\N	\N	7000000	200000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-19 00:00:00
434	346	348	2016-02-19	2016	56	\N	\N	\N	\N	\N	32.06.310.003.003.3201.0	\N	1	1	\N	\N	\N	2750000	115000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-19 00:00:00
435	347	349	2016-02-19	2016	131	\N	\N	\N	\N	\N	32.06.290.014.010.0332.0	\N	1	1	\N	\N	\N	0	25000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-19 00:00:00
436	348	350	2016-02-22	2016	112	\N	\N	\N	\N	\N	32.06.320.004.012.0027.0	\N	1	7	\N	\N	\N	2150000	103000000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-22 00:00:00
437	349	351	2016-02-22	2016	46	\N	\N	\N	\N	\N	32.06.171.006.008.0239.0	\N	1	1	\N	\N	\N	2900000	118000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-22 00:00:00
438	350	352	2016-02-22	2016	104	\N	\N	\N	\N	\N	32.06.760.004.023.1040.0	\N	1	1	\N	\N	\N	500000	70000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-22 00:00:00
439	351	353	2016-02-22	2016	124	\N	\N	\N	\N	\N	32.06.760.002.008.0108.0	\N	1	7	\N	\N	\N	3606600	132132000	60000000	2015	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-22 00:00:00
440	352	354	2016-02-22	2016	130	\N	\N	\N	\N	\N	32.06.290.016.007.0020.0	\N	1	7	\N	\N	\N	25050000	561000000	60000000	2016	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-22 00:00:00
441	353	355	2016-02-22	2016	130	\N	\N	\N	\N	\N	32.06.290.010.008.0063.0	\N	1	1	\N	\N	\N	18000000	420000000	60000000	2015	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-22 00:00:00
442	354	356	2016-02-22	2016	130	\N	\N	\N	\N	\N	32.06.290.016.007.0020.0	\N	1	7	\N	\N	\N	44492500	949850000	60000000	2016	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-22 00:00:00
443	355	357	2016-02-22	2016	109	\N	\N	\N	\N	\N	32.06.310.004.016.1729.0	\N	1	3	\N	\N	\N	998250	70000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-22 00:00:00
429	1	367	2010-06-23	2010	124	\N	\N	\N	\N	\N	32.06.760.002.007.0018.0	\N	1	7	\N	\N	\N	1016000	40320000	20000000	2010	["1","2","3","4","5","6"]	5	\N	0	0	2010-06-23 00:00:00
445	357	359	2016-02-22	2016	72	\N	\N	\N	\N	\N	32.06.310.003.007.0471.0	\N	1	1	\N	\N	\N	5000000	160000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-22 00:00:00
446	358	360	2016-02-22	2016	42	\N	\N	\N	\N	\N	32.06.320.003.027.1124.0	\N	1	3	\N	\N	\N	71105350	1482107000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-22 00:00:00
447	359	361	2016-02-22	2016	123	\N	\N	\N	\N	\N	32.06.290.010.004.0118.0	\N	1	1	\N	\N	\N	12000000	300000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-22 00:00:00
448	360	362	2016-02-22	2016	95	\N	\N	\N	\N	\N	32.06.760.006.004.0118.0	\N	1	1	\N	\N	\N	19450000	449000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-22 00:00:00
449	361	363	2016-02-22	2016	100	\N	\N	\N	\N	\N	32.06.310.003.003.1727.0	\N	1	1	\N	\N	\N	1506000	11700000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-22 00:00:00
450	362	364	2016-02-22	2016	107	\N	\N	\N	\N	\N	32.06.210.005.005.0062.0	\N	1	7	\N	\N	\N	7000000	200000000	60000000	2016	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-22 00:00:00
465	375	380	2016-02-23	2016	68	\N	\N	\N	\N	\N	32.06.760.004.018.0106.0	\N	1	1	\N	\N	\N	1821000	96420000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
451	363	365	2016-02-22	2016	112	\N	\N	\N	\N	\N	32.06.320.004.009.0245.0	\N	1	7	\N	\N	\N	0	45000000	60000000	2014	["1","2","3","4","5","6"]	5	\N	0	24	2016-02-22 00:00:00
452	364	366	2016-02-22	2016	112	\N	\N	\N	\N	\N	32.06.320.004.009.0245.0	\N	1	7	\N	\N	\N	1200000	24000000	0	2016	["1","2","3","4","5","6"]	5	\N	576000	24	2016-02-22 00:00:00
454	2	368	2016-02-22	2016	124	\N	\N	\N	\N	\N	32.06.760.002.007.0018.0	\N	1	7	\N	\N	\N	1176000	40320000	20000000	2010	["1","2","3","4","5","6"]	5	429	\N	\N	2016-02-22 00:00:00
453	2	369	2016-02-22	2016	124	\N	\N	\N	\N	\N	32.06.760.002.007.0018.0	\N	1	7	\N	\N	\N	1176000	40320000	20000000	2010	["1","2","3","4","5","6"]	5	429	\N	\N	2016-02-22 00:00:00
455	365	370	2016-02-23	2016	93	\N	\N	\N	\N	\N	32.06.760.005.010.0430.0	\N	1	1	\N	\N	\N	15620000	372400000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
456	366	371	2016-02-23	2016	93	\N	\N	\N	\N	\N	32.06.760.005.010.0430.0	\N	1	1	\N	\N	\N	24930000	558600000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
457	367	372	2016-02-23	2016	130	\N	\N	\N	\N	\N	32.06.760.006.009.0091.0	\N	1	1	\N	\N	\N	22000000	500000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
458	368	373	2016-02-23	2016	104	\N	\N	\N	\N	\N	32.06.320.003.012.0046.0	\N	1	1	\N	\N	\N	17456250	349125000	0	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
459	369	374	2016-02-23	2016	58	\N	\N	\N	\N	\N	32.06.290.013.004.0227.0	\N	1	1	\N	\N	\N	7750000	155000000	0	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
460	370	375	2016-02-23	2016	42	\N	\N	\N	\N	\N	32.06.320.003.027.1124.0	\N	1	3	\N	\N	\N	103019400	2120388000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
466	376	381	2016-02-23	2016	124	\N	\N	\N	\N	\N	32.06.290.009.013.0146.0	\N	1	1	\N	\N	\N	5140300	162806000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
461	371	376	2016-02-23	2016	124	\N	\N	\N	\N	\N	32.06.760.007.009.0139.0	\N	1	7	\N	\N	\N	4424000	100000000	60000000	2016	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-23 00:00:00
462	372	377	2016-02-23	2016	124	\N	\N	\N	\N	\N	32.06.760.007.009.0143.0	\N	1	7	\N	\N	\N	15712000	200000000	0	2016	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-23 00:00:00
463	373	378	2016-02-23	2016	124	\N	\N	\N	\N	\N	32.06.760.007.009.0115.0	\N	1	7	\N	\N	\N	8947200	120000000	0	2016	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-23 00:00:00
467	377	382	2016-02-23	2016	94	\N	\N	\N	\N	\N	32.06.760.006.014.0899.0	\N	1	1	\N	\N	\N	200000000	4060000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
468	378	383	2016-02-23	2016	122	\N	\N	\N	\N	\N	32.06.300.005.009.0399.0	\N	1	7	\N	\N	\N	500000	70000000	60000000	2016	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-23 00:00:00
469	379	384	2016-02-23	2016	41	\N	\N	\N	\N	\N	32.06.760.006.009.0114.0	\N	1	1	\N	\N	\N	38920450	838409000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
470	380	385	2016-02-23	2016	109	\N	\N	\N	\N	\N	32.06.310.004.022.0797.0	\N	1	3	\N	\N	\N	1000000	80000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
471	381	386	2016-02-23	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.0238.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
472	382	387	2016-02-23	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.1057.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
473	383	388	2016-02-23	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.1057.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
474	384	389	2016-02-23	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.1057.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
475	385	390	2016-02-23	2016	120	\N	\N	\N	\N	\N	32.06.171.002.002.0196.0	\N	1	3	\N	\N	\N	2500000	110000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
476	386	391	2016-02-23	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.1057.0	\N	1	3	\N	\N	\N	2500000	110000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
477	387	392	2016-02-23	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.0239.0	\N	1	3	\N	\N	\N	2500000	110000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
478	388	393	2016-02-23	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.0238.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
479	389	394	2016-02-23	2016	120	\N	\N	\N	\N	\N	32.06.171.006.008.0239.0	\N	1	3	\N	\N	\N	1715000	94300000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
480	390	395	2016-02-23	2016	120	\N	\N	\N	\N	\N	32.06.171.002.002.0196.0	\N	1	3	\N	\N	\N	2375000	107500000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-23 00:00:00
464	374	379	2016-02-23	2016	\N	\N	\N	\N	\N	\N	32.06.310.001.001.0465.0	\N	5	3	\N	\N	\N	100800	302016000	300000000	2016	["25","26","27","28","29","30","31"]	1	\N	0	0	2016-02-23 00:00:00
481	391	396	2016-02-24	2016	59	\N	\N	\N	\N	\N	32.06.310.004.018.0231.0	\N	1	1	\N	\N	\N	4500000	150000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-24 00:00:00
483	393	398	2016-02-24	2016	106	\N	\N	\N	\N	\N	32.06.320.008.011.0704.0	\N	7	7	\N	\N	\N	1944000	98880000	60000000	2016	["38","39","40","41","42","43"]	6	\N	0	0	2016-02-24 00:00:00
482	392	397	2016-02-24	2016	112	\N	\N	\N	\N	\N	32.06.320.005.003.0067.0	\N	1	7	\N	\N	\N	23179200	523584000	60000000	2016	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-24 00:00:00
485	395	399	2016-02-24	2016	41	\N	\N	\N	\N	\N	32.06.320.001.023.0100.0	\N	1	3	\N	\N	\N	67400000	1408000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-24 00:00:00
486	396	400	2016-02-24	2016	127	\N	\N	\N	\N	\N	32.06.310.010.011.0044.0	\N	1	7	\N	\N	\N	500000	70000000	60000000	2016	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-24 00:00:00
487	397	401	2016-02-24	2016	57	\N	\N	\N	\N	\N	32.06.760.002.001.0088.0	\N	1	1	\N	\N	\N	9500800	250016000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-24 00:00:00
488	398	402	2016-02-24	2016	52	\N	\N	\N	\N	\N	32.06.320.005.001.0817.0	\N	1	3	\N	\N	\N	2780000	115600000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-24 00:00:00
484	394	423	2016-02-25	2016	112	\N	\N	\N	\N	\N	32.06.320.005.003.0065.0	\N	1	7	\N	\N	\N	10124800	202496000	0	2016	["1","2","3","4","5","6"]	2	\N	0	0	2016-02-25 00:00:00
493	403	407	2016-02-24	2016	108	\N	\N	\N	\N	\N	32.06.310.004.018.0256.0	\N	1	3	\N	\N	\N	46414250	63888000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-24 00:00:00
494	404	408	2016-02-24	2016	44	\N	\N	\N	\N	\N	32.06.210.007.017.0335.0	\N	1	3	\N	\N	\N	10087500	261750000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-24 00:00:00
495	405	409	2016-02-24	2016	108	\N	\N	\N	\N	\N	32.06.310.004.018.0256.0	\N	1	3	\N	\N	\N	10000000	260000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-24 00:00:00
496	406	410	2016-02-24	2016	44	\N	\N	\N	\N	\N	32.06.210.007.017.0366.0	\N	1	3	\N	\N	\N	13875000	337500000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-24 00:00:00
497	407	411	2016-02-24	2016	108	\N	\N	\N	\N	\N	32.06.310.004.018.0256.0	\N	1	3	\N	\N	\N	8350000	227000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-24 00:00:00
498	408	412	2016-02-24	2016	98	\N	\N	\N	\N	\N	32.06.300.005.002.0021.0	\N	1	1	\N	\N	\N	6048000	180960000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-24 00:00:00
499	409	413	2016-02-24	2016	98	\N	\N	\N	\N	\N	32.06.300.005.002.0021.0	\N	1	1	\N	\N	\N	0	33440000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-24 00:00:00
500	410	414	2016-02-24	2016	56	\N	\N	\N	\N	\N	32.06.310.003.002.0328.0	\N	1	1	\N	\N	\N	7000000	200000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-24 00:00:00
501	411	415	2016-02-24	2016	106	\N	\N	\N	\N	\N	32.06.320.006.022.0261.0	\N	5	3	\N	\N	\N	-6918650	161627000	300000000	2016	["25","26","27","28","29","30","31"]	1	\N	0	0	2016-02-24 00:00:00
502	412	416	2016-02-24	2016	63	\N	\N	\N	\N	\N	32.06.310.003.012.0188.0	\N	1	1	\N	\N	\N	9500000	250000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-24 00:00:00
503	413	417	2016-02-24	2016	143	\N	\N	\N	\N	\N	32.06.310.004.018.0725.0	\N	1	3	\N	\N	\N	2000000	100000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-24 00:00:00
504	414	418	2016-02-24	2016	143	\N	\N	\N	\N	\N	32.06.760.002.006.0994.0	\N	1	1	\N	\N	\N	7000000	200000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-24 00:00:00
505	415	419	2016-02-25	2016	127	\N	\N	\N	\N	\N	32.06.310.005.005.0062.0	\N	1	1	\N	\N	\N	1000000	80000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-25 00:00:00
506	416	420	2016-02-25	2016	118	\N	\N	\N	\N	\N	32.06.310.003.010.0019.0	\N	1	3	\N	\N	\N	6700000	194000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-25 00:00:00
507	417	421	2016-02-25	2016	72	\N	\N	\N	\N	\N	32.06.290.009.021.0038.0	\N	1	1	\N	\N	\N	610200	72204000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-25 00:00:00
508	418	422	2016-02-25	2016	112	\N	\N	\N	\N	\N	32.06.320.006.005.0271.0	\N	1	1	\N	\N	\N	500000	70000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-25 00:00:00
509	419	424	2016-02-25	2016	112	\N	\N	\N	\N	\N	32.06.320.005.003.0065.0	\N	5	7	\N	\N	\N	-7406400	151872000	300000000	2016	["25","26","27","28","29","30","31"]	2	\N	0	0	2016-02-25 00:00:00
510	420	425	2016-02-25	2016	42	\N	\N	\N	\N	\N	32.06.310.004.021.0156.0	\N	1	1	\N	\N	\N	2000000	100000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-25 00:00:00
511	421	426	2016-02-25	2016	41	\N	\N	\N	\N	\N	32.06.310.003.003.4061.0	\N	1	1	\N	\N	\N	9500000	250000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-25 00:00:00
514	423	427	2016-02-25	2016	98	\N	\N	\N	\N	\N	32.06.760.006.010.0552.0	\N	1	1	\N	\N	\N	15750000	375000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-25 00:00:00
525	434	438	2016-02-26	2016	102	\N	\N	\N	\N	\N	32.06.320.003.027.2037.0	\N	1	3	\N	\N	\N	13000000	320000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-26 02:09:44
536	445	449	2016-02-29	2016	56	\N	\N	\N	\N	\N	32.06.310.003.015.0340.0	\N	1	1	\N	\N	\N	2749200	85000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-29 10:23:48
547	456	455	2016-02-29	2016	105	\N	\N	\N	\N	\N	32.06.760.005.008.0128.0	\N	1	1	\N	\N	\N	20850000	477000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-02-29 01:23:49
558	467	470	2016-03-01	2016	120	\N	\N	\N	\N	\N	32.06.210.003.006.0177.0	\N	1	3	\N	\N	\N	500000	70000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 07:47:49
569	478	477	2016-03-01	2016	120	\N	\N	\N	\N	\N	32.06.210.003.006.0177.0	\N	1	3	\N	\N	\N	500000	70000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-01 09:28:56
580	489	488	2016-03-02	2016	120	\N	\N	\N	\N	\N	32.06.760.005.010.0464.0	\N	1	1	\N	\N	\N	87000000	1800000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-02 10:22:26
591	500	498	2016-03-02	2016	41	\N	\N	\N	\N	\N	32.06.320.003.027.1130.0	\N	1	3	\N	\N	\N	30507450	670149000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-02 02:19:29
602	508	507	2016-03-03	2016	57	\N	\N	\N	\N	\N	32.06.330.004.016.0199.0	\N	1	3	\N	\N	\N	1350000	87000000	60000000	2016	["1","2","3","4","5","6"]	1	\N	0	0	2016-03-03 12:10:50
\.


--
-- Name: t_spt_t_idspt_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_spt_t_idspt_seq', 612, true);


--
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- Name: resource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (id);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (rid);


--
-- Name: s_acuan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY s_acuan
    ADD CONSTRAINT s_acuan_pkey PRIMARY KEY (s_idacuan);


--
-- Name: s_jenisdoktanah_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY s_jenisdoktanah
    ADD CONSTRAINT s_jenisdoktanah_pkey PRIMARY KEY (s_iddoktanah);


--
-- Name: s_jenishaktanah_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY s_jenishaktanah
    ADD CONSTRAINT s_jenishaktanah_pkey PRIMARY KEY (s_idhaktanah);


--
-- Name: s_jenisketetapan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY s_jenisketetapan
    ADD CONSTRAINT s_jenisketetapan_pkey PRIMARY KEY (s_idjenisketetapan);


--
-- Name: s_jenistransaksi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY s_jenistransaksi
    ADD CONSTRAINT s_jenistransaksi_pkey PRIMARY KEY (s_idjenistransaksi);


--
-- Name: s_kecamatan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY s_kecamatan
    ADD CONSTRAINT s_kecamatan_pkey PRIMARY KEY (s_idkecamatan);


--
-- Name: s_kecamatan_s_kodekecamatan_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY s_kecamatan
    ADD CONSTRAINT s_kecamatan_s_kodekecamatan_key UNIQUE (s_kodekecamatan);


--
-- Name: s_kelurahan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY s_kelurahan
    ADD CONSTRAINT s_kelurahan_pkey PRIMARY KEY (s_idkelurahan);


--
-- Name: s_koderekening_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY s_koderekening
    ADD CONSTRAINT s_koderekening_pkey PRIMARY KEY (s_korekid);


--
-- Name: s_notaris_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY s_notaris
    ADD CONSTRAINT s_notaris_pkey PRIMARY KEY (s_idnotaris);


--
-- Name: s_pejabat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY s_pejabat
    ADD CONSTRAINT s_pejabat_pkey PRIMARY KEY (s_idpejabat);


--
-- Name: s_pemda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY s_pemda
    ADD CONSTRAINT s_pemda_pkey PRIMARY KEY (s_idpemda);


--
-- Name: s_peraturan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY s_peraturan
    ADD CONSTRAINT s_peraturan_pkey PRIMARY KEY (s_idperaturan);


--
-- Name: s_persyaratan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY s_persyaratan
    ADD CONSTRAINT s_persyaratan_pkey PRIMARY KEY (s_idpersyaratan);


--
-- Name: s_presentase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY s_presentase
    ADD CONSTRAINT s_presentase_pkey PRIMARY KEY (s_idpresentase);


--
-- Name: s_tarifbphtb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY s_tarifbphtb
    ADD CONSTRAINT s_tarifbphtb_pkey PRIMARY KEY (s_idtarifbphtb);


--
-- Name: s_tarifnpoptkp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY s_tarifnpoptkp
    ADD CONSTRAINT s_tarifnpoptkp_pkey PRIMARY KEY (s_idtarifnpotkp);


--
-- Name: s_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY s_users
    ADD CONSTRAINT s_users_pkey PRIMARY KEY (s_iduser);


--
-- Name: ss_golonganpejabat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ss_golonganpejabat
    ADD CONSTRAINT ss_golonganpejabat_pkey PRIMARY KEY (ss_idgolongan);


--
-- Name: t_dendasanksinotaris_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY t_dendasanksinotaris
    ADD CONSTRAINT t_dendasanksinotaris_pkey PRIMARY KEY (t_idds);


--
-- Name: t_detailsptbphtb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY t_detailsptbphtb
    ADD CONSTRAINT t_detailsptbphtb_pkey PRIMARY KEY (t_iddetailsptbphtb);


--
-- Name: t_pembayaranspt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY t_pembayaranspt
    ADD CONSTRAINT t_pembayaranspt_pkey PRIMARY KEY (t_idpembayaranspt);


--
-- Name: t_pemeriksaan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY t_pemeriksaan
    ADD CONSTRAINT t_pemeriksaan_pkey PRIMARY KEY (p_idpemeriksaan);


--
-- Name: t_penerimawaris_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY t_penerimawaris
    ADD CONSTRAINT t_penerimawaris_pkey PRIMARY KEY (t_idpenerima);


--
-- Name: t_spt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY t_spt
    ADD CONSTRAINT t_spt_pkey PRIMARY KEY (t_idspt);


--
-- Name: s_koderekening_s_korekid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX s_koderekening_s_korekid ON s_koderekening USING btree (s_korekid);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

