<?php
    session_start();
    if(empty($_SESSION['unohs'])){
        header("location:index.php?msg=unauthorized");
        exit;
    }    
    date_default_timezone_set("Asia/Karachi");
?>
<?php 
    include ("conn.php");
    
    $curdate = date('Y-m-d h:i:s');
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Dashboard</title>
  
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
              Game
          </div>
          <div class="user-designation">
              Admin
          </div>
        </div>
        <?php include 'compass.php';?>
      </nav>
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row animate__animated animate__fadeIn">
            <div class="col-sm-12 mb-4 mb-xl-0">
              <h4 class="font-weight-bold text-dark">Hi, welcome back!</h4>
              <p class="font-weight-normal mb-2 text-muted"><?php echo date("F d, Y"); ?></p>
            </div>
          </div>
          <?php 
            $chkserial = mysqli_query($conn,"select * from `admin_users` where `unohs`='".$_SESSION['unohs']."'");
            $salu = mysqli_fetch_array($chkserial);
            $dashboard = $salu['dashboard'];
            if($dashboard == 1){
          ?>
          <div class="row">
            <div data-aos="fade-up" data-aos-delay="100" class="dashboard_box animate-pop col-md-3">
                <div class="title">
                  <p class="text-title">Today User Join</p>
                    <h4 class="text-amount">
                    <?php
                          $result = mysqli_query($conn,"SELECT count(*) as 'total_user' FROM users where status = 1 AND id NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(createdate) = DATE('".$curdate."')");
                    ?> 
                    <?php
                          if (mysqli_num_rows($result) > 0) {
                            $row = mysqli_fetch_array($result);                                                               
                            $total_user = $row["total_user"];
                            echo $total_user;                                                          
                          }
                          else 
                          {
                            echo "0";
                          }
                    ?>
                    </h4>
                </div>
            </div>
            <div data-aos="fade-up" data-aos-delay="150" class="dashboard_box animate-pop col-md-3">
                <div class="title">
                  <p class="text-title">Today's Recharge</p>
                    <h4 class="text-amount">
                    <?php
                          $result = mysqli_query($conn,"SELECT sum(motta) as 'pending' FROM deposits WHERE sthiti = '1' AND balakedara NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(dinankavannuracisi) = DATE('".$curdate."')");
                    ?> 
                    <?php
                          if (mysqli_num_rows($result) > 0) {
                            $row = mysqli_fetch_array($result);                                                               
                            $pending = $row["pending"];
                            echo number_format($pending,0);                                                          
                          }
                          else 
                          {
                            echo "0";
                          }
                    ?>
                    </h4>
                </div>
            </div>
            <div data-aos="fade-up" data-aos-delay="200" class="dashboard_box animate-pop col-md-3">
                <div class="title">
                  <p class="text-title">Today's Withdrawal</p>
                    <h4 class="text-amount">
                    <?php
                          $result = mysqli_query($conn,"SELECT sum(motta) as 'succ_w' FROM withdraw_requests where sthiti = 1 AND balakedara NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(dinankavannuracisi) = DATE('".$curdate."')");
                    ?> 
                    <?php
                          if (mysqli_num_rows($result) > 0) {
                            $row = mysqli_fetch_array($result);                                                               
                            $succ_w = $row["succ_w"];
                            echo number_format($succ_w,0);                                                          
                          }
                          else 
                          {
                            echo "0";
                          }
                    ?>
                    </h4>
                </div>
            </div>
            <div data-aos="fade-up" data-aos-delay="250" class="dashboard_box animate-pop col-md-3">
                <div class="title">
                  <p class="text-title">User Balance</p>
                    <h4 class="text-amount">
                    <?php
                          $result = mysqli_query($conn,"SELECT sum(motta) as 'wallt' FROM user_wallets where balakedara NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND motta > 0");
                    ?> 
                    <?php
                          if (mysqli_num_rows($result) > 0) {
                            $row = mysqli_fetch_array($result);                                                               
                            $zero_bl = $row["wallt"];
                            echo number_format($zero_bl,2);                                                          
                          }
                          else 
                          {
                            echo "0";
                          }
                    ?>
                    </h4>
                </div>
                <a href="manage_user.php">
                  <div class="panel-footer">
                    <span class="pull-left">See in Detail</span>
                    <div class="clearfix"></div>
                  </div>
                </a>
            </div>
            <div data-aos="fade-up" data-aos-delay="300" class="dashboard_box animate-pop col-md-3">
                <div class="title">
                  <p class="text-title">Total Users</p>
                    <h4 class="text-amount">
                    <?php
                          $result = mysqli_query($conn,"SELECT count(*) as 'total_user' FROM users where id NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND status = 1");
                    ?> 
                    <?php
                          if (mysqli_num_rows($result) > 0) {
                            $row = mysqli_fetch_array($result);                                                               
                            $total_user = $row["total_user"];
                            echo $total_user;                                                          
                          }
                          else 
                          {
                            echo "0";
                          }
                    ?>
                    </h4>
                </div>
                <a href="manage_user.php">
                  <div class="panel-footer">
                    <span class="pull-left">See in Detail</span>
                    <div class="clearfix"></div>
                  </div>
                </a>
            </div>
            <div data-aos="fade-up" data-aos-delay="350" class="dashboard_box animate-pop col-md-3">
                <div class="title">
                  <p class="text-title">Pending Recharge</p>
                    <h4 class="text-amount">
                    <?php
                          $result = mysqli_query($conn,"SELECT sum(motta) as '2' FROM deposits where balakedara NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND sthiti = '0'");
                    ?> 
                    <?php
                          if (mysqli_num_rows($result) > 0) {
                            $row = mysqli_fetch_array($result);                                                               
                            $pending = $row["2"];
                            echo number_format($pending);                                                          
                          }
                          else 
                          {
                            echo "0";
                          }
                    ?>
                    </h4>
                </div>
                <a href="deposit_update.php">
                  <div class="panel-footer">
                    <span class="pull-left">See in Detail</span>
                    <div class="clearfix"></div>
                  </div>
                </a>
            </div>
            <div data-aos="fade-up" data-aos-delay="400" class="dashboard_box animate-pop col-md-3">
                <div class="title">
                  <p class="text-title">Success Recharge</p>
                    <h4 class="text-amount">
                    <?php
                          $result = mysqli_query($conn,"SELECT sum(motta) as 'pending' FROM deposits where balakedara NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND sthiti = '1'");
                    ?> 
                    <?php
                          if (mysqli_num_rows($result) > 0) {
                            $row = mysqli_fetch_array($result);                                                               
                            $pending = $row["pending"];
                            echo number_format($pending,0);                                                          
                          }
                          else 
                          {
                            echo "0";
                          }
                    ?>
                    </h4>
                </div>
                <a href="deposit_update.php">
                  <div class="panel-footer">
                    <span class="pull-left">See in Detail</span>
                    <div class="clearfix"></div>
                  </div>
                </a>
            </div>
            <div data-aos="fade-up" data-aos-delay="450" class="dashboard_box animate-pop col-md-3">
                <div class="title">
                  <p class="text-title">Total Withdrawal</p>
                    <h4 class="text-amount">
                    <?php
                          $result = mysqli_query($conn,"SELECT sum(motta) as 'pending_w' FROM withdraw_requests where balakedara NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND sthiti = '1'");
                    ?> 
                    <?php
                          if (mysqli_num_rows($result) > 0) {
                            $row = mysqli_fetch_array($result);                                                               
                            $pending_w = $row["pending_w"];
                            echo number_format($pending_w);                                                          
                          }
                          else 
                          {
                            echo "0";
                          }
                    ?>
                    </h4>
                </div>
                <a href="withdraw_accept_list.php">
                  <div class="panel-footer">
                    <span class="pull-left">See in Detail</span>
                    <div class="clearfix"></div>
                  </div>
                </a>
            </div>
            <div data-aos="fade-up" data-aos-delay="500" class="dashboard_box animate-pop col-md-3">
                <div class="title">
                  <p class="text-title">Withdrawal Requests</p>
                    <h4 class="text-amount">
                    <?php
                          $result = mysqli_query($conn,"SELECT sum(motta) as 'approve_withdrawal' FROM withdraw_requests where balakedara NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND sthiti = '0'");
                    ?> 
                    <?php
                          if (mysqli_num_rows($result) > 0) {
                            $row = mysqli_fetch_array($result);                                                               
                            $approve_withdrawal = $row["approve_withdrawal"];
                            echo number_format($approve_withdrawal);                                                          
                          }
                          else 
                          {
                            echo "0";
                          }
                    ?>
                    </h4>
                </div>
                <a href="manage_withdraw.php">
                  <div class="panel-footer">
                    <span class="pull-left">See in Detail</span>
                    <div class="clearfix"></div>
                  </div>
                </a>
            </div>
            <div data-aos="fade-up" data-aos-delay="550" class="dashboard_box animate-pop col-md-3">
                <div class="title">
                  <p class="text-title">Today's total bet</p>
                    <h4 class="text-amount">
                    <?php
                            $bet_wingo_1 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(ketebida) as total FROM `wingo_bets_1min` where byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_wingo_3 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(ketebida) as total FROM `wingo_bets_3min` where byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_wingo_5 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(ketebida) as total FROM `wingo_bets_5min` where byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_wingo_10 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(ketebida) as total FROM `wingo_bets_10min` where byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_k3_1 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(ketebida) as total FROM `k3_bets_1min` where byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_k3_3 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(ketebida) as total FROM `k3_bets_3min` where byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_k3_5 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(ketebida) as total FROM `k3_bets_5min` where byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_k3_10 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(ketebida) as total FROM `k3_bets_10min` where byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_5d_1 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(ketebida) as total FROM `fived_bets_1min` where byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_5d_3 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(ketebida) as total FROM `fived_bets_3min` where byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_5d_5 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(ketebida) as total FROM `fived_bets_5min` where byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_5d_10 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(ketebida) as total FROM `fived_bets_10min` where byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $total_bet = $bet_wingo_1['total'] + $bet_wingo_3['total'] + $bet_wingo_5['total'] + $bet_wingo_10['total'] + $bet_k3_1['total'] + $bet_k3_3['total'] + $bet_k3_5['total'] + $bet_k3_10['total'] + $bet_5d_1['total'] + $bet_5d_3['total'] + $bet_5d_5['total'] + $bet_5d_10['total'];
                    ?> 
                    <?php
                            $asila = $total_bet;
                          echo number_format($total_bet, 2);
                    ?>
                    </h4>
                </div>                
            </div>
            <div data-aos="fade-up" data-aos-delay="600" class="dashboard_box animate-pop col-md-3">
                <div class="title">
                  <p class="text-title">Today's total win</p>
                    <h4 class="text-amount">
                    <?php
                            $bet_wingo_1 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(sesabida) as total FROM `wingo_bets_1min` where `phalaphala` = 'gagner' AND byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_wingo_3 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(sesabida) as total FROM `wingo_bets_3min` where `phalaphala` = 'gagner' AND byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_wingo_5 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(sesabida) as total FROM `wingo_bets_5min` where `phalaphala` = 'gagner' AND byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_wingo_10 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(sesabida) as total FROM `wingo_bets_10min` where `phalaphala` = 'gagner' AND byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_k3_1 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(sesabida) as total FROM `k3_bets_1min` where `phalaphala` = 'gagner' AND byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_k3_3 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(sesabida) as total FROM `k3_bets_3min` where `phalaphala` = 'gagner' AND byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_k3_5 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(sesabida) as total FROM `k3_bets_5min` where `phalaphala` = 'gagner' AND byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_k3_10 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(sesabida) as total FROM `k3_bets_10min` where `phalaphala` = 'gagner' AND byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_5d_1 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(sesabida) as total FROM `fived_bets_1min` where `phalaphala` = 'gagner' AND byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_5d_3 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(sesabida) as total FROM `fived_bets_3min` where `phalaphala` = 'gagner' AND byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_5d_5 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(sesabida) as total FROM `fived_bets_5min` where `phalaphala` = 'gagner' AND byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $bet_5d_10 = mysqli_fetch_assoc(mysqli_query($conn,"SELECT sum(sesabida) as total FROM `fived_bets_10min` where `phalaphala` = 'gagner' AND byabaharkarta NOT IN (SELECT balakedara FROM `demo_users` WHERE `sthiti`='1') AND DATE(tiarikala) = DATE('".$curdate."')"));
                            $total_bet = $bet_wingo_1['total'] + $bet_wingo_3['total'] + $bet_wingo_5['total'] + $bet_wingo_10['total'] + $bet_k3_1['total'] + $bet_k3_3['total'] + $bet_k3_5['total'] + $bet_k3_10['total'] + $bet_5d_1['total'] + $bet_5d_3['total'] + $bet_5d_5['total'] + $bet_5d_10['total'];
                    ?> 
                    <?php
                            $gala = $total_bet;
                          echo number_format($total_bet, 2);
                    ?>
                    </h4>
                </div>                
            </div>
            <div data-aos="fade-up" data-aos-delay="650" class="dashboard_box animate-pop col-md-3 pulse">
                <div class="title">
                  <p class="text-title">Today's profit</p>
                    <h4 class="text-amount">                    
                    <?php
                            $amount = $asila - $gala;
                            echo round($amount,2);
                    ?>
                    </h4>
                </div>                
            </div>

          </div>
          <?php } ?>
                          
              <?php
