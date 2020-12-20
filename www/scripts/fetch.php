<?php
/*
* Ixian Mining Pool
* Website: www.ixian.io 
* Github:  https://github.com/ProjectIxian/Ixian-Pool
*/

include_once("../config.php");

$cache_file = "../cache/block.ixi";
$status_file = "../cache/status.ixi";

$status = file_get_contents($dlt_host."/status");
file_put_contents($status_file, $status);
$status = json_decode($status, true, 512, JSON_BIGINT_AS_STRING);

$params = "/getminingblock?algo=1";

$response = file_get_contents($dlt_host.$params);
$response = json_decode($response, true, 512, JSON_BIGINT_AS_STRING);

$num = $response["result"]["num"];
$version = $response["result"]["ver"];
$diff = $response["result"]["dif"];
$checksum = $response["result"]["chk"];
$address = $response["result"]["adr"];

db_connect();
db_fetch("INSERT INTO `blocks` (`num`, `version`, `diff`, `checksum`, `address`) VALUES (:num, :version, :diff, :checksum, :address)", [":num" => $num, ":version" => $version, ":diff" => $diff, ":checksum" => $checksum, ":address" => $address]);

$response["result"]["dif"] = substr($diff, 0, $pooldifficulty_reduction);
$response["result"]["PoW field"] = "";

$new_data = json_encode($response);
file_put_contents($cache_file, $new_data);

echo json_encode($new_data);

?>