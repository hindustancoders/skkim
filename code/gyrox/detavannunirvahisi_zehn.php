<?php 
	// Database connection info 
	$dbDetails = array( 
		'host' => '127.0.0.1', 
		'user' => 'bhar42501_SQL', 
		'pass' => 'BharatG7_Kx9mQ2vL', 
		'db'   => 'bhar42501_SQL' 
	); 
	 
	// DB table to use 
	//$table = 'tbl_user'; 
	$table = <<<EOT
	 (
		SELECT
		  wingo_bets_10min.byabaharkarta,
		  wingo_bets_10min.ojana,
		  wingo_bets_10min.ketebida,
		  (SELECT mobile FROM  users WHERE id = wingo_bets_10min.byabaharkarta) AS mobile,
		  (SELECT motta FROM  user_wallets WHERE balakedara = wingo_bets_10min.byabaharkarta) AS balance
		FROM wingo_bets_10min
		WHERE wingo_bets_10min.kalaparichaya = (SELECT atadaaidi FROM wingo_periods_10min ORDER BY wingo_periods_10min.kramasankhye DESC LIMIT 1)
	 ) temp
	EOT;	
	 
	// Table's primary key 
	$primaryKey = 'byabaharkarta'; 
	 
	// Array of database columns which should be read and sent back to DataTables. 
	// The `db` parameter represents the column name in the database.  
	// The `dt` parameter represents the DataTables column identifier. 
	$columns = array( 
		array( 'db' => 'byabaharkarta', 'dt' => 0 ),  
		array( 'db' => 'ojana', 'dt' => 1,
				'formatter' => function( $d, $row ) { 
				return 
				($d == 10)?'Red':(($d == 11)?'Green':(($d == 12)?'Violet':(($d == 13)?'Big':(($d == 14)?'Small':$d))))
				; 
				}  		
		), 
		array( 'db' => 'ketebida', 'dt' => 2),
		array( 'db' => 'mobile', 'dt' => 3 ),
		array( 'db' => 'balance', 'dt' => 4 )
	); 
	 
	// Include SQL query processing class 
	require 'ssp_without_quote_table.php'; 
	 
	// Output data as json format 
	echo json_encode( 
		SSP::simple( $_GET, $dbDetails, $table, $primaryKey, $columns ) 
	);
?>