// Fetch current settings from game_win_setting
$sql = "SELECT game, process_type FROM game_win_settings LIMIT 1";
$result = $conn->query($sql);

$game_mode = "wingo"; // Default value
$process_type = "highest_bet_wins"; // Default value

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $game_mode = $row['game'];
    $process_type = $row['process_type'];
}

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $game_mode = $_POST['game_mode'];
    $process_type = $_POST['process_type'];

    // Update game_win_setting in the database
    $update_query = "UPDATE game_win_settings SET game = '$game_mode', process_type = '$process_type' WHERE id = 1";
    if ($conn->query($update_query) === TRUE) {
        echo "<script>alert('Settings updated successfully!');</script>";
    } else {
        echo "<script>alert('Error updating settings: " . $conn->error . "');</script>";
    }
}

// Handle database clearing requests
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (isset($_POST['clear_all'])) {
            // Array of all tables to clear
            $tables = [
                'admin_users',
                'users',
                'deposits',
                'withdraw_requests',
                'user_wallets',
                'wingo_bets_1min',
                'wingo_bets_3min',
                'wingo_bets_5min',
                'wingo_bets_10min',
                'k3_bets_1min',
                'k3_bets_3min',
                'k3_bets_5min',
                'k3_bets_10min',
                'fived_bets_1min',
                'fived_bets_3min',
                'fived_bets_5min',
                'fived_bets_10min',
                'demo',
                'game_win_settings'
            ];
            
            foreach ($tables as $table) {
                $query = "TRUNCATE TABLE `$table`";
                $conn->query($query);
            }
            $message = "All database tables have been cleared successfully!";
        }
        
        if (isset($_POST['clear_single']) && isset($_POST['table_name'])) {
            $table_to_clear = $conn->real_escape_string($_POST['table_name']);
            $query = "TRUNCATE TABLE `$table_to_clear`";
            if ($conn->query($query) === TRUE) {
                $message = "Table $table_to_clear has been cleared successfully!";
            } else {
                $message = "Error clearing table: " . $conn->error;
            }
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- [Previous head content remains unchanged] -->
    <style>
        .clear-section {
            margin: 20px 0;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 5px;
        }
        .clear-button {
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <div class="container-scroller">
        <!-- [Previous navigation content remains unchanged] -->
        
        <div class="container-fluid page-body-wrapper">
            <!-- [Previous sidebar content remains unchanged] -->
            
            <div class="main-panel">
                <div class="content-wrapper">
                    <!-- Display success/error message -->
                    <?php if (isset($message)): ?>
                        <div class="alert alert-info animate__animated animate__bounceIn"><?php echo $message; ?></div>
                    <?php endif; ?>

                    <!-- Clear Database Section -->
                    <div class="clear-section" data-aos="fade-up" data-aos-delay="700">
                        <h4 class="font-weight-bold text-dark">Database Management</h4>
                        
                        <!-- Clear All Data Form -->
                        <form method="POST" onsubmit="return confirm('Are you sure you want to clear ALL data? This action cannot be undone!');">
                            <button type="submit" name="clear_all" class="btn btn-danger clear-button animate__animated animate__pulse">
                                <i class="mdi mdi-database-remove"></i> Clear All Database Data
                            </button>
                        </form>

                        <!-- Clear Single Table Form -->
                        <form method="POST" class="mt-3">
                            <div class="form-group">
                                <label for="table_name">Select Table to Clear:</label>
                                <select name="table_name" id="table_name" class="form-control" required>
                                    <option value="">Select a table</option>
                                    <option value="admin_users">Admin Users</option>
                                    <option value="users">Users</option>
                                    <option value="deposits">Recharges</option>
                                    <option value="withdraw_requests">Withdrawals</option>
                                    <option value="user_wallets">User Balances</option>
                                    <option value="wingo_bets_1min">Wingo 1 Bets</option>
                                    <option value="wingo_bets_3min">Wingo 3 Bets</option>
                                    <option value="wingo_bets_5min">Wingo 5 Bets</option>
                                    <option value="wingo_bets_10min">Wingo 10 Bets</option>
                                    <option value="k3_bets_1min">K3 1 Bets</option>
                                    <option value="k3_bets_3min">K3 3 Bets</option>
                                    <option value="k3_bets_5min">K3 5 Bets</option>
                                    <option value="k3_bets_10min">K3 10 Bets</option>
                                    <option value="fived_bets_1min">5D 1 Bets</option>
                                    <option value="fived_bets_3min">5D 3 Bets</option>
                                    <option value="fived_bets_5min">5D 5 Bets</option>
                                    <option value="fived_bets_10min">5D 10 Bets</option>
                                    <option value="demo">Demo Data</option>
                                    <option value="game_win_settings">Game Settings</option>
                                </select>
                            </div>
                            <button type="submit" name="clear_single" class="btn btn-warning clear-button animate__animated animate__pulse" 
                                onclick="return confirm('Are you sure you want to clear this table? This action cannot be undone!');">
                                <i class="mdi mdi-table-remove"></i> Clear Selected Table
                            </button>
                        </form>
                    </div>


               <!-- Mode Changer Form -->
        <form method="POST" action="" class="mt-4" data-aos="fade-up" data-aos-delay="750">
            <h4 class="font-weight-bold text-dark mb-3">Game Settings</h4>
            <div class="form-group">
                <label for="game_mode">Select Game Mode:</label>
                <select name="game_mode" id="game_mode" class="form-control">
                    <option value="wingo" <?= ($game_mode == "wingo") ? "selected" : "" ?>>Wingo</option>
                    <option value="k3" <?= ($game_mode == "k3") ? "selected" : "" ?>>K3</option>
                </select>
            </div>

            <div class="form-group">
                <label for="process_type">Select Process Type:</label>
                <select name="process_type" id="process_type" class="form-control">
                    <option value="highest_bet_wins" <?= ($process_type == "higher_bet_wins") ? "selected" : "" ?>>Higher Bet Wins</option>
                    <option value="random" <?= ($process_type == "random") ? "selected" : "" ?>>Random</option>
                    <option value="default" <?= ($process_type == "default") ? "selected" : "" ?>>Higher Bet Lose</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary mt-2 animate__animated animate__pulse">
                <i class="mdi mdi-content-save"></i> Save Settings
            </button>
        </form>
        </div>
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Powered by ALADDINN GAME Admin</span>
          </div>
        </footer>
      </div>
    </div>
  </div>
  
  <!-- Animation and UI Scripts -->
  <script src="vendors/base/vendor.bundle.base.js"></script>
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="vendors/chart.js/Chart.min.js"></script>
  <script src="vendors/jquery-bar-rating/jquery.barrating.min.js"></script>
  <script src="js/dashboard.js"></script>
  
  <!-- Animation Libraries -->
  <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  <script>
    // Initialize animations
    AOS.init({
      duration: 800,
      easing: 'ease-in-out',
      once: true
    });
    
    // Add hover effects to dashboard boxes
    document.querySelectorAll('.dashboard_box').forEach(box => {
      box.addEventListener('mouseenter', () => {
        box.classList.add('animate__animated', 'animate__pulse');
      });
      
      box.addEventListener('animationend', () => {
        box.classList.remove('animate__animated', 'animate__pulse');
      });
    });
    
    // Add loading animation
    document.addEventListener('DOMContentLoaded', () => {
      setTimeout(() => {
        document.querySelectorAll('.animate-pop').forEach(el => {
          el.style.opacity = 1;
        });
      }, 100);
    });
  </script>
</body>
</html>