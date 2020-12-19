<?php
/*
* Ixian Mining Pool
* Website: www.ixian.io 
* Github:  https://github.com/ProjectIxian/Ixian-Pool
*/

$page = new Template();

$page->pool_name = $pool_name;
$page->pool_url = $pool_url;

$blockdata = file_get_contents("cache/block.ixi");
$response = json_decode($blockdata, true, 512, JSON_BIGINT_AS_STRING);
$nodeStatus = file_get_contents("cache/status.ixi");
$nodeStatus = json_decode($nodeStatus, true, 512, JSON_BIGINT_AS_STRING);

$blockheight = "0";
$page->nodeBlockHeight = "0";
$page->blockheight = "0";
$page->difficulty = "0";
$page->reward = "0";
$page->hashrate = "0";

if(isset($nodeStatus["result"]["Block Height"]))
{
	$page->nodeBlockHeight = number_format($nodeStatus["result"]["Block Height"]);
}

if(isset($response["result"]))
{
    $blockheight = $response["result"]["num"];
    $page->difficulty = $response["result"]["dif"];
}

$page->blockheight = number_format($blockheight);

db_connect();
$notices = db_fetch("SELECT * from `notices` where visible = 1 ORDER BY date DESC", array());

$page->noticecount = count($notices);
$noticesarr = array();

for($i = 0; $i < $page->noticecount; $i++) {
    $noticesarr[$i]["message"] = $notices[$i]["message"];
    if($notices[$i]["warning"] == 1) {
        $noticesarr[$i]["warning"] = "callout-danger";
    }
    else {
         $noticesarr[$i]["warning"] = "callout-info";
    }
}

$page->notices=$noticesarr;


$page->hashrate = db_fetch("SELECT sum(hashrate) as hashes FROM `workers` WHERE updated >= NOW() - INTERVAL 15 MINUTE", array())[0]['hashes'];

if($page->hashrate == "")
    $page->hashrate = 0;
$page->hashrate = humanNumber(number_format($page->hashrate, 0))."h/s";
$page->reward = number_format(calculateRewardForBlock($blockheight),4);
$page->percent = $poolfee * 100;
$page->minercount = db_fetch("SELECT COUNT(*) FROM `miners` where updated >= NOW() - INTERVAL 15 MINUTE", array())[0]['COUNT(*)'];
$page->workercount = db_fetch("SELECT COUNT(*) FROM `workers` where updated >= NOW() - INTERVAL 15 MINUTE", array())[0]['COUNT(*)'];

$page->totalpaid = db_fetch("SELECT sum(ixi_paid) as total FROM `miners`", array())[0]['total'];
if($page->totalpaid == "")
    $page->totalpaid = 0;
$page->totalpaid = number_format($page->totalpaid, 4);


$page->render('page_home.tpl');

?>