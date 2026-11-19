<?php
	session_start();
	if(empty($_SESSION['unohs'])){
		header("location:../index.php?msg=unauthorized");
		exit;
		}
?>
<?php
include '../conn.php';

$searchedId = null;
$subordinates = [];
$teamSubordinates = [];
$totalCommission = $numberOfBetters = $totalBetAmount = 0;
$totalDeposits = $totalDepositAmount = $firstDepositors = $totalFirstDepositAmount = 0;
$teamTotalCommission = $teamNumberOfBetters = $teamTotalBetAmount = 0;
$teamTotalDeposits = $teamTotalDepositAmount = $teamFirstDepositors = $teamTotalFirstDepositAmount = 0;
$selectedDate = null;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $userId = intval($_POST['user_id']);
    $searchedId = $userId;
    $selectedDate = !empty($_POST['date']) ? $_POST['date'] : null;
	$selectedLevel = isset($_POST['level']) ? $_POST['level'] : 'all'; 



    
    $codeQuery = $conn->prepare("SELECT owncode, code1, code2, code3, code4, code5 FROM users WHERE id = ?");
    $codeQuery->bind_param("i", $userId);
    $codeQuery->execute();
    $codeResult = $codeQuery->get_result();
    
    if ($codeRow = $codeResult->fetch_assoc()) {
        $owncode = $codeRow['owncode'];
        $teamCodes = array_filter([$codeRow['code1'], $codeRow['code2'], $codeRow['code3'], $codeRow['code4'], $codeRow['code5']]);
        
        $subQuery = $conn->prepare("SELECT id FROM users WHERE code = ?");
        $subQuery->bind_param("s", $owncode);
        $subQuery->execute();
        $subResult = $subQuery->get_result();
        while ($row = $subResult->fetch_assoc()) {
            $subordinates[] = $row['id'];
        }

        if (!empty($teamCodes)) {
            $teamCodesStr = implode("','", $teamCodes);
            $teamQuery = $conn->query("SELECT id FROM users WHERE owncode IN ('$teamCodesStr')");
            while ($row = $teamQuery->fetch_assoc()) {
                $teamSubordinates[] = $row['id'];
            }
        }

       function fetchStats($conn, $subordinateIds, $selectedDate, $selectedLevel) {
    $stats = [
        'commission' => 0, 'betters' => 0, 'betAmount' => 0,
        'deposits' => 0, 'depositAmount' => 0, 'firstDepositors' => 0, 'firstDepositAmount' => 0
    ];

    if (!empty($subordinateIds)) {
        $ids = implode(",", $subordinateIds);
        $dateCondition = $selectedDate ? " AND DATE(tiarikala) = '$selectedDate'" : "";

        $levelCondition = "";
        if ($selectedLevel !== 'all') {
            $levelCondition = "AND prakara = 'LVLCOMM" . intval($selectedLevel) . "'";
        }

        $filteredUsers = [];
        $result = $conn->query("SELECT DISTINCT balakedara FROM transaction_ledger WHERE balakedara IN ($ids) $dateCondition $levelCondition");
        while ($row = $result->fetch_assoc()) {
            $filteredUsers[] = $row['balakedara'];
        }

        if (!empty($filteredUsers)) {
            $filteredIds = implode(",", $filteredUsers);

         
            $result = $conn->query("SELECT SUM(ayoga) AS total FROM transaction_ledger WHERE balakedara IN ($filteredIds) $dateCondition $levelCondition");
            $stats['commission'] = $result->fetch_assoc()['total'] ?? 0;

         
            $betTables = [
                "fived_bets_1min", "fived_bets_3min", "fived_bets_5min",
                "fived_bets_10min", "wingo_bets_3min", "wingo_bets_5min",
                "k3_bets_1min", "k3_bets_3min", "k3_bets_5min",
                "k3_bets_10min", "trx_wingo_bets_1min", "trx_wingo_bets_3min",
                "trx_wingo_bets_5min", "trx_wingo_bets_10min", "wingo_bets_10min"
            ];
            $betters = [];
            foreach ($betTables as $table) {
                $result = $conn->query("SELECT DISTINCT byabaharkarta FROM $table WHERE byabaharkarta IN ($filteredIds) $dateCondition");
                while ($row = $result->fetch_assoc()) {
                    $betters[$row['byabaharkarta']] = true;
                }
                $result = $conn->query("SELECT SUM(wettanzahl) AS total FROM $table WHERE byabaharkarta IN ($filteredIds) $dateCondition");
                $stats['betAmount'] += $result->fetch_assoc()['total'] ?? 0;
            }
            $stats['betters'] = count($betters);

            // Fetch deposit statistics
            $depositDateCondition = $selectedDate ? " AND DATE(dinankavannuracisi) = '$selectedDate'" : "";
            $result = $conn->query("SELECT COUNT(*) AS count, SUM(motta) AS total FROM deposits WHERE balakedara IN ($filteredIds) AND sthiti = 1 $depositDateCondition");
            $row = $result->fetch_assoc();
            $stats['deposits'] = $row['count'] ?? 0;
            $stats['depositAmount'] = $row['total'] ?? 0;

            $result = $conn->query("SELECT COUNT(DISTINCT balakedara) AS count, SUM(motta) AS total FROM deposits WHERE balakedara IN ($filteredIds) AND sthiti = 1 $depositDateCondition");
            $row = $result->fetch_assoc();
            $stats['firstDepositors'] = $row['count'] ?? 0;
            $stats['firstDepositAmount'] = $row['total'] ?? 0;
        }
    }
    return $stats;
}




        $subStats = fetchStats($conn, $subordinates, $selectedDate, 'all');
        $teamStats = fetchStats($conn, $teamSubordinates, $selectedDate, $selectedLevel);
    }
}
?>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VG CLUB - Subordinate Data</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #141e30, #243b55);
            color: #fff;
            font-family: 'Poppins', sans-serif;
        }
        .container {
            margin-top: 50px;
            padding: 30px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            backdrop-filter: blur(10px);
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
        }
        .btn-custom {
            background: linear-gradient(45deg, #ff416c, #ff4b2b);
            color: white;
            font-weight: bold;
            width: 100%;
            transition: 0.3s;
            border: none;
            padding: 12px;
            border-radius: 8px;
        }
        .btn-custom:hover {
            background: linear-gradient(45deg, #ff4b2b, #ff416c);
            transform: scale(1.05);
        }
        .info-box {
            background: rgba(255, 255, 255, 0.2);
            padding: 15px;
            border-radius: 10px;
            font-weight: bold;
            margin-bottom: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        h2, h4 {
            text-align: center;
        }
        .logo {
            text-align: center;
            font-size: 30px;
            font-weight: bold;
            background: -webkit-linear-gradient(45deg, #ff416c, #ff4b2b);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="logo">🔥 VG CLUB 🔥</div>
    <h2 class="mb-4">📊 Subordinate Data</h2>
    <form method="post">
        <div class="mb-3">
            <input type="number" class="form-control" name="user_id" placeholder="Enter User ID" required>
        </div>
        <div class="mb-3">
            <label for="level" class="form-label">Select Level:</label>
            <select class="form-control" name="level" id="level">
                <option value="all">All Levels</option>
                <option value="1">Level 1</option>
                <option value="2">Level 2</option>
                <option value="3">Level 3</option>
                <option value="4">Level 4</option>
                <option value="5">Level 5</option>
                <option value="6">Level 6</option>
            </select>
        </div>
        <div class="mb-3">
            <input type="date" class="form-control" name="date">
        </div>
        <button type="submit" class="btn btn-custom">🔍 Fetch Data</button>
    </form>

    <?php if ($searchedId !== null): ?>
        <div class="row mt-4">
            <h5 class="text-center">🔍 Searched User ID: <?php echo $searchedId; ?> <?php if ($selectedDate !== null): ?> | Date: <?php echo $selectedDate; ?> <?php endif; ?></h5>
            <div class="col-md-6">
                <h4>Direct Subordinates</h4>
                <div class="info-box">💰 <strong>Commission Amount:</strong> ₹<?= number_format($subStats['commission'], 2); ?></div>
                <div class="info-box">🎲 <strong>Number of Betters:</strong> <?= $subStats['betters']; ?></div>
                <div class="info-box">💵 <strong>Total Bet Amount:</strong> ₹<?= number_format($subStats['betAmount'], 2); ?></div>
                <div class="info-box">📥 <strong>Number of Deposits:</strong> <?= $subStats['deposits']; ?></div>
                <div class="info-box">💳 <strong>Total Deposit Amount:</strong> ₹<?= number_format($subStats['depositAmount'], 2); ?></div>
                <div class="info-box">🎉 <strong>First Depositors:</strong> <?= $subStats['firstDepositors']; ?></div>
                <div class="info-box">🏆 <strong>First Deposit Amount:</strong> ₹<?= number_format($subStats['firstDepositAmount'], 2); ?></div>
            </div>

            <div class="col-md-6">
                <h4>Team Subordinates</h4>
                <div class="info-box">💰 <strong>Commission Amount:</strong> ₹<?= number_format($teamStats['commission'], 2); ?></div>
                <div class="info-box">🎲 <strong>Number of Betters:</strong> <?= $teamStats['betters']; ?></div>
                <div class="info-box">💵 <strong>Total Bet Amount:</strong> ₹<?= number_format($teamStats['betAmount'], 2); ?></div>
                <div class="info-box">📥 <strong>Number of Deposits:</strong> <?= $teamStats['deposits']; ?></div>
                <div class="info-box">💳 <strong>Total Deposit Amount:</strong> ₹<?= number_format($teamStats['depositAmount'], 2); ?></div>
                <div class="info-box">🎉 <strong>First Depositors:</strong> <?= $teamStats['firstDepositors']; ?></div>
                <div class="info-box">🏆 <strong>First Deposit Amount:</strong> ₹<?= number_format($teamStats['firstDepositAmount'], 2); ?></div>
            </div>
        </div>
    <?php endif; ?>
</div>

</body>
</html>
