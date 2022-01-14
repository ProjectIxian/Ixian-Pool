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
    api_error("Balance too low for payouts");

db_connect();

$totalshares = db_fetch("SELECT sum(shares) as sh FROM `miners` WHERE shares > 0", array())[0]['sh'];

if($totalshares < 1)
    api_error("Not enough shares to issue payouts");

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
	if($pending < 0)
        $pending = 0;
    db_fetch("UPDATE `miners` SET `ixi_pending` = :pending WHERE `miners`.`address` = :address", [":pending" => $pending, "address" => $miner["address"]]);
}

?>