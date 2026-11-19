<?php
session_start();
if (empty($_SESSION['unohs'])) {
    header("location:index.php?msg=unauthorized");
    exit;
}
include("conn.php");
include("navtop.php");

$from = $_GET['from'] ?? date('Y-m-d', strtotime('-7 days'));
$to = $_GET['to'] ?? date('Y-m-d');
$limit = min(500, max(50, intval($_GET['limit'] ?? 300)));

$logs = mysqli_query($conn, "SELECT * FROM admin_audit_log WHERE DATE(created_at) BETWEEN '" . mysqli_real_escape_string($conn, $from) . "' AND '" . mysqli_real_escape_string($conn, $to) . "' ORDER BY id DESC LIMIT " . $limit);
?>
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title" style="font-weight:bold;">
                                <i class="fa fa-history"></i> Admin Audit Log
                                <small class="text-muted d-block">Every critical admin action is recorded here (payments, balance ops, banners, chat deletions)</small>
                            </h4>

                            <form method="get" class="form-inline mb-3">
                                <label class="mr-2">From</label>
                                <input type="date" class="form-control form-control-sm mr-3" name="from" value="<?php echo htmlspecialchars($from); ?>">
                                <label class="mr-2">To</label>
                                <input type="date" class="form-control form-control-sm mr-3" name="to" value="<?php echo htmlspecialchars($to); ?>">
                                <button class="btn btn-gradient-primary btn-sm"><i class="fa fa-filter"></i> Filter</button>
                            </form>

                            <div class="table-responsive">
                                <table class="table table-bordered table-striped" id="example1">
                                    <thead style="background:#1a2e5a;color:#fff;">
                                        <tr><th>ID</th><th>Admin</th><th>Action</th><th>Details</th><th>IP</th><th>Time</th></tr>
                                    </thead>
                                    <tbody>
                                    <?php while ($l = mysqli_fetch_assoc($logs)): ?>
                                        <tr>
                                            <td><?php echo $l['id']; ?></td>
                                            <td><?php echo htmlspecialchars($l['admin_user']); ?></td>
                                            <td><span class="badge badge-info"><?php echo htmlspecialchars($l['action']); ?></span></td>
                                            <td style="max-width:460px; font-size:12px; word-break:break-all;"><?php echo htmlspecialchars($l['details']); ?></td>
                                            <td><?php echo htmlspecialchars($l['ip']); ?></td>
                                            <td><?php echo $l['created_at']; ?></td>
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
