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
		if (isset($shonupost['amount']) && isset($shonupost['betCount']) && isset($shonupost['gameType']) && isset($shonupost['issuenumber']) && 
			isset($shonupost['language']) && isset($shonupost['random']) && isset($shonupost['selectType']) && isset($shonupost['signature']) && 
			isset($shonupost['timestamp']) && isset($shonupost['typeId'])) {
			$amount = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['amount']));
			$betCount = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['betCount']));
			$gameType = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['gameType']));
			$issuenumber = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['issuenumber']));
			$language = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['language']));
			$random = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['random']));
			$selectType = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['selectType']));
			$signature = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['signature']));
			$typeId = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['typeId']));
			$shonustr = '{"amount":'.$amount.',"betCount":'.$betCount.',"gameType":'.$gameType.',"issuenumber":"'.$issuenumber.'","language":'.$language.',"random":"'.$random.'","selectType":'.$selectType.',"typeId":'.$typeId.'}';
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
						if($typeId == 1){
							$lordjesus = 'wingo_bets_1min';
							$sonofgod = 'wingo_periods_1min';
						}
						else if($typeId == 2){
							$lordjesus = 'wingo_bets_3min';
							$sonofgod = 'wingo_periods_3min';
						}
						else if($typeId == 3){
							$lordjesus = 'wingo_bets_5min';
							$sonofgod = 'wingo_periods_5min';
						}
						else if($typeId == 4 || $typeId == 30){
							$lordjesus = 'wingo_bets_30sec';
							$sonofgod = 'wingo_periods_30sec';
						}
						else if($typeId == 5){
							$lordjesus = 'wingo_bets_10min';
							$sonofgod = 'wingo_periods_10min';
						}
						if($betCount >= 1){
							if($amount >= 1){
								$samasye = "SELECT atadaaidi
								  FROM ".$sonofgod."
								  ORDER BY kramasankhye DESC LIMIT 1";
								$samasyephalitansa=$conn->query($samasye);
								$samasyesreni = mysqli_fetch_array($samasyephalitansa);
								if($samasyesreni['atadaaidi'] == $issuenumber){
									$totalamount = $amount * $betCount;								
									// Atomic debit: ek hi UPDATE me balance check + katoti (double-spend race fix)
									$nabikarana_debit = "UPDATE user_wallets set motta = motta - ".$totalamount." where balakedara = ".$data_auth['payload']['id']." AND motta >= ".$totalamount;
									$conn->query($nabikarana_debit);
									$shonudebitsaphal = ($conn->affected_rows === 1);
									$byabaharkarta = $data_auth['payload']['id'];
									$shonubalance = 0;
									if($shonudebitsaphal){
										$byabaharkarta = $data_auth['payload']['id'];
										
										// Check if the user has completed their first recharge
										$first_recharge_query = "SELECT * FROM deposits WHERE balakedara = '$byabaharkarta' AND sthiti = 1";
										//$first_recharge_result = $conn->query($first_recharge_query);
                                      
                                      $first_recharge_result = 1;
										//if ($first_recharge_result->num_rows > 0) {
										if ($first_recharge_result) {
											// Proceed with the bet if the first recharge is done
											$sesabida = sprintf("%.2f", $totalamount * 0.98);
											$tathya = mysqli_query($conn,"INSERT INTO `".$lordjesus."` (`byabaharkarta`,`kalaparichaya`,`prakar`,`ojana`,`menge`,`wettanzahl`,`ketebida`,`phalaphala`,`sesabida`,`tiarikala`) VALUES ('".$byabaharkarta."','".$issuenumber."','".$gameType."','".$selectType."','".$amount."','".$betCount."','".$totalamount."','perte','".$sesabida."','".$shnunc."')");
											if($tathya){
											    // (debit upar atomically ho chuka hai)
											}else{
											    // INSERT fail: katota hua paisa wapas credi karo
											    $conn->query("UPDATE user_wallets set motta = motta + ".$totalamount." where balakedara = '".$byabaharkarta."'");
											}
											$shonustopbet = !$tathya;
											if(!$shonustopbet){
											    include "commission.php";
											    include "vip.php";
											}
											$res['data'] = null;
											$res['code'] = 0;
											$res['msg'] = 'Succeed';
											$res['msgCode'] = 0;
											http_response_code(200);
											echo json_encode($res);
										} else {
											
											$res['code'] = 7;
											$res['msg'] = 'First recharge not completed';
											$res['msgCode'] = 502;
											http_response_code(200);
											echo json_encode($res);
										}
									} else {
										$res['code'] = 1;
										$res['msg'] = 'Balance is not enough';
										$res['msgCode'] = 142;
										http_response_code(200);
										echo json_encode($res);
									}
								} else {
									$res['code'] = 1;
									$res['msg'] = 'The current period is settled';
									$res['msgCode'] = 404;
									http_response_code(200);
									echo json_encode($res);
								}																																				
							} else {
								$res['code'] = 7;
								$res['msg'] = "Invalid value for parameter 'Amount'";
								unset($res['msgCode']);
								unset($res['serviceNowTime']);
								http_response_code(200);
								echo json_encode($res);
							}
						} else {
							$res['code'] = 7;
							$res['msg'] = "Invalid value for parameter 'BetCount'";
							unset($res['msgCode']);
							unset($res['serviceNowTime']);
							http_response_code(200);
							echo json_encode($res);
						}
					} else {
						$res['code'] = 4;
						$res['msg'] = 'No operation permission';
						$res['msgCode'] = 2;
						http_response_code(401);
						echo json_encode($res);
					}					
				} else {					
					$res['code'] = 4;
					$res['msg'] = 'No operation permission';
					$res['msgCode'] = 2;
					http_response_code(401);
					echo json_encode($res);					
				}
			} else {
				$res['code'] = 5;
				$res['msg'] = 'Wrong signature';
				$res['msgCode'] = 1;
				http_response_code(403);
				echo json_encode($res);
			}
		} else {
			$res['code'] = 9;
			$res['msg'] = 'Missing parameters';
			unset($res['msgCode']);
			unset($res['serviceNowTime']);
			http_response_code(200);
			echo json_encode($res);
		}
	}
	else{
		http_response_code(405);
		echo json_encode($res);
	}	
?>
