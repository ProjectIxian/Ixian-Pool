<?php
/*
* Ixian Mining Pool
* Website: www.ixian.io 
* Github:  https://github.com/ProjectIxian/Ixian-Pool
*/

include_once("../config.php");

// DB table to use
$table = 'miners';
// Table's primary key
$primaryKey = 'id';
// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database, while the `dt`
// parameter represents the DataTables column identifier. In this case simple
// indexes
$columns = array(
	array( 'db' => 'address',  'dt' => 0 ),
	array( 'db' => 'shares',   'dt' => 1 ),
	array( 'db' => 'updated',  'dt' => 2 )
);

$where = "updated >= NOW() - INTERVAL 48 HOUR";

require( '../include/assp.class.php' );

$ret = 	SSP::complex( $_GET, $sql_details, $table, $primaryKey, $columns, null, $where);
$data = &$ret["data"];

foreach($data as &$worker)
{
    $address = $worker[0];
    $address = "<a href='?p=address&id=$address'>$address</a>";
    $worker[0] = $address;
    $date = strtotime($worker[2]);
    $datestring = humanTiming($date).' ago';
    $worker[2] = $datestring;
}

echo json_encode($ret);

?>