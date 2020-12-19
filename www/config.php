<?php
/*
* Ixian Mining Pool
* Website: www.ixian.io 
* Github:  https://github.com/ProjectIxian/Ixian-Pool
*/

// Database configuration
$db_host = "127.0.0.1"; // Database host
$db_user = "root"; // Database username
$db_pass = "root"; // Database password
$db_name = "ixian"; // Database name

// Ixian Node configuration
$dlt_host = "http://localhost:8081"; // DLT Node that the pool connects to

// Pool configuration
$pool_name = "My Ixian Pool"; // Pool name
$pool_url = "http://my-ixian-pool.com"; // This pool's URL

// Pool fee configuration
$poolfee = 0.02; // Percent of funds the pool keeps on every payout (defaults to 2%)
$poolfee_address = "153xXfVi1sznPcRqJur8tutgrZecNVYGSzetp47bQvRfNuDix"; // Address that collects the pool fees (defaults to Ixian foundation address)

// Pool difficulty configuration
$pooldifficulty_reduction = -15; // Value between -1 and -15. The lower the value, the higher the number of average shares per miner

// Pool locked configuration
$poollocked_balance = 20001; // Minimum balance required to run the pool masternode




// Convenience configuration and failsafes
$sql_details = array('user' => $db_user,'pass' => $db_pass,'db' => $db_name,'host' => $db_host);
if($pooldifficulty_reduction < -15) $pooldifficulty_reduction = -15;
else if($pooldifficulty_reduction > -1) $$pooldifficulty_reduction = -1;
if($poolfee > 1) $poolfee = 0.02;
else if($poolfee < 0) $poolfee = 0.02;


// Additional includes files
include_once("include/database.php");
include_once("include/helpers.php");


?>