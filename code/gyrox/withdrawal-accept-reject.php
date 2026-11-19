<?php
	session_start();
	if(empty($_SESSION['unohs'])){
		header("location:index.php?msg=unauthorized");
		exit;
	}
?>
<?php
	include ("conn.php");
	
	if($id=encryptor('decrypt', $_GET['id'])){	
		$Query=mysqli_query($conn,"select users.mobile,users.email,users.owncode,user_withdraw_accounts.phalanubhavi,user_withdraw_accounts.kod,user_withdraw_accounts.khatehesaru,
		user_withdraw_accounts.khatesankhye,`withdraw_requests`.`shonu`,`withdraw_requests`.`motta`,`withdraw_requests`.`khateshonu`,`withdraw_requests`.`sthiti`,`withdraw_requests`.`dinankavannuracisi` from `withdraw_requests`
		INNER JOIN users ON users.id=`withdraw_requests`.`balakedara`
		INNER JOIN user_withdraw_accounts ON user_withdraw_accounts.shonu=`withdraw_requests`.`khateshonu`
		where `withdraw_requests`.`shonu`='".$id."'");
		$Result=mysqli_fetch_array($Query);
	}
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Dashboard</title>
  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
  <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css"/>
  <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="vendors/jquery-bar-rating/fontawesome-stars-o.css">
  <link rel="stylesheet" href="vendors/jquery-bar-rating/fontawesome-stars.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.2.3/css/fixedHeader.dataTables.min.css">
  <link rel="shortcut icon" href="images/favicon.png" />
 <!-- Premium Fonts -->
  <link rel="stylesheet" href="https://use.typekit.net/xyz.css"> <!-- Replace with your premium font kit -->
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
  
  <!-- Animation Libraries -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
  <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
  
  <!-- Icon Libraries -->
  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
  <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css"/>
  <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="vendors/jquery-bar-rating/fontawesome-stars-o.css">
  <link rel="stylesheet" href="vendors/jquery-bar-rating/fontawesome-stars.css">
  
  <!-- Custom CSS -->
  <link rel="stylesheet" href="css/style.css">
  <link rel="shortcut icon" href="images/favicon.png" />
  
  <style>
    :root {
      --primary-color: #6c5ce7;
      --secondary-color: #a29bfe;
      --accent-color: #fd79a8;
      --dark-color: #2d3436;
      --light-color: #f5f6fa;
      --success-color: #00b894;
      --warning-color: #fdcb6e;
      --danger-color: #d63031;
    }
    
    body {
      font-family: 'Montserrat', sans-serif;
      background-color: #f8f9fa;
    }
    
    h1, h2, h3, h4, h5, h6 {
      font-family: 'Playfair Display', serif;
    }
    
    .dashboard_box {
      border-radius: 12px;
      padding: 25px;
      margin-bottom: 30px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.05);
      transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
      background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
      color: white;
      position: relative;
      overflow: hidden;
    }
    
    .dashboard_box:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 35px rgba(0,0,0,0.1);
    }
    
    .dashboard_box::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(255,255,255,0.1);
      transform: scaleX(0);
      transform-origin: right;
      transition: transform 0.5s ease-in-out;
    }
    
    .dashboard_box:hover::before {
      transform: scaleX(1);
      transform-origin: left;
    }
    
    .text-title {
      font-size: 16px;
      font-weight: 500;
      margin-bottom: 10px;
      opacity: 0.9;
    }
    
    .text-amount {
      font-size: 28px;
      font-weight: 700;
      margin-bottom: 15px;
    }
    
    .panel-footer {
      border-top: 1px solid rgba(255,255,255,0.2);
      padding-top: 15px;
      margin-top: 15px;
      font-size: 14px;
      transition: all 0.3s ease;
    }
    
    .panel-footer:hover {
      opacity: 0.8;
    }
    
    .navbar {
      background: linear-gradient(135deg, var(--dark-color) 0%, #636e72 100%);
      box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    }
    
    .sidebar {
      background: linear-gradient(135deg, #2d3436 0%, #636e72 100%);
    }
    
    .user-profile {
      background: rgba(255,255,255,0.1);
    }
    
    .content-wrapper {
      background-color: #f8f9fa;
      padding: 30px;
    }
    
    /* Button styles */
    .btn-primary {
      background-color: var(--primary-color);
      border-color: var(--primary-color);
    }
    
    .btn-danger {
      background-color: var(--danger-color);
      border-color: var(--danger-color);
    }
    
    .btn-warning {
      background-color: var(--warning-color);
      border-color: var(--warning-color);
      color: var(--dark-color);
    }
    
    /* Form styles */
    .form-control {
      border-radius: 8px;
      border: 1px solid #dfe6e9;
      padding: 12px 15px;
      transition: all 0.3s ease;
    }
    
    .form-control:focus {
      border-color: var(--primary-color);
      box-shadow: 0 0 0 0.2rem rgba(108, 92, 231, 0.25);
    }
    
    /* Alert styles */
    .alert {
      border-radius: 8px;
      padding: 15px 20px;
    }
    
    /* Clear section */
    .clear-section {
      background: white;
      border-radius: 12px;
      padding: 25px;
      margin-bottom: 30px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
    }
    
    /* Animation classes */
    .animate-pop {
      animation: popIn 0.6s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
    }
    
    @keyframes popIn {
      0% { transform: scale(0.9); opacity: 0; }
      100% { transform: scale(1); opacity: 1; }
    }
    
    .pulse {
      animation: pulse 2s infinite;
    }
    
    @keyframes pulse {
      0% { transform: scale(1); }
      50% { transform: scale(1.05); }
      100% { transform: scale(1); }
    }
  </style>
</head>
<body>
  <div class="container-scroller">
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo" href="dashboard.php"><img src="images/logo.png" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="dashboard.php"><img src="images/logo-mini.png" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>       
        <ul class="navbar-nav navbar-nav-right">           
          <li class="nav-item dropdown d-flex mr-4 ">
            <a class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center" id="notificationDropdown" href="#" data-toggle="dropdown">
              <i class="icon-cog"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Settings</p>              
              <a class="dropdown-item preview-item" href="logout.php">
                  <i class="icon-inbox"></i> Logout
              </a>
            </div>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>
    <div class="container-fluid page-body-wrapper">
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <div class="user-profile">
          <div class="user-image">
            <img src="images/faces/face28.png">
          </div>
          <div class="user-name">
              99 Game
          </div>
          <div class="user-designation">
              Admin
          </div>
        </div>
        <?php include 'compass.php';?>
      </nav>
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-sm-12 mb-4 mb-xl-0">
              <h4 class="font-weight-bold text-dark">Withdraw Accept/Reject</h4>
            </div>
          </div> 		  		  		  			
		  <div class="row">
            <div class="col-sm-12">
				<h3 class="box-title text-center text-danger">
					<?php echo 'Bank Withdrawal';?>
				</h3>
				<table class="table">
				  <tbody>
					<tr>
						<td style="color: blue; font-size:25px;" scope="col">Mobile:</td>
						<td style="color: blue; font-size:25px;" scope="col" ><?php echo $Result['mobile'];?></td>					  
					</tr>				  				  
					<tr>					  
						<td style="color: blue; font-size:25px;">Date:</td>
						<td style="color: blue; font-size:25px;"><?php echo $convert=date('d-m-Y',strtotime($Result['dinankavannuracisi']));?></td>					  
					</tr>
					<tr>
						<td style="color: blue; font-size:25px;" scope="col">Amount:</td>
						<td style="color: blue; font-size:25px;" scope="col"><?php echo number_format($Result['motta'],2);?></td>						  
					</tr>
					  <tr>
						<td style="color: blue; font-size:25px;" scope="col">A/c Holder Name:</td>
						<td style="color: blue; font-size:25px;" scope="col"><?php echo $Result['phalanubhavi'];?></td>						  
					</tr>
					<tr>
						<td style="color: blue; font-size:25px;" scope="col">Bank Name:</td>
						<td style="color: blue; font-size:25px;" scope="col"><?php echo $Result['khatehesaru'];?></td>						  
					</tr>
					<tr>
						<td style="color: blue; font-size:25px;" scope="col">IFSC Code:</td>
						<td style="color: blue; font-size:25px;" scope="col"><?php echo $Result['kod'];?></td>						  
					</tr>
					<tr>
						<td style="color: blue; font-size:25px;" scope="col">Account Number:</td>
						<td style="color: blue; font-size:25px;" scope="col"><?php echo $Result['khatesankhye'];?></td>						  
					</tr>
				</table>
            </div>
			<div class="col-sm-12">
				<?php if($Result['sthiti'] == 0)
					{
				?>
						<div class="d-flex">
						  <div class="col-sm-6">
							<a href="javascript:void(0);" class="btn btn-success btn-block" onClick="acceptrejectconfirm(<?php echo $Result['shonu'];?>,'accept');">
							  <strong><i class="fa fa-check"></i>Agree</strong>
							</a>
						  </div>
						  <div class="col-sm-6">
							<a href="javascript:void(0);" class="btn btn-danger btn-block" onClick="acceptrejectconfirm(<?php echo $Result['shonu'];?>,'reject');">
							  <strong><i class="fa fa-check"></i>Reject</strong>
							</a>
						  </div>
						</div>
				<?php 
					}
				?>													
            </div>
          </div>		  
		</div>
		<footer class="footer">
			<div class="d-sm-flex justify-content-center justify-content-sm-between">
				<span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © bharatgames.online 2024</span>
			</div>
		</footer>
      </div>     
    </div>
  </div>
	<div id="confirm" class="modal fade" role="dialog">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content" style="padding:8px;">
            <div class="modal-body text-center">
                Are you sure you want to <span id="typetext"></span>?
            </div>
            <input type="hidden" id="id" name="id" value="">
            <div class="form-group" id="remarkContainer">
                <label for="remark">Enter Remark:</label>
                <input type="text" id="remark" name="remark" class="form-control" placeholder="Enter your remark here">
            </div>

            <input type="hidden" id="type" name="type" value="">
            <div class="text-center">
                <a type="button" class="btn btn-sm btn-success text-light" onClick="acceptreject();">&nbsp;YES&nbsp;</a>&nbsp;
                <a type="button" class="btn btn-sm btn-danger text-light" data-dismiss="modal">&nbsp;NO&nbsp;</a>
            </div> 
        </div>
    </div>
</div>
  <script src="vendors/base/vendor.bundle.base.js"></script>
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="vendors/chart.js/Chart.min.js"></script>
  <script src="vendors/jquery-bar-rating/jquery.barrating.min.js"></script>
  <script src="js/dashboard.js"></script>
  <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
  <script>
    function acceptrejectconfirm(Id, type) {
        $('#confirm').modal({backdrop: 'static', keyboard: false});
        $('#confirm').modal('show');
        $('#id').val(Id);
        $('#type').val(type);
        document.getElementById('typetext').innerHTML = type;

        
    }

    function acceptreject() {
        var Id = $('#id').val();
        var Type = $('#type').val();

        $.ajax({
            type: "Post",
            data: "id=" + Id + "&type=" + Type + "&remark=" + $("#remark").val(),
            url: "manage_withdrawAction.php",
            success: function (html) {
                if (html == 1) {
                    window.location = 'withdraw_accept_list.php';
                } else {
                    window.location = 'withdraw_reject_list.php';
                }                
                return false;
            },
            error: function (e) {
            }
        });
    }
</script>
</body>

</html>