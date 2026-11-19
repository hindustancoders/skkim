<?php 
	include('conn.php');
	
	if(isset($_POST['type'])){
		$id = $_POST['id'];
        $remark = $_POST['remark'];
		$today = date('Y-m-d H:i:s');
		
		$finduid = mysqli_query($conn, "SELECT * FROM `withdraw_requests` WHERE `shonu`='".$id."'");
		$finduidArray = mysqli_fetch_array($finduid);
		$userid = $finduidArray['balakedara'];
		$serial = $finduidArray['dharavahi'];
		$amount = $finduidArray['motta'];
		$bid = $finduidArray['khateshonu'];
		
		$sql_d = "SELECT * FROM payment_channel_settings WHERE status = '1'";		
		$run_d = mysqli_query($conn, $sql_d);
		$rund_f = mysqli_fetch_array($run_d);
		$gateway = $rund_f['value'];
		
		if($_POST['type'] == 'accept'){
			$sqlA = mysqli_query($conn, "UPDATE `withdraw_requests` 
				SET sthiti = '1', tike = 'Completed', remarks = '".$remark."', dinankavannuracisi = '".$today."' 
				WHERE `shonu`='".$id."'");

			if($sqlA) {
				// Insert withdrawal notification
				$title = "Notification of cash withdrawal";
				$insertNotificationQuery = "INSERT INTO user_notifications (state, title, user_id, created_at) 
					VALUES (0, '$title', $userid, '$today')";
				$conn->query($insertNotificationQuery);
			}

			echo 1;
		}
			
		if($_POST['type']=='reject'){
			$sqlA = mysqli_query($conn, "UPDATE `withdraw_requests` 
				SET sthiti = '2', tike = 'Rejected', dinankavannuracisi = '".$today."', remarks = '".$remark."' 
				WHERE `shonu`='".$id."'");

			$sqlwallet = mysqli_query($conn, "UPDATE `user_wallets` 
				SET `motta` = ROUND((motta + '$amount'), 2) 
				WHERE `balakedara`= '$userid'");
			
			echo 2;
		}
	}
?>
