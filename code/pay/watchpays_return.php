<?php
/**
 * WatchPay browser return handler (page_url - synchronous redirect)
 * User lands here after completing payment. Payment status is ALWAYS
 * confirmed by the async callback (notify_url), never by this page.
 */
require_once(__DIR__ . "/watchpay_lib.php");
watchpay_log("Payin browser return (page_url)", array('GET' => $_GET, 'POST' => $_POST));
header("Location: /#/wallet/RechargeHistory");
exit;
