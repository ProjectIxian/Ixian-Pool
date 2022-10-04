<?php
/*
* Ixian Mining Pool
* Website: www.ixian.io 
* Github:  https://github.com/ProjectIxian/Ixian-Pool
*/

include_once("../config.php");

// DB table to use
$table = 'payments';
// Table's primary key
$primaryKey = 'id';
// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database, while the `dt`
// parameter represents the DataTables column identifier. In this case simple
// indexes
$columns = array(
	array( 'db' => 'date',  'dt' => 0 ),
	array( 'db' => 'amount',   'dt' => 1 ),
	array( 'db' => 'txid',   'dt' => 2 )
);

if(!isset($_GET['address']))
	die("No address");

$addr = $_GET['address'];
if(!ctype_alnum($addr))
    die("Invalid address");

$where = "address = '$addr'";

require( '../include/assp.class.php' );

$ret = 	SSP::complex( $_GET, $sql_details, $table, $primaryKey, $columns, null, $where);
$data = &$ret["data"];

foreach($data as &$payment)
{
    $txid = $payment[2];
    $txid = "<a href='https://explorer.ixian.io/index.php?p=transaction&id=$txid'>$txid</a>";
    $payment[2] = $txid;
}

echo json_encode($ret);

?>