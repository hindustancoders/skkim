<?php 
include("conn.php");

// Function to check for illegal bets
function checkIllegalBets($conn) {
    $query = "
        SELECT byabaharkarta, kalaparichaya, 'wingo_bets_10min' AS table_name FROM wingo_bets_10min
        UNION ALL
        SELECT byabaharkarta, kalaparichaya, 'wingo_bets_1min' FROM wingo_bets_1min
        UNION ALL
        SELECT byabaharkarta, kalaparichaya, 'wingo_bets_3min' FROM wingo_bets_3min
        UNION ALL
        SELECT byabaharkarta, kalaparichaya, 'wingo_bets_5min' FROM wingo_bets_5min
        UNION ALL
        SELECT byabaharkarta, kalaparichaya, 'fived_bets_1min' FROM fived_bets_1min
        UNION ALL
        SELECT byabaharkarta, kalaparichaya, 'fived_bets_3min' FROM fived_bets_3min
        UNION ALL
        SELECT byabaharkarta, kalaparichaya, 'fived_bets_5min' FROM fived_bets_5min
        UNION ALL
        SELECT byabaharkarta, kalaparichaya, 'fived_bets_10min' FROM fived_bets_10min
    ";
    return $conn->query($query);
}

// Function to map table names to game names
function getGameName($table_name) {
    $game_names = [
        "wingo_bets_10min" => "Wingo 30 sec",
        "wingo_bets_1min" => "Wingo 1 min",
        "wingo_bets_3min" => "Wingo 3 min",
        "wingo_bets_5min" => "Wingo 5 min",
        "fived_bets_1min" => "D5 1 min",
        "fived_bets_3min" => "D5 3 min",
        "fived_bets_5min" => "D5 5 min",
        "fived_bets_10min" => "D5 10 min"
    ];
    return $game_names[$table_name] ?? "Unknown Game";
}

// Get illegal bets data
$illegal_bets = checkIllegalBets($conn);

if ($illegal_bets->num_rows > 0) {
    while ($row = $illegal_bets->fetch_assoc()) {
        $user_id = $row['byabaharkarta'];
        $period = $row['kalaparichaya'];
        $game = getGameName($row['table_name']);  
        echo "<tr>
                <td>{$period}</td>
                <td>{$user_id}</td>
                <td>{$game}</td>
                <td>
                    <form method='POST' action='index.php'>
                        <input type='hidden' name='user_id' value='{$user_id}'>
                        <input type='hidden' name='period' value='{$period}'>
                        <input type='hidden' name='game' value='{$game}'>
                        <button type='submit' name='ban_user'>Ban</button>
                    </form>
                </td>
              </tr>";
    }
} else {
    echo "<tr><td colspan='4'>No illegal bets detected.</td></tr>";
}
?>
