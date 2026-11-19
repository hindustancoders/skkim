<?php
include("serive/samparka.php");
// Web access guard: CLI cron allowed, web-cron needs secret key
if (php_sapi_name() !== 'cli') {
    $shonucronkey = isset($_GET['key']) ? $_GET['key'] : '';
    if ($shonucronkey !== '2c8938261d4aa749ce3190c36e6a71e1') {
        http_response_code(403);
        exit('Access denied. Invalid cron key.');
    }
}

$samasye = "SELECT dinankavannuracisi,atadaaidi FROM trx_wingo_periods_5min ORDER BY kramasankhye DESC LIMIT 1";
$samasyephalitansa = $conn->query($samasye);
$samasyesreni = mysqli_fetch_array($samasyephalitansa);
if (!$samasyesreni || !isset($samasyesreni['atadaaidi'])) {
    return; // koi period hi nahi - settle karne ko kuch nahi (ktrx period-creation chalne de)
}

$apiKey = "92aa5681-5d97-4375-8fa5-e304f4cfc272";
$starttime = (strtotime($samasyesreni['dinankavannuracisi']) + 291) * 1000; 


$endtime = $starttime + 300 * 1000; 

$url = "https://apilist.tronscanapi.com/api/block?sort=-timestamp&limit=100&start_timestamp={$starttime}&end_timestamp={$endtime}";


$curl = curl_init();
curl_setopt_array($curl, [
    CURLOPT_URL => $url,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_HTTPHEADER => [
        "TRON-PRO-API-KEY: $apiKey"
    ],
]);

$response = curl_exec($curl);

if ($response === false) {
    echo "Error fetching API data.";
    exit;
}

$data = json_decode($response, true);

if (isset($data['data'][0]['hash'])) {
    $hash = $data['data'][0]['hash'];
    $timestamp = $data['data'][0]['timestamp'];
    $blockNumber=$data['data'][0]['number'];
} else {
    $blockNumber = 0;
    $hash = "00000000040b4803" . bin2hex(random_bytes(24));
    $timestamp = time() * 1000;
}

$bt = $timestamp / 1000;
$formattedDate = date("Y-m-d H:i:s", $bt);

$kadimesucyanka = null;
for ($i = strlen($hash) - 1; $i >= 0; $i--) {
    if (is_numeric($hash[$i])) {
        $kadimesucyanka = (int)$hash[$i];
        break;
    }
}

$dinanka = $formattedDate;
/*echo '<pre>';
print_r($data); // This will print the array in a readable format
echo '</pre>';
echo $starttime;
echo $endtime; */
$yadrcchikasanke = $kadimesucyanka;
$yadrcchikasankhye = (int)implode('', (array)$yadrcchikasanke);

// Settlement dedupe: ek period sirf ek baar settle ho (double-cron / manual re-run guard)
$shonudupcheck = mysqli_query($conn, "SELECT shonu FROM trx_wingo_results_5min WHERE kalaparichaya = '".mysqli_real_escape_string($conn, $samasyesreni['atadaaidi'])."' LIMIT 1");
if ($shonudupcheck && mysqli_num_rows($shonudupcheck) > 0) {
    curl_close($curl);
    return; // ye period already settled hai
}

if ($conn) {
    $query = "INSERT INTO `trx_wingo_results_5min` 
              (`kalaparichaya`, `bele`, `phalitansa`, `banna`, `phalitansadaprakara`, `dinankavannuracisi`, `bh`, `hash`) 
              VALUES 
              ('" . mysqli_real_escape_string($conn, $samasyesreni['atadaaidi']) . "', 
               '" . $yadrcchikasankhye . "', 
               '" . $kadimesucyanka . "', 
               '" . (($kadimesucyanka == 0) ? 'red,violet' : (($kadimesucyanka == 5) ? 'green,violet' : (($kadimesucyanka % 2 == 1) ? 'green' : 'red'))) . "', 
               'uncensored', 
               '" . $formattedDate . "', 
               '" . $blockNumber . "', 
               '" . $hash . "')";

    $tathya = mysqli_query($conn, $query);

    if ($tathya) {
        echo "Data inserted successfully!";
    } else {
        echo "Error in query execution: " . mysqli_error($conn);
    }
}

if($kadimesucyanka == 0){
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 1.5, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '10' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '10' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
				
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 4.5, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '12' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '12' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
				
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '0' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '0' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
				
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '14' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '14' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
			}
			if($kadimesucyanka == 1){
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '11' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '11' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
								
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '1' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '1' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
				
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '14' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '14' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
			}
			if($kadimesucyanka == 2){
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '10' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '10' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
								
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '2' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '2' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
				
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '14' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '14' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
			}
			if($kadimesucyanka == 3){
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '11' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '11' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
								
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '3' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '3' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
				
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '14' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '14' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
			}
			if($kadimesucyanka == 4){
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '10' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '10' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
								
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '4' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '4' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
				
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '14' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '14' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
			}
			if($kadimesucyanka == 5){
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 1.5, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '11' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '11' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
				
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 4.5, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '12' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '12' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
				
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '5' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '5' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
				
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '13' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '13' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
			}
			if($kadimesucyanka == 6){
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '10' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '10' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
								
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '6' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '6' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
				
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '13' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '13' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
			}
			if($kadimesucyanka == 7){
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '11' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '11' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
								
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '7' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '7' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
				
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '13' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '13' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
			}
			if($kadimesucyanka == 8){
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '10' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '10' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
								
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '8' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '8' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
				
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '13' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '13' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
			}
			if($kadimesucyanka == 9){
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '11' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '11' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
								
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '9' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '9' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
				
				$nabikarana = "UPDATE trx_wingo_bets_5min set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '13' AND phalaphala = 'perte'";
				$conn->query($nabikarana);
				$nabikarana = "UPDATE user_wallets
				INNER JOIN (
					SELECT byabaharkarta, SUM(sesabida) AS total_paid
					FROM trx_wingo_bets_5min
					WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
					AND ojana = '13' 
					AND phalaphala ='gagner'
					GROUP BY byabaharkarta
				)  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
				SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
				";
				$conn->query($nabikarana);
			}
			$nabikarana_dui = "UPDATE trx_wingo_bets_5min set ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."'";
			$conn->query($nabikarana_dui);
curl_close($curl);
?>
