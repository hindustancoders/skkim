<?php
session_start();
if (!isset($_SESSION['unohs'])) {
    header("Location: index.php?msg=unauthorized");
    exit;
}

include("conn.php");

function generateRandomSerial($length = 32) {
    return strtoupper(bin2hex(random_bytes($length / 2)));
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['maxserials'], $_POST['maxusers'], $_POST['price'], $_POST['required_deposit'])) {
    $maxserials = (int)$_POST['maxserials'];
    $maxusers = mysqli_real_escape_string($conn, $_POST['maxusers']);
    $price = mysqli_real_escape_string($conn, $_POST['price']);
    $remark = mysqli_real_escape_string($conn, $_POST['remark']);
    $required_deposit = mysqli_real_escape_string($conn, $_POST['required_deposit']);

    if ($maxserials > 50) {
        echo '<script>alert("You can generate a maximum of 50 serial numbers.");</script>';
        exit;
    }

    $createdate = date("Y-m-d H:i");
    $status = 1;
    $generatedSerials = [];

    for ($i = 0; $i < $maxserials; $i++) {
        $newSerial = generateRandomSerial();
        $generatedSerials[] = $newSerial;

        $query = "INSERT INTO gift_codes (enserie, utilisateurmax, prix, nombredutilisateurs, creerunrendezvous, shonu, remark, required_deposit) 
                  VALUES ('$newSerial', '$maxusers', '$price', 0, '$createdate', '$status', '$remark', '$required_deposit')";
        mysqli_query($conn, $query);
    }
}

$limit = 10;
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$offset = ($page - 1) * $limit;

$historyQuery = "SELECT * FROM gift_codes ORDER BY creerunrendezvous DESC LIMIT $limit OFFSET $offset";
$historyResult = mysqli_query($conn, $historyQuery);

$totalQuery = "SELECT COUNT(*) AS total FROM gift_codes";
$totalResult = mysqli_query($conn, $totalQuery);
$totalRecords = mysqli_fetch_assoc($totalResult)['total'];
$totalPages = ceil($totalRecords / $limit);

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['delete_serial'])) {
    $serialToDelete = mysqli_real_escape_string($conn, $_POST['delete_serial']);
    mysqli_query($conn, "DELETE FROM gift_codes WHERE enserie = '$serialToDelete'");
    header("Location: ".$_SERVER['PHP_SELF']);
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Generate Gift Codes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Generate Gift Codes</h2>
        <form action="#" method="post">
            <div class="mb-3">
                <input name="maxserials" type="number" placeholder="Number of Codes (Max: 50)" required class="form-control" min="1" max="50" />
            </div>
            <div class="mb-3">
                <input name="maxusers" type="number" placeholder="Maximum Users" required class="form-control" min="1" />
            </div>
            <div class="mb-3">
                <input name="remark" type="text" placeholder="Remark" required class="form-control" />
            </div>
            <div class="mb-3">
                <input name="price" type="number" placeholder="Price" required class="form-control" min="1" />
            </div>
            <div class="mb-3">
    <input name="required_deposit" type="number" placeholder="Required Deposit Amount[OPTIONAL]" class="form-control" min="0" />
</div>
            <button type="submit" class="btn btn-primary">Generate Codes</button>
        </form>
    </div>

    <div class="container mt-5">
        <h2>Generated Codes History</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Serial Code</th>
                    <th>Max Users</th>
                    <th>Price</th>
                    <th>Required Deposit</th>
                    <th>Created At</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = mysqli_fetch_assoc($historyResult)): ?>
                    <tr>
                        <td><?php echo $row['enserie']; ?></td>
                        <td><?php echo $row['utilisateurmax']; ?></td>
                        <td>₹<?php echo $row['prix']; ?></td>
                        <td>₹<?php echo $row['required_deposit']; ?></td>
                        <td><?php echo $row['creerunrendezvous']; ?></td>
                        <td>
                            <form method="post" onsubmit="return confirmDelete('<?php echo $row['enserie']; ?>')">
                                <input type="hidden" name="delete_serial" value="<?php echo $row['enserie']; ?>">
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>

        <nav>
            <ul class="pagination">
                <?php for ($i = 1; $i <= $totalPages; $i++): ?>
                    <li class="page-item <?= ($page == $i) ? 'active' : '' ?>">
                        <a class="page-link" href="?page=<?php echo $i; ?>"><?php echo $i; ?></a>
                    </li>
                <?php endfor; ?>
            </ul>
        </nav>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
        <?php if (isset($generatedSerialsJson)): ?>
            let generatedSerials = <?php echo $generatedSerialsJson; ?>;
            let serialList = document.getElementById('generatedSerialList');
            generatedSerials.forEach(serial => {
                let listItem = document.createElement('li');
                listItem.textContent = serial;
                serialList.appendChild(listItem);
            });

            new bootstrap.Modal(document.getElementById('generatedSerialsModal')).show();
        <?php endif; ?>

        document.getElementById("copyButton").addEventListener("click", function() {
            let serials = [...document.querySelectorAll('#generatedSerialList li')].map(li => li.textContent).join("\n");
            navigator.clipboard.writeText(serials).then(() => {
                Swal.fire("Copied!", "Gift codes copied to clipboard.", "success");
            });
        });
    </script>
</body>
</html>
