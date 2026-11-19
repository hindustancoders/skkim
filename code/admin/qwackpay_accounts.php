<?php
session_start();
if (empty($_SESSION['unohs'])) {
    header("location:index.php?msg=unauthorized");
    exit;
}
date_default_timezone_set("Asia/Kolkata");
include("conn.php");
include_once("../pay/qwackpay_lib.php");

$msg = '';
$edit = null;

/* ---------------- Handle actions ---------------- */
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $act = $_POST['act'] ?? '';

    if ($act === 'save') {
        $id = intval($_POST['id'] ?? 0);
        $vals = array(
            'account_name' => mysqli_real_escape_string($conn, trim($_POST['account_name'] ?? '')),
            'merchant_id'  => mysqli_real_escape_string($conn, trim($_POST['merchant_id'] ?? '')),
            'api_key'      => mysqli_real_escape_string($conn, trim($_POST['api_key'] ?? '')),
            'base_url'     => mysqli_real_escape_string($conn, trim($_POST['base_url'] ?? '')),
        );
        if ($vals['base_url'] === '') $vals['base_url'] = 'https://qwackpay.com/api/v1';

        $payinFee = floatval($_POST['payin_fee_percent'] ?? 8);
        $payoutFee = floatval($_POST['payout_fee_percent'] ?? 3);
        $payoutFlat = floatval($_POST['payout_fee_flat'] ?? 6);
        $minPayin = floatval($_POST['min_payin'] ?? 100);
        $maxPayin = floatval($_POST['max_payin'] ?? 100000);
        $minPayout = floatval($_POST['min_payout'] ?? 100);
        $maxPayout = floatval($_POST['max_payout'] ?? 100000);
        $autoPayout = intval($_POST['auto_payout'] ?? 0);
        $status = intval($_POST['status'] ?? 0);

        if ($id > 0) {
            $sql = "UPDATE qwackpay_accounts SET
                account_name='{$vals['account_name']}', merchant_id='{$vals['merchant_id']}',
                api_key='{$vals['api_key']}', base_url='{$vals['base_url']}',
                payin_fee_percent=$payinFee, payout_fee_percent=$payoutFee, payout_fee_flat=$payoutFlat,
                min_payin=$minPayin, max_payin=$maxPayin, min_payout=$minPayout, max_payout=$maxPayout,
                auto_payout=$autoPayout, status=$status, updated_at=NOW()
                WHERE id=$id";
            $msg = mysqli_query($conn, $sql) ? "Account #$id updated successfully." : "Update failed: " . mysqli_error($conn);
            admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', 'qwackpay_account_update', "id=$id name={$vals['account_name']}");
        } else {
            $sql = "INSERT INTO qwackpay_accounts
                (account_name, merchant_id, api_key, base_url, payin_fee_percent, payout_fee_percent, payout_fee_flat, min_payin, max_payin, min_payout, max_payout, auto_payout, status)
                VALUES
                ('{$vals['account_name']}', '{$vals['merchant_id']}', '{$vals['api_key']}', '{$vals['base_url']}', $payinFee, $payoutFee, $payoutFlat, $minPayin, $maxPayin, $minPayout, $maxPayout, $autoPayout, $status)";
            $msg = mysqli_query($conn, $sql) ? "Account added successfully (ID " . mysqli_insert_id($conn) . ")." : "Insert failed: " . mysqli_error($conn);
            admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', 'qwackpay_account_add', "name={$vals['account_name']} mch={$vals['merchant_id']}");
        }
    } elseif ($act === 'delete') {
        $id = intval($_POST['id']);
        $msg = mysqli_query($conn, "DELETE FROM qwackpay_accounts WHERE id=$id") ? "Account #$id deleted." : "Delete failed: " . mysqli_error($conn);
        admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', 'qwackpay_account_delete', "id=$id");
    } elseif ($act === 'toggle') {
        $id = intval($_POST['id']);
        mysqli_query($conn, "UPDATE qwackpay_accounts SET status = IF(status=1,0,1) WHERE id=$id");
        $msg = "Account #$id status toggled.";
        admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', 'qwackpay_account_toggle', "id=$id");
    } elseif ($act === 'setdefault') {
        $id = intval($_POST['id']);
        mysqli_query($conn, "UPDATE qwackpay_accounts SET is_default=0");
        mysqli_query($conn, "UPDATE qwackpay_accounts SET is_default=1, status=1 WHERE id=$id");
        $msg = "Account #$id is now the default.";
        admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', 'qwackpay_account_default', "id=$id");
    }
}

if (isset($_GET['edit'])) {
    $eid = intval($_GET['edit']);
    $edit = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM qwackpay_accounts WHERE id=$eid"));
}

