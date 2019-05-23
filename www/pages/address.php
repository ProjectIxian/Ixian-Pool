<?php
/*
* Ixian Mining Pool
* Website: www.ixian.io 
* Github:  https://github.com/ProjectIxian/Ixian-Pool
*/

$page = new Template();

$addressid = "";
if(isset($_GET['id']) && $_GET['id'] != "") {
    $addressid = $_GET['id'];
    if(!ctype_alnum($addressid))
    {
        $page->render('page_error.tpl');
        return;
    }
}
else 
{
    $page->render('page_error.tpl');
    return;
}

$active_shares = 0;

$page->address = $addressid;

db_connect();
$page->workercount = db_fetch("SELECT COUNT(*) FROM `workers` where wallet = :address AND updated >= NOW() - INTERVAL 24 HOUR", array(':address' => $addressid))[0]['COUNT(*)'];

if($page->workercount == 0)
{
    $page->render('page_error.tpl');
    return;    
}

$miner = db_fetch("SELECT * from `miners` where address = :address LIMIT 1", array(':address' => $addressid));
if(isset($miner[0]))
{
    $page->totalpaid = number_format($miner[0]['ixi_paid'],4);
    $page->pending = number_format($miner[0]['ixi_pending'],4);
    $active_shares = $miner[0]['shares'];
}
else
{
    $page->totalpaid = "0.0000";
    $page->pending = "0.0000";   
}


$page->hashrate = db_fetch("SELECT sum(hashrate) as hashes FROM `workers` WHERE wallet = :address AND updated >= NOW() - INTERVAL 5 MINUTE", array(':address' => $addressid))[0]['hashes']." h/s";

if($page->hashrate == " h/s") {
    $page->hashrate = "0 h/s";
}


$page->render('page_address.tpl');

?>