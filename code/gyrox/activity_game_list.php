<?php
session_start();
if(empty($_SESSION['unohs'])){
    header("location:index.php?msg=unauthorized");
    exit;
    exit;
}

include ("conn.php");

// Define upload directory for images
$upload_dir = "../banners/";
$base_url = "https://tiranga08.site/banners/";

// Handle form submissions
if($_SERVER['REQUEST_METHOD'] == 'POST') {
    if(isset($_POST['update_activity'])) {
        $activity_id = mysqli_real_escape_string($conn, $_POST['activity_id']);
        $banner_title = mysqli_real_escape_string($conn, $_POST['banner_title']);
        $banner_id = mysqli_real_escape_string($conn, $_POST['banner_id']);
        $jump_type = mysqli_real_escape_string($conn, $_POST['jump_type']);
        $contents = mysqli_real_escape_string($conn, $_POST['contents']);
        $banner_url = mysqli_real_escape_string($conn, $_POST['banner_url']);
        
        // Handle image upload
        if(isset($_FILES['banner_image']) && $_FILES['banner_image']['size'] > 0) {
            $file = $_FILES['banner_image'];
            $file_name = time() . '_' . basename($file['name']);
            $target_file = $upload_dir . $file_name;
            
            $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
            $allowed_types = array('jpg', 'png', 'jpeg', 'gif');
            
            if(in_array($imageFileType, $allowed_types) && $file['size'] <= 5000000) {
                if(move_uploaded_file($file['tmp_name'], $target_file)) {
                    $banner_url = $base_url . $file_name;
                } else {
                    echo '<script type="text/JavaScript"> alert("Image Upload Failed"); </script>';
                    return;
                }
            } else {
                echo '<script type="text/JavaScript"> alert("Invalid Image Type or Size (Max 5MB)"); </script>';
                return;
            }
        }
        
        $query = "UPDATE activity_game_list SET banner_title='$banner_title', banner_id='$banner_id', banner_url='$banner_url', jump_type='$jump_type', contents='$contents' WHERE id='$activity_id'";
        if(mysqli_query($conn, $query)) {
            echo '<script type="text/JavaScript"> alert("Activity Updated"); </script>';
        } else {
            echo '<script type="text/JavaScript"> alert("Activity Update Failed"); </script>';
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Activity Game List Management</title>
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
    :root {
        --primary-color: #6c5ce7;
        --primary-dark: #5649c0;
        --secondary-color: #a29bfe;
        --accent-color: #fd79a8;
        --dark-color: #2d3436;
        --light-color: #f5f6fa;
        --success-color: #00b894;
        --warning-color: #fdcb6e;
        --danger-color: #d63031;
        --text-muted: #6c757d;
    }

    /* Enhanced Input Styles */
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

    /* Enhanced Copy Notification */
    #copied {
        visibility: hidden;
        z-index: 1000;
        position: fixed;
        bottom: 50%;
        left: 50%;
        transform: translateX(-50%);
        background-color: var(--dark-color);
        color: #fff;
        border-radius: 12px;
        padding: 20px 30px;
        max-width: 300px;
        font-size: 1rem;
        font-weight: 500;
        text-align: center;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        opacity: 0;
        transition: opacity 0.3s ease;
    }

    #copied.show {
        visibility: visible;
        opacity: 1;
        animation: bounceIn 0.6s, fadeOut 0.8s 2s forwards;
    }

    @keyframes bounceIn {
        0% { transform: translateX(-50%) scale(0.8); opacity: 0; }
        50% { transform: translateX(-50%) scale(1.1); }
        100% { transform: translateX(-50%) scale(1); opacity: 1; }
    }

    @keyframes fadeOut {
        0% { opacity: 1; }
        100% { opacity: 0; }
    }

    /* Form and Card Enhancements */
    .card-body form {
        margin-bottom: 0;
        transition: all 0.3s ease;
    }

    .card-body form:hover {
        transform: translateY(-2px);
    }

    /* Image Preview with Animation */
    .image-preview {
        max-width: 180px;
        margin: 15px 0;
        border-radius: 12px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        cursor: pointer;
    }

    .image-preview:hover {
        transform: scale(1.05) rotate(2deg);
        box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
    }

    /* Additional Micro-interactions */
    .cool-button:active {
        transform: translateY(1px);
    }

    .cool-input:invalid {
        border-color: var(--danger-color);
        animation: shake 0.5s;
    }

    @keyframes shake {
        0%, 100% { transform: translateX(0); }
        20%, 60% { transform: translateX(-5px); }
        40%, 80% { transform: translateX(5px); }
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
                            <h4 class="font-weight-bold text-dark">Activity Game List Management</h4>
                        </div>
                    </div> 
                    <div class="row mt-4">
                        <?php
                        $sel_activities = "SELECT * FROM activity_game_list ORDER BY id ASC";
                        $activities_r = mysqli_query($conn, $sel_activities);
                        while ($row = mysqli_fetch_array($activities_r)) {
                        ?>
                            <div class="col-md-4 mb-3">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title"><?php echo $row['banner_title']; ?></h5>
                                        <form action="#" method="post" enctype="multipart/form-data" autocomplete="off">
                                            <input type="hidden" name="activity_id" value="<?php echo $row['id']; ?>">
                                            <div class="form-group">
                                                <label>Banner Title</label>
                                                <input name="banner_title" type="text" value="<?php echo $row['banner_title']; ?>" class="cool-input w-100" style="height: 40px;" />
                                            </div>
                                            <div class="form-group">
                                                <label>Banner ID</label>
                                                <input name="banner_id" type="number" value="<?php echo $row['banner_id']; ?>" class="cool-input w-100" style="height: 40px;" />
                                            </div>
                                            <div class="form-group">
                                                <label>Banner URL</label>
                                                <img src="<?php echo $row['banner_url']; ?>" class="image-preview" alt="<?php echo $row['banner_title']; ?>">
                                                <input name="banner_url" type="text" value="<?php echo $row['banner_url']; ?>" class="cool-input w-100 mb-2" style="height: 40px;" />
                                                <input name="banner_image" type="file" accept="image/*" class="cool-input w-100" style="height: 40px;" />
                                            </div>
                                            <div class="form-group">
                                                <label>Jump Type</label>
                                                <input name="jump_type" type="number" value="<?php echo $row['jump_type']; ?>" class="cool-input w-100" style="height: 40px;" />
                                            </div>
                                            <div class="form-group">
                                                <label>Contents</label>
                                                <input name="contents" type="text" value="<?php echo $row['contents']; ?>" class="cool-input w-100" style="height: 40px;" />
                                            </div>
                                            <button type="submit" name="update_activity" class="btn btn-primary cool-button">Update Activity</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>
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
        if ( window.history.replaceState ) {
            window.history.replaceState( null, null, window.location.href );
        }
    </script>
</body>
</html>