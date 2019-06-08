<?php
/*
*   Client requests a new mining block
*/
header('Content-type: application/json');

readfile("../cache/block.ixi");

include_once("../config.php"); 

if(!isset($_GET['wallet']) || !isset($_GET['worker']))
{
    die("Invalid parameters");
}

$wallet = $_GET['wallet'];
$worker = $_GET['worker'];
$symbols = array('-', '_'); 
$id = md5($wallet.$worker);

$hashrate = 0;
if(isset($_GET['hr']))
{
    $hashrate = $_GET['hr'];
}

if(!ctype_alnum($wallet) || !ctype_alnum(str_replace($symbols, '', $worker)) || !ctype_alnum($hashrate))
    api_error("Incorrect parameters");

db_connect();
$statement = db_prepare("INSERT INTO `workers` (`id`,`wallet`, `name`, `hashrate`, `updated`) VALUES (:id, :address, :name, :hashrate, CURRENT_TIMESTAMP) ON DUPLICATE KEY UPDATE updated=CURRENT_TIMESTAMP, hashrate=:hashrate");
db_execute($statement, array(':id' => $id, ':address' => $wallet, ':name' => $worker, ':hashrate' => $hashrate)); 


?>