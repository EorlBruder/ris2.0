<?php

$f3=require('lib/base.php');

$db=new DB\SQL('sqlite:/home/david/dev/Uni/Softwareprojekt/ris2.0/development.sqlite3'));

$f3->route('GET /',
    function() {
        echo 'Hello, world!';
    }
);

$f3->run();
