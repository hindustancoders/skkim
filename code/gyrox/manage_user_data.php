<?php 
    // Database connection info 
    $dbDetails = array( 
        'host' => '127.0.0.1', 
        'user' => 'bhar42501_SQL', 
        'pass' => 'BharatG7_Kx9mQ2vL', 
        'db'   => 'bhar42501_SQL' 
    ); 

    // DB table to use 
    $table = <<<EOT
 (
    SELECT
        users.mobile,
        users.code,
        users.ip,
        users.id,
        users.createdate,
        users.status,
        users.pwd,
        users.account_frozen, 
        user_wallets.motta,
        (SELECT SUM(motta) FROM deposits WHERE balakedara = users.id AND `status`='1') AS total_deposit,
        (SELECT motta FROM deposits WHERE balakedara = users.id AND `status`='1' ORDER BY motta ASC LIMIT 1) AS deposit_motta,
        (SELECT name FROM user_bankcards WHERE userid = users.id ORDER BY id ASC LIMIT 1) AS name,
        (SELECT account FROM user_bankcards WHERE userid = users.id ORDER BY id ASC LIMIT 1) AS account,
        (SELECT SUM(balance) FROM provider_balances WHERE user_id = users.id) AS third_party_wallet
    FROM users
    JOIN user_wallets ON users.id = user_wallets.balakedara
 ) temp
EOT;

    // Table's primary key 
    $primaryKey = 'id'; 

    // Array of database columns which should be read and sent back to DataTables
    $columns = array( 
        array( 'db' => 'mobile', 'dt' => 0 ),  
        array( 'db' => 'code', 'dt' => 1 ), 
        array( 'db' => 'ip', 'dt' => 2 ), 
        array( 'db' => 'id', 'dt' => 3 ), 
        array( 
            'db' => 'motta', 
            'dt' => 4,
            'formatter' => function( $d, $row ) { 
                $aid = $row['id'];
                $mobile = $row['mobile'];
                $motta = $row['motta'];
                return number_format($d, 2) . ' <a href="javascript:void(0);" onClick="edit('.$aid.',\''.$mobile.'\','.$motta.')" class="text-aqua" title="Edit"><i class="fa fa-edit"></i></a>';
            }            
        ),
        array( 
            'db' => 'third_party_wallet', 
            'dt' => 5,
            'formatter' => function( $d, $row ) { 
                $aid = $row['id'];
                $mobile = $row['mobile'];
                $thirdPartyWallet = $d ? $d : 0;
                return number_format($thirdPartyWallet, 2) . ' <a href="javascript:void(0);" onClick="editThirdParty('.$aid.',\''.$mobile.'\','.$thirdPartyWallet.')" class="text-aqua" title="Edit"><i class="fa fa-edit"></i></a>';
            }            
        ),
        array( 
            'db' => 'total_deposit', 
            'dt' => 6,
            'formatter' => function( $d, $row ) { 
                return ($d == null) ? '0.00' : number_format($d, 2);
            } 
        ),
        array( 
            'db' => 'deposit_motta', 
            'dt' => 7,
            'formatter' => function( $d, $row ) { 
                return ($d == null) ? '0.00' : number_format($d, 2);
            } 
        ),
        array( 
            'db' => 'createdate', 
            'dt' => 8, 
            'formatter' => function( $d, $row ) { 
                return date('jS M Y', strtotime($d)); 
            } 
        ), 
        array( 
            'db' => 'status', 
            'dt' => 9, 
            'formatter' => function( $d, $row ) {
                $id = $row['id'];
                return ($d == 1) ?
                    '<a href="javascript:void(0);" onClick="delete_row('.$id.')" class="update-person" style="color:#f56954; font-size:16px;" title="Delete"><i class="fa fa-trash"></i></a>
                    <a href="javascript:void(0);" onClick="Respond('.$id.')" class="update-person" style="color:#090; font-size:16px;" data-toggle="tooltip" title="Publish"><i class="fa fa-check-square-o"></i></a>
                    <a href="user-details.php?user='.$id.'" class="update-person" style="color:#0E0E44; font-size:16px;" data-toggle="tooltip" title="User Detail"><i class="fa fa-info"></i></a>' :
                    '<a href="javascript:void(0);" onClick="delete_row('.$id.')" class="update-person" style="color:#f56954; font-size:16px;" title="Delete"><i class="fa fa-trash"></i></a>
                    <a href="javascript:void(0);" onClick="UnRespond('.$id.')" class="update-person" style="color:#f00; font-size:16px;" data-toggle="tooltip" title="Unpublish"><i class="fa fa-square-o"></i></a>
                    <a href="user-details.php?user='.$id.'" class="update-person" style="color:#0E0E44; font-size:16px;" data-toggle="tooltip" title="User Detail"><i class="fa fa-info"></i></a>';
            } 
        ),
        array( 'db' => 'pwd', 'dt' => 10 ),
        array( 'db' => 'name', 'dt' => 11 ),
        array( 'db' => 'account', 'dt' => 12 ),
        array( 
            'db' => 'account_frozen', 
            'dt' => 13,
            'formatter' => function( $d, $row ) {
                $id = $row['id'];  
                return ($d == 1) 
                    ? '<a href="javascript:void(0);" onclick="toggleFreeze('.$id.', 0)" style="color:red;">Yes</a>' 
                    : '<a href="javascript:void(0);" onclick="toggleFreeze('.$id.', 1)" style="color:green;">No</a>';
            }
        )
    ); 

    // Include SQL query processing class 
    require 'ssp_without_quote_table.php'; 

    // Output data as json format 
    echo json_encode( 
        SSP::simple( $_GET, $dbDetails, $table, $primaryKey, $columns ) 
    );
?>