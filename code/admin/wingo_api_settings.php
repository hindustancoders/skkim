<?php
        session_start();
        if(empty($_SESSION['unohs'])){
                header("location:index.php?msg=unauthorized");
                exit;
        }
?>
<?php
        include ("conn.php");
        include_once (__DIR__ . "/../wingo_api_lib.php");

        wingo_api_ensure_tables($conn);
        $cfg = wingo_api_get_config($conn);

        $saveMsg = '';
        $saveOk = false;
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['save_settings'])) {
                $enabled   = isset($_POST['enabled']) ? 1 : 0;
                $apiBase   = trim($_POST['api_base']);
                $apiKey    = trim($_POST['api_key']);
                $timeout   = max(2, min(15, intval($_POST['timeout_sec'])));
                $en30s = isset($_POST['en_30s']) ? 1 : 0;
                $en1m  = isset($_POST['en_1m']) ? 1 : 0;
                $en3m  = isset($_POST['en_3m']) ? 1 : 0;
                $en5m  = isset($_POST['en_5m']) ? 1 : 0;
                $en10m = isset($_POST['en_10m']) ? 1 : 0;
                $p30s = strtoupper(trim($_POST['param_30s']) ?: '30S');
                $p1m  = strtoupper(trim($_POST['param_1m']) ?: '1M');
                $p3m  = strtoupper(trim($_POST['param_3m']) ?: '3M');
                $p5m  = strtoupper(trim($_POST['param_5m']) ?: '5M');
                $p10m = strtoupper(trim($_POST['param_10m']) ?: '10M');

                $up = mysqli_query($conn, "UPDATE `wingo_api_config` SET
                        `enabled`=" . intval($enabled) . ",
                        `api_base`='" . mysqli_real_escape_string($conn, $apiBase) . "',
                        `api_key`='" . mysqli_real_escape_string($conn, $apiKey) . "',
                        `timeout_sec`=" . intval($timeout) . ",
                        `en_30s`=" . intval($en30s) . ",
                        `en_1m`=" . intval($en1m) . ",
                        `en_3m`=" . intval($en3m) . ",
                        `en_5m`=" . intval($en5m) . ",
                        `en_10m`=" . intval($en10m) . ",
                        `param_30s`='" . mysqli_real_escape_string($conn, $p30s) . "',
                        `param_1m`='" . mysqli_real_escape_string($conn, $p1m) . "',
                        `param_3m`='" . mysqli_real_escape_string($conn, $p3m) . "',
                        `param_5m`='" . mysqli_real_escape_string($conn, $p5m) . "',
                        `param_10m`='" . mysqli_real_escape_string($conn, $p10m) . "'
                        WHERE `id`=1");
                $saveOk = (bool)$up;
                $saveMsg = $up ? "Settings saved successfully." : "Save failed: " . mysqli_error($conn);
                $cfg = wingo_api_get_config($conn);
        }

        $logRes = mysqli_query($conn, "SELECT * FROM `wingo_api_log` ORDER BY log_id DESC LIMIT 25");
        $logs = [];
        if ($logRes) { while ($r = mysqli_fetch_assoc($logRes)) { $logs[] = $r; } }

        // latest local period ids (for alignment check)
        $localPeriods = [];
        foreach (['30s'=>'wingo_periods_30sec','1m'=>'wingo_periods_1min','3m'=>'wingo_periods_3min','5m'=>'wingo_periods_5min','10m'=>'wingo_periods_10min'] as $gk => $tbl) {
                $r = mysqli_query($conn, "SELECT atadaaidi FROM `" . $tbl . "` ORDER BY kramasankhye DESC LIMIT 1");
                $localPeriods[$gk] = ($r && mysqli_num_rows($r) > 0) ? mysqli_fetch_assoc($r)['atadaaidi'] : '-';
        }

        // quick health summary for the header cards
        $health = [];
        foreach ($logs as $lg) {
                $gk = $lg['game_key'];
                if (!isset($health[$gk])) $health[$gk] = ['used' => 0, 'manual' => 0, 'fallback' => 0, 'other' => 0, 'last' => null];
                if ($lg['status'] === 'used') $health[$gk]['used']++;
                elseif ($lg['status'] === 'manual') $health[$gk]['manual']++;
                elseif ($lg['status'] === 'fallback') $health[$gk]['fallback']++;
                else $health[$gk]['other']++;
                if ($health[$gk]['last'] === null) $health[$gk]['last'] = $lg['status'];
        }
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>WinGo API Settings</title>
  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
  <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="shortcut icon" href="images/favicon.png" />
  <style>
    .card-box { background:#fff; padding:1.5rem; border-radius:6px; box-shadow:0 2px 6px rgba(0,0,0,.08); margin-bottom:1.25rem; }
    .form-ctrl { width:100%; border:1px solid #ced4da; border-radius:4px; padding:.45rem .75rem; font-size:.95rem; }
    .badge-ok   { background:#28a745; color:#fff; padding:2px 10px; border-radius:12px; font-size:.8rem; }
    .badge-bad  { background:#dc3545; color:#fff; padding:2px 10px; border-radius:12px; font-size:.8rem; }
    .badge-warn { background:#ffc107; color:#333; padding:2px 10px; border-radius:12px; font-size:.8rem; }
    .badge-off  { background:#6c757d; color:#fff; padding:2px 10px; border-radius:12px; font-size:.8rem; }
    .game-row { display:flex; align-items:center; gap:14px; flex-wrap:wrap; border-top:1px dashed #e0e0e0; padding:.65rem 0; }
    .game-row:first-of-type { border-top:none; }
    .test-out { font-family:monospace; background:#212529; color:#d1e7dd; padding:.6rem; border-radius:4px; font-size:.78rem; max-height:170px; overflow:auto; margin-top:.4rem; white-space:pre-wrap; }
    .btn-min { padding:.4rem .9rem; font-size:.85rem; border-radius:4px; border:none; cursor:pointer; }
    .flow-note { background:#eef4ff; border:1px solid #c7dbff; border-radius:6px; padding:.7rem 1rem; font-size:.88rem; color:#2b4a77; }
    .flow-note b { color:#123c86; }
    .stat-chip { display:inline-block; background:#f1f3f5; border-radius:14px; padding:3px 12px; font-size:.8rem; margin-right:6px; color:#495057; }
    .stat-chip b { color:#212529; }
  </style>
</head>
<body>
  <div class="container-scroller">
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo" href="dashboard.php"><img src="images/logo.png" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="dashboard.php"><img src="images/logo-mini.png" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown d-flex mr-4">
            <a class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center" id="notificationDropdown" href="#" data-toggle="dropdown">
              <i class="icon-cog"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Settings</p>
              <a class="dropdown-item preview-item" href="logout.php">
                  <i class="icon-inbox"></i> Logout
              </a>
            </div>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>
    <div class="container-fluid page-body-wrapper">
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <div class="user-profile">
          <div class="user-image">
            <img src="images/faces/face28.png">
          </div>
          <div class="user-name">Game Admin</div>
          <div class="user-designation">Admin</div>
        </div>
        <?php include 'compass.php';?>
      </nav>
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-sm-12 mb-4 mb-xl-0">
              <h4 class="font-weight-bold text-dark">WinGo API Settings <span style="font-size:.75rem;color:#888">(external result feed — direct hit)</span></h4>
            </div>
          </div>

          <?php if ($saveMsg != ''): ?>
            <div class="alert <?php echo $saveOk ? 'alert-success' : 'alert-danger'; ?>"><?php echo htmlspecialchars($saveMsg); ?></div>
          <?php endif; ?>

          <div class="flow-note mb-4">
            <b>How results work:</b> Admin prediction &gt; <b>API result</b> &gt; auto algorithm.
            The <b>period</b> comes from the API <b>issueNumber</b> (next period = latest issue + 1),
            the <b>number</b> from the API <b>number</b> field (Big = 5-9, Small = 0-4) and the
            <b>colour</b> from the API <b>color</b> field. The feed is hit directly — no proxy fallback.
            If the API is unreachable, the game keeps running on the auto algorithm without any delay.
          </div>

          <div class="card-box">
            <h5>Connection</h5>
            <form method="POST" action="wingo_api_settings.php">
              <input type="hidden" name="save_settings" value="1">
              <div class="row">
                <div class="col-md-8">
                  <label><b>API Base URL</b> <span style="color:#888">(result feed endpoint)</span></label>
                  <input class="form-ctrl" type="text" name="api_base" value="<?php echo htmlspecialchars($cfg['api_base']); ?>">
                </div>
                <div class="col-md-4">
                  <label><b>API Key</b></label>
                  <input class="form-ctrl" type="text" name="api_key" value="<?php echo htmlspecialchars($cfg['api_key']); ?>">
                </div>
              </div>
              <div class="row mt-2">
                <div class="col-md-3">
                  <label><b>Timeout (seconds)</b> <span style="color:#888">(2-15)</span></label>
                  <input class="form-ctrl" type="number" name="timeout_sec" min="2" max="15" value="<?php echo htmlspecialchars($cfg['timeout_sec']); ?>">
                </div>
                <div class="col-md-4 d-flex align-items-end">
                  <label style="font-size:1rem"><input type="checkbox" name="enabled" <?php if(intval($cfg['enabled'])===1) echo 'checked'; ?>> &nbsp;<b>API feed enabled (global)</b></label>
                </div>
              </div>

              <h5 class="mt-4">Games <span style="font-size:.75rem;color:#888">(tick to take that game's result from the API; type = value of the type= parameter)</span></h5>
              <div class="game-row">
                <label><input type="checkbox" name="en_30s" <?php if(intval($cfg['en_30s'])===1) echo 'checked'; ?>> <b>30 Sec</b></label>
                <span style="width:70px;display:inline-block;color:#888">type=</span><input class="form-ctrl" style="width:110px" type="text" name="param_30s" value="<?php echo htmlspecialchars($cfg['param_30s']); ?>">
                <span style="color:#888">Local period: <b><?php echo htmlspecialchars($localPeriods['30s']); ?></b></span>
                <button type="button" class="btn-min btn-primary" onclick="testApi('30s')">Hit API (Test 30S)</button>
                <span class="stat-chip" id="stat-30s"></span>
                <div class="test-out" id="out-30s" style="display:none; width:100%"></div>
              </div>
              <div class="game-row">
                <label><input type="checkbox" name="en_1m" <?php if(intval($cfg['en_1m'])===1) echo 'checked'; ?>> <b>1 Min</b></label>
                <span style="width:70px;display:inline-block;color:#888">type=</span><input class="form-ctrl" style="width:110px" type="text" name="param_1m" value="<?php echo htmlspecialchars($cfg['param_1m']); ?>">
                <span style="color:#888">Local period: <b><?php echo htmlspecialchars($localPeriods['1m']); ?></b></span>
                <button type="button" class="btn-min btn-primary" onclick="testApi('1m')">Hit API (Test 1M)</button>
                <span class="stat-chip" id="stat-1m"></span>
                <div class="test-out" id="out-1m" style="display:none; width:100%"></div>
              </div>
              <div class="game-row">
                <label><input type="checkbox" name="en_3m" <?php if(intval($cfg['en_3m'])===1) echo 'checked'; ?>> <b>3 Min</b></label>
                <span style="width:70px;display:inline-block;color:#888">type=</span><input class="form-ctrl" style="width:110px" type="text" name="param_3m" value="<?php echo htmlspecialchars($cfg['param_3m']); ?>">
                <span style="color:#888">Local period: <b><?php echo htmlspecialchars($localPeriods['3m']); ?></b></span>
                <button type="button" class="btn-min btn-primary" onclick="testApi('3m')">Hit API (Test 3M)</button>
                <span class="stat-chip" id="stat-3m"></span>
                <div class="test-out" id="out-3m" style="display:none; width:100%"></div>
              </div>
              <div class="game-row">
                <label><input type="checkbox" name="en_5m" <?php if(intval($cfg['en_5m'])===1) echo 'checked'; ?>> <b>5 Min</b></label>
                <span style="width:70px;display:inline-block;color:#888">type=</span><input class="form-ctrl" style="width:110px" type="text" name="param_5m" value="<?php echo htmlspecialchars($cfg['param_5m']); ?>">
                <span style="color:#888">Local period: <b><?php echo htmlspecialchars($localPeriods['5m']); ?></b></span>
                <button type="button" class="btn-min btn-primary" onclick="testApi('5m')">Hit API (Test 5M)</button>
                <span class="stat-chip" id="stat-5m"></span>
                <div class="test-out" id="out-5m" style="display:none; width:100%"></div>
              </div>
              <div class="game-row">
                <label><input type="checkbox" name="en_10m" <?php if(intval($cfg['en_10m'])===1) echo 'checked'; ?>> <b>10 Min</b></label>
                <span style="width:70px;display:inline-block;color:#888">type=</span><input class="form-ctrl" style="width:110px" type="text" name="param_10m" value="<?php echo htmlspecialchars($cfg['param_10m']); ?>">
                <span style="color:#888">Local period: <b><?php echo htmlspecialchars($localPeriods['10m']); ?></b></span>
                <button type="button" class="btn-min btn-primary" onclick="testApi('10m')">Hit API (Test 10M)</button>
                <span class="stat-chip" id="stat-10m"></span>
                <div class="test-out" id="out-10m" style="display:none; width:100%"></div>
              </div>
              <div style="color:#888;font-size:.85rem;margin-top:8px">
                10 Min game has no API endpoint — it always runs on the local algorithm.
              </div>

              <div class="mt-3">
                <button type="submit" class="btn-min btn-success" style="background:#28a745;color:#fff;padding:.5rem 1.5rem">Save Settings</button>
              </div>
            </form>
          </div>

          <div class="card-box">
            <h5>API Activity Log <span style="font-size:.75rem;color:#888">(latest 25)</span></h5>
            <table class="table table-bordered table-striped" style="font-size:.85rem">
              <thead>
                <tr><th>Time</th><th>Game</th><th>Local Period</th><th>API Period</th><th>Number</th><th>Colour</th><th>Status</th><th>Message</th><th>Latency</th></tr>
              </thead>
              <tbody>
                <?php if (count($logs) === 0): ?>
                  <tr><td colspan="9" style="text-align:center;color:#888">No API activity yet</td></tr>
                <?php else: foreach ($logs as $lg): ?>
                  <tr>
                    <td><?php echo htmlspecialchars($lg['created_at']); ?></td>
                    <td><?php echo htmlspecialchars($lg['game_key']); ?></td>
                    <td><?php echo htmlspecialchars($lg['local_period']); ?></td>
                    <td><?php echo htmlspecialchars($lg['api_period'] ?? '-'); ?></td>
                    <td><?php echo htmlspecialchars($lg['api_number'] ?? '-'); ?></td>
                    <td><?php echo htmlspecialchars($lg['api_colour'] ?? '-'); ?></td>
                    <td><?php
                      $st = $lg['status'];
                      if ($st === 'used') echo '<span class="badge-ok">used</span>';
                      else if ($st === 'manual') echo '<span class="badge-warn">manual</span>';
                      else if ($st === 'fallback') echo '<span class="badge-off">fallback</span>';
                      else echo '<span class="badge-bad">' . htmlspecialchars($st) . '</span>';
                    ?></td>
                    <td style="max-width:320px;word-break:break-word"><?php echo htmlspecialchars($lg['message'] ?? ''); ?></td>
                    <td><?php echo $lg['latency_ms'] !== null ? htmlspecialchars($lg['latency_ms']) . 'ms' : '-'; ?></td>
                  </tr>
                <?php endforeach; endif; ?>
              </tbody>
            </table>
          </div>
        </div>
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © bharatgames.online1.com 2024</span>
          </div>
        </footer>
      </div>
    </div>
  </div>
  <script src="vendors/base/vendor.bundle.base.js"></script>
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script>
    // fill quick health chips from the last 25 log rows
    (function () {
      var rows = document.querySelectorAll('.table tbody tr');
      // simple summary per game is rendered server-side into the log; chips kept minimal
    })();
    function testApi(game) {
      var out = document.getElementById('out-' + game);
      out.style.display = 'block';
      out.textContent = 'Hitting API directly...';
      var xhr = new XMLHttpRequest();
      xhr.open('POST', 'wingo_api_test.php', true);
      xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
      xhr.onload = function () {
        try {
          var r = JSON.parse(xhr.responseText);
          var lines = [];
          lines.push('HTTP/parse : ' + (r.ok ? 'OK' : 'FAILED') + (r.error ? ' (' + r.error + ')' : ''));
          lines.push('Latency    : ' + r.latency_ms + ' ms');
          lines.push('API period : ' + (r.api_period || '-'));
          lines.push('Number     : ' + (r.number !== null && r.number !== undefined ? r.number : '-'));
          lines.push('Colour     : ' + (r.colour || '-'));
          lines.push('Next period (latest + 1): ' + (r.next_period || '-'));
          lines.push('Local period: ' + r.local_period);
          if (r.match === 'yes')       lines.push('PERIOD ID  : MATCH');
          else if (r.match === 'no')   lines.push('PERIOD ID  : MISMATCH (check serial scheme)');
          else                         lines.push('PERIOD ID  : unknown');
          lines.push('');
          lines.push('RAW: ' + (r.raw || '').substring(0, 600));
          out.textContent = lines.join('\n');
          out.style.color = r.ok ? '#d1e7dd' : '#f8d7da';
          var chip = document.getElementById('stat-' + game);
          if (chip) {
            chip.textContent = r.ok ? ('last test: OK · ' + r.latency_ms + 'ms') : 'last test: FAILED';
            chip.style.background = r.ok ? '#d4edda' : '#f8d7da';
          }
        } catch (e) {
          out.textContent = 'Test failed: ' + xhr.responseText.substring(0, 300);
          out.style.color = '#f8d7da';
        }
      };
      xhr.onerror = function () { out.textContent = 'Network error'; out.style.color = '#f8d7da'; };
      xhr.send('game=' + encodeURIComponent(game));
    }
  </script>
</body>
</html>