$accounts = mysqli_query($conn, "SELECT * FROM qwackpay_accounts ORDER BY id ASC");
include("navtop.php");
?>

            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title" style="font-weight:bold;">
                                <i class="fa fa-university"></i> QwackPay Gateway Accounts
                                <small class="text-muted d-block">Advanced multi-account integration - qwackpay.com (payin, payout, order query, balance, callbacks)</small>
                            </h4>

                            <?php if ($msg): ?>
                                <div class="alert alert-info alert-dismissible fade show" role="alert">
                                    <?php echo htmlspecialchars($msg); ?>
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                </div>
                            <?php endif; ?>

                            <!-- Account list -->
                            <div class="table-responsive mt-3">
                                <table class="table table-bordered table-striped" id="example1">
                                    <thead style="background:#1a2e5a;color:#fff;">
                                        <tr>
                                            <th>ID</th><th>Name</th><th>Merchant ID</th><th>Base URL</th>
                                            <th>Payin Fee</th><th>Payout Fee</th><th>Range (Payin)</th>
                                            <th>Auto Payout</th><th>Status</th><th>Default</th><th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php while ($a = mysqli_fetch_assoc($accounts)): ?>
                                        <tr>
                                            <td><?php echo $a['id']; ?></td>
                                            <td><?php echo htmlspecialchars($a['account_name']); ?></td>
                                            <td><?php echo htmlspecialchars($a['merchant_id']); ?></td>
                                            <td style="max-width:220px;overflow:hidden;text-overflow:ellipsis;"><?php echo htmlspecialchars($a['base_url']); ?></td>
                                            <td><?php echo $a['payin_fee_percent']; ?>%</td>
                                            <td><?php echo $a['payout_fee_percent']; ?>% + <?php echo $a['payout_fee_flat']; ?></td>
                                            <td><?php echo $a['min_payin'] . ' - ' . $a['max_payin']; ?></td>
                                            <td><?php echo $a['auto_payout'] ? '<span class="badge badge-success">ON</span>' : '<span class="badge badge-secondary">OFF</span>'; ?></td>
                                            <td><?php echo $a['status'] ? '<span class="badge badge-success">Active</span>' : '<span class="badge badge-danger">Disabled</span>'; ?></td>
                                            <td><?php echo $a['is_default'] ? '<span class="badge badge-warning">DEFAULT</span>' : '-'; ?></td>
                                            <td style="white-space:nowrap;">
                                                <button class="btn btn-info btn-sm" onclick="checkBalance(<?php echo $a['id']; ?>, this)"><i class="fa fa-wallet"></i> Balance</button>
                                                <a class="btn btn-primary btn-sm" href="?edit=<?php echo $a['id']; ?>"><i class="fa fa-edit"></i></a>
                                                <form method="post" style="display:inline;" onsubmit="return confirm('Toggle status?');">
                                                    <input type="hidden" name="act" value="toggle"><input type="hidden" name="id" value="<?php echo $a['id']; ?>">
                                                    <button class="btn btn-warning btn-sm"><i class="fa fa-power-off"></i></button>
                                                </form>
                                                <form method="post" style="display:inline;" onsubmit="return confirm('Make this the default account?');">
                                                    <input type="hidden" name="act" value="setdefault"><input type="hidden" name="id" value="<?php echo $a['id']; ?>">
                                                    <button class="btn btn-dark btn-sm"><i class="fa fa-star"></i></button>
                                                </form>
                                                <form method="post" style="display:inline;" onsubmit="return confirm('Delete this account? This cannot be undone.');">
                                                    <input type="hidden" name="act" value="delete"><input type="hidden" name="id" value="<?php echo $a['id']; ?>">
                                                    <button class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></button>
                                                </form>
                                            </td>
                                        </tr>
                                    <?php endwhile; ?>
                                    </tbody>
                                </table>
                            </div>

                            <div id="balanceResult" class="mt-3"></div>

                            <hr>
                            <h5><?php echo $edit ? 'Edit Account #' . $edit['id'] : 'Add New Account'; ?></h5>
                            <form method="post" class="row mt-2">
                                <input type="hidden" name="act" value="save">
                                <input type="hidden" name="id" value="<?php echo $edit['id'] ?? 0; ?>">

                                <div class="col-md-4 form-group">
                                    <label>Account Name *</label>
                                    <input class="form-control" name="account_name" required value="<?php echo htmlspecialchars($edit['account_name'] ?? ''); ?>" placeholder="QwackPay India">
                                </div>
                                <div class="col-md-4 form-group">
                                    <label>Merchant ID *</label>
                                    <input class="form-control" name="merchant_id" required value="<?php echo htmlspecialchars($edit['merchant_id'] ?? ''); ?>" placeholder="681551699">
                                </div>
                                <div class="col-md-4 form-group">
                                    <label>API Key * (merchant portal, Google-verified)</label>
                                    <input class="form-control" name="api_key" required value="<?php echo htmlspecialchars($edit['api_key'] ?? ''); ?>" placeholder="paste X-API-Key here">
                                </div>
                                <div class="col-md-12 form-group">
                                    <label>API Base URL</label>
                                    <input class="form-control" name="base_url" value="<?php echo htmlspecialchars($edit['base_url'] ?? 'https://qwackpay.com/api/v1'); ?>" placeholder="https://qwackpay.com/api/v1">
                                </div>
                                <div class="col-md-3 form-group">
                                    <label>Payin Fee %</label>
                                    <input class="form-control" type="number" step="0.01" name="payin_fee_percent" value="<?php echo $edit['payin_fee_percent'] ?? '8.00'; ?>">
                                </div>
                                <div class="col-md-3 form-group">
                                    <label>Payout Fee %</label>
                                    <input class="form-control" type="number" step="0.01" name="payout_fee_percent" value="<?php echo $edit['payout_fee_percent'] ?? '3.00'; ?>">
                                </div>
                                <div class="col-md-3 form-group">
                                    <label>Payout Flat Fee (INR)</label>
                                    <input class="form-control" type="number" step="0.01" name="payout_fee_flat" value="<?php echo $edit['payout_fee_flat'] ?? '6.00'; ?>">
                                </div>
                                <div class="col-md-3 form-group">
                                    <label>Min Payin</label>
                                    <input class="form-control" type="number" step="1" name="min_payin" value="<?php echo $edit['min_payin'] ?? '100'; ?>">
                                </div>
                                <div class="col-md-3 form-group">
                                    <label>Max Payin</label>
                                    <input class="form-control" type="number" step="1" name="max_payin" value="<?php echo $edit['max_payin'] ?? '100000'; ?>">
                                </div>
                                <div class="col-md-3 form-group">
                                    <label>Min Payout</label>
                                    <input class="form-control" type="number" step="1" name="min_payout" value="<?php echo $edit['min_payout'] ?? '100'; ?>">
                                </div>
                                <div class="col-md-3 form-group">
                                    <label>Max Payout</label>
                                    <input class="form-control" type="number" step="1" name="max_payout" value="<?php echo $edit['max_payout'] ?? '100000'; ?>">
                                </div>
                                <div class="col-md-3 form-group">
                                    <label>Auto Payout on Approve</label>
                                    <select class="form-control" name="auto_payout">
                                        <option value="0" <?php echo ($edit['auto_payout'] ?? 0) == 0 ? 'selected' : ''; ?>>OFF (manual)</option>
                                        <option value="1" <?php echo ($edit['auto_payout'] ?? 0) == 1 ? 'selected' : ''; ?>>ON (auto transfer)</option>
                                    </select>
                                </div>
                                <div class="col-md-3 form-group">
                                    <label>Status</label>
                                    <select class="form-control" name="status">
                                        <option value="1" <?php echo ($edit['status'] ?? 1) == 1 ? 'selected' : ''; ?>>Active</option>
                                        <option value="0" <?php echo ($edit['status'] ?? 1) == 0 ? 'selected' : ''; ?>>Disabled</option>
                                    </select>
                                </div>
                                <div class="col-md-12">
                                    <button class="btn btn-gradient-primary mr-2" type="submit"><i class="fa fa-save"></i> <?php echo $edit ? 'Update Account' : 'Add Account'; ?></button>
                                    <?php if ($edit): ?><a href="qwackpay_accounts.php" class="btn btn-light">Cancel</a><?php endif; ?>
                                </div>
                            </form>

                            <div class="alert alert-secondary mt-4" style="font-size:12px;">
                                <b>Integration notes (official docs https://6ue86z5lbf.apifox.cn):</b><br>
                                - Auth: header <code>X-API-Key</code> + JSON body, MD5 signature (ksort, &amp;key=API_KEY, UPPERCASE)<br>
                                - Payin: POST <code>{base}/order/create</code> -> redirect <code>data.payment_url</code><br>
                                - Payout: POST <code>{base}/payout/create</code> - <b>server IP whitelist must be bound in the merchant portal first</b><br>
                                - Callbacks: <code>/pay/qwackpay_callback.php</code> (payin notify_url), <code>/pay/qwackpay_payout_callback.php</code> (payout notify_url) - verified + always reply plain text <code>success</code><br>
                                - One integration supports unlimited merchant accounts - switch anytime using the star (DEFAULT) button.
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script>
            function checkBalance(id, btn) {
                var orig = btn.innerHTML;
                btn.innerHTML = 'Checking...';
                btn.disabled = true;
                var fd = new FormData();
                fd.append('action', 'balance');
                fd.append('account_id', id);
                fetch('/pay/qwackpay_admin_api.php', { method: 'POST', body: fd, credentials: 'same-origin' })
                    .then(function(r) { return r.json(); })
                    .then(function(d) {
                        var el = document.getElementById('balanceResult');
                        if (d.ok) {
                            el.innerHTML = '<div class="alert alert-success">Account #' + id + ' balance: Total <b>' + d.amount + '</b> | Frozen <b>' + d.frozenAmount + '</b> | Available <b>' + d.availableAmount + '</b></div>';
                        } else {
                            el.innerHTML = '<div class="alert alert-danger">Account #' + id + ' balance check failed: ' + (d.msg || 'unknown error') + '</div>';
                        }
                    })
                    .catch(function(e) { document.getElementById('balanceResult').innerHTML = '<div class="alert alert-danger">Request failed: ' + e + '</div>'; })
                    .finally(function() { btn.innerHTML = orig; btn.disabled = false; });
            }
            </script>
<?php include("navfoot.php"); ?>
