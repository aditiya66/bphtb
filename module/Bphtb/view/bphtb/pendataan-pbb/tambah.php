<?php
$frm_subjek_wp = $this->frm_subjek_wp;
$frm_subjek_wp->setAttribute('action', $this->url() . '/tambah');
$frm_subjek_wp->setAttribute('id', "formtambah");
$frm_subjek_wp->prepare();
?>
<div class="col-md-12">
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <div class="col-md-3">
                    <h3 class="panel-title">
                        <span style="font-size: 11pt">PENDATAAN SISMIOP PBB</span>
                    </h3>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <fieldset>
                <legend>Data Subjek Pajak</legend>
                <?= $this->form()->openTag($frm_subjek_wp) ?>              
                <div class="col-sm-6">
                    <?= $this->formrow($frm_subjek_wp->get("SUBJEK_PAJAK_ID")) ?>                
                    <?= $this->formrow($frm_subjek_wp->get("NM_WP")) ?>
                    <?= $this->formrow($frm_subjek_wp->get("JALAN_WP")) ?>
                    <div class="row">
                        <div class="col-sm-3">
                            <?= $this->formrow($frm_subjek_wp->get("BLOK_KAV_NO_WP")) ?>
                        </div>
                        <div class="col-sm-3">
                            <?= $this->formrow($frm_subjek_wp->get("RW_WP")) ?>
                        </div>
                        <div class="col-sm-3">
                            <?= $this->formrow($frm_subjek_wp->get("RT_WP")) ?>
                        </div>
                    </div>                    
                    <?= $this->formrow($frm_subjek_wp->get("KELURAHAN_WP")) ?>                
                </div>
                <div class="col-sm-6">				
                    <?= $this->formrow($frm_subjek_wp->get("KOTA_WP")) ?>
                    <?= $this->formrow($frm_subjek_wp->get("KD_POS_WP")) ?>
                    <?= $this->formrow($frm_subjek_wp->get("TELP_WP")) ?>
                    <?= $this->formrow($frm_subjek_wp->get("NPWP")) ?>
                    <?= $this->formrow($frm_subjek_wp->get("STATUS_PEKERJAAN_WP")) ?>                
                    <?= $this->form()->closeTag($frm_subjek_wp) ?>
                </div>
            </fieldset>
            <?php
            $frm_dat_op_bumi = $this->frm_dat_op_bumi;
            $frm_dat_op_bumi->setAttribute('action', $this->url() . '/tambah');
            $frm_dat_op_bumi->setAttribute('id', "formtambah");
            $frm_dat_op_bumi->prepare();
            ?>			
            <fieldset>
                <legend>Data Bumi</legend>
                <?= $this->form()->openTag($frm_dat_op_bumi) ?>
                <div class="col-sm-6">
                    <?= $this->formrow($frm_dat_op_bumi->get("KD_NOP")) ?>
                    <?= $this->formrow($frm_dat_op_bumi->get("KD_ZNT")) ?>
                    <?= $this->formrow($frm_dat_op_bumi->get("JNS_BUMI")) ?>										
                </div>
                <div class="col-sm-6">
                    <?= $this->formrow($frm_dat_op_bumi->get("NO_BUMI")) ?>
                    <?= $this->formrow($frm_dat_op_bumi->get("LUAS_BUMI")) ?>					
                </div>
                <?= $this->form()->closeTag($frm_dat_op_bumi) ?>
            </fieldset>
            <?php
            $frm_dat_op_bangunan = $this->frm_dat_op_bangunan;
            $frm_dat_op_bangunan->setAttribute('action', $this->url() . '/tambah');
            $frm_dat_op_bangunan->setAttribute('id', "formtambah");
            $frm_dat_op_bangunan->prepare();
            ?>	
            <fieldset>
                <legend>Data Bangunan</legend>
                <?= $this->form()->openTag($frm_dat_op_bangunan) ?>
                <div class="col-sm-6">
                    <?= $this->formrow($frm_dat_op_bangunan->get("NO_BNG")) ?>
                    <?= $this->formrow($frm_dat_op_bangunan->get("NO_FORMULIR_LSPOP")) ?>
                    <?= $this->formrow($frm_dat_op_bangunan->get("THN_RENOVASI_BNG")) ?>
                    <?= $this->formrow($frm_dat_op_bangunan->get("JML_LANTAI_BNG")) ?>
                    <?= $this->formrow($frm_dat_op_bangunan->get("NO_BNG")) ?>
                    <?= $this->formrow($frm_dat_op_bangunan->get("JNS_ATAP_BNG")) ?>
                    <?= $this->formrow($frm_dat_op_bangunan->get("KD_LANTAI")) ?>
                    <?= $this->formrow($frm_dat_op_bangunan->get("JNS_TRANSAKSI_BNG")) ?>

                </div>
                <div class="col-sm-6">
                    <?= $this->formrow($frm_dat_op_bangunan->get("KD_JPB")) ?>
                    <?= $this->formrow($frm_dat_op_bangunan->get("THN_DIBANGUN_BNG")) ?>
                    <?= $this->formrow($frm_dat_op_bangunan->get("LUAS_BNG")) ?>
                    <?= $this->formrow($frm_dat_op_bangunan->get("KONDISI_BNG")) ?>
                    <?= $this->formrow($frm_dat_op_bangunan->get("JNS_KONSTRUKSI_BNG")) ?>
                    <?= $this->formrow($frm_dat_op_bangunan->get("KD_DINDING")) ?>
                    <?= $this->formrow($frm_dat_op_bangunan->get("KD_LANGIT_LANGIT")) ?>
                    <?= $this->formrow($frm_dat_op_bangunan->get("TGL_PENDATAAN_BNG")) ?>
                </div>
                <?= $this->form()->closeTag($frm_dat_op_bangunan) ?>
            </fieldset>
            <div class="row text-center">
                <br/>
                <input type="button" class="btn btn-primary" value="Simpan" /> <a href="<?= $this->url("pendataan_pbb") ?>" class="btn btn-primary">Kembali</a>
            </div>
        </div>
    </div>
</div>
<style>

</style>