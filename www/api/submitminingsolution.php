<?php

include_once("../config.php"); 

if(!isset($_GET['nonce']) || !isset($_GET['blocknum']) || !isset($_GET['wallet']) || !isset($_GET['worker'])) {
    api_error("Invalid parameters");
}

$ip = $_SERVER['REMOTE_ADDR'];

$nonce = $_GET['nonce'];
$blocknum = $_GET['blocknum'];


$blockheightres = file_get_contents($dlt_host."/getblockcount");
$blockheightdata = json_decode($blockheightres, true);
if(isset($blockheightdata["error"]) || $blockheightdata["result"] == "") {
    api_error("Rejected");
}

$blockheight = $blockheightdata["result"];
if($blocknum < $blockheight - 20000)
{
    api_error("Rejected");
}

$wallet = $_GET['wallet'];
$worker = $_GET['worker'];
$symbols = array('-', '_'); 

if(!ctype_alnum($wallet) || !ctype_alnum(str_replace($symbols, '', $worker)) || !ctype_alnum($blocknum) || !ctype_alnum($nonce))
    api_error("Incorrect parameters");

db_connect();
$chk = db_fetch("SELECT count(1) FROM nonces WHERE nonce=:nonce", [":nonce" => $nonce])[0]['count(1)'];
if ($chk != 0) {
    api_error("Duplicate nonce");
}


$blockdatacontents = file_get_contents("../cache/block.ixi");
$blockdata = json_decode($blockdatacontents, true, 512, JSON_BIGINT_AS_STRING);

if(!isset($blockdata["result"])) {
    api_error("Error");
}


$blockheight = $blockdata["result"]["num"];
$difficulty = $blockdata["result"]["dif"];

if($blockheight != $blocknum) {
    api_error("Invalid blocknum");
}


$res = file_get_contents($dlt_host."/verifyminingsolution?nonce=$nonce&blocknum=$blocknum&diff=$difficulty");
$data = json_decode($res, true);

if(isset($data["error"]) || $data["result"] == "") {
    api_error("Rejected");
}

$share = 1;

db_fetch("INSERT IGNORE into nonces SET nonce=:nonce", [":nonce" => $nonce]);

db_fetch("INSERT INTO miners SET address=:id, shares=shares+:sh, updated=CURRENT_TIMESTAMP ON DUPLICATE KEY UPDATE shares=shares+:sh2, updated=CURRENT_TIMESTAMP",
            [":id" => $wallet, ":sh" => $share, ":sh2" => $share]
        );


$res = file_get_contents($dlt_host."/submitminingsolution?nonce=$nonce&blocknum=$blocknum");
$data = json_decode($res, true);

if(isset($data["error"]) || $data["result"] == "") {
    // Rejected with normal difficulty
}

?>