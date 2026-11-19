<?php
session_start();
if (empty($_SESSION['unohs'])) {
    header("location:index.php?msg=unauthorized");
    exit;
}
date_default_timezone_set("Asia/Kolkata");
include("conn.php");

/* libraries for audit log + both gateways */
require_once(__DIR__ . "/../pay/watchpay_lib.php");
require_once(__DIR__ . "/../pay/watchpay_actions.php");
require_once(__DIR__ . "/../pay/qwackpay_lib.php");
require_once(__DIR__ . "/../pay/qwackpay_actions.php");

$msg = '';
$gateway = ($_POST['gateway'] ?? ($_GET['gateway'] ?? 'watchpay')) === 'qwackpay' ? 'qwackpay' : 'watchpay';
$gLabel = $gateway === 'qwackpay' ? 'QwackPay' : 'WatchPay';

/* Actions */
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $act = $_POST['act'] ?? '';

    if ($act === 'pay') {
        $withdrawId = intval($_POST['withdraw_id']);
        $accountId = intval($_POST['account_id']);
        $ifsc = trim($_POST['ifsc'] ?? '');
        $apiOut = $gateway === 'qwackpay'
            ? qwackpay_action_payout($conn, $withdrawId, $accountId, $ifsc)
            : watchpay_action_payout($conn, $withdrawId, $accountId, $ifsc);
        $msg = $apiOut['ok']
            ? "Payout created: status=<b>{$apiOut['status']}</b>" . (!empty($apiOut['tradeNo']) ? " tradeNo={$apiOut['tradeNo']}" : "") . (!empty($apiOut['fee']) ? " (fee {$apiOut['fee']})" : "")
            : "Payout failed: " . ($apiOut['msg'] ?? 'unknown');
        admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', $gateway . '_payout_create', "withdraw=$withdrawId acct=$accountId status=" . ($apiOut['status'] ?? ''));
    } elseif ($act === 'sync') {
        $apiOut = $gateway === 'qwackpay' ? qwackpay_action_sync($conn) : watchpay_action_sync($conn);
        $msg = "Synced {$apiOut['checked']} orders, updated {$apiOut['updated']}.";
        admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', $gateway . '_payout_sync', json_encode($apiOut));
    } elseif ($act === 'query') {
        $payoutId = intval($_POST['payout_id']);
        $rowRes = mysqli_query($conn, "SELECT gateway FROM payout_orders WHERE id = $payoutId LIMIT 1");
        $row = mysqli_fetch_assoc($rowRes);
        $pgw = ($row && $row['gateway'] === 'qwackpay') ? 'qwackpay' : 'watchpay';
        $apiOut = $pgw === 'qwackpay' ? qwackpay_action_query($conn, $payoutId) : watchpay_action_query($conn, $payoutId);
        $msg = $apiOut['ok'] ? "Query OK - status=<b>{$apiOut['status']}</b>" : "Query failed: " . ($apiOut['msg'] ?? '');
    } elseif ($act === 'markpaid') {
        /* Manual fallback: mark withdraw as paid locally (no gateway call) */
        $wid = intval($_POST['withdraw_id']);
        $today = date('Y-m-d H:i:s');
        mysqli_query($conn, "UPDATE withdraw_requests SET sthiti=1, tike='Completed', remarks=CONCAT(remarks,' [manual mark paid]'), dinankavannuracisi='$today' WHERE shonu='$wid' AND sthiti IN ('0','3')");
        admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', 'withdraw_manual_mark_paid', "withdraw=$wid");
        $msg = "Withdrawal #$wid marked as completed manually.";
    }
}

/* accounts for the ACTIVE gateway only */
$accounts = mysqli_query($conn, $gateway === 'qwackpay'
    ? "SELECT * FROM qwackpay_accounts WHERE status=1 ORDER BY is_default DESC, id ASC"
    : "SELECT * FROM watchpay_accounts WHERE status=1 ORDER BY is_default DESC, id ASC");
