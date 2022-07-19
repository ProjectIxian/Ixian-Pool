<?php
/*
* Ixian Mining Pool
* Website: www.ixian.io 
* Github:  https://github.com/ProjectIxian/Ixian-Pool
*/

include_once("../config.php");

$params = "/mywallet";

$response = file_get_contents($dlt_host.$params);
$response = json_decode($response, true, 512, JSON_BIGINT_AS_STRING);

if(!isset($response["result"]))
    api_error("Can't retrieve balance");

$primarybalance = reset($response["result"]);
if($primarybalance == FALSE)
    api_error("Incorrect balance");

if($primarybalance < 10)
    api_error("Balance too low for estimates");

// Fetch the current node block height
$params = "/status";

$response = file_get_contents($dlt_host.$params);
$response = json_decode($response, true, 512, JSON_BIGINT_AS_STRING);

$blockheight = $response["result"]["Block Height"];
if($blockheight == FALSE)
    api_error("Incorrect block height");


db_connect();

$totalshares = db_fetch("SELECT sum(shares) as sh FROM `pending_payments` WHERE `block` >= :blk", 
array(":blk" => $blockheight - 120))[0]['sh'];

if($totalshares < 1)
    api_error("Not enough shares to estimate payouts");

echo "Total shares: $totalshares | ";

$primarybalance = $primarybalance - $poollocked_balance;
$fee = $primarybalance * $poolfee;
$primarybalance = $primarybalance - $fee;
$rewardpershare = $primarybalance / $totalshares;

echo "Reward per share: $rewardpershare";

$miners = db_fetch("SELECT * from `miners` where shares > 0", array());

foreach($miners as $miner)
{
    $pending = $rewardpershare * $miner["shares"];
    db_fetch("UPDATE `miners` SET `ixi_pending` = :pending WHERE `miners`.`address` = :address", [":pending" => $pending, "address" => $miner["address"]]);
}

?>