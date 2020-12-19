<?php
/*
* Ixian Mining Pool
* Website: www.ixian.io 
* Github:  https://github.com/ProjectIxian/Ixian-Pool
*/

include_once("config.php");
include_once("include/template.php");

$current_page = "home";

if(isset($_GET['p']))
{
    $new_page = $_GET['p'];
    
    if($new_page === 'address' || $new_page === 'miners' || $new_page === 'terms' )
    {
        $current_page = $new_page;
    }
}

$page = new Template();

$page->pool_name = $pool_name;
$page->pool_url = $pool_url;

$page->cpage = $current_page;

$page->render('header.tpl'); 

include_once('pages/'.$current_page.'.php');

$page->render('footer.tpl');

?>