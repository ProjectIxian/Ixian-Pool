<?php
/*
* Ixian Mining Pool
* Website: www.ixian.io 
* Github:  https://github.com/ProjectIxian/Ixian-Pool
*/

$db = null;

function db_connect() {
    global $db, $db_host, $db_name, $db_user, $db_pass;
    try {
        $db = new PDO("mysql:host=".$db_host.";dbname=".$db_name, $db_user, $db_pass);
    } catch (PDOException $pe) {
        die("Could not connect to the database ".$db_name." :" . $pe->getMessage());
    } 
}

function db_exec($sql) {
    global $db;
    return $db->exec($sql);
}

function db_prepare($sql)
{
    global $db;
    return $db->prepare($sql);
}

function db_bindParam($prep, $name, $param)
{
    global $db;
    $prep->bind_param($name, $param);
}

function db_execute($prep, $array)
{
    global $db;
    $prep->execute($array);
}

function db_fetch($sql, $bind = "")
{
    global $db;
    $sql = trim($sql);
    try {
        $pdostmt = $db->prepare($sql);
        
        if ($pdostmt->execute($bind) !== false) {           
            return $pdostmt->fetchAll(PDO::FETCH_ASSOC);
        }
        return false;
    } catch (PDOException $e) {        
        return false;
    }
}

?>