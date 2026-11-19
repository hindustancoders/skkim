<?php 
        include "../../conn.php";
        include "../../functions2.php";
        include_once __DIR__ . "/../../../wingo_api_lib.php";
        
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
                        $typeId = intval($shonupost['typeId']);
                        $shonustr = '{"language":'.$language.',"random":"'.$random.'","typeId":'.intval($typeId).'}';
                        $shonusign = strtoupper(md5($shonustr));
                        if($shonusign == $signature){
                                $bearer = explode(" ", $_SERVER['HTTP_AUTHORIZATION'] ?? '');
                                $author = isset($bearer[1]) ? $bearer[1] : '';
                                $is_jwt_valid = is_jwt_valid($author);
                                $data_auth = json_decode($is_jwt_valid, 1);
                                if($data_auth['status'] === 'Success') {
                                        $sesquery = "SELECT akshinak
                                          FROM users
                                          WHERE akshinak = '$author'";
                                        $sesresult=$conn->query($sesquery);
                                        $sesnum = mysqli_num_rows($sesresult);
                                        if($sesnum == 1){
                                                /* game -> table, interval, key for the API scheme helper.
                                                   start/end times are derived FROM THE PERIOD ID itself
                                                   (same scheme as the external API issueNumber), so the
                                                   countdown is always aligned to the true slot boundary
                                                   even if the cron created the row a few seconds late. */
                                                $wingoTypes = [
                                                        1  => ['table' => 'wingo_periods_1min',  'interval' => 60,  'intervalM' => 1,    'gk' => '1m'],
                                                        2  => ['table' => 'wingo_periods_3min',  'interval' => 180, 'intervalM' => 3,    'gk' => '3m'],
                                                        3  => ['table' => 'wingo_periods_5min',  'interval' => 300, 'intervalM' => 5,    'gk' => '5m'],
                                                        4  => ['table' => 'wingo_periods_30sec', 'interval' => 30,  'intervalM' => 0.50, 'gk' => '30s'],
                                                        30 => ['table' => 'wingo_periods_30sec', 'interval' => 30,  'intervalM' => 0.50, 'gk' => '30s'],
                                                        5  => ['table' => 'wingo_periods_10min', 'interval' => 600, 'intervalM' => 10,   'gk' => '10m'],
                                                ];
                                                if (isset($wingoTypes[$typeId])) {
                                                        $wt = $wingoTypes[$typeId];

                                                        /* === WINGO v4 SELF-HEAL (the +1 rule) ===
                                                           Make sure the OPEN period always exists and is
                                                           exactly latest settled period + 1: if the top
                                                           periods row expired (slot ended) or is already
                                                           settled, open the next period RIGHT NOW instead
                                                           of waiting for the cron. This keeps the countdown
                                                           running fast at every boundary for 30s/1m/3m/5m. */
                                                        if (function_exists('wingo_api_ensure_open_period')) {
                                                                $manualMap = [
                                                                        '30s' => 'wingo_manual_result_30sec',
                                                                        '1m'  => 'wingo_manual_result_1min',
                                                                        '3m'  => 'wingo_manual_result_3min',
                                                                        '5m'  => 'wingo_manual_result_5min',
                                                                        '10m' => 'wingo_manual_result_10min',
                                                                ];
                                                                wingo_api_ensure_open_period($conn, $wt['gk'], $wt['table'], $manualMap[$wt['gk']]);
                                                        }

                                                        $samasye = "SELECT atadaaidi, dinankavannuracisi
                                                          FROM `" . $wt['table'] . "`
                                                          ORDER BY kramasankhye DESC LIMIT 1";
                                                        $samasyephalitansa=$conn->query($samasye);
                                                        $samasyesreni = mysqli_fetch_array($samasyephalitansa);

                                                        $data['issueNumber'] = ($samasyesreni['atadaaidi'] ?? '');
                                                        $slotTimes = wingo_api_slot_times(($samasyesreni['atadaaidi'] ?? ''), $wt['interval'], $wt['gk']);
                                                        if ($slotTimes !== null) {
                                                                $data['startTime'] = date('Y-m-d H:i:s', $slotTimes['start']);
                                                                $data['endTime']   = date('Y-m-d H:i:s', $slotTimes['end']);
                                                        } else {
                                                                // unparseable id -> legacy behaviour: row time + interval
                                                                $data['startTime'] = ($samasyesreni['dinankavannuracisi'] ?? $shnunc);
                                                                $ondusamaya = strtotime('+' . $wt['interval'] . ' seconds', strtotime($data['startTime']));
                                                                $data['endTime'] = date('Y-m-d H:i:s', $ondusamaya);
                                                        }
                                                        $data['serviceTime'] = date('Y-m-d H:i:s');
                                                        $data['intervalM'] = $wt['intervalM'];
                                                }
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
