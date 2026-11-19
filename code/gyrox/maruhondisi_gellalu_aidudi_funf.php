<?php
	include("conn.php");
	$username = "";
	$err = "";

	// if request method is post
	if ($_SERVER['REQUEST_METHOD'] == "POST"){
	 
		$username = trim($_POST['stat']);
		
		if(empty($err))
		{
		   
			$sqla = mysqli_query($conn,"UPDATE fived_manual_result_5min SET sthiti='0'");
			echo "Reset";
		}
	}
?>