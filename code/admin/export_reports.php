<?php
session_start();
if (empty($_SESSION['unohs'])) {
    header("location:index.php?msg=unauthorized");
    exit;
}
include("conn.php");
require_once(__DIR__ . "/../pay/watchpay_lib.php"); /* admin_audit_log */

/* CSV export: type=users|deposits|withdrawals */
$type = $_GET['type'] ?? '';
if ($type !== '') {
    header('Content-Type: text/csv; charset=utf-8');
    $stamp = date('Ymd_His');
    header("Content-Disposition: attachment; filename=export_{$type}_{$stamp}.csv");
    $out = fopen('php://output', 'w');

    if ($type === 'users') {
        fputcsv($out, array('id', 'mobile', 'invite_code', 'status', 'registered', 'wallet_balance', 'bonus'));
        $res = mysqli_query($conn, "SELECT u.id, u.mobile, u.codechorkamukala, u.status, u.createdate, w.motta, w.bonus
            FROM users u LEFT JOIN user_wallets w ON w.balakedara = u.id ORDER BY u.id ASC");
        while ($r = mysqli_fetch_row($res)) fputcsv($out, $r);
        admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', 'export_users_csv', '');
    } elseif ($type === 'deposits') {
        fputcsv($out, array('id', 'user_id', 'amount', 'order_no', 'gateway', 'gateway_order', 'status', 'created'));
        $res = mysqli_query($conn, "SELECT shonu, balakedara, motta, dharavahi, mula, ullekha, sthiti, dinankavannuracisi FROM deposits ORDER BY shonu DESC LIMIT 5000");
        while ($r = mysqli_fetch_row($res)) fputcsv($out, $r);
        admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', 'export_deposits_csv', '');
    } elseif ($type === 'withdrawals') {
        fputcsv($out, array('id', 'user_id', 'amount', 'serial', 'status', 'remark', 'updated'));
        $res = mysqli_query($conn, "SELECT shonu, balakedara, motta, dharavahi, sthiti, tike, dinankavannuracisi FROM withdraw_requests ORDER BY shonu DESC LIMIT 5000");
        while ($r = mysqli_fetch_row($res)) fputcsv($out, $r);
        admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', 'export_withdrawals_csv', '');
    } else {
        fputcsv($out, array('error', 'unknown type'));
    }
    fclose($out);
    exit;
}

include("navtop.php");
?>
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title" style="font-weight:bold;">
                                <i class="fa fa-download"></i> Export Reports (CSV)
                                <small class="text-muted d-block">Download operational data for accounting / review</small>
                            </h4>
                            <div class="row mt-3">
                                <div class="col-md-4">
                                    <div class="card text-center p-4">
                                        <i class="fa fa-users fa-2x text-primary mb-2"></i>
                                        <h5>Users</h5>
                                        <p class="text-muted">Full user list with wallet balances</p>
                                        <a href="export_reports.php?type=users" class="btn btn-gradient-primary"><i class="fa fa-download"></i> Download CSV</a>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card text-center p-4">
                                        <i class="fa fa-arrow-down fa-2x text-success mb-2"></i>
                                        <h5>Deposits</h5>
                                        <p class="text-muted">All recharge orders and statuses</p>
                                        <a href="export_reports.php?type=deposits" class="btn btn-gradient-success"><i class="fa fa-download"></i> Download CSV</a>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card text-center p-4">
                                        <i class="fa fa-arrow-up fa-2x text-danger mb-2"></i>
                                        <h5>Withdrawals</h5>
                                        <p class="text-muted">All payout requests and statuses</p>
                                        <a href="export_reports.php?type=withdrawals" class="btn btn-gradient-danger"><i class="fa fa-download"></i> Download CSV</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<?php include("navfoot.php"); ?>
