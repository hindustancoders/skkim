<?php
	session_start();
	if(empty($_SESSION['unohs'])){
		header("location:index.php?msg=unauthorized");
		exit;
	}
?>
<?php
	include ("conn.php");
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
              Aladdinn Game
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
              <h4 class="font-weight-bold text-dark">Withdraw Accept List</h4>
            </div>
          </div> 		  		  		  			
		  <div class="row">
            <div class="col-sm-12">
				<form id="formID" name="formID" method="post" action="#" enctype="multipart/form-data">
					<table id="example1" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>Sr.No</th>
								<th>User Mobile</th>
                              	<th>User ID</th>
								<th>Amount</th>
                              	<th>Order ID</th>
								<th>Payout Type</th>
								<th>Req. Date</th>
							</tr>
						</thead>
						<tbody>
						<?php
$Query = mysqli_query($conn, "SELECT *, 
    (SELECT `mobile` FROM `users` WHERE `id`=`withdraw_requests`.`balakedara`) AS user,
    (SELECT `id` FROM `users` WHERE `id`=`withdraw_requests`.`balakedara`) AS subject_id
FROM `withdraw_requests` 
WHERE `sthiti`='1' 
ORDER BY `shonu` DESC");

$i = 0;
$total = 0; 
while ($row = mysqli_fetch_array($Query)) {
    $i++;
    $total += $row['motta'];
?>  
    <tr>
        <td><?php echo $i; ?></td>
        <td><?php echo $row["user"]; ?></td>
        <td><?php echo $row["subject_id"]; ?></td>
        <td><?php echo number_format($row['motta'], 2); ?></td>
      	<td><?php echo $row["dharavahi"]; ?></td>
        <td><?php echo 'bank'; ?></td>
        <td><?php echo date('d-m-Y', strtotime($row['dinankavannuracisi'])); ?></td>                                    
    </tr>
<?php 
}
?>

					   
						</tbody>
					</table>
				</form>			  			  
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
  <script src="vendors/base/vendor.bundle.base.js"></script>
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="vendors/chart.js/Chart.min.js"></script>
  <script src="vendors/jquery-bar-rating/jquery.barrating.min.js"></script>
  <script src="js/dashboard.js"></script>
  <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
  <script>
	$(function () {
		$('#example1').DataTable({
		  "paging": true,
		  "lengthChange": false,
		  "searching": true,
		  "ordering": false,
		  "info": true,
		  "autoWidth": true,
		  "pageLength": 100
		});
	});
  </script>
</body>

</html>