<?php
session_start();
if(empty($_SESSION['unohs'])){
    header("location:index.php?msg=unauthorized");
    exit;
}

include("conn.php");

// Save all changes
if (isset($_POST['save_all'])) {
    // Games
    if (!empty($_POST['games'])) {
        foreach ($_POST['games'] as $id => $game) {
            $vendor_code = mysqli_real_escape_string($conn, $game['vendor_code']);
            $game_code = mysqli_real_escape_string($conn, $game['game_code']);
            $game_name_en = mysqli_real_escape_string($conn, $game['game_name_en']);
            $img_url = mysqli_real_escape_string($conn, $game['img_url']);
            $img_url2 = mysqli_real_escape_string($conn, $game['img_url2']);
            $win_odds = floatval($game['win_odds']);
            $game_type = mysqli_real_escape_string($conn, $game['game_type']);
            $custom_game_type = intval($game['custom_game_type']);

            $sql = "UPDATE games SET 
                    vendor_code='$vendor_code', game_code='$game_code', game_name_en='$game_name_en', 
                    img_url='$img_url', img_url2='$img_url2', win_odds='$win_odds', 
                    game_type='$game_type', custom_game_type='$custom_game_type' 
                    WHERE id='$id'";
            mysqli_query($conn, $sql);
        }
    }

    // Vendors
    if (!empty($_POST['vendors'])) {
        foreach ($_POST['vendors'] as $id => $vendor) {
            $slots_type_id = intval($vendor['slots_type_id']);
            $slots_name = mysqli_real_escape_string($conn, $vendor['slots_name']);
            $vendor_code = mysqli_real_escape_string($conn, $vendor['vendor_code']);
            $state = intval($vendor['state']);
            $vendor_img = mysqli_real_escape_string($conn, $vendor['vendor_img']);

            $sql = "UPDATE vendors SET 
                    slots_type_id='$slots_type_id', slots_name='$slots_name', vendor_code='$vendor_code', 
                    state='$state', vendor_img='$vendor_img' 
                    WHERE id='$id'";
            mysqli_query($conn, $sql);
        }
    }

    // Lottery Categories
    if (!empty($_POST['lottery_categories'])) {
        foreach ($_POST['lottery_categories'] as $id => $lottery) {
            $category_code = mysqli_real_escape_string($conn, $lottery['category_code']);
            $category_name = mysqli_real_escape_string($conn, $lottery['category_name']);
            $state = intval($lottery['state']);
            $sort = intval($lottery['sort']);
            $category_img = mysqli_real_escape_string($conn, $lottery['category_img']);

            $sql = "UPDATE lottery_categories SET 
                    category_code='$category_code', category_name='$category_name', state='$state', 
                    sort='$sort', category_img='$category_img' 
                    WHERE id='$id'";
            mysqli_query($conn, $sql);
        }
    }

    // Award Records
    if (!empty($_POST['award_records'])) {
        foreach ($_POST['award_records'] as $order_id => $award) {
            $user_id = intval($award['user_id']);
            $user_photo = mysqli_real_escape_string($conn, $award['user_photo']);
            $user_name = mysqli_real_escape_string($conn, $award['user_name']);
            $game_name = mysqli_real_escape_string($conn, $award['game_name']);
            $img_url = mysqli_real_escape_string($conn, $award['img_url']);
            $img_url2 = mysqli_real_escape_string($conn, $award['img_url2']);
            $multiple = floatval($award['multiple']);
            $bonus_amount = floatval($award['bonus_amount']);
            $multiple_name = mysqli_real_escape_string($conn, $award['multiple_name']);
            $create_time = mysqli_real_escape_string($conn, $award['create_time']);

            $sql = "UPDATE award_records SET 
                    user_id='$user_id', user_photo='$user_photo', user_name='$user_name', 
                    game_name='$game_name', img_url='$img_url', img_url2='$img_url2', 
                    multiple='$multiple', bonus_amount='$bonus_amount', multiple_name='$multiple_name', 
                    create_time='$create_time' 
                    WHERE order_id='$order_id'";
            mysqli_query($conn, $sql);
        }
    }

    echo '<script>alert("All changes saved successfully!");</script>';
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Manage All Games - Admin Dashboard</title>
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
            width: 100%;
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
        table.dataTable thead th {
            background-color: #007bff;
            color: white;
        }
        .table-responsive {
            margin-bottom: 20px;
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
                    <li class="nav-item dropdown d-flex mr-4">
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
                    <div class="user-name">ALADDINN GAME</div>
                    <div class="user-designation">Admin</div>
                </div>
                <?php include 'compass.php'; ?>
            </nav>
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-sm-12 mb-4 mb-xl-0">
                            <h4 class="font-weight-bold text-dark">Manage All Game Data</h4>
                        </div>
                    </div>

                    <form action="#" method="post">
                        <!-- Games Table -->
                        <div class="row">
                            <div class="col-lg-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Games</h4>
                                        <div class="table-responsive">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Vendor Code</th>
                                                        <th>Game Code</th>
                                                        <th>Game Name</th>
                                                        <th>Image URL</th>
                                                        <th>Image URL 2</th>
                                                        <th>Win Odds</th>
                                                        <th>Game Type</th>
                                                        <th>Custom Game Type</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $sql = "SELECT * FROM games ORDER BY id";
                                                    $result = mysqli_query($conn, $sql);
                                                    while ($row = mysqli_fetch_assoc($result)) {
                                                        echo "<tr>";
                                                        echo "<td>{$row['id']}</td>";
                                                        echo "<td><input type='text' name='games[{$row['id']}][vendor_code]' value='{$row['vendor_code']}' class='cool-input'></td>";
                                                        echo "<td><input type='text' name='games[{$row['id']}][game_code]' value='{$row['game_code']}' class='cool-input'></td>";
                                                        echo "<td><input type='text' name='games[{$row['id']}][game_name_en]' value='{$row['game_name_en']}' class='cool-input'></td>";
                                                        echo "<td><input type='text' name='games[{$row['id']}][img_url]' value='{$row['img_url']}' class='cool-input'></td>";
                                                        echo "<td><input type='text' name='games[{$row['id']}][img_url2]' value='{$row['img_url2']}' class='cool-input'></td>";
                                                        echo "<td><input type='number' step='0.01' name='games[{$row['id']}][win_odds]' value='{$row['win_odds']}' class='cool-input'></td>";
                                                        echo "<td><select name='games[{$row['id']}][game_type]' class='cool-input'>
                                                            <option value='popular'" . ($row['game_type'] == 'popular' ? ' selected' : '') . ">Popular</option>
                                                            <option value='clicks_top'" . ($row['game_type'] == 'clicks_top' ? ' selected' : '') . ">Clicks Top</option>
                                                            <option value='clicks_video'" . ($row['game_type'] == 'clicks_video' ? ' selected' : '') . ">Clicks Video</option>
                                                            <option value='fish'" . ($row['game_type'] == 'fish' ? ' selected' : '') . ">Fish</option>
                                                            <option value='flash'" . ($row['game_type'] == 'flash' ? ' selected' : '') . ">Flash</option>
                                                        </select></td>";
                                                        echo "<td><input type='number' name='games[{$row['id']}][custom_game_type]' value='{$row['custom_game_type']}' class='cool-input'></td>";
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

                        <!-- Vendors Table -->
                        <div class="row">
                            <div class="col-lg-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Vendors</h4>
                                        <div class="table-responsive">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Slots Type ID</th>
                                                        <th>Slots Name</th>
                                                        <th>Vendor Code</th>
                                                        <th>State</th>
                                                        <th>Vendor Image</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $sql = "SELECT * FROM vendors ORDER BY id";
                                                    $result = mysqli_query($conn, $sql);
                                                    while ($row = mysqli_fetch_assoc($result)) {
                                                        echo "<tr>";
                                                        echo "<td>{$row['id']}</td>";
                                                        echo "<td><input type='number' name='vendors[{$row['id']}][slots_type_id]' value='{$row['slots_type_id']}' class='cool-input'></td>";
                                                        echo "<td><input type='text' name='vendors[{$row['id']}][slots_name]' value='{$row['slots_name']}' class='cool-input'></td>";
                                                        echo "<td><input type='text' name='vendors[{$row['id']}][vendor_code]' value='{$row['vendor_code']}' class='cool-input'></td>";
                                                        echo "<td><input type='number' name='vendors[{$row['id']}][state]' value='{$row['state']}' class='cool-input'></td>";
                                                        echo "<td><input type='text' name='vendors[{$row['id']}][vendor_img]' value='{$row['vendor_img']}' class='cool-input'></td>";
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

                        <!-- Lottery Categories Table -->
                        <div class="row">
                            <div class="col-lg-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Lottery Categories</h4>
                                        <div class="table-responsive">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Category Code</th>
                                                        <th>Category Name</th>
                                                        <th>State</th>
                                                        <th>Sort</th>
                                                        <th>Category Image</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $sql = "SELECT * FROM lottery_categories ORDER BY id";
                                                    $result = mysqli_query($conn, $sql);
                                                    while ($row = mysqli_fetch_assoc($result)) {
                                                        echo "<tr>";
                                                        echo "<td>{$row['id']}</td>";
                                                        echo "<td><input type='text' name='lottery_categories[{$row['id']}][category_code]' value='{$row['category_code']}' class='cool-input'></td>";
                                                        echo "<td><input type='text' name='lottery_categories[{$row['id']}][category_name]' value='{$row['category_name']}' class='cool-input'></td>";
                                                        echo "<td><input type='number' name='lottery_categories[{$row['id']}][state]' value='{$row['state']}' class='cool-input'></td>";
                                                        echo "<td><input type='number' name='lottery_categories[{$row['id']}][sort]' value='{$row['sort']}' class='cool-input'></td>";
                                                        echo "<td><input type='text' name='lottery_categories[{$row['id']}][category_img]' value='{$row['category_img']}' class='cool-input'></td>";
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

                        <!-- Award Records Table -->
                        <div class="row">
                            <div class="col-lg-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Award Records</h4>
                                        <div class="table-responsive">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>Order ID</th>
                                                        <th>User ID</th>
                                                        <th>User Photo</th>
                                                        <th>User Name</th>
                                                        <th>Game Name</th>
                                                        <th>Image URL</th>
                                                        <th>Image URL 2</th>
                                                        <th>Multiple</th>
                                                        <th>Bonus Amount</th>
                                                        <th>Multiple Name</th>
                                                        <th>Create Time</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $sql = "SELECT * FROM award_records ORDER BY order_id DESC";
                                                    $result = mysqli_query($conn, $sql);
                                                    while ($row = mysqli_fetch_assoc($result)) {
                                                        echo "<tr>";
                                                        echo "<td>{$row['order_id']}</td>";
                                                        echo "<td><input type='number' name='award_records[{$row['order_id']}][user_id]' value='{$row['user_id']}' class='cool-input'></td>";
                                                        echo "<td><input type='text' name='award_records[{$row['order_id']}][user_photo]' value='{$row['user_photo']}' class='cool-input'></td>";
                                                        echo "<td><input type='text' name='award_records[{$row['order_id']}][user_name]' value='{$row['user_name']}' class='cool-input'></td>";
                                                        echo "<td><input type='text' name='award_records[{$row['order_id']}][game_name]' value='{$row['game_name']}' class='cool-input'></td>";
                                                        echo "<td><input type='text' name='award_records[{$row['order_id']}][img_url]' value='{$row['img_url']}' class='cool-input'></td>";
                                                        echo "<td><input type='text' name='award_records[{$row['order_id']}][img_url2]' value='{$row['img_url2']}' class='cool-input'></td>";
                                                        echo "<td><input type='number' step='0.01' name='award_records[{$row['order_id']}][multiple]' value='{$row['multiple']}' class='cool-input'></td>";
                                                        echo "<td><input type='number' step='0.01' name='award_records[{$row['order_id']}][bonus_amount]' value='{$row['bonus_amount']}' class='cool-input'></td>";
                                                        echo "<td><input type='text' name='award_records[{$row['order_id']}][multiple_name]' value='{$row['multiple_name']}' class='cool-input'></td>";
                                                        echo "<td><input type='datetime-local' name='award_records[{$row['order_id']}][create_time]' value='" . date('Y-m-d\TH:i', strtotime($row['create_time'])) . "' class='cool-input'></td>";
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

                        <!-- Save All Button -->
                        <div class="row">
                            <div class="col-lg-12">
                                <button type="submit" name="save_all" class="btn btn-primary cool-button">Save All Changes</button>
                            </div>
                        </div>
                    </form>
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
        $(document).ready(function() {
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.href);
            }
        });
    </script>
</body>
</html>