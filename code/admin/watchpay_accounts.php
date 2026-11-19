<?php
session_start();
if (empty($_SESSION['unohs'])) {
    header("location:index.php?msg=unauthorized");
    exit;
}
date_default_timezone_set("Asia/Kolkata");
include("conn.php");

$msg = '';
$edit = null;

/* ---------------- Handle actions ---------------- */
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $act = $_POST['act'] ?? '';

    if ($act === 'save') {
        $id = intval($_POST['id'] ?? 0);
        $fields = array(
            'account_name', 'mch_id', 'payin_key', 'payout_key',
            'payin_url', 'payout_url', 'payout_query_url', 'balance_query_url',
            'pay_type', 'bank_code_payout'
        );
        $vals = array();
        foreach ($fields as $f) {
            $vals[$f] = mysqli_real_escape_string($conn, trim($_POST[$f] ?? ''));
        }
        if ($vals['payin_url'] === '') $vals['payin_url'] = 'https://api.wataiglobal.com/pay/web';
        if ($vals['payout_url'] === '') $vals['payout_url'] = 'https://api.wataiglobal.com/pay/transfer';
        if ($vals['payout_query_url'] === '') $vals['payout_query_url'] = 'https://api.wataiglobal.com/query/transfer';
        if ($vals['balance_query_url'] === '') $vals['balance_query_url'] = 'https://api.wataiglobal.com/query/balance';

        $payinFee = floatval($_POST['payin_fee_percent'] ?? 0);
        $payoutFee = floatval($_POST['payout_fee_percent'] ?? 0);
        $minPayin = floatval($_POST['min_payin'] ?? 100);
        $maxPayin = floatval($_POST['max_payin'] ?? 50000);
        $minPayout = floatval($_POST['min_payout'] ?? 110);
        $maxPayout = floatval($_POST['max_payout'] ?? 50000);
        $autoPayout = intval($_POST['auto_payout'] ?? 0);
        $status = intval($_POST['status'] ?? 0);

        if ($id > 0) {
            $sql = "UPDATE watchpay_accounts SET
                account_name='{$vals['account_name']}', mch_id='{$vals['mch_id']}',
                payin_key='{$vals['payin_key']}', payout_key='{$vals['payout_key']}',
                payin_url='{$vals['payin_url']}', payout_url='{$vals['payout_url']}',
                payout_query_url='{$vals['payout_query_url']}', balance_query_url='{$vals['balance_query_url']}',
                pay_type='{$vals['pay_type']}', bank_code_payout='{$vals['bank_code_payout']}',
                payin_fee_percent=$payinFee, payout_fee_percent=$payoutFee,
                min_payin=$minPayin, max_payin=$maxPayin, min_payout=$minPayout, max_payout=$maxPayout,
                auto_payout=$autoPayout, status=$status, updated_at=NOW()
                WHERE id=$id";
            $msg = mysqli_query($conn, $sql) ? "Account #$id updated successfully." : "Update failed: " . mysqli_error($conn);
            admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', 'watchpay_account_update', "id=$id name={$vals['account_name']}");
        } else {
            $sql = "INSERT INTO watchpay_accounts
                (account_name, mch_id, payin_key, payout_key, payin_url, payout_url, payout_query_url, balance_query_url, pay_type, bank_code_payout, payin_fee_percent, payout_fee_percent, min_payin, max_payin, min_payout, max_payout, auto_payout, status)
                VALUES
                ('{$vals['account_name']}', '{$vals['mch_id']}', '{$vals['payin_key']}', '{$vals['payout_key']}', '{$vals['payin_url']}', '{$vals['payout_url']}', '{$vals['payout_query_url']}', '{$vals['balance_query_url']}', '{$vals['pay_type']}', '{$vals['bank_code_payout']}', $payinFee, $payoutFee, $minPayin, $maxPayin, $minPayout, $maxPayout, $autoPayout, $status)";
            $msg = mysqli_query($conn, $sql) ? "Account added successfully (ID " . mysqli_insert_id($conn) . ")." : "Insert failed: " . mysqli_error($conn);
            admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', 'watchpay_account_add', "name={$vals['account_name']} mch={$vals['mch_id']}");
        }
    } elseif ($act === 'delete') {
        $id = intval($_POST['id']);
        $msg = mysqli_query($conn, "DELETE FROM watchpay_accounts WHERE id=$id") ? "Account #$id deleted." : "Delete failed: " . mysqli_error($conn);
        admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', 'watchpay_account_delete', "id=$id");
    } elseif ($act === 'toggle') {
        $id = intval($_POST['id']);
        mysqli_query($conn, "UPDATE watchpay_accounts SET status = IF(status=1,0,1) WHERE id=$id");
        $msg = "Account #$id status toggled.";
        admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', 'watchpay_account_toggle', "id=$id");
    } elseif ($act === 'setdefault') {
        $id = intval($_POST['id']);
        mysqli_query($conn, "UPDATE watchpay_accounts SET is_default=0");
        mysqli_query($conn, "UPDATE watchpay_accounts SET is_default=1, status=1 WHERE id=$id");
        $msg = "Account #$id is now the default.";
        admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', 'watchpay_account_default', "id=$id");
    }
}

if (isset($_GET['edit'])) {
    $eid = intval($_GET['edit']);
    $edit = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM watchpay_accounts WHERE id=$eid"));
}

