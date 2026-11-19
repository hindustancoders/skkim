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
                if (isset($shonupost['accountno']) && isset($shonupost['bankid']) && isset($shonupost['beneficiaryname']) && isset($shonupost['codeType']) && isset($shonupost['email']) && isset($shonupost['ifsccode']) && isset($shonupost['language']) && isset($shonupost['mobileno']) && isset($shonupost['random']) && isset($shonupost['signature']) && isset($shonupost['timestamp'])) {
                        $accountno = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['accountno']));
                        $bankid = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['bankid']));
                        $beneficiaryname = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['beneficiaryname']));
                        $codeType = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['codeType']));
                        $email = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['email']));
                        $ifsccode = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['ifsccode']));
                        $language = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['language']));
                        $mobileno = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['mobileno']));                 
                        $random = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['random']));
                        $signature = htmlspecialchars(mysqli_real_escape_string($conn, $shonupost['signature']));
                        $shonustr = '{"accountno":"'.$accountno.'","bankid":'.$bankid.',"beneficiaryname":"'.$beneficiaryname.'","codeType":'.$codeType.',"email":"'.$email.'","ifsccode":"'.$ifsccode.'","language":'.$language.',"mobileno":"'.$mobileno.'","random":"'.$random.'"}';                                                 
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
                                                /* resolve bank name from the LOCAL bank list
                                                   (no external API call — in.bdg05.shop is a
                                                   third-party host and fails silently, leaving
                                                   the bank name empty in the DB) */
                                                $bankName = '';
                                                $__bankListSrc = @file_get_contents(__DIR__ . '/GetBankList.php');
                                                if ($__bankListSrc && preg_match_all('/"banklist"\s*:\s*(\[.*?\])\s*\}/s', $__bankListSrc, $__bms)) {
                                                        $__allBanks = [];
                                                        foreach ($__bms[1] as $__blk) {
                                                                $__decoded = json_decode($__blk, true);
                                                                if (is_array($__decoded)) $__allBanks = array_merge($__allBanks, $__decoded);
                                                        }
                                                        foreach ($__allBanks as $__bank) {
                                                                if (isset($__bank['bankID']) && strval($__bank['bankID']) === strval($bankid)) {
                                                                        $bankName = $__bank['bankName'];
                                                                        break;
                                                                }
                                                        }
                                                }
                                                $shonuid = $data_auth['payload']['id'];
                                                
                                                $tathya = mysqli_query($conn,"INSERT INTO `user_withdraw_accounts` (`byabaharkarta`,`khatesankhye`,`khatakrama`,`phalanubhavi`,`kodprakara`,`daka`,`kod`,`khatehesaru`,`duravani`,`sthiti`) VALUES ('".$shonuid."','".$accountno."','".$bankid."','".$beneficiaryname."','".$codeType."','".$email."','".$ifsccode."','".$bankName."','".$mobileno."','1')");
                                                
                                                $res['data'] = null;
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
        
        mysqli_close($conn);
?>