<?php

namespace Bphtb\Controller\Historylog;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Math\Rand;

class Historylog extends AbstractActionController {

    protected $tbl_pemda, $tbl_pembayaran, $tbl_pendataan, $tbl_jenistransaksi, $tbl_haktanah, $tbl_doktanah, $tbl_sspd, $tbl_notaris, $tbl_persyaratan, $tbl_hist, $tbl_verifikasi;

    public function indexAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $form = new \Bphtb\Form\Pendataan\SSPDFrm();
        $view = new ViewModel(array(
            "form" => $form
        ));
        $data = array(
            'menu_setting' => 'active',
            'side_historylog' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function carihistorylognamaAction() {
        $req = $this->getRequest();
        $res = $this->getResponse();
        $datane = $req->getPost();
        $datacari = $this->getTbl()->getcarihislognamatgl($datane->hislog_opr_nama);
        $html .= "<ul class='timeline'>";
        foreach ($datacari as $hasil) {
            $html .= "<li class='time-label'>
                     <span class='bg-blue'>
                         " . date('d-m-Y', strtotime($hasil['hislog_tgl'])) . "
                        </span>
                  </li>";
            $datacari2 = $this->getTbl()->getcarihislognama($hasil['hislog_tgl'], $datane->hislog_opr_nama);
            foreach ($datacari2 as $hasil2) {
                $html .= "<li>";
                if (strpos(strtolower($hasil2['hislog_action']), 'hapus') !== false) {
                    $html .= "<i class='fa fa-trash bg-red'></i>";
                } elseif (strpos(strtolower($hasil2['hislog_action']), 'simpan') !== false) {
                    $html .= "<i class='fa fa-save bg-green'></i>";
                } elseif (strpos(strtolower($hasil2['hislog_action']), 'update') !== false) {
                    $html .= "<i class='fa fa-edit bg-yellow'></i>";
                } else {
                    $html .= "<i class='fa fa-envelope bg-blue'></i>";
                }
                $html .= "<div class='timeline-item'>";
                $html .= "<span class='time'><i class='fa fa-clock-o'></i> " . date('s:i:H d-m-Y', strtotime($hasil2['hislog_time'])) . "</span>";
                $html .= "<h3 class='timeline-header'><a href='#'>" . $hasil2['hislog_opr_nama'] . "</a> &nbsp;&nbsp;<span style='font-size:12px'>" . $hasil2['hislog_action'] . "</span></h3>";
                $html .= "</div>";
                $html .= "</li>";
            }
        }
        $html .= "</ul>";
        $data['datahistorynama'] = $html;
        $res->setContent(\Zend\Json\Json::encode($data));
        return $res;
    }

    public function carihistorylogaktifitasAction() {
        $req = $this->getRequest();
        $res = $this->getResponse();
        $datane = $req->getPost();
        $datacari = $this->getTbl()->getcarihislogaktifitastgl($datane->hislog_action);
        $html .= "<ul class='timeline'>";
        foreach ($datacari as $hasil) {
            $html .= "<li class='time-label'>
                     <span class='bg-blue'>
                         " . date('d-m-Y', strtotime($hasil['hislog_tgl'])) . "
                        </span>
                  </li>";
            $datacari2 = $this->getTbl()->getcarihislogaktifitas($hasil['hislog_tgl'], $datane->hislog_action);
            foreach ($datacari2 as $hasil2) {
                $html .= "<li>";
                if (strpos(strtolower($hasil2['hislog_action']), 'hapus') !== false) {
                    $html .= "<i class='fa fa-trash bg-red'></i>";
                } elseif (strpos(strtolower($hasil2['hislog_action']), 'simpan') !== false) {
                    $html .= "<i class='fa fa-save bg-green'></i>";
                } elseif (strpos(strtolower($hasil2['hislog_action']), 'update') !== false) {
                    $html .= "<i class='fa fa-edit bg-yellow'></i>";
                } else {
                    $html .= "<i class='fa fa-envelope bg-blue'></i>";
                }
                $html .= "<div class='timeline-item'>";
                $html .= "<span class='time'><i class='fa fa-clock-o'></i> " . date('s:i:H d-m-Y', strtotime($hasil2['hislog_time'])) . "</span>";
                $html .= "<h3 class='timeline-header'><a href='#'>" . $hasil2['hislog_opr_nama'] . "</a> &nbsp;&nbsp;<span style='font-size:12px'>" . $hasil2['hislog_action'] . "</span></h3>";
                $html .= "</div>";
                $html .= "</li>";
            }
        }
        $html .= "</ul>";
        $data['datahistoryaktifitas'] = $html;
        $res->setContent(\Zend\Json\Json::encode($data));
        return $res;
    }

    public function carihistorylogtimeAction() {
        $req = $this->getRequest();
        $res = $this->getResponse();
        $datane = $req->getPost();
        $tglcari = date("Y-m-d", strtotime($datane->hislog_time));
        $datacari = $this->getTbl()->getcarihislogtime($tglcari);
        $i = 1;
        $html = "";
        $html .= "<ul class='timeline'>";
        $html .= "<li class='time-label'>
                     <span class='bg-blue'>
                         " . $datane->hislog_time . "
                        </span>
                  </li>";
        foreach ($datacari as $hasil) {
            $html .= "<li>";
            if (strpos(strtolower($hasil['hislog_action']), 'hapus') !== false) {
                $html .= "<i class='fa fa-trash bg-red'></i>";
            } elseif (strpos(strtolower($hasil['hislog_action']), 'simpan') !== false) {
                $html .= "<i class='fa fa-save bg-green'></i>";
            } elseif (strpos(strtolower($hasil['hislog_action']), 'update') !== false) {
                $html .= "<i class='fa fa-edit bg-yellow'></i>";
            } else {
                $html .= "<i class='fa fa-envelope bg-blue'></i>";
            }

            $html .= "<div class='timeline-item'>";
            $html .= "<span class='time'><i class='fa fa-clock-o'></i> " . date('s:i:H d-m-Y', strtotime($hasil['hislog_time'])) . "</span>";
            $html .= "<h3 class='timeline-header'><a href='#'>" . $hasil['hislog_opr_nama'] . "</a> &nbsp;&nbsp;<span style='font-size:12px'>" . $hasil['hislog_action'] . "</span></h3>";
            $html .= "</div>";
            $html .= "</li>";
            $i++;
        }
        $html .= "</ul>";
        $data['datahistorytime'] = $html;
        $res->setContent(\Zend\Json\Json::encode($data));
        return $res;
    }

    public function getTbl() {
        if (!$this->tbl_hist) {
            $sm = $this->getServiceLocator();
            $this->tbl_hist = $sm->get("HistorylogTable");
        }
        return $this->tbl_hist;
    }

    public function getPemda() {
        if (!$this->tbl_pemda) {
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
        }
        return $this->tbl_pemda;
    }

}
