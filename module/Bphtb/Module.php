<?php

namespace Bphtb;

use Zend\ModuleManager\Feature\AutoloaderProviderInterface;
use Zend\Authentication\AuthenticationService;
use Zend\Authentication\Adapter\DbTable as DbTableAuthAdapter;

class Module implements AutoloaderProviderInterface {

    // Common Code
    public function getAutoloaderConfig() {
        return array(
            'Zend\Loader\ClassMapAutoloader' => array(
                __DIR__ . '/autoload_classmap.php'
            ),
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__
                )
            )
        );
    }

    public function getConfig() {
        return include __DIR__ . '/config/module.config.php';
    }

    // Custom Code
    public function getServiceConfig() {
        return array(
            'factories' => array(
                'NotifikasiTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Notifikasi\NotifikasiTable($dbAdapter);
                    return $table;
                },
                'DatagridTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Setting\DatagridTable($dbAdapter);
                    return $table;
                },
                'PersyaratanTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Setting\PersyaratanTable($dbAdapter);
                    return $table;
                },
                'UserTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Setting\SettingUserTable($dbAdapter);
                    return $table;
                },
                'TarifBphtbTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Setting\TarifBphtbTable($dbAdapter);
                    return $table;
                },
                'JenisKetetapanTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Setting\JenisKetetapanTable($dbAdapter);
                    return $table;
                },
                'HakTanahTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Setting\HakTanahTable($dbAdapter);
                    return $table;
                },
                'TarifNpotkpTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Setting\TarifNpotkpTable($dbAdapter);
                    return $table;
                },
                'JenisTransaksiBphtbTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Setting\JenisTransaksiBphtbTable($dbAdapter);
                    return $table;
                },
                'NotarisBphtbTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Setting\NotarisBphtbTable($dbAdapter);
                    return $table;
                },
                'PejabatBphtbTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Setting\PejabatBphtbTable($dbAdapter);
                    return $table;
                },
                'KelurahanBphtbTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Setting\KelurahanBphtbTable($dbAdapter);
                    return $table;
                },
                'KecamatanBphtbTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Setting\KecamatanBphtbTable($dbAdapter);
                    return $table;
                },
                'PemdaTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Setting\PemdaTable($dbAdapter);
                    return $table;
                },
                'DokTanahTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Setting\DokTanahTable($dbAdapter);
                    return $table;
                },
                'TargetTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Setting\TargetTable($dbAdapter);
                    return $table;
                },
                'HargaAcuanTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Setting\HargaAcuanTable($dbAdapter);
                    return $table;
                },
                'SPTTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Pendataan\SPTTable($dbAdapter);
                    return $table;
                },
                'SSPDBphtbTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Pendataan\SSPDBphtbTable($dbAdapter);
                    return $table;
                },
                'SPPTTable' => function ($sm) {
                    $dbAdapter = $sm->get('oracle_db');
                    $table = new Model\Pendataan\SPPTTable($dbAdapter);
                    return $table;
                },
                'SpbbTable' => function ($sm) {
                    $dbAdapter = $sm->get('oracle_db');
                    $table = new Model\DataSismiop\DatsubjekpajakTable($dbAdapter);
                    return $table;
                },
                'OpbbTable' => function ($sm) {
                    $dbAdapter = $sm->get('oracle_db');
                    $table = new Model\DataSismiop\DatobjekpajakTable($dbAdapter);
                    return $table;
                },
                'PembayaranSptTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Pembayaran\PembayaranSptTable($dbAdapter);
                    return $table;
                },
                'KoreksiTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Koreksi\KoreksiTable($dbAdapter);
                    return $table;
                },
                'VerifikasiSptTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Verifikasi\VerifikasiSPTTable($dbAdapter);
                    return $table;
                },
                'PelaporanTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Pelaporan\PelaporanTable($dbAdapter);
                    return $table;
                },
                'SSPDTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Pencetakan\SSPDTable($dbAdapter);
                    return $table;
                },
                'HistorylogTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Historylog\HistorylogTable($dbAdapter);
                    return $table;
                },
                'SPTWarisTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $table = new Model\Pendataan\SPTWarisTable($dbAdapter);
                    return $table;
                },
                'PBBKecamatanTable' => function ($sm) {
                    $dbAdapter = $sm->get('oracle_db');
                    $table = new Model\Setting\PBBKecamatanTable($dbAdapter);
                    return $table;
                },
                'PBBKelurahanTable' => function ($sm) {
                    $dbAdapter = $sm->get('oracle_db');
                    $table = new Model\Setting\PBBKelurahanTable($dbAdapter);
                    return $table;
                },
