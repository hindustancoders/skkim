<?php
session_start();
if(empty($_SESSION['unohs'])){
    header("location:index.php?msg=unauthorized");
    exit;
    exit();
}

include ("conn.php");

if(isset($_POST['toggle_games'])) {
    $new_status = mysqli_real_escape_string($conn, $_POST['new_status']);
    $shnunc = date("Y-m-d H:i:s");
    
    $sql = "INSERT INTO game_settings (all_games_status, last_updated) 
            VALUES ('$new_status', '$shnunc')
            ON DUPLICATE KEY UPDATE 
            all_games_status = '$new_status',
            last_updated = '$shnunc'";
            
    if(mysqli_query($conn, $sql)) {
        echo '<script type="text/JavaScript"> alert("Games Status Updated"); </script>';
    } else {
        echo '<script type="text/JavaScript"> alert("Update Failed"); </script>';
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Games Control Panel</title>
    <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="vendors/feather/feather.css">
    <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .cool-input {
            border: 2px solid #007bff;
            border-radius: 0.25rem;
            padding: 0.5rem 1rem;
            font-size: 1rem;
            transition: all 0.3s ease;
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
        .status-indicator {
            padding: 8px 15px;
            border-radius: 15px;
            color: white;
        }
        .status-on {
            background-color: #28a745;
        }
        .status-off {
            background-color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container-scroller">
        <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
            <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                <a class="navbar-brand brand-logo" href="dashboard.php"><img src="images/logo.png" alt="logo"/></a>
            </div>
            <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
                <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                    <span class="icon-menu"></span>
                </button>
            </div>
        </nav>
        <div class="container-fluid page-body-wrapper">
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-sm-12 mb-4 mb-xl-0">
                            <h4 class="font-weight-bold text-dark">Games Control Panel</h4>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-6">
                            <?php
                            $status_query = "SELECT all_games_status, last_updated FROM game_settings ORDER BY id DESC LIMIT 1";
                            $status_result = mysqli_query($conn, $status_query);
                            $current_status = $status_result->num_rows > 0 ? mysqli_fetch_assoc($status_result)['all_games_status'] : 1;
                            ?>
                            <div class="card">
                                <div class="card-body">
                                    <h5>Current Status: 
                                        <span class="status-indicator <?php echo $current_status ? 'status-on' : 'status-off'; ?>">
                                            <?php echo $current_status ? 'ON' : 'OFF'; ?>
                                        </span>
                                    </h5>
                                    <form action="#" method="post" class="mt-3">
                                        <input type="hidden" name="new_status" value="<?php echo $current_status ? '0' : '1'; ?>">
                                        <button type="submit" name="toggle_games" class="btn btn-primary cool-button">
                                            Turn <?php echo $current_status ? 'OFF' : 'ON'; ?> All Games
                                        </button>
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
    <script>
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }
    </script>
</body>
</html>