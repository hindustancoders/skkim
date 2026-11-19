<?php
session_start();
if(empty($_SESSION['unohs'])){
    header("location:index.php?msg=unauthorized");
    exit;
    exit();
}
include "conn.php";

// Handle balance actions
if (isset($_POST['user_id']) && isset($_POST['action']) && isset($_POST['amount'])) {
    $user_id = mysqli_real_escape_string($conn, $_POST['user_id']);
    $action = $_POST['action'];
    $amount = floatval($_POST['amount']);

    if ($amount <= 0) {
        echo '<script>alert("Amount must be positive");</script>';
    } else {
        $safe_query = "SELECT SUM(amount) as safe_balance FROM safe_box WHERE user_id = '$user_id'";
        $safe_result = mysqli_query($conn, $safe_query);
        $safe_balance = mysqli_fetch_assoc($safe_result)['safe_balance'] ?? 0.00;

        $main_query = "SELECT motta FROM user_wallets WHERE balakedara = '$user_id'";
        $main_result = mysqli_query($conn, $main_query);
        $main_balance = mysqli_fetch_assoc($main_result)['motta'] ?? 0.00;

        mysqli_begin_transaction($conn);
        try {
            if ($action == 'add') {
                $new_safe_query = "INSERT INTO safe_box (user_id, amount, transaction_date) VALUES ('$user_id', '$amount', NOW())";
                mysqli_query($conn, $new_safe_query);
                echo '<script>alert("Amount added to safe box");</script>';
            } elseif ($action == 'deduct' && $safe_balance >= $amount) {
                $deduct_query = "INSERT INTO safe_box (user_id, amount, transaction_date) VALUES ('$user_id', '-$amount', NOW())";
                mysqli_query($conn, $deduct_query);
                echo '<script>alert("Amount deducted from safe box");</script>';
            } else {
                throw new Exception("Insufficient safe balance or invalid action");
            }
            mysqli_commit($conn);
        } catch (Exception $e) {
            mysqli_rollback($conn);
            echo '<script>alert("Error: ' . $e->getMessage() . '");</script>';
        }
    }
}

// Handle percentage and on/off settings
if (isset($_POST['update_settings'])) {
    $user_id = $_POST['user_id'] === '' ? NULL : mysqli_real_escape_string($conn, $_POST['user_id']);
    $day_share_rate = floatval($_POST['day_share_rate']);
    $is_active = isset($_POST['is_active']) ? 1 : 0;

    $check_query = "SELECT id FROM safe_box_settings WHERE user_id " . ($user_id === NULL ? "IS NULL" : "= '$user_id'");
    $check_result = mysqli_query($conn, $check_query);
    if (mysqli_num_rows($check_result) > 0) {
        $update_query = "UPDATE safe_box_settings SET day_share_rate = '$day_share_rate', is_active = '$is_active', updated_at = NOW() WHERE user_id " . ($user_id === NULL ? "IS NULL" : "= '$user_id'");
    } else {
        $update_query = "INSERT INTO safe_box_settings (user_id, day_share_rate, is_active) VALUES ('$user_id', '$day_share_rate', '$is_active')";
    }
    if (mysqli_query($conn, $update_query)) {
        echo '<script>alert("Settings updated successfully");</script>';
    } else {
        echo '<script>alert("Settings update failed");</script>';
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Manage Safe Box - Admin</title>
    <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="vendors/feather/feather.css">
    <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
    <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css"/>
    <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendors/jquery-bar-rating/fontawesome-stars-o.css">
    <link rel="stylesheet" href="vendors/jquery-bar-rating/fontawesome-stars.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
    <link rel="shortcut icon" href="images/favicon.png"/>
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
        table.dataTable th, table.dataTable td {
            white-space: nowrap;
        }
    </style>
</head>
<body>
<div class="container-scroller">
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <!-- Same navbar as before -->
    </nav>
    <div class="container-fluid page-body-wrapper">
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <!-- Same sidebar as before -->
        </nav>
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-sm-12 mb-4 mb-xl-0">
                        <h4 class="font-weight-bold text-dark">Manage Safe Box</h4>
                    </div>
                </div>
                <!-- Global Settings -->
                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Global Safe Box Settings</h4>
                                <?php
                                $global_query = "SELECT day_share_rate, is_active FROM safe_box_settings WHERE user_id IS NULL";
                                $global_result = mysqli_query($conn, $global_query);
                                $global_settings = mysqli_fetch_assoc($global_result);
                                ?>
                                <form method="post">
                                    <input type="hidden" name="user_id" value="">
                                    <div class="form-group">
                                        <label>Daily Share Rate (%)</label>
                                        <input type="number" name="day_share_rate" class="cool-input" step="0.0001" min="0" value="<?php echo $global_settings['day_share_rate'] ?? 0.005; ?>" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Safe Box Active</label>
                                        <input type="checkbox" name="is_active" <?php echo ($global_settings['is_active'] ?? 1) ? 'checked' : ''; ?>>
                                    </div>
                                    <button type="submit" name="update_settings" class="btn btn-primary cool-button">Update Global Settings</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- User Balances and Settings -->
                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">User Balances & Settings</h4>
                                <table id="safeTable" class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>User ID</th>
                                            <th>Main Balance</th>
                                            <th>Safe Balance</th>
                                            <th>Share Rate (%)</th>
                                            <th>Active</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $users_query = "SELECT s.id, k.motta, SUM(sb.amount) as safe_balance 
                                                        FROM users s 
                                                        LEFT JOIN user_wallets k ON s.id = k.balakedara 
                                                        LEFT JOIN safe_box sb ON s.id = sb.user_id 
                                                        GROUP BY s.id, k.motta";
                                        $users_result = mysqli_query($conn, $users_query);
                                        while ($user = mysqli_fetch_assoc($users_result)) {
                                            $safe_balance = $user['safe_balance'] ?? 0.00;
                                            echo "<tr>";
                                            echo "<td>{$user['id']}</td>";
                                            echo "<td>" . number_format($user['motta'] ?? 0.00, 2) . "</td>";
                                            echo "<td>" . number_format($safe_balance, 2) . "</td>";
                                            echo "<td>
                                                    <form method='post' style='display:inline;'>
                                                        <input type='hidden' name='user_id' value='{$user['id']}'>
                                                        <input type='number' name='amount' class='cool-input' style='width:100px;' step='0.01' min='0' required>
                                                        <button type='submit' name='action' value='add' class='btn btn-success cool-button'>Add</button>
                                                        <button type='submit' name='action' value='deduct' class='btn btn-danger cool-button'>Deduct</button>
                                                    </form>
                                                  </td>";
                                            echo "</tr>";
                                        }
                                        ?>
                                    </tbody>
                                </table>
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
    $(document).ready(function () {
        $('#safeTable').DataTable({
            "fixedHeader": true,
            "paging": true,
            "searching": true,
            "ordering": true,
            "info": true
        });
    });
    if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.href);
    }
</script>
</body>
</html>
<?php mysqli_close($conn); ?>