# Ixian-Pool

## About Ixian Pool
Mining pool implementation for the Ixian cryptocurrency. 
Discover Ixian in the main repository here: https://github.com/ProjectIxian


## Requirements
A typical LAMP/WAMP/MAMP setup is needed for proper functionality.
Development tests were done with the following software versions:
- Apache 2.4 (with mod_rewrite)
- Mariadb 10.1
- PHP 7.2

The pool operator needs to run an IxianDLT node for the pool to connect to. The node will be responsible with worker share validation, with collecting mining rewards and with performing the periodic payouts.


## Deploying
1. Create SQL database and import the included pool.sql file
```
mysql -e "CREATE DATABASE ixian"
mysql -e "CREATE USER 'ixian'@'localhost' IDENTIFIED BY 'myPassword'"
mysql -e "GRANT ALL PRIVILEGES ON ixian.* TO 'ixian'@'localhost'"
mysql ixian < pool.sql
```

2. Edit config.php and set the parameters as required, most important parameters are:
```
// Database configuration
$db_host = "127.0.0.1"; // Database host
$db_user = "ixian"; // Database username
$db_pass = "myPassword"; // Database password
$db_name = "ixian"; // Database name

// Ixian Node configuration
$dlt_host = "http://localhost:8081"; // DLT Node that the pool connects to

// Pool configuration
$pool_name = "My Ixian Pool"; // Pool name
$pool_url = "http://my-ixian-pool.com"; // This pool's URL

// Pool fee configuration
$poolfee = 0.02; // Percent of funds the pool keeps on every payout (defaults to 2%)
$poolfee_address = "153xXfVi1sznPcRqJur8tutgrZecNVYGSzetp47bQvRfNuDix"; // Address that collects the pool fees (defaults to Ixian foundation address)
```

3. Set crontab entries
```
crontab -l | { cat; echo "* * * * * cd /var/www/html/scripts && /usr/bin/php fetch.php"; } | crontab -
crontab -l | { cat; echo "*/5 * * * * cd /var/www/html/scripts && /usr/bin/php balances.php"; } | crontab -
crontab -l | { cat; echo "0 * * * * cd /var/www/html/scripts && /usr/bin/php pay.php"; } | crontab -
```

## Usage
Navigate to the pool's HTTP/s - i.e. http://localhost/index.php.


## Notes
Ixian Pool automatically splits the pool's earnings with the Ixian foundation 50%/50%.


## License Mentions
Ixian Pool uses the free AdminLTE bootstrap template, which is licensed under the MIT license. More information can be found here: https://adminlte.io/


## Get in touch / Contributing
If you feel like you can contribute to the project, or have questions or comments, you can get in touch with the team through Discord: (https://discord.gg/dbg9WtR)
