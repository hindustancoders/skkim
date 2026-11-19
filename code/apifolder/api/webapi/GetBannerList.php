<?php
	include "../../conn.php";
			
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
		if (isset($shonupost['language']) && isset($shonupost['random']) && isset($shonupost['signature']) && isset($shonupost['timestamp'])) {
			$language = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['language']));
			$random = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['random']));
			$signature = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['signature']));
			$shonustr = '{"language":'.$language.',"random":"'.$random.'"}';
			$shonusign = strtoupper(md5($shonustr));
			if($shonusign == $signature){
				/* Banners served from site_banners table (admin manageable - admin/manage_banners.php) */
				$data = [];
				$banRes = mysqli_query($conn, "SELECT * FROM site_banners WHERE status = 1 ORDER BY sort_order ASC, id ASC");
				if ($banRes && mysqli_num_rows($banRes) > 0) {
					$bIdx = 0;
					while ($b = mysqli_fetch_assoc($banRes)) {
						$data[$bIdx]['url'] = $b['link_url'];
						$data[$bIdx]['bannerUrl'] = $b['image_url'];
						$bIdx++;
					}
				} else {
					/* fallback to bundled Bharat banners */
					$data[0]['url'] = '';
					$data[0]['bannerUrl'] = '/banner/bharat_banner_1_70extra.jpg';
					$data[1]['url'] = '';
					$data[1]['bannerUrl'] = '/banner/bharat_banner_2_winstreak.jpg';
					$data[2]['url'] = '';
					$data[2]['bannerUrl'] = '/banner/bharat_banner_3_refer.jpg';
					$data[3]['url'] = '';
					$data[3]['bannerUrl'] = '/banner/bharat_banner_4_agent.jpg';
				}
			
			
			
			
			
				
				
				$res['data'] = $data;
				$res['code'] = 0;
				$res['msg'] = 'Succeed';
				$res['msgCode'] = 0;
				http_response_code(200);
				echo json_encode($res);
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