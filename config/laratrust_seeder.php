<?php

return [
    /**
     * Control if the seeder should create a user per role while seeding the data.
     */
    'create_users' => false,

    /**
     * Control if all the laratrust tables should be truncated before running the seeder.
     */
    'truncate_tables' => true,

    'roles_structure' => [
        'superadmin' => [
            'users' => 'i,c,r,u,d',
            'products' => 'i,c,r,u,d',
            'pos' => 'i,c,r,u,d',
        ],
        'kasir' => [
            'pos' => 'i,c,r,u,d',
        ],
    ],

    'permissions_map' => [
        'i' => 'index',
        'c' => 'create',
        'r' => 'read',
        'u' => 'update',
        'd' => 'delete'
    ]
];
