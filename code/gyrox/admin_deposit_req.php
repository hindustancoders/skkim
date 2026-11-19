<?php 
include("conn.php");
if(isset($_POST['app'])) {
    
    $uid = $_POST['uid'];
    $deposit = $_POST['amount'];
	$depositdup = $deposit;
	
	$sid = $_POST['sid'];
	
	$ref_num = $_POST['ref_num'];

    date_default_timezone_set('Asia/Karachi');
    $today = date("F j, Y, g:i a"); 
	$tday = date("Y-m-d H:i");
	
	$dt = $_POST['date']; // added
	$timestamp = strtotime($dt);
	$dt2 = date("Y-m-d H:i", $timestamp);
	
	// Find referer
	$self = mysqli_query($conn , "SELECT code FROM users WHERE id = '".$uid."'");
	$selfArray = mysqli_fetch_array($self);
	$ref = mysqli_query($conn , "SELECT id FROM users WHERE owncode = '".$selfArray['code']."'");
	$refArray = mysqli_fetch_array($ref);
	$refid = isset($refArray['id']) ? $refArray['id'] : null; // Prevent error if no ref found
	
	if($depositdup >= 500){
		$refbn = 0; // Set reference bonus as per logic
	} else {
		$refbn = 0;
	}
	
	$refbnthr = 0;
	$refwal = mysqli_query($conn , "SELECT motta FROM user_wallets WHERE balakedara = '".$refid."'");
	$refwalA = mysqli_fetch_array($refwal);
	$refwalB = isset($refwalA['motta']) ? $refwalA['motta'] : 0;
	$refwalF = intval($refwalB) + intval($refbn);
	$refwalFthr = intval($refwalB) + intval($refbnthr);
	
	// Find 1st Recharge
	$up2 = mysqli_query($conn , "SELECT shonu FROM deposits WHERE balakedara = '".$uid."' && sthiti = '1'");
	$up2row = mysqli_num_rows($up2);
	
  	// Bonus
  	$rechqueryaa = mysqli_query($conn, "SELECT rechargebonus FROM payment_settings");
    $rechqueryarrayaa = mysqli_fetch_array($rechqueryaa);
    $rechargebonus = isset($rechqueryarrayaa['rechargebonus']) ? $rechqueryarrayaa['rechargebonus'] : 0;
  	$bn = ($up2row == 0) ? '0' : '0';
  
	
    $up = mysqli_query($conn , "SELECT motta FROM user_wallets WHERE balakedara = '".$uid."'");
    $rup = mysqli_fetch_array($up);
    $currentBalance = isset($rup['motta']) ? intval($rup['motta']) : 0;
         
    $addmoney = $currentBalance + intval($deposit) + intval($bn);

    $wal = mysqli_query($conn, "UPDATE user_wallets SET motta = '".$addmoney."' WHERE balakedara = '".$uid."'");
    
    if ($wal) {
        $succes = mysqli_query($conn, "UPDATE deposits SET sthiti = '1' WHERE balakedara = '".$uid."' && motta = '$deposit' && dinankavannuracisi = '".$dt."' && shonu = '".$sid."'");

        if ($up2row == 0) {
            $refwll = mysqli_query($conn, "UPDATE user_wallets SET motta = '".$refwalF."' WHERE balakedara = '".$refid."'");
        } else if ($up2row == 2) {
            $refwll = mysqli_query($conn, "UPDATE user_wallets SET motta = '".$refwalFthr."' WHERE balakedara = '".$refid."'");
        }

       // ✅ Insert Recharge Approval Notification
        $title = "Recharge Arrival";
        $message = "Your recharge has been successfully credited to your account. You can now enjoy uninterrupted access to our services. If you have any questions, feel free to contact our support team.";
        $today = date('Y-m-d H:i:s');

        $insertNotificationQuery = "INSERT INTO user_notifications (state, title, user_id, created_at) 
                                    VALUES ('0', '$title', '$uid', '$today')";
        mysqli_query($conn, $insertNotificationQuery);

        echo "1~".$sid;
    } else {
        echo "2"; 
    }
}
?>



<?php 
if(isset($_POST['rej'])){
	
	$sid = $_POST['sid'];
	$ref_num = $_POST['ref_num'];
	$dt = $_POST['date']; // added
	$timestamp = strtotime($dt);
	$dt2 = date("Y-m-d H:i", $timestamp);
	
	date_default_timezone_set('Asia/Karachi');
	$tdayy = date("Y-m-d H:i");
    
    $uid = $_POST['uid'];
    $deposit = $_POST['amount'];
    
    $reject = mysqli_query($conn, "UPDATE deposits SET sthiti = '2' WHERE balakedara = '".$uid."' && motta = '$deposit' && dinankavannuracisi = '".$dt."' && shonu = '".$sid."'");

	if($reject){
		echo "1~".$sid;
	} else {
		echo "2";
	}
}
?>