//                'AnggaranSimpatdaTable' => function ($sm) {
//                    $dbAdapter = $sm->get('simpatda');
//                    $table = new Model\DataSimpatda\AnggaranSimpatdaTable($dbAdapter);
//                    return $table;
//                },
                'EtaxService' => function ($sm) {
                    $dbAdapter = $sm->get('bphtb');
                    $dbTableAuthAdapter = new DbTableAuthAdapter($dbAdapter, "s_users", "s_username", "s_password", "MD5(?)");
                    $eTaxService = new AuthenticationService ();
                    $eTaxService->setAdapter($dbTableAuthAdapter);
                    return $eTaxService;
                },
                'bphtbRoleTable' => function ($serviceManager) {
                    return new Model\Secure\Role($serviceManager->get('bphtb'));
                },
                'UserRoleTable' => function ($serviceManager) {
                    return new Model\Secure\UserRole($serviceManager->get('bphtb'));
                },
                'PermissionTable' => function ($serviceManager) {
                    return new Model\Secure\PermissionTable($serviceManager->get('bphtb'));
                },
                'bphtbResourceTable' => function ($serviceManager) {
                    return new Model\Secure\ResourceTable($serviceManager->get('bphtb'));
                },
                'bphtbRolePermissionTable' => function ($serviceManager) {
                    return new Model\Secure\RolePermissionTable($serviceManager->get('bphtb'));
                },
                'bphtbAcl' => function ($serviceManager) {
                    return new Utility\Acl ();
                },
                'app_path' => function ($sm) {
                    $path_aplikasi = "/var/www/html/simpatda";
                    return $path_aplikasi;
                }
            )
        );
    }

    public function init(\Zend\ModuleManager\ModuleManager $mm) {
        $mm->getEventManager()->getSharedManager()->attach(__NAMESPACE__, 'dispatch', function ($e) {
            $e->getTarget()->layout('bphtb/layout');
        });
    }

    public function onBootstrap($e) {
        $translator = $e->getApplication()->getServiceManager()->get('translator');
        $eventManager = $e->getApplication()->getEventManager();
        $moduleRouteListener = new \Zend\Mvc\ModuleRouteListener ();
        $moduleRouteListener->attach($eventManager);

//         $translator->addTranslationFile('phpArray', './vendor/zendframework/zend-i18n-resources/languages/id/Zend_Validate.php', 'default');
//         \Zend\Validator\AbstractValidator::setDefaultTranslator($translator);

        $eventManager->attach(\Zend\Mvc\MvcEvent::EVENT_DISPATCH, array(
            $this,
            'boforeDispatch'
                ), 100);
    }

    function boforeDispatch(\Zend\Mvc\MvcEvent $event) {
        $authenticationService = $event->getApplication()->getServiceManager()->get('EtaxService');
        $request = $event->getRequest();
        $response = $event->getResponse();
        $target = $event->getTarget();
        $whiteList = array(
            'LoginAccess-logout'
        );
        $requestUri = $request->getRequestUri();
        $controller = $event->getRouteMatch()->getParam('controller');
        $action = $event->getRouteMatch()->getParam('action');
        $requestedResourse = $controller . "-" . $action;
        if ($authenticationService->hasIdentity()) {
            if ($requestedResourse == 'LoginAccess-logout' || in_array($requestedResourse, $whiteList)) {
                $url = 'sign_in';
                $response->setHeaders($response->getHeaders()->addHeaderLine('Location', $url));
                $response->setStatusCode(302);
            } else {
                $serviceManager = $event->getApplication()->getServiceManager();
                $storage = $serviceManager->get('EtaxService')->getStorage()->read();
                // $userRole = $storage['s_namauserrole'];
                $userRole = $storage ['s_username'];
                $acl = $serviceManager->get('bphtbAcl');
                $acl->initAcl();

                $status = $acl->isAccessAllowed($userRole, $controller, $action);
                if (!$status) {
                    die('Anda tidak di ijinkan untuk membuka halaman ini');
                }
            }
        } else {
            if ($requestedResourse != 'LoginAccess-index' && !in_array($requestedResourse, $whiteList)) {
                $url = 'sign_in';
                $response->setHeaders($response->getHeaders()->addHeaderLine('Location', $url));
                $response->setStatusCode(302);
            }
            $response->sendHeaders();
        }
    }

    // Custom Code
}
