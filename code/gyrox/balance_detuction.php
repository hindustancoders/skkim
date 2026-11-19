<?php
session_start();
if(empty($_SESSION['unohs'])){
    header("location:../index.php?msg=unauthorized");
    exit;
}

include 'conn.php';
$message = "";

date_default_timezone_set("Asia/Kolkata"); // Set Indian timezone

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $userId = intval($_POST['user_id']);
    $amountToDeduct = floatval($_POST['amount']);
    $remark = trim($_POST['remark']);
    $currentTime = date("Y-m-d H:i:s");

    $balanceQuery = $conn->prepare("SELECT motta FROM user_wallets WHERE balakedara = ?");
    $balanceQuery->bind_param("i", $userId);
    $balanceQuery->execute();
    $balanceResult = $balanceQuery->get_result();
    $userBalance = $balanceResult->fetch_assoc()['motta'] ?? 0;

    if ($userBalance >= $amountToDeduct) {
        $deductQuery = $conn->prepare("UPDATE user_wallets SET motta = motta - ? WHERE balakedara = ?");
        $deductQuery->bind_param("di", $amountToDeduct, $userId);
        $deductQuery->execute();

        $serial = "Imitator";
        $processed = 0;
        $insertQuery = $conn->prepare("INSERT INTO balance_detuct_table (userkani, price, serial, shonu, remark, processed) VALUES (?, ?, ?, ?, ?, ?)");
        $insertQuery->bind_param("idsssi", $userId, $amountToDeduct, $serial, $currentTime, $remark, $processed);
        $insertQuery->execute();

        $message = "<div class='alert alert-success text-center'>✅ Balance Deducted Successfully!</div>";
    } else {
        $message = "<div class='alert alert-danger text-center'>❌ Insufficient Funds! Please check your balance.</div>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Balance Manager</title>
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
    <style>
        .cool-input {
            border: 2px solid #007bff;
            border-radius: 0.25rem;
            padding: 0.5rem 1rem;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        .cool-input:focus {
            border-color: #0056b3;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }
        .cool-input::placeholder {
            color: #6c757d;
            opacity: 1;
        }
        .cool-button {
            padding: 0.5rem 1rem;
            font-size: 1rem;
            border-radius: 0.25rem;
            transition: all 0.3s ease;
        }
        .cool-button:hover {
            background-color: #0056b3;
            color: #fff;
        }
        .cool-button.btn-secondary:hover {
            background-color: #343a40;
            color: #fff;
        }
        #copied {
            visibility: hidden;
            z-index: 1;
            position: fixed;
            bottom: 50%;
            background-color: #333;
            color: #fff;
            border-radius: 6px;
            padding: 16px;
            max-width: 250px;
            font-size: 17px;
        }       
        #copied.show {
            visibility: visible;
            -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
            animation: fadein 0.5s, fadeout 0.5s 2.5s;
        }
        .loader {
            display: none;
            border: 4px solid rgba(255, 255, 255, 0.3);
            border-top: 4px solid #007bff;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
            margin: 10px auto;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
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
                        ALADDINN GAME
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
                            <h4 class="font-weight-bold text-dark">Balance Manager</h4>
                        </div>
                    </div> 
                    <div class="row mt-4">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <?php echo $message; ?>
                                    <form id="searchForm" class="mb-3" autocomplete="off">
                                        <div class="form-group">
                                            <label>User ID</label>
                                            <input type="number" class="cool-input w-100" name="user_id" id="user_id" placeholder="Enter User ID" required style="height: 40px;" />
                                        </div>
                                        <button type="submit" class="btn btn-primary cool-button">Fetch Balance</button>
                                    </form>
                                    <div class="loader" id="loader"></div>
                                    <div id="balanceDetails"></div>
                                    <form method="post" autocomplete="off" id="deductForm" style="display: none;">
                                        <input type="hidden" name="user_id" id="deduct_user_id">
                                        <div class="form-group">
                                            <label>Amount to Deduct</label>
                                            <input type="number" step="0.01" class="cool-input w-100" name="amount" placeholder="Enter Amount" required style="height: 40px;" />
                                        </div>
                                        <div class="form-group">
                                            <label>Remark</label>
                                            <input type="text" class="cool-input w-100" name="remark" placeholder="Enter Remark" required style="height: 40px;" />
                                        </div>
                                        <button type="submit" class="btn btn-primary cool-button">Deduct Balance</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="footer">
                    <div class="d-sm-flex justify-content-center justify-content-sm-between">
                        <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © tiranga08.site 2025</span>
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
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }

        document.getElementById("searchForm").addEventListener("submit", function(event) {
            event.preventDefault();
            document.getElementById("loader").style.display = "block";
            let userId = document.getElementById("user_id").value;
            fetch("fetch_balance.php?user_id=" + userId)
                .then(response => response.text())
                .then(data => {
                    document.getElementById("balanceDetails").innerHTML = data;
                    document.getElementById("deduct_user_id").value = userId;
                    document.getElementById("deductForm").style.display = "block";
                    document.getElementById("loader").style.display = "none";
                })
                .catch(error => {
                    console.error("Error fetching balance:", error);
                    document.getElementById("loader").style.display = "none";
                });
        });
    </script>
</body>
</html>