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
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['save_settings'])) {
                $enabled   = isset($_POST['enabled']) ? 1 : 0;
                $apiBase   = trim($_POST['api_base']);
                $apiKey    = trim($_POST['api_key']);
                $timeout   = max(2, min(30, intval($_POST['timeout_sec'])));
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
                $proxyTpls = '';
                if (isset($_POST['proxy_tpls'])) {
                        $proxyTpls = implode("\n", array_filter(array_map('trim', explode("\n", str_replace("\r", "", $_POST['proxy_tpls'])))));
                }

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
                        `param_10m`='" . mysqli_real_escape_string($conn, $p10m) . "',
                        `proxy_tpls`='" . mysqli_real_escape_string($conn, $proxyTpls) . "'
                        WHERE `id`=1");
                $saveMsg = $up ? "Settings saved successfully." : "Save failed: " . mysqli_error($conn);
                $cfg = wingo_api_get_config($conn);
        }

        $logRes = mysqli_query($conn, "SELECT * FROM `wingo_api_log` ORDER BY log_id DESC LIMIT 25");
        $logs = [];
        if ($logRes) { while ($r = mysqli_fetch_assoc($logRes)) { $logs[] = $r; } }

        // our latest local period ids (for alignment check)
        $localPeriods = [];
        foreach (['30s'=>'wingo_periods_30sec','1m'=>'wingo_periods_1min','3m'=>'wingo_periods_3min','5m'=>'wingo_periods_5min','10m'=>'wingo_periods_10min'] as $gk => $tbl) {
                $r = mysqli_query($conn, "SELECT atadaaidi FROM `" . $tbl . "` ORDER BY kramasankhye DESC LIMIT 1");
                $localPeriods[$gk] = ($r && mysqli_num_rows($r) > 0) ? mysqli_fetch_assoc($r)['atadaaidi'] : '-';
        }

        $proxyVal = isset($cfg['proxy_tpls']) ? strval($cfg['proxy_tpls']) : implode("\n", wingo_api_default_proxies());
        $lgPath = intval(isset($cfg['last_good_path']) ? $cfg['last_good_path'] : 0);
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
    .game-row { display:flex; align-items:center; gap:12px; flex-wrap:wrap; border-top:1px dashed #e0e0e0; padding:.6rem 0; }
    .test-out { font-family:monospace; background:#212529; color:#d1e7dd; padding:.6rem; border-radius:4px; font-size:.78rem; max-height:150px; overflow:auto; margin-top:.4rem; white-space:pre-wrap; }
    .btn-min { padding:.35rem .8rem; font-size:.85rem; border-radius:4px; border:none; cursor:pointer; }
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
          <div class="user-name">Imitator</div>
          <div class="user-designation">Developer</div>
        </div>
        <?php include 'compass.php';?>
      </nav>
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-sm-12 mb-4 mb-xl-0">
              <h4 class="font-weight-bold text-dark">WinGo API Settings <span style="font-size:.75rem;color:#888">(external result feed)</span></h4>
            </div>
          </div>

          <?php if ($saveMsg != ''): ?>
            <div class="alert alert-success"><?php echo htmlspecialchars($saveMsg); ?></div>
          <?php endif; ?>

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
                  <label><b>Timeout (seconds)</b></label>
                  <input class="form-ctrl" type="number" name="timeout_sec" min="2" max="30" value="<?php echo htmlspecialchars($cfg['timeout_sec']); ?>">
                </div>
                <div class="col-md-3 d-flex align-items-end">
                  <label style="font-size:1rem"><input type="checkbox" name="enabled" <?php if(intval($cfg['enabled'])===1) echo 'checked'; ?>> &nbsp;<b>API feed enabled (global)</b></label>
                </div>
              </div>

              <h5 class="mt-4">Proxy fallback <span style="font-size:.75rem;color:#888">(used automatically when the API blocks direct server calls, one per line; {URL} = full API url, {URL_ENC} = urlencoded)</span></h5>
              <div class="row">
                <div class="col-md-12">
                  <textarea class="form-ctrl" name="proxy_tpls" rows="4" style="font-family:monospace;font-size:.8rem"><?php echo htmlspecialchars($proxyVal); ?></textarea>
                  <div style="color:#888;font-size:.8rem;margin-top:4px">Last successful path: <b><?php echo $lgPath === 0 ? 'direct' : 'proxy #' . $lgPath; ?></b></div>
                </div>
              </div>

              <h5 class="mt-4">Games</h5>
              <div class="game-row">
                <label><input type="checkbox" name="en_30s" <?php if(intval($cfg['en_30s'])===1) echo 'checked'; ?>> 30 Sec</label>
                <span style="width:90px;display:inline-block">type=</span><input class="form-ctrl" style="width:110px" type="text" name="param_30s" value="<?php echo htmlspecialchars($cfg['param_30s']); ?>">
                <span style="color:#888">Local period: <b><?php echo htmlspecialchars($localPeriods['30s']); ?></b></span>
                <button type="button" class="btn-min btn-primary" onclick="testApi('30s')">Test 30S</button>
                <div class="test-out" id="out-30s" style="display:none"></div>
              </div>
              <div class="game-row">
                <label><input type="checkbox" name="en_1m" <?php if(intval($cfg['en_1m'])===1) echo 'checked'; ?>> 1 Min</label>
                <span style="width:90px;display:inline-block">type=</span><input class="form-ctrl" style="width:110px" type="text" name="param_1m" value="<?php echo htmlspecialchars($cfg['param_1m']); ?>">
                <span style="color:#888">Local period: <b><?php echo htmlspecialchars($localPeriods['1m']); ?></b></span>
                <button type="button" class="btn-min btn-primary" onclick="testApi('1m')">Test 1M</button>
                <div class="test-out" id="out-1m" style="display:none"></div>
              </div>
              <div class="game-row">
                <label><input type="checkbox" name="en_3m" <?php if(intval($cfg['en_3m'])===1) echo 'checked'; ?>> 3 Min</label>
                <span style="width:90px;display:inline-block">type=</span><input class="form-ctrl" style="width:110px" type="text" name="param_3m" value="<?php echo htmlspecialchars($cfg['param_3m']); ?>">
                <span style="color:#888">Local period: <b><?php echo htmlspecialchars($localPeriods['3m']); ?></b></span>
                <button type="button" class="btn-min btn-primary" onclick="testApi('3m')">Test 3M</button>
                <div class="test-out" id="out-3m" style="display:none"></div>
              </div>
              <div class="game-row">
                <label><input type="checkbox" name="en_5m" <?php if(intval($cfg['en_5m'])===1) echo 'checked'; ?>> 5 Min</label>
                <span style="width:90px;display:inline-block">type=</span><input class="form-ctrl" style="width:110px" type="text" name="param_5m" value="<?php echo htmlspecialchars($cfg['param_5m']); ?>">
                <span style="color:#888">Local period: <b><?php echo htmlspecialchars($localPeriods['5m']); ?></b></span>
                <button type="button" class="btn-min btn-primary" onclick="testApi('5m')">Test 5M</button>
                <div class="test-out" id="out-5m" style="display:none"></div>
              </div>
              <div class="game-row">
                <label><input type="checkbox" name="en_10m" <?php if(intval($cfg['en_10m'])===1) echo 'checked'; ?>> 10 Min</label>
                <span style="width:90px;display:inline-block">type=</span><input class="form-ctrl" style="width:110px" type="text" name="param_10m" value="<?php echo htmlspecialchars($cfg['param_10m']); ?>">
                <span style="color:#888">Local period: <b><?php echo htmlspecialchars($localPeriods['10m']); ?></b></span>
                <button type="button" class="btn-min btn-primary" onclick="testApi('10m')">Test 10M</button>
                <div class="test-out" id="out-10m" style="display:none"></div>
              </div>

              <div class="mt-3">
                <button type="submit" class="btn-min btn-success" style="background:#28a745;color:#fff;padding:.5rem 1.5rem">Save Settings</button>
                <span style="color:#888;margin-left:12px;font-size:.85rem">Priority: Admin prediction &gt; API feed &gt; auto algorithm</span>
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
                      else if ($st === 'lag') echo '<span class="badge-warn">lag</span>';
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
    function testApi(game) {
      var out = document.getElementById('out-' + game);
      out.style.display = 'block';
      out.textContent = 'Testing...';
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
          lines.push('Local period: ' + r.local_period);
          if (r.match === 'yes')       lines.push('PERIOD ID  : MATCH');
          else if (r.match === 'no')   lines.push('PERIOD ID  : MISMATCH (check serial scheme)');
          else                         lines.push('PERIOD ID  : unknown');
          lines.push('');
          lines.push('RAW: ' + (r.raw || '').substring(0, 600));
          out.textContent = lines.join('\n');
          out.style.color = r.ok ? '#d1e7dd' : '#f8d7da';
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
