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
                if (isset($shonupost['language']) || isset($shonupost['payTypeId']) || isset($shonupost['payid']) || isset($shonupost['random']) || isset($shonupost['signature']) || isset($shonupost['timestamp'])) {
                        $language = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['language'] ?? 'en'));
                        $payTypeId = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['payTypeId'] ?? '0'));
                        $payid = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['payid'] ?? '2'));
                        $random = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['random'] ?? ''));
                        $signature = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['signature'] ?? ''));
                        $shonustr = '{"language":'.$language.','.(isset($shonupost['payTypeId']) ? '"payTypeId":'.$payTypeId.',' : '').'"payid":'.$payid.',"random":"'.$random.'"}';
                        $shonusign = strtoupper(md5($shonustr));
                        if($shonusign == $signature){
                                $bearer = explode(" ", $_SERVER['HTTP_AUTHORIZATION'] ?? '');
                                $author = $bearer[1] ?? '';                             
                                $is_jwt_valid = is_jwt_valid($author);
                                $data_auth = json_decode($is_jwt_valid, 1);
                                if($data_auth['status'] === 'Success') {
                                        $sesquery = "SELECT akshinak
                                          FROM users
                                          WHERE akshinak = '$author'";
                                        $sesresult=$conn->query($sesquery);
                                        $sesnum = mysqli_num_rows($sesresult);
                                        if($sesnum == 1){
                                                $protocol = (!empty($_SERVER['HTTP_X_FORWARDED_PROTO'])) ? $_SERVER['HTTP_X_FORWARDED_PROTO'] : ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') ? 'https' : 'http');
                                                $host = !empty($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '';
                                                $sites = $protocol . '://' . $host;
                                                
                                                $data = [];
                                                if ($payid == 2 || $payid == 13 || $payid == 1) {
                                                        /* WatchPay Gateway Options - one channel per ACTIVE account (multi-account support).
                                                           Table watchpay_accounts: admin can add unlimited merchant accounts. */
                                                        $idx = 0;
                                                        $scopeStr = "100|200|500|1000|2000|5000|10000|50000";
                                                        $quickList = [
                                                                ["rechargeAmount" => 100.0, "giftAmount" => 0.0],
                                                                ["rechargeAmount" => 500.0, "giftAmount" => 0.0],
                                                                ["rechargeAmount" => 1000.0, "giftAmount" => 0.0],
                                                                ["rechargeAmount" => 2000.0, "giftAmount" => 0.0],
                                                                ["rechargeAmount" => 5000.0, "giftAmount" => 0.0],
                                                                ["rechargeAmount" => 10000.0, "giftAmount" => 0.0],
                                                                ["rechargeAmount" => 50000.0, "giftAmount" => 0.0],
                                                        ];
                                                        $acctRes = mysqli_query($conn, "SELECT * FROM watchpay_accounts WHERE status = 1 ORDER BY is_default DESC, id ASC");
                                                        if ($acctRes && mysqli_num_rows($acctRes) > 0) {
                                                                while ($acct = mysqli_fetch_assoc($acctRes)) {
                                                                        $data["rechargetypelist"][$idx]["payTypeID"] = 1023;
                                                                        $data["rechargetypelist"][$idx]["payID"] = (int)$payid;
                                                                        $data["rechargetypelist"][$idx]["payName"] = "WatchPay" . (mysqli_num_rows($acctRes) > 1 ? " " . $acct['account_name'] : " UPI");
                                                                        $data["rechargetypelist"][$idx]["paySysName"] = "Online Pay";
                                                                        $data["rechargetypelist"][$idx]["miniPrice"] = (int)$acct['min_payin'];
                                                                        $data["rechargetypelist"][$idx]["maxPrice"] = (int)$acct['max_payin'];
                                                                        $data["rechargetypelist"][$idx]["scope"] = $scopeStr;
                                                                        $data["rechargetypelist"][$idx]["paySendUrl"] = $sites . "/pay/watchpays?a=" . (int)$acct['id'];
                                                                        $data["rechargetypelist"][$idx]["parameters"] = '';
                                                                        $data["rechargetypelist"][$idx]["startTime"] = "00:00";
                                                                        $data["rechargetypelist"][$idx]["endTime"] = "24:00";
                                                                        $data["rechargetypelist"][$idx]["rechargeRifts"] = 0.00;
                                                                        $data["rechargetypelist"][$idx]["c2cUnitAmount"] = null;
                                                                        $data["rechargetypelist"][$idx]["quickConfig"] = "";
                                                                        $data["rechargetypelist"][$idx]["quickConfigList"] = $quickList;
                                                                        $data["rechargetypelist"][$idx]["random"] = 0.819226;
                                                                        $data["rechargetypelist"][$idx]["sort"] = 90000 - $idx;
                                                                        $idx++;
                                                                }
                                                        }
                                                        /* No active WatchPay account: channel intentionally hidden
                                                           (never show a dead gateway channel to users). */

                                                        /* QwackPay Gateway Options - one channel per ACTIVE account (multi-account support).
                                                           Table qwackpay_accounts: admin can add unlimited merchant accounts. */
                                                        $qkRes = mysqli_query($conn, "SELECT * FROM qwackpay_accounts WHERE status = 1 ORDER BY is_default DESC, id ASC");
                                                        if ($qkRes && mysqli_num_rows($qkRes) > 0) {
                                                                while ($qk = mysqli_fetch_assoc($qkRes)) {
                                                                        $data["rechargetypelist"][$idx]["payTypeID"] = 1024;
                                                                        $data["rechargetypelist"][$idx]["payID"] = (int)$payid;
                                                                        $data["rechargetypelist"][$idx]["payName"] = "QwackPay" . (mysqli_num_rows($qkRes) > 1 ? " " . $qk['account_name'] : " UPI");
                                                                        $data["rechargetypelist"][$idx]["paySysName"] = "Online Pay";
                                                                        $data["rechargetypelist"][$idx]["miniPrice"] = (int)$qk['min_payin'];
                                                                        $data["rechargetypelist"][$idx]["maxPrice"] = (int)$qk['max_payin'];
                                                                        $data["rechargetypelist"][$idx]["scope"] = $scopeStr;
                                                                        $data["rechargetypelist"][$idx]["paySendUrl"] = $sites . "/pay/qwackpays?a=" . (int)$qk['id'];
                                                                        $data["rechargetypelist"][$idx]["parameters"] = '';
                                                                        $data["rechargetypelist"][$idx]["startTime"] = "00:00";
                                                                        $data["rechargetypelist"][$idx]["endTime"] = "24:00";
                                                                        $data["rechargetypelist"][$idx]["rechargeRifts"] = 0.00;
                                                                        $data["rechargetypelist"][$idx]["c2cUnitAmount"] = null;
                                                                        $data["rechargetypelist"][$idx]["quickConfig"] = "";
                                                                        $data["rechargetypelist"][$idx]["quickConfigList"] = $quickList;
                                                                        $data["rechargetypelist"][$idx]["random"] = 0.819227;
                                                                        $data["rechargetypelist"][$idx]["sort"] = 89000 - $idx;
                                                                        $idx++;
                                                                }
                                                        }
                                                } elseif ($payid == 11) {
                                                        // USDT Option
                                                        $data["rechargetypelist"][0]["payTypeID"] = 2123;
                                                        $data["rechargetypelist"][0]["payID"] = 11;
                                                        $data["rechargetypelist"][0]["payName"] = "UPAY-USDT";
                                                        $data["rechargetypelist"][0]["paySysName"] = "825";
                                                        $data["rechargetypelist"][0]["miniPrice"] = 10;
                                                        $data["rechargetypelist"][0]["maxPrice"] = 50000;
                                                        $data["rechargetypelist"][0]["scope"] = "10|20|50|100|200|500|1000";
                                                        $data["rechargetypelist"][0]["paySendUrl"] = $sites . "/pay/usdt";
                                                        $data["rechargetypelist"][0]["parameters"] = '';
                                                        $data["rechargetypelist"][0]["startTime"] = "00:00";
                                                        $data["rechargetypelist"][0]["endTime"] = "24:00";
                                                        $data["rechargetypelist"][0]["rechargeRifts"] = 0.02;
                                                        $data["rechargetypelist"][0]["c2cUnitAmount"] = null;
                                                        $data["rechargetypelist"][0]["quickConfig"] = "";
                                                        $data["rechargetypelist"][0]["quickConfigList"] = [
                                                                ["rechargeAmount" => 10.0, "giftAmount" => 0.0],
                                                                ["rechargeAmount" => 20.0, "giftAmount" => 0.0],
                                                                ["rechargeAmount" => 50.0, "giftAmount" => 0.0],
                                                                ["rechargeAmount" => 100.0, "giftAmount" => 0.0],
                                                                ["rechargeAmount" => 500.0, "giftAmount" => 0.0],
                                                                ["rechargeAmount" => 1000.0, "giftAmount" => 0.0],
                                                        ];
                                                        $data["rechargetypelist"][0]["random"] = 0.758493;
                                                        $data["rechargetypelist"][0]["sort"] = 95000;
                                                }
                                                
                                                $data['banklist'] = null;
                                                $data['localUsdtlist'] = null;
                                                $data['thirdPayBankList'] = null;
                                                                                                
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
