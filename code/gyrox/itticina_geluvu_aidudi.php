<?php
	include("conn.php");
	$username = "";
	$err = "";

	// if request method is post
	if ($_SERVER['REQUEST_METHOD'] == "POST"){
	 
		$username = trim($_POST['username']);			
		
		if(empty($err))
		{
		   
			$sqla = mysqli_query($conn,"UPDATE fived_manual_result_1min SET sthiti='0'");
			$sql = "UPDATE fived_manual_result_1min SET sthiti='1', sankhye='".$username."' WHERE shonu='1'";

			$conn->query($sql);
			if ($conn->query($sql) === TRUE) {
				header("Location: 5d1min.php");
			} else {
				echo '<h1  style="text-align: center;" > Does not Exists</h1>';
			}
		
		}
	}
?>