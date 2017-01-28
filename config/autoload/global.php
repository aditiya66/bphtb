<?php

/**
 * Global Configuration Override
 *
 * You can use this file for overriding configuration values from modules, etc.
 * You would place values in here that are agnostic to the environment and not
 * sensitive to security.
 *
 * @NOTE: In practice, this file will typically be INCLUDED in your source
 * control, so do not include passwords or other sensitive information in this
 * file.
 */
return array(
    'db' => array(
        'driver' => 'pdo',
        'dsn' => 'pgsql:dbname=bphtb;host=localhost',
        'username' => 'aditiya',
        'password' => 'destrak123',
        'adapters' => array(
            'bphtb' => array(
                'driver' => 'pdo',
//                'dsn' => 'pgsql:dbname=bphtb;host=localhost',
                'dsn' => 'pgsql:dbname=bphtb;host=localhost',
                'username' => 'aditiya',
//                'password' => 'destrak123',
                'password' => 'destrak123',
            ),
            'simpatda' => array(
                'driver' => 'pdo',
                'dsn' => 'pgsql:dbname=simpatda;host=localhost',
                'username' => 'postgres',
                'password' => 'postgres',
            ),
            'oracle_db' => array(
                'driver' => 'OCI8',
//                'connection_string' => '192.168.56.1/SIMPBB',
//                'connection_string' => '192.168.1.254/SIMPBB',
                'connection_string' => '192.168.88.150/SIMPBB',
                'character_set' => 'AL32UTF8',
                'username' => 'PBB',
                'password' => 'Z2184SDNHGF8121RT58',
            )
        ),
        'options'=>array(
            'buffer_results' => true
        ),
    ),
    'service_manager' => array(
        'abstract_factories' => array(
            'Zend\Db\Adapter\AdapterAbstractServiceFactory',
        ),
        'factories' => array(
            'Zend\Db\Adapter\Adapter' => 'Zend\Db\Adapter\AdapterServiceFactory',
        ),
    ),
);

