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


$primarybalance = $primarybalance - $poollocked_balance;

if($primarybalance < 1000)
    die("Not enough funds to issue payouts");

$fee = $primarybalance * $poolfee;
$primarybalance = $primarybalance - $fee;
$rewardpershare = $primarybalance / $totalshares;

$miners = db_fetch("SELECT * from `miners` where shares > 0", array());

if(count($miners) < 1)
    die("No miners to pay");

$prefix = $dlt_host."/addtransaction?to=";
$full_uri = $prefix;

foreach($miners as $miner)
{
    $mineraddress = $miner["address"];
    $pending = $rewardpershare * $miner["shares"];
    
    $full_uri = $prefix.$mineraddress."_".$pending;
    
    $payresponse = file_get_contents($full_uri);
    $payresponse = json_decode($payresponse, true, 512, JSON_BIGINT_AS_STRING);
    
    print_r($payresponse);
    
    if(isset($payresponse["error"]["code"]))
    {
        echo "Error sending to $mineraddress";
        continue;
    }
    
    $txid = $payresponse["result"]["id"];
    
    db_fetch("INSERT INTO `payments` (`address`, `amount`, `txid`) VALUES (:address, :amount, :txid)", [":address" => $miner["address"], ":amount" => $pending, ":txid" => $txid]);
    
    db_fetch("UPDATE `miners` SET ixi_pending = :pending WHERE `miners`.`address` = :address", [":pending" => "0", "address" => $miner["address"]]);
    db_fetch("UPDATE `miners` SET ixi_paid = ixi_paid+:pending WHERE `miners`.`address` = :address", [":pending" => $pending, "address" => $miner["address"]]);
    db_fetch("UPDATE `miners` SET shares = :shares WHERE `miners`.`address` = :address", [":shares" => "0", "address" => $miner["address"]]);
    db_fetch("UPDATE `miners` SET historicshares = historicshares+:shares WHERE `miners`.`address` = :address", [":shares" => $miner["shares"], "address" => $miner["address"]]);
}

$full_uri = $prefix.$poolfee_address."_".$fee;
$payresponse = file_get_contents($full_uri);
$payresponse = json_decode($payresponse, true, 512, JSON_BIGINT_AS_STRING);

db_fetch("DELETE FROM `nonces` WHERE `timestamp` < NOW() - INTERVAL 48 HOUR", array());

?>