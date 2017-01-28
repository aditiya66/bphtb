<?php

namespace Bphtb\Controller\Setting;

class Paginator extends \Zend\Mvc\Controller\AbstractActionController {
    
    public function paginator($baserows, $count, $page, $total_pages) {
        $pager = "<ul class='pagination pagination-sm no-margin'>";
        $class = ( $page == 1 ) ? "disabled" : "";
        $pager .= '<li class="' . $class . '"><a href="#" onclick="calldatagrid(' . ( $page - 1 ) . ')">&laquo;</a></li>';
        if ($start > 1) {
            $pager .= '<li><a href="#" onclick="calldatagrid(1)">1</a></li>';
            $pager .= '<li class="disabled"><span>...</span></li>';
        }
        if ($page <= $total_pages) {
            if ($page == $total_pages) { // page terahir
                $total_pagesnya = $page;
                $i = $page - 2;
                if ($page <= 1) {
                    $i = $page;
                }
            } elseif ($page == ($total_pages - 1)) { // page terahir -1
                $total_pagesnya = $page + 1;
                $i = $page - 1;
                if ($page <= 1) {
                    $i = $page;
                }
            } else {
                $total_pagesnya = $page + 2;
                $i = $page;
                if ($page <= 1) {
                    $i = $page;
                }
            }
        }
        while ($i <= $total_pagesnya) {
            $class = ( $page == $i ) ? "active" : "";
            $pager .= '<li class="' . $class . '"><a href="#" onclick="calldatagrid(' . $i . ');return false;">' . $i . '</a></li>';
            $i++;
        }
        if ($total_pages > $page) {
            $pager .= '<li class="disabled"><span>...</span></li>';
            $pager .= '<li><a href="#" onclick="calldatagrid(' . $total_pages . ');return false;">' . $total_pages . '</a></li>';
        }
        $class = ( $page == $total_pages ) ? "disabled" : "";
        $pager .= '<li class="' . $class . '"><a href="#" onclick="calldatagrid(' . ( $page + 1 ) . ')">&raquo;</a></li>';

        $pager .= "</ul>";
        $akhirdata = (int) $baserows * (int) $page;
        if ($akhirdata < $baserows) {
            $akhirdata = $count;
        }
        if ($akhirdata >= $count) {
            $akhirdata = $count;
        }
        if ($akhirdata == 0) {
            $awaldata = 0;
            $page = 1;
        } elseif ($akhirdata < $baserows) {
            $awaldata = 1;
            $page = 1;
        } else {
            $awaldata = ((int) $baserows * ((int) $page - 1)) + 1;
        }

        if ($awaldata < 0) {
            $page = 1;
        }

        $datapaging = array(
            "paginatore" => $pager,
            "akhirdata" => $akhirdata,
            "awaldata" => $awaldata
        );
        return $datapaging;
    }

}
