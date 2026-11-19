<?php
session_start();
if(empty($_SESSION['unohs'])){
    header("location:../index.php?msg=unauthorized");
    exit;
}

include("../conn.php");

$user_id = isset($_GET['user_id']) ? intval($_GET['user_id']) : 0;
$page_bets = isset($_GET['page_bets']) ? intval($_GET['page_bets']) : 1;
$page_deposits = isset($_GET['page_deposits']) ? intval($_GET['page_deposits']) : 1;
$page_withdrawals = isset($_GET['page_withdrawals']) ? intval($_GET['page_withdrawals']) : 1;
$records_per_page = 30;

$user_data = [];
$bet_history = [];
$deposit_history = [];
$illegal_bets = [];
$commission_earned = 0;
$user_data2 = [];
$same_ip_accounts = [];
$withdrawal_history = [];
$deposit_records = [];
$commission_direct = $commission_team = $total_deposit = 0;

// Fetch User Data from `user_wallets`
if ($user_id > 0) {
    $query = $conn->prepare("SELECT * FROM user_wallets WHERE balakedara = ?");
    $query->bind_param("i", $user_id);
    $query->execute();
    $result = $query->get_result();
    $user_data = $result->fetch_assoc();
}
// Fetch User Data from `user_bankcards`
if ($user_id > 0) {
    $query = $conn->prepare("SELECT * FROM user_bankcards WHERE userid = ?");
    $query->bind_param("i", $user_id);
    $query->execute();
    $result = $query->get_result();
    $user_data3 = $result->fetch_assoc();
}
// Fetch User Data from `users` and same IP accounts
if ($user_id > 0) {
    $query = $conn->prepare("SELECT id, ip, ishonup FROM users WHERE id = ?");
    $query->bind_param("i", $user_id);
    $query->execute();
    $result = $query->get_result();
    $user_data2 = $result->fetch_assoc();

    if ($user_data2) {
        $user_ip = $user_data2['ip'] ?? null;
        $user_ishonuip = $user_data2['ishonup'] ?? null;

        if (!empty($user_ip) || !empty($user_ishonuip)) {
            $query = $conn->prepare("
                SELECT id, ip, ishonup FROM users 
                WHERE (ip = ? OR ishonup = ?) AND id != ?
            ");
            $query->bind_param("ssi", $user_ip, $user_ishonuip, $user_id);
            $query->execute();
            $result = $query->get_result();

            while ($row = $result->fetch_assoc()) {
                $same_ip_accounts[] = $row;
            }
        }
    }
}

function getGameName($table_name) {
    $game_names = [
        "wingo_bets_10min" => "Wingo 30 sec", "wingo_bets_1min" => "Wingo 1 min",
        "wingo_bets_3min" => "Wingo 3 min", "wingo_bets_5min" => "Wingo 5 min",
        "fived_bets_1min" => "D5 1 min", "fived_bets_3min" => "D5 3 min",
        "fived_bets_5min" => "D5 5 min", "fived_bets_10min" => "D5 10 min"
    ];
    return $game_names[$table_name] ?? "Unknown Game";
}

function getUplineChain($conn, $user_id) {
    $chain = [];
    for ($i = 0; $i < 5; $i++) {
        $query = $conn->prepare("
            SELECT id FROM users 
            WHERE owncode = (SELECT code FROM users WHERE id = ?)
        ");
        $query->bind_param("i", $user_id);
        $query->execute();
        $result = $query->get_result();
        
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $user_id = $row['id']; 
            $chain[] = $user_id;
        } else {
            break;
        }
    }
    return $chain;
}

function checkIllegalBets($conn, $user_id) {
    $query = "
        SELECT byabaharkarta, kalaparichaya, MAX(tiarikala) AS latest_time, table_name, COUNT(DISTINCT ojana) AS bet_type_count 
        FROM (
            SELECT byabaharkarta, kalaparichaya, tiarikala, ojana, 'wingo_bets_10min' AS table_name FROM wingo_bets_10min
            UNION ALL SELECT byabaharkarta, kalaparichaya, tiarikala, ojana, 'wingo_bets_1min' FROM wingo_bets_1min
            UNION ALL SELECT byabaharkarta, kalaparichaya, tiarikala, ojana, 'wingo_bets_3min' FROM wingo_bets_3min
            UNION ALL SELECT byabaharkarta, kalaparichaya, tiarikala, ojana, 'wingo_bets_5min' FROM wingo_bets_5min
            UNION ALL SELECT byabaharkarta, kalaparichaya, tiarikala, ojana, 'fived_bets_1min' FROM fived_bets_1min
            UNION ALL SELECT byabaharkarta, kalaparichaya, tiarikala, ojana, 'fived_bets_3min' FROM fived_bets_3min
            UNION ALL SELECT byabaharkarta, kalaparichaya, tiarikala, ojana, 'fived_bets_5min' FROM fived_bets_5min
            UNION ALL SELECT byabaharkarta, kalaparichaya, tiarikala, ojana, 'fived_bets_10min' FROM fived_bets_10min
        ) AS merged_tables
        WHERE byabaharkarta = ?
        GROUP BY kalaparichaya, table_name, byabaharkarta
        HAVING bet_type_count > 1
        ORDER BY latest_time DESC
    ";
    
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    return $stmt->get_result();
}

if ($user_id > 0) {
    $result = checkIllegalBets($conn, $user_id);
    while ($row = $result->fetch_assoc()) {
        $illegal_bets[] = $row;
    }

    $start_bets = ($page_bets - 1) * $records_per_page;
    $query = $conn->prepare("SELECT * FROM wingo_bets_3min WHERE byabaharkarta = ? ORDER BY tiarikala DESC LIMIT ?, ?");
    $query->bind_param("iii", $user_id, $start_bets, $records_per_page);
    $query->execute();
    $result = $query->get_result();
    while ($row = $result->fetch_assoc()) {
        $bet_history[] = $row;
    }

    $query = $conn->prepare("SELECT COUNT(*) as total FROM wingo_bets_3min WHERE byabaharkarta = ?");
    $query->bind_param("i", $user_id);
    $query->execute();
    $result = $query->get_result();
    $total_bets = $result->fetch_assoc()['total'];
    $total_pages_bets = ceil($total_bets / $records_per_page);

    $start_deposits = ($page_deposits - 1) * $records_per_page;
    $query = $conn->prepare("SELECT * FROM deposits WHERE balakedara = ? AND sthiti = 1 ORDER BY dinankavannuracisi DESC LIMIT ?, ?");
    $query->bind_param("iii", $user_id, $start_deposits, $records_per_page);
    $query->execute();
    $result = $query->get_result();
    while ($row = $result->fetch_assoc()) {
        $deposit_history[] = $row;
    }

    $start_withdrawals = ($page_withdrawals - 1) * $records_per_page;
    $query = $conn->prepare("SELECT motta, dinankavannuracisi FROM withdraw_requests WHERE balakedara = ? AND sthiti = 1 ORDER BY dinankavannuracisi DESC LIMIT ?, ?");
    $query->bind_param("iii", $user_id, $start_withdrawals, $records_per_page);
    $query->execute();
    $result = $query->get_result();
    while ($row = $result->fetch_assoc()) {
        $withdrawal_history[] = $row;
    }

    $query = $conn->prepare("SELECT COUNT(*) as total FROM deposits WHERE balakedara = ? AND sthiti = 1");
    $query->bind_param("i", $user_id);
    $query->execute();
    $result = $query->get_result();
    $total_deposits = $result->fetch_assoc()['total'];
    $total_pages_deposits = ceil($total_deposits / $records_per_page);

    $query = $conn->prepare("SELECT COUNT(*) as total FROM withdraw_requests WHERE balakedara = ? AND sthiti = 1");
    $query->bind_param("i", $user_id);
    $query->execute();
    $result = $query->get_result();
    $total_withdrawals = $result->fetch_assoc()['total'];
    $total_pages_withdrawals = ceil($total_withdrawals / $records_per_page);

    $query = $conn->prepare("SELECT SUM(ayoga) as total_commission FROM transaction_ledger WHERE balakedara = ?");
    $query->bind_param("i", $user_id);
    $query->execute();
    $result = $query->get_result();
    $commission_earned = $result->fetch_assoc()['total_commission'] ?? 0;

    $upline_chain = getUplineChain($conn, $user_id);

    $query = $conn->prepare("SELECT owncode FROM users WHERE id = ?");
    $query->bind_param("i", $user_id);
    $query->execute();
    $result = $query->get_result();
    $user_data = $result->fetch_assoc();
    $user_owncode = $user_data['owncode'] ?? '';

    $query = $conn->prepare("
        SELECT s.id, 'Level 1' as level, t.motta, t.dinankavannuracisi 
        FROM users s
        JOIN deposits t ON s.id = t.balakedara
        WHERE s.code = ? AND t.sthiti = 1 AND t.dinankavannuracisi >= NOW() - INTERVAL 1 DAY
    ");
    $query->bind_param("s", $user_owncode);
    $query->execute();
    $result = $query->get_result();
    while ($row = $result->fetch_assoc()) {
        $deposit_records[] = $row;
        $commission_direct += $row['motta'] * 0.05;
        $total_deposit += $row['motta'];
    }

    $query = $conn->prepare("
        SELECT s.id, 'Level X' as level, t.motta, t.dinankavannuracisi 
        FROM users s
        JOIN deposits t ON s.id = t.balakedara
        WHERE (s.code1 = ? OR s.code2 = ? OR s.code3 = ? OR s.code4 = ? OR s.code5 = ?)
        AND t.sthiti = 1 AND t.dinankavannuracisi >= NOW() - INTERVAL 1 DAY
    ");
    $query->bind_param("sssss", $user_owncode, $user_owncode, $user_owncode, $user_owncode, $user_owncode);
    $query->execute();
    $result = $query->get_result();
    while ($row = $result->fetch_assoc()) {
        $deposit_records[] = $row;
        $commission_team += $row['motta'] * 0.05;
        $total_deposit += $row['motta'];
    }

    $total_commission = $commission_direct + $commission_team;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>User Details</title>
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
        .table th, .table td {
            vertical-align: middle;
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
                            <h4 class="font-weight-bold text-dark">User Details</h4>
                        </div>
                    </div> 
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <form method="get" class="mb-3" autocomplete="off">
                                        <div class="form-group">
                                            <label>User ID</label>
                                            <div class="input-group">
                                                <input type="number" class="cool-input w-100" name="user_id" placeholder="Enter User ID" required style="height: 40px;" />
                                                <button type="submit" class="btn btn-primary cool-button">Search</button>
                                            </div>
                                        </div>
                                    </form>

                                    <?php if ($user_data): ?>
                                        <h5>User Information</h5>
                                        <table class="table table-bordered">
                                            <tr><th>User ID</th><td><?php echo $user_data['balakedara'] ?? 'N/A'; ?></td></tr>
                                            <tr><th>Name</th><td><?php echo $user_data3['name'] ?? 'N/A'; ?></td></tr>
                                            <tr><th>Number</th><td><?php echo $user_data3['account'] ?? 'N/A'; ?></td></tr>
                                            <tr><th>IP</th><td><?php echo $user_data2['ip'] ?? 'N/A'; ?></td></tr>
                                            <tr><th>Recent IP</th><td><?php echo $user_data2['ishonup'] ?? 'N/A'; ?></td></tr>
                                            <tr><th>Balance</th><td>💰 <?php echo number_format($user_data['motta'] ?? 0, 2); ?></td></tr>
                                            <tr><th>Status</th><td><?php echo ($user_data['status'] ?? 1) == 0 ? '✅ Active' : '❌ Banned'; ?></td></tr>
                                        </table>

                                        <h5>Commission Earned: 💵 <?php echo number_format($commission_earned, 2); ?></h5>

                                        <h5>📌 Bet History</h5>
                                        <table class="table table-striped">
                                            <thead><tr><th>Period</th><th>Amount</th><th>Date</th></tr></thead>
                                            <tbody>
                                                <?php foreach ($bet_history as $bet): ?>
                                                    <tr>
                                                        <td><?php echo $bet['kalaparichaya']; ?></td>
                                                        <td>💰 <?php echo number_format($bet['ketebida'], 2); ?></td>
                                                        <td><?php echo $bet['tiarikala']; ?></td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            </tbody>
                                        </table>

                                        <h5>🚨 Illegal Bet History</h5>
                                        <?php if (!empty($illegal_bets)): ?>
                                            <table class="table table-danger">
                                                <thead><tr><th>Game</th><th>Period</th><th>Bet Types</th><th>Latest Bet Time</th></tr></thead>
                                                <tbody>
                                                    <?php foreach ($illegal_bets as $bet): ?>
                                                        <tr>
                                                            <td><?php echo getGameName($bet['table_name']); ?></td>
                                                            <td><?php echo $bet['kalaparichaya']; ?></td>
                                                            <td><?php echo $bet['bet_type_count']; ?></td>
                                                            <td><?php echo $bet['latest_time']; ?></td>
                                                        </tr>
                                                    <?php endforeach; ?>
                                                </tbody>
                                            </table>
                                        <?php else: ?>
                                            <div class="alert alert-success">✅ No illegal bets found.</div>
                                        <?php endif; ?>

                                        <h5>📌 Deposit & Withdrawal History</h5>
                                        <h6>💰 Deposit History</h6>
                                        <table class="table table-striped">
                                            <thead><tr><th>Amount</th><th>Date</th></tr></thead>
                                            <tbody>
                                                <?php foreach ($deposit_history as $deposit): ?>
                                                    <tr>
                                                        <td>💰 <?php echo number_format($deposit['motta'], 2); ?></td>
                                                        <td><?php echo $deposit['dinankavannuracisi']; ?></td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            </tbody>
                                        </table>

                                        <h6>💸 Withdrawal History</h6>
                                        <table class="table table-striped">
                                            <thead><tr><th>Amount</th><th>Date</th></tr></thead>
                                            <tbody>
                                                <?php foreach ($withdrawal_history as $withdrawal): ?>
                                                    <tr>
                                                        <td>💸 <?php echo number_format($withdrawal['motta'], 2); ?></td>
                                                        <td><?php echo $withdrawal['dinankavannuracisi']; ?></td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            </tbody>
                                        </table>

                                        <h5>📜 Deposit History (Last 24 Hours)</h5>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered">
                                                <thead><tr><th>User ID</th><th>Level</th><th>Deposit Amount (💰)</th><th>Deposit Time</th></tr></thead>
                                                <tbody>
                                                    <?php if (!empty($deposit_records)): ?>
                                                        <?php foreach ($deposit_records as $record): ?>
                                                            <tr>
                                                                <td><?php echo $record['id']; ?></td>
                                                                <td><?php echo $record['level']; ?></td>
                                                                <td><?php echo number_format($record['motta'], 2); ?></td>
                                                                <td><?php echo $record['dinankavannuracisi']; ?></td>
                                                            </tr>
                                                        <?php endforeach; ?>
                                                    <?php else: ?>
                                                        <tr><td colspan="4" class="text-center">🚫 No deposits found in the last 24 hours.</td></tr>
                                                    <?php endif; ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    <?php else: ?>
                                        <div class="alert alert-info">Please enter a User ID to view details.</div>
                                    <?php endif; ?>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }

        document.addEventListener("DOMContentLoaded", function () {
            let userID = <?php echo $user_id; ?>;
            let baseCommission = <?php echo json_encode($total_deposit); ?>;

            document.getElementById("commissionPercentage")?.addEventListener("input", function() {
                let commissionPercent = parseFloat(this.value) / 100;
                let newCommission = baseCommission * commissionPercent;
                document.getElementById("commissionAmount").innerText = newCommission.toFixed(2);
            });

            document.getElementById("sendCommissionBtn")?.addEventListener("click", function () {
                let commissionAmount = document.getElementById("commissionAmount").innerText.trim();
                commissionAmount = Number(commissionAmount.replace(/,/g, ""));

                if (isNaN(commissionAmount) || commissionAmount <= 0 || !userID) {
                    Swal.fire({
                        title: "Error!",
                        text: "Invalid commission amount or user ID.",
                        icon: "error",
                        confirmButtonText: "OK"
                    });
                    return;
                }

                let data = new FormData();
                data.append("commission", commissionAmount);
                data.append("userID", userID);

                fetch("save_commission.php", {
                    method: "POST",
                    body: data
                })
                .then(response => response.json())
                .then(result => {
                    if (result.success) {
                        Swal.fire({
                            title: "Success!",
                            text: "Commission saved successfully.",
                            icon: "success",
                            confirmButtonText: "OK"
                        });
                    } else {
                        Swal.fire({
                            title: "Error!",
                            text: result.message || "Failed to save commission.",
                            icon: "error",
                            confirmButtonText: "OK"
                        });
                    }
                })
                .catch(error => {
                    Swal.fire({
                        title: "Error!",
                        text: "Something went wrong.",
                        icon: "error",
                        confirmButtonText: "OK"
                    });
                    console.error("Error:", error);
                });
            });
        });
    </script>
</body>
</html>