<?php
namespace Bphtb\Form\Pencetakan;

use Zend\Form\Form;

class SSPDFrm extends Form {
    
    public function __construct() {
        parent::__construct();
        
        $this->add(array(
            'name' => 'no_spt1',
            'type' => 'text',            
        ));
        
        $this->add(array(
            'name' => 'no_spt2',
            'type' => 'text',            
        ));
        
        $this->add(array(
            'name' => 'periode_spt',
            'type' => 'text',            
        ));
        
        $this->add(array(
            'name' => 'tgl_cetak',
            'type' => 'text',            
        ));
        
        $this->add(array(
            'name' => 't_objekspt',
            'type' => 'text',            
        ));
        
    }
    
}