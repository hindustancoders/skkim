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
        $imageUrl = mysqli_real_escape_string($conn, trim($_POST['image_url'] ?? ''));
        $linkUrl = mysqli_real_escape_string($conn, trim($_POST['link_url'] ?? ''));
        $sort = intval($_POST['sort_order'] ?? 0);
        if ($title !== '' && $imageUrl !== '') {
            $msg = mysqli_query($conn, "INSERT INTO site_banners (title, image_url, link_url, sort_order, status) VALUES ('$title', '$imageUrl', '$linkUrl', $sort, 1)")
                ? "Banner added." : "Add failed: " . mysqli_error($conn);
            admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', 'banner_add', $title);
        } else {
            $msg = "Title and image URL are required.";
        }
    } elseif ($act === 'upload') {
        /* File upload -> /banner folder */
        if (!empty($_FILES['banner_file']['tmp_name']) && $_FILES['banner_file']['error'] === UPLOAD_ERR_OK) {
            $info = @getimagesize($_FILES['banner_file']['tmp_name']);
            if ($info === false) {
                $msg = "Uploaded file is not a valid image.";
            } else {
                $ext = image_type_to_extension($info[2], false);
                $allowed = array('jpeg', 'jpg', 'png', 'gif', 'webp');
                if (!in_array(strtolower(ltrim($ext, '.')), $allowed)) {
                    $msg = "Unsupported image type.";
                } else {
                    $safeName = 'bharat_banner_' . date('YmdHis') . '_' . rand(100, 999) . '.' . strtolower(ltrim($ext, '.'));
                    $dest = __DIR__ . '/../banner/' . $safeName;
                    if (move_uploaded_file($_FILES['banner_file']['tmp_name'], $dest)) {
                        $title = mysqli_real_escape_string($conn, trim($_POST['title'] ?: $safeName));
                        $sort = intval($_POST['sort_order'] ?? 0);
                        mysqli_query($conn, "INSERT INTO site_banners (title, image_url, link_url, sort_order, status) VALUES ('$title', '/banner/$safeName', '', $sort, 1)");
                        $msg = "Banner uploaded: /banner/$safeName";
                        admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', 'banner_upload', $safeName);
                    } else {
                        $msg = "Failed to save uploaded file.";
                    }
                }
            }
        } else {
            $msg = "No file uploaded.";
        }
    } elseif ($act === 'toggle') {
        $id = intval($_POST['id']);
        mysqli_query($conn, "UPDATE site_banners SET status = IF(status=1,0,1) WHERE id=$id");
        $msg = "Banner #$id status toggled.";
    } elseif ($act === 'delete') {
        $id = intval($_POST['id']);
        $b = mysqli_fetch_assoc(mysqli_query($conn, "SELECT image_url FROM site_banners WHERE id=$id"));
        mysqli_query($conn, "DELETE FROM site_banners WHERE id=$id");
        /* do not delete physical file automatically (safe) */
        $msg = "Banner #$id removed from rotation.";
        admin_audit_log($conn, $_SESSION['nirvahaka_hesaru'] ?? 'admin', 'banner_delete', "id=$id url=" . ($b['image_url'] ?? ''));
    }
}

$banners = mysqli_query($conn, "SELECT * FROM site_banners ORDER BY sort_order ASC, id ASC");
include("navtop.php");
?>

            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title" style="font-weight:bold;">
                                <i class="fa fa-image"></i> Home Banner Manager
                                <small class="text-muted d-block">Banners shown on the app home page (GetBannerList API)</small>
                            </h4>
                            <?php if ($msg): ?>
                                <div class="alert alert-info alert-dismissible fade show" role="alert">
                                    <?php echo htmlspecialchars($msg); ?>
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                </div>
                            <?php endif; ?>

                            <div class="row">
                                <?php while ($b = mysqli_fetch_assoc($banners)): ?>
                                <div class="col-md-4 mb-4">
                                    <div class="card">
                                        <img src="<?php echo htmlspecialchars($b['image_url']); ?>" class="card-img-top" style="max-height:150px; object-fit:cover;" onerror="this.src='/uploads/bharat_brand/default_game_icon.png'">
                                        <div class="card-body py-2">
                                            <b><?php echo htmlspecialchars($b['title']); ?></b>
                                            <div class="text-muted" style="font-size:11px;"><?php echo htmlspecialchars($b['image_url']); ?> | sort <?php echo $b['sort_order']; ?></div>
                                            <div class="mt-2 d-flex">
                                                <span class="mr-2"><?php echo $b['status'] ? '<span class="badge badge-success">ON</span>' : '<span class="badge badge-danger">OFF</span>'; ?></span>
                                                <form method="post" class="mr-1">
                                                    <input type="hidden" name="act" value="toggle"><input type="hidden" name="id" value="<?php echo $b['id']; ?>">
                                                    <button class="btn btn-outline-warning btn-sm"><i class="fa fa-power-off"></i></button>
                                                </form>
                                                <form method="post" onsubmit="return confirm('Remove this banner from rotation?');">
                                                    <input type="hidden" name="act" value="delete"><input type="hidden" name="id" value="<?php echo $b['id']; ?>">
                                                    <button class="btn btn-outline-danger btn-sm"><i class="fa fa-trash"></i></button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <?php endwhile; ?>
                            </div>

                            <hr>
                            <div class="row">
                                <div class="col-md-6">
                                    <h5>Add Banner by URL</h5>
                                    <form method="post">
                                        <input type="hidden" name="act" value="add">
                                        <div class="form-group"><label>Title</label><input class="form-control" name="title" required></div>
                                        <div class="form-group"><label>Image URL (local /banner/... or full URL)</label><input class="form-control" name="image_url" required placeholder="/banner/my_banner.jpg"></div>
                                        <div class="form-group"><label>Link URL (optional)</label><input class="form-control" name="link_url"></div>
                                        <div class="form-group"><label>Sort order</label><input class="form-control" type="number" name="sort_order" value="10"></div>
                                        <button class="btn btn-gradient-primary"><i class="fa fa-plus"></i> Add</button>
                                    </form>
                                </div>
                                <div class="col-md-6">
                                    <h5>Upload Banner File</h5>
                                    <form method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="act" value="upload">
                                        <div class="form-group"><label>Title (optional)</label><input class="form-control" name="title"></div>
                                        <div class="form-group"><label>Image file (jpg/png/webp/gif)</label><input type="file" class="form-control" name="banner_file" accept="image/*" required></div>
                                        <div class="form-group"><label>Sort order</label><input class="form-control" type="number" name="sort_order" value="10"></div>
                                        <button class="btn btn-gradient-success"><i class="fa fa-upload"></i> Upload</button>
                                    </form>
                                    <div class="alert alert-secondary mt-3" style="font-size:12px;">
                                        Tip: uploaded files are saved into the site's <code>/banner/</code> folder. Existing Bharat banners: bharat_banner_1_70extra.jpg, bharat_banner_2_winstreak.jpg, bharat_banner_3_refer.jpg, bharat_banner_4_agent.jpg
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<?php include("navfoot.php"); ?>
