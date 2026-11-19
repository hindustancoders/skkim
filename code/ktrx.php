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
include("trxupkid.php");	    
	
$currentDate = date('Ymd');
$timeInSeconds = time() % 86400; 
$sequenceNumber = intval($timeInSeconds / 60); 
$uniqueSequence = str_pad($sequenceNumber, 4, '0', STR_PAD_LEFT); 
$bartamankalakrama = $currentDate . "10301" . $uniqueSequence;
$bartamankalakrama = $bartamankalakrama + 1;

$prathama = $bartamankalakrama; 
$sesa = $currentDate . "10001" . sprintf("%04d", ceil(86400 / 60)); 


$tarika = date('Y-m-d H:i:s');
	
	$dekhakalakrama = mysqli_query($conn,"select atadaaidi from `trx_wingo_periods_1min` order by kramasankhye desc limit 1");
	$kaladhadi = mysqli_num_rows($dekhakalakrama);
	$kalakramadhadi=mysqli_fetch_array($dekhakalakrama);
	
	if($kaladhadi == null){
		$tathya = mysqli_query($conn,"INSERT INTO `trx_wingo_periods_1min` (`atadaaidi`,`dinankavannuracisi`) VALUES ('".$bartamankalakrama."','".$tarika."')");
	}
	else if($prathama > $kalakramadhadi['atadaaidi']){
		$katiba=mysqli_query($conn,"TRUNCATE TABLE `trx_wingo_periods_1min`");
		//$truncateQuery=mysqli_query($con,"TRUNCATE TABLE `abracadabra`");
		$tathya = mysqli_query($conn,"INSERT INTO `trx_wingo_periods_1min` (`atadaaidi`,`dinankavannuracisi`) VALUES ('".$prathama."','".$tarika."')");
	}
	else{
		$parabartikrama = $kalakramadhadi['atadaaidi'] + 1;
		$tathya = mysqli_query($conn,"INSERT INTO `trx_wingo_periods_1min` (`atadaaidi`,`dinankavannuracisi`) VALUES ('".$parabartikrama."','".$tarika."')");
	}
	
	//$safa_shonu = mysqli_query($conn,"UPDATE wingo_manual_result_1min SET sthiti='0'");
?>