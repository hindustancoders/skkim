<?php
    session_start();
    if(empty($_SESSION['unohs'])){
        header("location:../index.php?msg=unauthorized");
        exit;
        }
?>
<?php
include '../conn.php';
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

        $message = "<div class='alert alert-success text-center fw-bold fs-5'>✅💎 Balance Deducted Successfully!</div>";
    } else {
        $message = "<div class='alert alert-danger text-center fw-bold fs-5'>❌🚫 Insufficient Funds! Please check your balance.</div>";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>💰 Premium Balance Manager</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&display=swap');
        body {
            background: linear-gradient(135deg, #1a1a2e, #16213e);
            color: #ffffff;
            font-family: 'Inter', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            max-width: 500px;
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
        }
        .btn-custom {
            background: linear-gradient(90deg, #ff416c, #ff4b2b);
            color: #ffffff;
            font-weight: bold;
            padding: 12px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        .btn-custom:hover {
            background: linear-gradient(90deg, #ff4b2b, #ff416c);
            transform: scale(1.05);
        }
        .loader {
            display: none;
            border: 4px solid rgba(255, 255, 255, 0.3);
            border-top: 4px solid #ffffff;
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
<div class="container text-center">
    <h2 class="mb-4 fw-bold">💎 Exclusive Balance Deduction Portal</h2>
    <?= $message; ?>
    <form id="searchForm" class="mb-3">
        <div class="input-group">
            <input type="number" class="form-control" name="user_id" id="user_id" placeholder="🔎 Enter User ID" required>
            <button type="submit" class="btn btn-warning">🚀 Fetch Balance</button>
        </div>
    </form>
    <div class="loader" id="loader"></div>
    <div id="balanceDetails"></div>
</div>
<script>
    document.getElementById("searchForm").addEventListener("submit", function(event) {
        event.preventDefault();
        document.getElementById("loader").style.display = "block";
        let userId = document.getElementById("user_id").value;
        fetch("fetch_balance.php?user_id=" + userId)
            .then(response => response.text())
            .then(data => {
                document.getElementById("balanceDetails").innerHTML = data;
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