$accounts = mysqli_query($conn, "SELECT * FROM watchpay_accounts ORDER BY id ASC");
include("navtop.php");
?>

            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title" style="font-weight:bold;">
                                <i class="fa fa-credit-card"></i> WatchPay Gateway Accounts
                                <small class="text-muted d-block">Advanced multi-account integration - api.wataiglobal.com (payin, payout, query, balance, callbacks)</small>
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
                                            <th>ID</th><th>Name</th><th>Merchant ID</th><th>Pay Type</th>
                                            <th>Payin Fee</th><th>Payout Fee</th><th>Range (Payin)</th>
                                            <th>Auto Payout</th><th>Status</th><th>Default</th><th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php while ($a = mysqli_fetch_assoc($accounts)): ?>
                                        <tr>
                                            <td><?php echo $a['id']; ?></td>
                                            <td><?php echo htmlspecialchars($a['account_name']); ?></td>
                                            <td><?php echo htmlspecialchars($a['mch_id']); ?></td>
                                            <td><?php echo htmlspecialchars($a['pay_type']); ?></td>
                                            <td><?php echo $a['payin_fee_percent']; ?>%</td>
                                            <td><?php echo $a['payout_fee_percent']; ?>%</td>
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
                                    <input class="form-control" name="account_name" required value="<?php echo htmlspecialchars($edit['account_name'] ?? ''); ?>" placeholder="WatchPay India UPI">
                                </div>
                                <div class="col-md-4 form-group">
                                    <label>Merchant ID (mch_id) *</label>
                                    <input class="form-control" name="mch_id" required value="<?php echo htmlspecialchars($edit['mch_id'] ?? ''); ?>" placeholder="222887002">
                                </div>
                                <div class="col-md-4 form-group">
                                    <label>Pay Type / Channel Code *</label>
                                    <input class="form-control" name="pay_type" required value="<?php echo htmlspecialchars($edit['pay_type'] ?? '101'); ?>" placeholder="101 (India UPI)">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Payin API Key *</label>
                                    <input class="form-control" name="payin_key" required value="<?php echo htmlspecialchars($edit['payin_key'] ?? ''); ?>">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Payout API Key *</label>
                                    <input class="form-control" name="payout_key" required value="<?php echo htmlspecialchars($edit['payout_key'] ?? ''); ?>">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Payin URL</label>
                                    <input class="form-control" name="payin_url" value="<?php echo htmlspecialchars($edit['payin_url'] ?? 'https://api.wataiglobal.com/pay/web'); ?>">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Payout URL</label>
                                    <input class="form-control" name="payout_url" value="<?php echo htmlspecialchars($edit['payout_url'] ?? 'https://api.wataiglobal.com/pay/transfer'); ?>">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Payout Query URL</label>
                                    <input class="form-control" name="payout_query_url" value="<?php echo htmlspecialchars($edit['payout_query_url'] ?? 'https://api.wataiglobal.com/query/transfer'); ?>">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Balance Query URL</label>
                                    <input class="form-control" name="balance_query_url" value="<?php echo htmlspecialchars($edit['balance_query_url'] ?? 'https://api.wataiglobal.com/query/balance'); ?>">
                                </div>
                                <div class="col-md-4 form-group">
                                    <label>Payout Bank Code (optional)</label>
                                    <input class="form-control" name="bank_code_payout" value="<?php echo htmlspecialchars($edit['bank_code_payout'] ?? ''); ?>">
                                </div>
                                <div class="col-md-2 form-group">
                                    <label>Payin Fee %</label>
                                    <input class="form-control" type="number" step="0.01" name="payin_fee_percent" value="<?php echo $edit['payin_fee_percent'] ?? '11.00'; ?>">
                                </div>
                                <div class="col-md-2 form-group">
                                    <label>Payout Fee %</label>
                                    <input class="form-control" type="number" step="0.01" name="payout_fee_percent" value="<?php echo $edit['payout_fee_percent'] ?? '4.00'; ?>">
                                </div>
                                <div class="col-md-2 form-group">
                                    <label>Min Payin</label>
                                    <input class="form-control" type="number" step="1" name="min_payin" value="<?php echo $edit['min_payin'] ?? '100'; ?>">
                                </div>
                                <div class="col-md-2 form-group">
                                    <label>Max Payin</label>
                                    <input class="form-control" type="number" step="1" name="max_payin" value="<?php echo $edit['max_payin'] ?? '50000'; ?>">
                                </div>
                                <div class="col-md-3 form-group">
                                    <label>Min Payout</label>
                                    <input class="form-control" type="number" step="1" name="min_payout" value="<?php echo $edit['min_payout'] ?? '110'; ?>">
                                </div>
                                <div class="col-md-3 form-group">
                                    <label>Max Payout</label>
                                    <input class="form-control" type="number" step="1" name="max_payout" value="<?php echo $edit['max_payout'] ?? '50000'; ?>">
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
                                    <?php if ($edit): ?><a href="watchpay_accounts.php" class="btn btn-light">Cancel</a><?php endif; ?>
                                </div>
                            </form>

                                <div class="alert alert-secondary mt-4" style="font-size:12px;">
                                <b>Integration notes (official docs):</b><br>
                                - Payin: POST <code>https://api.wataiglobal.com/pay/web</code> (MD5 signature, version=1.0 for JSON response)<br>
                                - Payout: POST <code>https://api.wataiglobal.com/pay/transfer</code> (India requires IFSC in remark)<br>
                                - Callbacks: <code>/pay/watchpays_callback.php</code> (payin notify_url), <code>/pay/watchpays_payout_callback.php</code> (payout back_url) - must return "success"<br>
                                - Gateway callback IPs (firewall whitelist on our side): <code>18.141.88.123</code> (new), <code>47.131.79.37</code> (old, keep both)<br>
                                - Merchant portal: <code>https://mer.wataiglobal.com</code> - payin key from portal home; payout key issued after IP whitelist with your business manager<br>
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
                fetch('/pay/watchpay_admin_api.php', { method: 'POST', body: fd, credentials: 'same-origin' })
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