$payouts = mysqli_query($conn, "SELECT po.*, u.mobile FROM payout_orders po LEFT JOIN users u ON u.id = po.user_id ORDER BY po.id DESC LIMIT 100");

/* pending withdrawals (Applied or Processing) */
$pending = mysqli_query($conn, "SELECT w.*, u.mobile, b.account AS bank_account, b.name AS bank_name
    FROM withdraw_requests w
    LEFT JOIN users u ON u.id = w.balakedara
    LEFT JOIN user_bankcards b ON b.id = w.khateshonu
    WHERE w.sthiti IN ('0','3')
    ORDER BY w.shonu DESC LIMIT 100");

include("navtop.php");
?>

            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title" style="font-weight:bold;">
                                <i class="fa fa-paper-plane"></i> <?php echo $gLabel; ?> Payouts
                                <small class="text-muted d-block">Send withdrawals to user bank accounts via the <?php echo $gLabel; ?> gateway and track them</small>
                            </h4>

                            <ul class="nav nav-tabs mb-3">
                                <li class="nav-item"><a class="nav-link <?php echo $gateway === 'watchpay' ? 'active' : ''; ?>" href="?gateway=watchpay"><i class="fa fa-credit-card"></i> WatchPay</a></li>
                                <li class="nav-item"><a class="nav-link <?php echo $gateway === 'qwackpay' ? 'active' : ''; ?>" href="?gateway=qwackpay"><i class="fa fa-university"></i> QwackPay</a></li>
                            </ul>

                            <?php if ($msg): ?>
                                <div class="alert alert-info alert-dismissible fade show" role="alert">
                                    <?php echo $msg; ?>
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                </div>
                            <?php endif; ?>

                            <!-- Pending withdrawals -->
                            <h5 class="mt-2">Pending Withdrawals (Applied / Processing)</h5>
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped" id="example1">
                                    <thead style="background:#1a2e5a;color:#fff;">
                                        <tr>
                                            <th>ID</th><th>User</th><th>Amount</th><th>Bank Account</th><th>Holder</th><th>Status</th><th>Requested</th><th>Pay via <?php echo $gLabel; ?></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php $hasAccounts = $accounts && mysqli_num_rows($accounts) > 0; while ($w = mysqli_fetch_assoc($pending)): ?>
                                        <tr>
                                            <td><?php echo $w['shonu']; ?></td>
                                            <td><?php echo htmlspecialchars($w['mobile'] ?? ('#' . $w['balakedara'])); ?></td>
                                            <td><?php echo $w['motta']; ?></td>
                                            <td><?php echo htmlspecialchars($w['bank_account'] ?? '-'); ?></td>
                                            <td><?php echo htmlspecialchars($w['bank_name'] ?? '-'); ?></td>
                                            <td><?php echo $w['sthiti'] == 0 ? '<span class="badge badge-warning">Applied</span>' : '<span class="badge badge-info">Processing</span>'; ?></td>
                                            <td><?php echo $w['dinankavannuracisi']; ?></td>
                                            <td style="white-space:nowrap;">
                                                <?php if ($w['sthiti'] == 0): ?>
                                                <?php if ($hasAccounts): ?>
                                                <form method="post" style="display:inline-flex; align-items:center; gap:4px;" onsubmit="return confirm('Create <?php echo $gLabel; ?> payout for withdrawal #<?php echo $w['shonu']; ?> (amount <?php echo $w['motta']; ?>)?');">
                                                    <input type="hidden" name="act" value="pay">
                                                    <input type="hidden" name="gateway" value="<?php echo $gateway; ?>">
                                                    <input type="hidden" name="withdraw_id" value="<?php echo $w['shonu']; ?>">
                                                    <select name="account_id" class="form-control form-control-sm" style="width:auto;">
                                                        <?php mysqli_data_seek($accounts, 0); while ($a = mysqli_fetch_assoc($accounts)): ?>
                                                        <option value="<?php echo $a['id']; ?>"><?php echo htmlspecialchars($a['account_name']); ?></option>
                                                        <?php endwhile; ?>
                                                    </select>
                                                    <input name="ifsc" class="form-control form-control-sm" placeholder="IFSC (India)" style="width:130px;">
                                                    <button class="btn btn-gradient-primary btn-sm"><i class="fa fa-paper-plane"></i> Pay</button>
                                                </form>
                                                <?php else: ?>
                                                <span class="badge badge-secondary">No active account</span>
                                                <?php endif; ?>
                                                <form method="post" style="display:inline;" onsubmit="return confirm('Mark this withdrawal as paid manually?');">
                                                    <input type="hidden" name="act" value="markpaid">
                                                    <input type="hidden" name="withdraw_id" value="<?php echo $w['shonu']; ?>">
                                                    <button class="btn btn-success btn-sm" title="Manual mark paid"><i class="fa fa-check"></i></button>
                                                </form>
                                                <?php else: ?>
                                                <span class="text-muted">awaiting gateway</span>
                                                <?php endif; ?>
                                            </td>
                                        </tr>
                                    <?php endwhile; ?>
                                    </tbody>
                                </table>
                            </div>

                            <hr>
                            <div class="d-flex align-items-center">
                                <h5>Payout Orders (last 100)</h5>
                                <form method="post" class="ml-3">
                                    <input type="hidden" name="act" value="sync">
                                    <input type="hidden" name="gateway" value="<?php echo $gateway; ?>">
                                    <button class="btn btn-outline-primary btn-sm"><i class="fa fa-refresh"></i> Sync <?php echo $gLabel; ?> statuses</button>
                                </form>
                            </div>
                            <div class="table-responsive mt-2">
                                <table class="table table-bordered">
                                    <thead style="background:#1a2e5a;color:#fff;">
                                        <tr>
                                            <th>GW</th><th>ID</th><th>Withdraw</th><th>User</th><th>Amount</th><th>Mch Transfer ID</th><th>Trade No</th><th>Receiver</th><th>Status</th><th>Updated</th><th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php while ($p = mysqli_fetch_assoc($payouts)): ?>
                                        <tr>
                                            <td><span class="badge badge-dark"><?php echo htmlspecialchars($p['gateway'] ?? 'watchpay'); ?></span></td>
                                            <td><?php echo $p['id']; ?></td>
                                            <td><?php echo $p['withdraw_id']; ?></td>
                                            <td><?php echo htmlspecialchars($p['mobile'] ?? ('#' . $p['user_id'])); ?></td>
                                            <td><?php echo $p['amount']; ?></td>
                                            <td style="font-size:11px;"><?php echo htmlspecialchars($p['mch_transfer_id']); ?></td>
                                            <td><?php echo htmlspecialchars($p['trade_no']); ?></td>
                                            <td><?php echo htmlspecialchars($p['receive_name']); ?></td>
                                            <td>
                                                <?php
                                                $badge = array('success' => 'badge-success', 'fail' => 'badge-danger', 'rejected' => 'badge-danger', 'applied' => 'badge-warning', 'processing' => 'badge-info', 'created' => 'badge-secondary', 'failed' => 'badge-danger');
                                                echo '<span class="badge ' . ($badge[$p['status']] ?? 'badge-secondary') . '">' . htmlspecialchars($p['status']) . '</span>';
                                                ?>
                                            </td>
                                            <td><?php echo $p['updated_at']; ?></td>
                                            <td>
                                                <form method="post" onsubmit="return true;">
                                                    <input type="hidden" name="act" value="query">
                                                    <input type="hidden" name="payout_id" value="<?php echo $p['id']; ?>">
                                                    <button class="btn btn-outline-info btn-sm"><i class="fa fa-search"></i> Query</button>
                                                </form>
                                            </td>
                                        </tr>
                                    <?php endwhile; ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<?php include("navfoot.php"); ?>
