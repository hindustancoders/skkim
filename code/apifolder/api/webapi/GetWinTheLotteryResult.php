<?php 
	include "../../conn.php";
	include "../../functions2.php";
	
	header('Content-Type: application/json; charset=utf-8');
	header('Strict-Transport-Security: max-age=31536000');
	header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, Authorization');
	header('Access-Control-Allow-Credentials: true');
	$origin = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : '';
	header('Access-Control-Allow-Origin: ' . $origin);
	header('vary: Origin');
	
	date_default_timezone_set("Asia/Kolkata");
	$shnunc = date("Y-m-d H:i:s");
	$res = [
		'code' => 11,
		'msg' => 'Method not allowed',
		'msgCode' => 12,
		'serviceNowTime' => $shnunc,
	];
	$shonubody = file_get_contents("php://input");
	$shonupost = json_decode($shonubody, true);
	
	if ($_SERVER['REQUEST_METHOD'] != 'GET') {
		if (isset($shonupost['issueNumber']) && isset($shonupost['language']) && isset($shonupost['random']) && isset($shonupost['signature']) && isset($shonupost['timestamp'])) {
			$issueNumber = isset($shonupost['issueNumber'][0]) ? mysqli_real_escape_string($conn, $shonupost['issueNumber'][0]) : '';
			$language = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['language']));
			$random = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['random']));
			$signature = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['signature']));
			$shonustr = '{"issueNumber":["'.$issueNumber.'"],"language":'.$language.',"random":"'.$random.'"}';
			$shonusign = strtoupper(md5($shonustr));
			if($shonusign == $signature){
				$bearer = explode(" ", $_SERVER['HTTP_AUTHORIZATION']);
				$author = $bearer[1];				
				$is_jwt_valid = is_jwt_valid($author);
				$data_auth = json_decode($is_jwt_valid, 1);
				if($data_auth['status'] === 'Success') {
					$sesquery = "SELECT akshinak
					  FROM users
					  WHERE akshinak = '$author'";
					$sesresult=$conn->query($sesquery);
					$sesnum = mysqli_num_rows($sesresult);
					if($sesnum == 1){
						/* Game type from the issueNumber PREFIX (positions 8-12):
						   10001=1m, 10002=3m, 10003=5m, 10004=10m, 10005=30s.
						   (The old $issueNumber[12] single-char check mapped 30s
						   to the 10min bets table and 10m to the 30sec table,
						   so the win/loss popup never appeared for 30s / 10m.) */
						$wingoPrefix = substr($issueNumber, 8, 5);
						$shonuid = $data_auth['payload']['id'];

						if($wingoPrefix === '10001'){
							$jayshriram = 'wingo_bets_1min';
							$typeId = 1;
						}
						else if($wingoPrefix === '10002'){
							$jayshriram = 'wingo_bets_3min';
							$typeId = 2;
						}
						else if($wingoPrefix === '10003'){
							$jayshriram = 'wingo_bets_5min';
							$typeId = 3;
						}
						else if($wingoPrefix === '10004'){
							$jayshriram = 'wingo_bets_10min';
							$typeId = 5;
						}
						else if($wingoPrefix === '10005'){
							$jayshriram = 'wingo_bets_30sec';
							$typeId = 4;
						}
						else{
							$typeId = $issueNumber[12];
							if($typeId == 1){
								$jayshriram = 'wingo_bets_1min';
							}
							else if($typeId == 2){
								$jayshriram = 'wingo_bets_3min';
							}
							else if($typeId == 3){
								$jayshriram = 'wingo_bets_5min';
							}
							else if($typeId == 4){
								$jayshriram = 'wingo_bets_30sec';
							}
							else if($typeId == 5){
								$jayshriram = 'wingo_bets_10min';
							}
							else{
								$jayshriram = 'wingo_bets_1min';
							}
						}
						
						$samasye = "SELECT
						        COUNT(*) AS kul_bets,
						        COALESCE(SUM(CASE WHEN phalaphala = 'gagner' THEN 1 ELSE 0 END), 0) AS jit_bets,
						        COALESCE(SUM(CASE WHEN phalaphala = 'gagner' THEN sesabida ELSE 0 END), 0) AS jit_rakam,
						        MAX(ergebnis) AS parinama
						  FROM ".$jayshriram." WHERE kalaparichaya = '$issueNumber' AND byabaharkarta = $shonuid";
						$samasyephalitansa = $conn->query($samasye);
						$samasyephalitansa_sreni = mysqli_fetch_array($samasyephalitansa);
						
						$data[0]['issueNumber'] = $issueNumber;
						$parinama = (int)$samasyephalitansa_sreni['parinama'];
						$data[0]['number'] = $parinama;
						if($parinama === 0){
												$color = 'red,violet';
						}
						else if($parinama === 5){
												$color = 'green,violet';
						}
						else if($parinama === 1 || $parinama === 3 || $parinama === 7 || $parinama === 9){
												$color = 'green';
						}
						else if($parinama === 2 || $parinama === 4 || $parinama === 6 || $parinama === 8){
												$color = 'red';
						}
						else{
												$color = '';
						}
						$data[0]['colour'] = $color;
						$data[0]['winAmount'] = $samasyephalitansa_sreni['jit_rakam'];
						$data[0]['typeName'] = $typeId;
						if((int)$samasyephalitansa_sreni['kul_bets'] === 0){
												$state = 2; // bet hi nahi mila / abhi settle nahi hua - frontend 2s me dobara poll karega
						}
						else if((int)$samasyephalitansa_sreni['jit_bets'] > 0){
												$state = 1;
						}
						else{
												$state = 0;
						}
						$data[0]['state'] = $state;												
						
						$res['data'] = $data;
						$res['code'] = 0;
						$res['msg'] = 'Succeed';
						$res['msgCode'] = 0;
						http_response_code(200);
						echo json_encode($res);	
					}
					else{
						$res['code'] = 4;
						$res['msg'] = 'No operation permission';
						$res['msgCode'] = 2;
						http_response_code(401);
						echo json_encode($res);
					}					
				}
				else{					
					$res['code'] = 4;
					$res['msg'] = 'No operation permission';
					$res['msgCode'] = 2;
					http_response_code(401);
					echo json_encode($res);					
				}
			}
			else{
				$res['code'] = 5;
				$res['msg'] = 'Wrong signature';
				$res['msgCode'] = 3;
				http_response_code(200);
				echo json_encode($res);				
			}
		}
		else{
			$res['code'] = 7;
			$res['msg'] = 'Param is Invalid';
			$res['msgCode'] = 6;
			http_response_code(200);
			echo json_encode($res);			
		}		
	} else {		
		http_response_code(405);
		echo json_encode($res);
	}
?>