<?php
session_start();
if(empty($_SESSION['unohs'])){
    header("location:index.php?msg=unauthorized");
    exit;
    exit;
}

include("conn.php");

$message = "";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $mobile = mysqli_real_escape_string($conn, $_POST['mobile']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $password = md5($_POST['password']);
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $account_no = mysqli_real_escape_string($conn, $_POST['account_no']);
    $initial_balance = mysqli_real_escape_string($conn, $_POST['initial_balance']);

    // Check if mobile number exists
    $check = mysqli_query($conn, "SELECT id FROM users WHERE mobile = '$mobile'");
    if(mysqli_num_rows($check) > 0) {
        $message = "Mobile number already exists";
    } else {
        // Get IP address
        $ipaddress = '';
        if (isset($_SERVER['HTTP_CLIENT_IP']))
            $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
        else if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
            $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
        else if(isset($_SERVER['REMOTE_ADDR']))
            $ipaddress = $_SERVER['REMOTE_ADDR'];
        else
            $ipaddress = 'UNKNOWN';

        // Generate unique owncode
        do {
            $codethiefstfu = str_pad(mt_rand(1, 999999), 6, '0', STR_PAD_LEFT);
            $query = "SELECT id FROM users ORDER BY id DESC LIMIT 1";
            $result = mysqli_query($conn, $query);
            $row = mysqli_fetch_assoc($result);
            $nextId = isset($row['id']) ? $row['id'] + 1 : 1;
            $nextId = str_pad($nextId, 6, '0', STR_PAD_LEFT);
            $owncode = $codethiefstfu . $nextId;
            $check_code = mysqli_query($conn, "SELECT id FROM users WHERE owncode = '$owncode'");
        } while(mysqli_num_rows($check_code) > 0);

        $createdate = date("Y-m-d H:i:s");

        // Insert user
        $sql = "INSERT INTO users (mobile, email, password, owncode, createdate, ip, name, account_no) 
                VALUES ('$mobile', '$email', '$password', '$owncode', '$createdate', '$ipaddress', '$name', '$account_no')";
        
        if(mysqli_query($conn, $sql)) {
            $user_id = mysqli_insert_id($conn);
            
            // Insert initial balance if provided
            if($initial_balance > 0) {
                $money_sql = "INSERT INTO user_wallets (balakedara, motta, dinankavannuracisi) 
                            VALUES ('$user_id', '$initial_balance', '$createdate')";
                mysqli_query($conn, $money_sql);
            }

            header("Location: dashboard.php?msg=user_added&owncode=$owncode");
            exit;
        } else {
            $message = "Error: " . mysqli_error($conn);
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Add New User</title>
    <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="vendors/feather/feather.css">
    <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
    <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css"/>
    <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
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
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="container-scroller">
        <div class="container-fluid page-body-wrapper">
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="container">
                        <h2 class="text-center mb-4">Add New User</h2>
                        <?php if($message): ?>
                            <div class="alert alert-<?php echo strpos($message, 'Error') !== false ? 'danger' : 'success'; ?>">
                                <?php echo $message; ?>
                            </div>
                        <?php endif; ?>
                        <form method="post" action="">
                            <div class="form-group">
                                <label for="mobile">Mobile Number *</label>
                                <input type="text" class="form-control cool-input" id="mobile" name="mobile" required pattern="[0-9]{10}" title="Please enter a valid 10-digit mobile number">
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control cool-input" id="email" name="email">
                            </div>
                            <div class="form-group">
                                <label for="initial_balance">Money</label>
                                <input type="number" class="form-control cool-input" id="initial_balance" name="initial_balance" min="0" value="0">
                            </div>
                            <div class="form-group">
                                <label for="password">Password *</label>
                                <input type="password" class="form-control cool-input" id="password" name="password" required>
                            </div>
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" class="form-control cool-input" id="name" name="name">
                            </div>
                            <div class="form-group">
                                <label for="account_no">Account Number</label>
                                <input type="text" class="form-control cool-input" id="account_no" name="account_no">
                            </div>
                            <div class="form-group">
                                <label for="initial_balance">Initial Wallet Balance</label>
                                <input type="number" class="form-control cool-input" id="initial_balance" name="initial_balance" min="0" value="0">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary cool-button">Add User</button>
                                <a href="dashboard.php" class="btn btn-secondary cool-button">Back to Dashboard</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="vendors/base/vendor.bundle.base.js"></script>
</body>
</html>
<?php mysqli_close($conn); ?>