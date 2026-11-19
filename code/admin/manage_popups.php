<?php
session_start();
if (empty($_SESSION['unohs'])) {
    header("location:index.php?msg=unauthorized");
    exit;
}
date_default_timezone_set("Asia/Kolkata");
include("conn.php");
require_once(__DIR__ . "/../pay/watchpay_lib.php"); /* admin_audit_log */

$msg = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $act = $_POST['act'] ?? '';
    if ($act === 'add') {
        $title = mysqli_real_escape_string($conn, trim($_POST['title'] ?? ''));
        $content = mysqli_real_escape_string($conn, $_POST['content'] ?? '');
        $sort = intval($_POST['sort_order'] ?? 0);
        if ($title !== '' && $content !== '') {
            $msg = mysqli_query($conn, "INSERT INTO site_popups (title, content, sort_order, status) VALUES ('$title', '$content', $sort, 1)")
                ? "Popup added." : "Add failed: " . mysqli_error($conn);
            admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', 'popup_add', $title);
        } else {
            $msg = "Title and content are required.";
        }
    } elseif ($act === 'toggle') {
        $id = intval($_POST['id']);
        mysqli_query($conn, "UPDATE site_popups SET status = IF(status=1,0,1) WHERE id=$id");
        $msg = "Popup #$id status toggled.";
    } elseif ($act === 'delete') {
        $id = intval($_POST['id']);
        mysqli_query($conn, "DELETE FROM site_popups WHERE id=$id");
        $msg = "Popup #$id deleted.";
        admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', 'popup_delete', "id=$id");
    }
}

$popups = mysqli_query($conn, "SELECT * FROM site_popups ORDER BY sort_order ASC, id ASC");
include("navtop.php");
?>

            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title" style="font-weight:bold;">
                                <i class="fa fa-bullhorn"></i> Site Popup Notices
                                <small class="text-muted d-block">Welcome popups shown in the app (GetSitePopMsgList API)</small>
                            </h4>
                            <?php if ($msg): ?>
                                <div class="alert alert-info alert-dismissible fade show" role="alert">
                                    <?php echo htmlspecialchars($msg); ?>
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                </div>
                            <?php endif; ?>

                            <div class="table-responsive">
                                <table class="table table-bordered" id="example1">
                                    <thead style="background:#1a2e5a;color:#fff;">
                                        <tr><th>ID</th><th>Title</th><th>Content</th><th>Sort</th><th>Status</th><th>Created</th><th>Actions</th></tr>
                                    </thead>
                                    <tbody>
                                    <?php while ($p = mysqli_fetch_assoc($popups)): ?>
                                        <tr>
                                            <td><?php echo $p['id']; ?></td>
                                            <td><?php echo htmlspecialchars($p['title']); ?></td>
                                            <td style="max-width:420px;"><div style="max-height:90px; overflow:auto; font-size:12px;"><?php echo $p['content']; ?></div></td>
                                            <td><?php echo $p['sort_order']; ?></td>
                                            <td><?php echo $p['status'] ? '<span class="badge badge-success">ON</span>' : '<span class="badge badge-danger">OFF</span>'; ?></td>
                                            <td><?php echo $p['created_at']; ?></td>
                                            <td style="white-space:nowrap;">
                                                <form method="post" style="display:inline;">
                                                    <input type="hidden" name="act" value="toggle"><input type="hidden" name="id" value="<?php echo $p['id']; ?>">
                                                    <button class="btn btn-outline-warning btn-sm"><i class="fa fa-power-off"></i></button>
                                                </form>
                                                <form method="post" style="display:inline;" onsubmit="return confirm('Delete this popup?');">
                                                    <input type="hidden" name="act" value="delete"><input type="hidden" name="id" value="<?php echo $p['id']; ?>">
                                                    <button class="btn btn-outline-danger btn-sm"><i class="fa fa-trash"></i></button>
                                                </form>
                                            </td>
                                        </tr>
                                    <?php endwhile; ?>
                                    </tbody>
                                </table>
                            </div>

                            <hr>
                            <h5>Add New Popup</h5>
                            <form method="post" class="row">
                                <input type="hidden" name="act" value="add">
                                <div class="col-md-6 form-group">
                                    <label>Title</label>
                                    <input class="form-control" name="title" required>
                                </div>
                                <div class="col-md-2 form-group">
                                    <label>Sort</label>
                                    <input class="form-control" type="number" name="sort_order" value="10">
                                </div>
                                <div class="col-md-12 form-group">
                                    <label>Content (HTML allowed)</label>
                                    <textarea class="form-control" name="content" rows="4" required></textarea>
                                </div>
                                <div class="col-md-12">
                                    <button class="btn btn-gradient-primary"><i class="fa fa-plus"></i> Add Popup</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
<?php include("navfoot.php"); ?>
