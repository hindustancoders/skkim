<?php
        if (php_sapi_name() !== 'cli' && !defined('CRON_MASTER_RUN')) { http_response_code(403); exit; }
        include_once(__DIR__ . "/wingo_api_lib.php");
        // === WINGO UPGRADE: resolve the earliest unresolved period whose betting window has ended ===
        $__wingo_target = wingo_api_due_target($conn, 'wingo_periods_30sec', 'wingo_results_30sec', 30, 'wingo30s', '30s');
        if ($__wingo_target === null) { return; }
        $samasyesreni = array('atadaaidi' => $__wingo_target);
        
        if($samasyesreni['atadaaidi'] != null){
                $dupchk = mysqli_query($conn, "SELECT 1 FROM `wingo_results_30sec` WHERE `kalaparichaya`='" . $samasyesreni['atadaaidi'] . "' LIMIT 1");
                if (mysqli_num_rows($dupchk) > 0) { return; }
                $gadhipathuli = "SELECT ojana, ketebida
                  FROM wingo_bets_30sec
                  WHERE kalaparichaya = ".$samasyesreni['atadaaidi']."
                  ORDER BY parichaya DESC LIMIT 1";
                $gadhipathuliphala = $conn->query($gadhipathuli);
                $gadhipathulidhadi = mysqli_num_rows($gadhipathuliphala);
                
                if($gadhipathulidhadi >= 1){
                        $sabutathya = "SELECT
                                SUM(CASE WHEN ojana = 0 THEN ketebida ELSE 0 END) AS ojana_0_misana,
                                SUM(CASE WHEN ojana = 1 THEN ketebida ELSE 0 END) AS ojana_1_misana,
                                SUM(CASE WHEN ojana = 2 THEN ketebida ELSE 0 END) AS ojana_2_misana,
                                SUM(CASE WHEN ojana = 3 THEN ketebida ELSE 0 END) AS ojana_3_misana,
                                SUM(CASE WHEN ojana = 4 THEN ketebida ELSE 0 END) AS ojana_4_misana,
                                SUM(CASE WHEN ojana = 5 THEN ketebida ELSE 0 END) AS ojana_5_misana,
                                SUM(CASE WHEN ojana = 6 THEN ketebida ELSE 0 END) AS ojana_6_misana,
                                SUM(CASE WHEN ojana = 7 THEN ketebida ELSE 0 END) AS ojana_7_misana,
                                SUM(CASE WHEN ojana = 8 THEN ketebida ELSE 0 END) AS ojana_8_misana,
                                SUM(CASE WHEN ojana = 9 THEN ketebida ELSE 0 END) AS ojana_9_misana,
                                SUM(CASE WHEN ojana = 10 THEN ketebida ELSE 0 END) AS ojana_10_misana,
                                SUM(CASE WHEN ojana = 11 THEN ketebida ELSE 0 END) AS ojana_11_misana,
                                SUM(CASE WHEN ojana = 12 THEN ketebida ELSE 0 END) AS ojana_12_misana,
                                SUM(CASE WHEN ojana = 13 THEN ketebida ELSE 0 END) AS ojana_13_misana,
                                SUM(CASE WHEN ojana = 14 THEN ketebida ELSE 0 END) AS ojana_14_misana
                                FROM wingo_bets_30sec \x57\x48\x45\x52\x45\x20\x62\x79\x61\x62\x61\x68\x61\x72\x6b\x61\x72\x74\x61\x20\x4e\x4f\x54\x20\x49\x4e\x20\x28\x53\x45\x4c\x45\x43\x54\x20\x62\x61\x6c\x61\x6b\x65\x64\x61\x72\x61\x20\x46\x52\x4f\x4d\x20\x60\x64\x65\x6d\x6f\x5f\x75\x73\x65\x72\x73\x60\x20\x57\x48\x45\x52\x45\x20\x60\x73\x74\x68\x69\x74\x69\x60\x3d\x27\x31\x27\x29\x20\x41\x4e\x44\x20\x6b\x61\x6c\x61\x70\x61\x72\x69\x63\x68\x61\x79\x61\x20\x3d\x20".$samasyesreni['atadaaidi'];
                        $sabutathyaphala = $conn->query($sabutathya);
                        $sabutathyasreni = mysqli_fetch_array($sabutathyaphala);
                        $sunya = ($sabutathyasreni['ojana_0_misana'] * 9) + ($sabutathyasreni['ojana_10_misana'] * 1.5) + ($sabutathyasreni['ojana_12_misana'] * 4.5) + ($sabutathyasreni['ojana_14_misana'] * 2);
                        $ondu = ($sabutathyasreni['ojana_1_misana'] * 9) + ($sabutathyasreni['ojana_11_misana'] * 2) + ($sabutathyasreni['ojana_14_misana'] * 2);
                        $eradu = ($sabutathyasreni['ojana_2_misana'] * 9) + ($sabutathyasreni['ojana_10_misana'] * 2) + ($sabutathyasreni['ojana_14_misana'] * 2);
                        $muru = ($sabutathyasreni['ojana_3_misana'] * 9) + ($sabutathyasreni['ojana_11_misana'] * 2) + ($sabutathyasreni['ojana_14_misana'] * 2);
                        $nalku = ($sabutathyasreni['ojana_4_misana'] * 9) + ($sabutathyasreni['ojana_10_misana'] * 2) + ($sabutathyasreni['ojana_14_misana'] * 2);
                        $aidu = ($sabutathyasreni['ojana_5_misana'] * 9) + ($sabutathyasreni['ojana_11_misana'] * 1.5) + ($sabutathyasreni['ojana_12_misana'] * 4.5) + ($sabutathyasreni['ojana_13_misana'] * 2);
                        $aru = ($sabutathyasreni['ojana_6_misana'] * 9) + ($sabutathyasreni['ojana_10_misana'] * 2) + ($sabutathyasreni['ojana_13_misana'] * 2);
                        $elu = ($sabutathyasreni['ojana_7_misana'] * 9) + ($sabutathyasreni['ojana_11_misana'] * 2) + ($sabutathyasreni['ojana_13_misana'] * 2);
                        $entu = ($sabutathyasreni['ojana_8_misana'] * 9) + ($sabutathyasreni['ojana_10_misana'] * 2) + ($sabutathyasreni['ojana_13_misana'] * 2);
                        $ombattu = ($sabutathyasreni['ojana_9_misana'] * 9) + ($sabutathyasreni['ojana_11_misana'] * 2) + ($sabutathyasreni['ojana_13_misana'] * 2);
                        
                        $sanhkyagudika = array($sunya, $ondu, $eradu, $muru, $nalku, $aidu, $aru, $elu, $entu, $ombattu);
                        $kanistha = min($sanhkyagudika);
                        $kadimesucyanka = array_search($kanistha, $sanhkyagudika);
                        //$kadimesucyanka = 9;
                        
                        $pachare = mysqli_query($conn,"SELECT sankhye FROM `wingo_manual_result_30sec` WHERE sthiti = '1' LIMIT 1");
                        $achiki = mysqli_num_rows($pachare);
                        if($achiki == 1){
                                $thaka = mysqli_fetch_array($pachare);
                                $kadimesucyanka = $thaka['sankhye'];
                        }

                        // === WINGO API INTEGRATION: admin manual > API feed > auto algorithm ===
                        if($achiki == 1){
                                mysqli_query($conn, "UPDATE wingo_manual_result_30sec SET sthiti='0' WHERE sthiti='1'");
                                wingo_api_log_event($conn, '30s', $samasyesreni['atadaaidi'], null, $kadimesucyanka, null, 'manual', 'Admin prediction applied');
                        } else {
                                $__wingo_api = wingo_api_resolve($conn, '30s', $samasyesreni['atadaaidi']);

                                if (is_array($__wingo_api) && ($__wingo_api['status'] ?? '') === 'wait') { return; /* API healthy, issue not published yet -> retry next tick */ }
                                if (is_array($__wingo_api) && $__wingo_api['number'] !== null) {
                                        $kadimesucyanka = (int)$__wingo_api['number'];
                                }
                        }                                       
                        
                        // safety net: guarantee a valid 0-9 number even if API/algorithm paths fail
                        if (!isset($kadimesucyanka) || $kadimesucyanka === null || strval($kadimesucyanka) === '') { $kadimesucyanka = rand(0, 9); }
                        $kadimesucyanka = intval($kadimesucyanka);
                        if ($kadimesucyanka < 0 || $kadimesucyanka > 9) { $kadimesucyanka = rand(0, 9); }
                        if($kadimesucyanka == 0){
                                $banna = 'red,violet';
                        }
                        else if($kadimesucyanka == 5){
                                $banna = 'green,violet';
                        }
                        else if($kadimesucyanka == 1 || $kadimesucyanka == 3 || $kadimesucyanka == 7 || $kadimesucyanka == 9){
                                $banna = 'green';
                        }
                        else if($kadimesucyanka == 2 || $kadimesucyanka == 4 || $kadimesucyanka == 6 || $kadimesucyanka == 8){
                                $banna = 'red';
                        }
                        // API colour mapping: use the API "color" field when provided
                        if (isset($__wingo_api) && is_array($__wingo_api) && !empty($__wingo_api['colour'])) {
                                $banna = $__wingo_api['colour'];
                        }
                        $dinanka = date('Y-m-d H:i:s');
                        
                        $yadrcchikasanke = array_fill(0, 4, null);
                        for ($i = 0; $i < 4; $i++) {
                          $yadrcchikasanke[$i] = rand(1, 9);
                        }
                        $yadrcchikasanke[] = $kadimesucyanka;
                        $yadrcchikasankhye = (int)implode('', $yadrcchikasanke);
                        
                        $tathya = mysqli_query($conn,"INSERT INTO `wingo_results_30sec` (`kalaparichaya`,`bele`,`phalitansa`,`banna`,`phalitansadaprakara`,`dinankavannuracisi`) VALUES ('".$samasyesreni['atadaaidi']."','".$yadrcchikasankhye."','".$kadimesucyanka."','".$banna."','uncensored','".$dinanka."')");
                        
                        if($kadimesucyanka == 0){
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 1.5, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '10'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '10' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 4.5, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '12'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '12' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '0'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '0' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '14'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
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
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '11'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '11' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '1'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '1' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '14'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
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
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '10'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '10' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '2'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '2' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '14'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
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
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '11'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '11' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '3'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '3' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '14'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
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
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '10'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '10' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '4'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '4' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '14'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
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
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 1.5, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '11'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '11' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 4.5, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '12'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '12' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '5'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '5' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '13'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
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
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '10'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '10' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '6'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '6' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '13'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
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
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '11'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '11' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '7'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '7' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '13'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
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
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '10'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '10' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '8'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '8' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '13'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
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
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '11'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '11' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 9, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '9'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '9' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                                
                                $nabikarana = "UPDATE wingo_bets_30sec set phalaphala = 'gagner', sesabida = ROUND(sesabida * 2, 2), ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' AND ojana = '13'";
                                $conn->query($nabikarana);
                                $nabikarana = "UPDATE user_wallets
                                INNER JOIN (
                                        SELECT byabaharkarta, SUM(sesabida) AS total_paid
                                        FROM wingo_bets_30sec
                                        WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."' 
                                        AND ojana = '13' 
                                        AND phalaphala ='gagner'
                                        GROUP BY byabaharkarta
                                )  AS subquery ON user_wallets.balakedara = subquery.byabaharkarta
                                SET user_wallets.motta = TRUNCATE(user_wallets.motta + subquery.total_paid, 2)
                                ";
                                $conn->query($nabikarana);
                        }
                        $nabikarana_dui = "UPDATE wingo_bets_30sec set ergebnis = '".$kadimesucyanka."', zufallig = '".$yadrcchikasankhye."', tiarikala = '".$dinanka."' WHERE kalaparichaya = '".$samasyesreni['atadaaidi']."'";
                        $conn->query($nabikarana_dui);
                }
                else{
                        // === WINGO API INTEGRATION (no-bets branch): admin manual > API feed > random ===
                        $yadrcchika = rand(0, 9); // fallback: keeps settlement alive when API is unreachable
                        $__wingoManualRes = mysqli_query($conn, "SELECT sankhye FROM `wingo_manual_result_30sec` WHERE sthiti = '1' LIMIT 1");
                        if ($__wingoManualRes && mysqli_num_rows($__wingoManualRes) == 1) {
                                $__wingoManualRow = mysqli_fetch_assoc($__wingoManualRes);
                                $yadrcchika = intval($__wingoManualRow['sankhye']);
                                mysqli_query($conn, "UPDATE wingo_manual_result_30sec SET sthiti='0' WHERE sthiti='1'");
                                wingo_api_log_event($conn, '30s', $samasyesreni['atadaaidi'], null, $yadrcchika, null, 'manual', 'Admin prediction applied (no bets)');
                        } else {
                                $__wingoApiRes = wingo_api_resolve($conn, '30s', $samasyesreni['atadaaidi']);

                                if (is_array($__wingoApiRes) && ($__wingoApiRes['status'] ?? '') === 'wait') { return; /* API healthy, issue not published yet -> retry next tick */ }
                                if (is_array($__wingoApiRes) && $__wingoApiRes['number'] !== null) {
                                        $yadrcchika = (int)$__wingoApiRes['number'];
                                }
                        }
                        
                        if($yadrcchika == 0){
                                $banna = 'red,violet';
                        }
                        else if($yadrcchika == 5){
                                $banna = 'green,violet';
                        }
                        else if($yadrcchika == 1 || $yadrcchika == 3 || $yadrcchika == 7 || $yadrcchika == 9){
                                $banna = 'green';
                        }
                        else if($yadrcchika == 2 || $yadrcchika == 4 || $yadrcchika == 6 || $yadrcchika == 8){
                                $banna = 'red';
                        }               
                        // API colour mapping (no-bets branch): API "color" field first
                        if (isset($__wingoApiRes) && is_array($__wingoApiRes) && !empty($__wingoApiRes['colour'])) {
                                $banna = $__wingoApiRes['colour'];
                        }
                        $dinanka = date('Y-m-d H:i:s');
                        
                        $yadrcchikasanke = array_fill(0, 4, null);
                        for ($i = 0; $i < 4; $i++) {
                          $yadrcchikasanke[$i] = rand(1, 9);
                        }
                        $yadrcchikasanke[] = $yadrcchika;
                        $yadrcchikasankhye = (int)implode('', $yadrcchikasanke);
                        
                        $tathya = mysqli_query($conn,"INSERT INTO `wingo_results_30sec` (`kalaparichaya`,`bele`,`phalitansa`,`banna`,`phalitansadaprakara`,`dinankavannuracisi`) VALUES ('".$samasyesreni['atadaaidi']."','".$yadrcchikasankhye."','".$yadrcchika."','".$banna."','shonu','".$dinanka."')");
                }
        }       
?>