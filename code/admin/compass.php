                <?php
        if (session_status() === PHP_SESSION_NONE) { @session_start(); }
        if (empty($_SESSION['unohs'])) return;
        if(!isset($conn) || !$conn){ http_response_code(403); exit; }
                        $chkserial = mysqli_query($conn,"select * from `admin_users` where `unohs`='".$_SESSION['unohs']."'");
                        $salu = mysqli_fetch_array($chkserial);
                        $dashboard = $salu['dashboard'];
                        $wingomanager = $salu['wingomanager'];
                        $k3manager = $salu['k3manager'];
                        $d5manager = $salu['5dmanager'];
                        $finance = $salu['finance'];
                        $managegame = $salu['managegame'];
            $support = $salu['support'];

            /* ---- active page helpers: highlight + auto-open current section ---- */
            $__cur = basename(strtok($_SERVER['REQUEST_URI'] ?? '', '?'));
            if ($__cur === '' || $__cur === 'index.php') $__cur = 'dashboard.php';
            if (!function_exists('compass_nav_item')) {
                function compass_nav_item($file, $title, $current) {
                    $active = ($current === $file) ? ' active' : '';
                    echo '<li class="nav-item"><a class="nav-link' . $active . '" href="' . $file . '">' . $title . '</a></li>';
                }
                function compass_section($id, $title, $icon, $files, $current) {
                    $isOpen = in_array($current, $files, true);
                    echo '<li class="nav-item' . ($isOpen ? ' active' : '') . '">'
                       . '<a class="nav-link" data-toggle="collapse" href="#' . $id . '" aria-expanded="' . ($isOpen ? 'true' : 'false') . '" aria-controls="' . $id . '">'
                       . '<i class="' . $icon . ' menu-icon"></i><span class="menu-title">' . $title . '</span><i class="menu-arrow"></i></a>'
                       . '<div class="collapse' . ($isOpen ? ' show' : '') . '" id="' . $id . '">'
                       . '<ul class="nav flex-column sub-menu">';
                }
                function compass_section_end() {
                    echo '</ul></div></li>';
                }
            }
                ?>
                <ul class="nav">
          <li class="nav-item<?php echo ($__cur === 'dashboard.php') ? ' active' : ''; ?>">
            <a class="nav-link" href="dashboard.php">
              <i class="icon-box menu-icon"></i>
              <span class="menu-title">Dashboard</span>
            </a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="/" target="_blank">
              <i class="icon-box menu-icon"></i>
              <span class="menu-title">Service Centre</span>
            </a>
          </li>
                  <?php
                        if($wingomanager == 1){
                  ?>
                        <?php compass_section('menu-wingomanager', 'WinGo Manager', 'icon-disc', ['wingo10min.php','wingo1min.php','wingo3min.php','wingo5min.php','wingo_api_settings.php'], $__cur); ?>
                <?php compass_nav_item('wingo10min.php', 'WinGo 30 Sec', $__cur); ?>
                <?php compass_nav_item('wingo1min.php', 'WinGo 1 Min', $__cur); ?>
                <?php compass_nav_item('wingo3min.php', 'WinGo 3 Min', $__cur); ?>
                <?php compass_nav_item('wingo5min.php', 'WinGo 5 Min', $__cur); ?>
                <?php compass_nav_item('wingo_api_settings.php', 'WinGo API Settings', $__cur); ?>
                        <?php compass_section_end(); ?>
                  <?php
                        }
                        if($k3manager == 1){
                  ?>
                        <?php compass_section('menu-k3manager', 'K3 Manager', 'icon-disc', ['k31min.php','k33min.php','k35min.php','k310min.php'], $__cur); ?>
                <?php compass_nav_item('k31min.php', 'K3 1 Min', $__cur); ?>
                <?php compass_nav_item('k33min.php', 'K3 3 Min', $__cur); ?>
                <?php compass_nav_item('k35min.php', 'K3 5 Min', $__cur); ?>
                <?php compass_nav_item('k310min.php', 'K3 10 Min', $__cur); ?>
                        <?php compass_section_end(); ?>
                  <?php
                        }
                        if($d5manager == 1){
                  ?>
                        <?php compass_section('menu-5dmanager', '5D Manager', 'icon-disc', ['5d1min.php','5d3min.php','5d5min.php','5d10min.php'], $__cur); ?>
                <?php compass_nav_item('5d1min.php', '5D 1 Min', $__cur); ?>
                <?php compass_nav_item('5d3min.php', '5D 3 Min', $__cur); ?>
                <?php compass_nav_item('5d5min.php', '5D 5 Min', $__cur); ?>
                <?php compass_nav_item('5d10min.php', '5D 10 Min', $__cur); ?>
                        <?php compass_section_end(); ?>
                  <?php
                        }
                        if($finance == 1){
                  ?>
                        <?php compass_section('menu-finance', 'Finance', 'icon-book', ['addupi.php','usdtkids.php','addusdt.php','addupiimg.php','addimgusdt_2.php','deposit_update.php','manage_withdraw.php','withdraw_accept_list.php','withdraw_reject_list.php','update_with_pay.php','watchpay_accounts.php','watchpay_payouts.php','qwackpay_accounts.php'], $__cur); ?>
                <?php compass_nav_item('addupi.php', 'Add Upi', $__cur); ?>
                <?php compass_nav_item('usdtkids.php', 'USDT Rate', $__cur); ?>
                <?php compass_nav_item('addusdt.php', 'Add Usdt', $__cur); ?>
                <?php compass_nav_item('addupiimg.php', 'Add Upi Image', $__cur); ?>
                <?php compass_nav_item('addimgusdt_2.php', 'Add Usdt Image', $__cur); ?>
                <?php compass_nav_item('deposit_update.php', 'Deposit Update', $__cur); ?>
                <?php compass_nav_item('manage_withdraw.php', 'Withdraw Apply', $__cur); ?>
                <?php compass_nav_item('withdraw_accept_list.php', 'Withdraw Sent', $__cur); ?>
                <?php compass_nav_item('withdraw_reject_list.php', 'Withdraw Reject', $__cur); ?>
                <?php compass_nav_item('update_with_pay.php', 'Update Gateway', $__cur); ?>
                <?php compass_nav_item('watchpay_accounts.php', 'WatchPay Accounts', $__cur); ?>
                <?php compass_nav_item('watchpay_payouts.php', 'WatchPay Payouts', $__cur); ?>
                <?php compass_nav_item('qwackpay_accounts.php', 'QwackPay Accounts', $__cur); ?>
                <?php compass_nav_item('watchpay_payouts.php?gateway=qwackpay', 'QwackPay Payouts', $__cur); ?>
                        <?php compass_section_end(); ?>
                  <?php
                        }
                        if($support == 1){
                  ?>
                        <?php compass_section('menu-support', 'Support', 'icon-book', ['deposite.php','withprob.php','ifscm.php','bankm.php','gamep.php'], $__cur); ?>
                <?php compass_nav_item('deposite.php', 'Deposite Problem', $__cur); ?>
                <?php compass_nav_item('withprob.php', 'Withdrawal Problem', $__cur); ?>
                <?php compass_nav_item('ifscm.php', 'IFSC Modification', $__cur); ?>
                <?php compass_nav_item('bankm.php', 'Bank Modification', $__cur); ?>
                <?php compass_nav_item('gamep.php', 'Game Problem', $__cur); ?>
                        <?php compass_section_end(); ?>
                  <?php
                        }
                        if($managegame == 1){
                  ?>
                        <?php compass_section('menu-managegame', 'Manage Game', 'icon-head', ['userbonus.php','manage_bet.php','manage_bankcard.php','adminpass.php','autobanuser.php','mainkids.php','banbybet.php','updatejet.php','manage_support.php','manage_user.php','manage_salary.php','addgiftcode.php','addtelegram.php','addadmin.php','demouser.php','agentuser.php'], $__cur); ?>
                <?php compass_nav_item('userbonus.php', 'Bonus Manage', $__cur); ?>
                <?php compass_nav_item('manage_bet.php', 'Manage Illegal Bet', $__cur); ?>
                <?php compass_nav_item('manage_bankcard.php', 'Modify Bank Details', $__cur); ?>
                <?php compass_nav_item('adminpass.php', 'Admin Password', $__cur); ?>
                <?php compass_nav_item('autobanuser.php', 'Check Same IP', $__cur); ?>
                <?php compass_nav_item('mainkids.php', 'Maintenance', $__cur); ?>
                <?php compass_nav_item('banbybet.php', 'Ban Illegal Users', $__cur); ?>
                <?php compass_nav_item('updatejet.php', 'Jet Max Value', $__cur); ?>
                <?php compass_nav_item('manage_support.php', 'Users Query', $__cur); ?>
                <?php compass_nav_item('manage_user.php', 'Users', $__cur); ?>
                <?php compass_nav_item('manage_salary.php', 'Daily Salary', $__cur); ?>
                <?php compass_nav_item('addgiftcode.php', 'Gift Code', $__cur); ?>
                <?php compass_nav_item('addtelegram.php', 'Telegram', $__cur); ?>
                <?php compass_nav_item('addadmin.php', 'Add Admin', $__cur); ?>
                <?php compass_nav_item('demouser.php', 'Demo User', $__cur); ?>
                <?php compass_nav_item('agentuser.php', 'Agent User', $__cur); ?>
                        <?php compass_section_end(); ?>
                  <?php
                        }
                  ?>
           <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#menu-advanced" aria-expanded="false" aria-controls="menu-advanced">
              <i class="fa fa-rocket menu-icon"></i>
              <span class="menu-title">Advanced</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="menu-advanced">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="watchpay_accounts.php"><i class="fa fa-credit-card"></i> WatchPay Accounts</a></li>
                <li class="nav-item"> <a class="nav-link" href="watchpay_payouts.php"><i class="fa fa-paper-plane"></i> WatchPay Payouts</a></li>
                <li class="nav-item"> <a class="nav-link" href="qwackpay_accounts.php"><i class="fa fa-university"></i> QwackPay Accounts</a></li>
                <li class="nav-item"> <a class="nav-link" href="watchpay_payouts.php?gateway=qwackpay"><i class="fa fa-money"></i> QwackPay Payouts</a></li>
                <li class="nav-item"> <a class="nav-link" href="manage_banners.php"><i class="fa fa-image"></i> Banner Manager</a></li>
                <li class="nav-item"> <a class="nav-link" href="manage_popups.php"><i class="fa fa-bullhorn"></i> Popup Notices</a></li>
                <li class="nav-item"> <a class="nav-link" href="chat.php"><i class="fa fa-comments"></i> User Chat</a></li>
                <li class="nav-item"> <a class="nav-link" href="audit_log.php"><i class="fa fa-history"></i> Audit Log</a></li>
                <li class="nav-item"> <a class="nav-link" href="export_reports.php"><i class="fa fa-download"></i> Export Reports</a></li>
              </ul>
            </div>
          </li>
                 <li class="nav-item">
                    <a href="/" class="nav-link" target="_blank">
                        <i class="nav-icon fa fa-sign-out" aria-hidden="true"></i>
                        <span class="menu-title">Go To Website</span>
                    </a>
                </li>
        </ul>
