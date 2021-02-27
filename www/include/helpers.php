<?php
/*
* Ixian Mining Pool
* Website: www.ixian.io 
* Github:  https://github.com/ProjectIxian/Ixian-Pool
*/

function api_error($message)
{
    if (!headers_sent()) 
    {
        header('Content-Type: application/json');
    }

    echo json_encode(["result" => null, "error" => ["code" => -32603, "message" => $message], "id" => null]);
    exit;
}

function humanTiming ($time)
{

    $time = time() - $time; // to get the time since that moment
    $time = ($time<1)? 1 : $time;
    $tokens = array (
        31536000 => 'year',
        2592000 => 'month',
        604800 => 'week',
        86400 => 'day',
        3600 => 'hour',
        60 => 'minute',
        1 => 'second'
    );

    foreach ($tokens as $unit => $text) {
        if ($time < $unit) continue;
        $numberOfUnits = floor($time / $unit);
        return $numberOfUnits.' '.$text.(($numberOfUnits>1)?'s':'');
    }
}

function humanNumber($num, $decimals = 2)
{
	if($num >= 1000000000000)
	{
		return number_format($num/1000000000000, $decimals)." T";
	}else if($num >= 1000000000)
	{
		return number_format($num/1000000000, $decimals)." G";
	}else if($num >= 1000000)
	{
		return number_format($num/1000000, $decimals)." M";
	}else if($num >= 1000)
	{
		return number_format($num/1000, $decimals)." K";
	}
	return number_format($num, 0);
}

function calculateRewardForBlock($blockNum)
{
    $reward = 0;
    
    if($blockNum < 1051200) // first year
    {
        $reward = ((($blockNum * 0.009) + 0.009) / 2) + 10;
    }else if($blockNum < 1802000) // second year, until first adjustment
    {
        $reward = ((1051200 * 0.009) / 2) + 10;
    }else if($blockNum < 6307200) // up to first halving
    {
        $reward = 2304;
    }else if($blockNum < 9460800) // up to second halving
    {
        $reward = 1152;
    }else if($blockNum < 12614400) // up to final reward
    {
        $reward = 576;
    
    }else if ($blockNum < 105120000)
    {
        $reward = 18;
    }
    
    return $reward;
}


?>