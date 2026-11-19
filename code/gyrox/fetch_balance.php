<?php
include '../conn.php'; 

if (isset($_GET['user_id'])) {
    $userId = intval($_GET['user_id']);
    $balanceQuery = $conn->prepare("SELECT motta FROM user_wallets WHERE balakedara = ?");
    $balanceQuery->bind_param("i", $userId);
    $balanceQuery->execute();
    $balanceResult = $balanceQuery->get_result();
    $userBalance = $balanceResult->fetch_assoc()['motta'] ?? 0;

    if ($userBalance !== null) {
        echo "<h4>User ID: <b>{$userId}</b> | Current Balance: <b>" . number_format($userBalance, 2) . "</b></h4>
        <form method='post' action=''>
            <input type='hidden' name='user_id' value='{$userId}'>
            <div class='mb-3'>
                <label>Amount to Deduct:</label>
                <input type='number' class='form-control' name='amount' min='1' max='{$userBalance}' required>
            </div>
            <div class='mb-3'>
                <label>Remarks:</label>
                <input type='text' class='form-control' name='remark' required>
            </div>
            <button type='submit' class='btn btn-danger w-100'>💸 Deduct Balance</button>
        </form>";
    } else {
        echo "<div class='alert alert-danger'>❌ User Not Found!</div>";
    }
} else {
    echo "<div class='alert alert-danger'>❌ Invalid Request!</div>";
}
?>
