<?php
session_start();
if (empty($_SESSION['unohs'])) {
    header("location:index.php?msg=unauthorized");
    exit;
}
include("conn.php");
include("navtop.php");
?>
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title" style="font-weight:bold;">
                                <i class="fa fa-comments"></i> User Support Chat
                                <small class="text-muted d-block">Live chat with users - click a conversation, reply, or delete any message</small>
                            </h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body" style="max-height:600px; overflow:auto;">
                            <h5>Conversations</h5>
                            <div id="userList" class="list-group mt-2">Loading...</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="card">
                        <div class="card-body">
                            <div id="chatHeader" class="mb-2"><b>Select a conversation</b></div>
                            <div id="chatBox" style="height:420px; overflow-y:auto; background:#f5f7fb; border-radius:8px; padding:16px;"></div>
                            <div class="mt-3 d-flex">
                                <input type="text" id="replyInput" class="form-control mr-2" placeholder="Type your reply..." disabled>
                                <button id="replyBtn" class="btn btn-gradient-primary" disabled><i class="fa fa-send"></i> Send</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script>
            var currentUserId = null;

            function loadUsers() {
                var fd = new FormData(); fd.append('action', 'users');
                fetch('chat_api.php', { method: 'POST', body: fd, credentials: 'same-origin' })
                    .then(function(r) { return r.json(); })
                    .then(function(d) {
                        var el = document.getElementById('userList');
                        if (!d.data || d.data.length === 0) { el.innerHTML = '<div class="text-muted p-2">No conversations yet.</div>'; return; }
                        el.innerHTML = '';
                        d.data.forEach(function(u) {
                            var a = document.createElement('a');
                            a.href = 'javascript:void(0)';
                            a.className = 'list-group-item list-group-item-action' + (u.id === currentUserId ? ' active' : '');
                            a.innerHTML = '<b>' + u.mobile + '</b>' + (u.unread > 0 ? ' <span class="badge badge-danger">' + u.unread + '</span>' : '') +
                                '<div style="font-size:11px;" class="text-muted">' + u.lastTime + '</div>';
                            a.onclick = function() { currentUserId = u.id; loadUsers(); loadHistory(u.id, u.mobile); };
                            el.appendChild(a);
                        });
                    });
            }

            function esc(s) { var d = document.createElement('div'); d.textContent = s == null ? '' : s; return d.innerHTML; }

            function loadHistory(uid, mobile) {
                document.getElementById('chatHeader').innerHTML = '<b>Chat with ' + esc(mobile) + ' (user #' + uid + ')</b>';
                document.getElementById('replyInput').disabled = false;
                document.getElementById('replyBtn').disabled = false;
                var fd = new FormData(); fd.append('action', 'history'); fd.append('user_id', uid);
                fetch('chat_api.php', { method: 'POST', body: fd, credentials: 'same-origin' })
                    .then(function(r) { return r.json(); })
                    .then(function(d) {
                        var box = document.getElementById('chatBox');
                        box.innerHTML = '';
                        (d.data || []).forEach(function(m) {
                            var wrap = document.createElement('div');
                            wrap.style.margin = '8px 0';
                            wrap.style.textAlign = m.sender === 'admin' ? 'right' : 'left';
                            var isAdmin = m.sender === 'admin';
                            var bubble = document.createElement('span');
                            bubble.style.cssText = 'display:inline-block;max-width:70%;padding:8px 12px;border-radius:12px;font-size:14px;' +
                                (isAdmin ? 'background:#1a73e8;color:#fff;' : 'background:#fff;border:1px solid #ddd;color:#222;');
                            if (m.deleted) {
                                bubble.style.cssText += 'background:#eee;color:#999;font-style:italic;';
                                bubble.textContent = '[message deleted by admin]';
                            } else {
                                bubble.textContent = m.message;
                            }
                            var meta = document.createElement('div');
                            meta.style.fontSize = '10px';
                            meta.style.color = '#888';
                            meta.innerHTML = (isAdmin ? 'Admin' : 'User') + ' · ' + m.createdAt +
                                ' &nbsp;<a href="javascript:void(0)" style="color:#e53935;" onclick="deleteMsg(' + m.id + ')">delete</a>';
                            wrap.appendChild(bubble);
                            wrap.appendChild(meta);
                            box.appendChild(wrap);
                        });
                        box.scrollTop = box.scrollHeight;
                    });
            }

            function deleteMsg(id) {
                if (!confirm('Delete this message? Users will see "[message deleted by admin]". Continue?')) return;
                var fd = new FormData(); fd.append('action', 'delete'); fd.append('message_id', id);
                fetch('chat_api.php', { method: 'POST', body: fd, credentials: 'same-origin' })
                    .then(function(r) { return r.json(); })
                    .then(function() { if (currentUserId) loadHistory(currentUserId, document.getElementById('chatHeader').textContent.replace('Chat with ', '').split(' (')[0]); loadUsers(); });
            }

            document.getElementById('replyBtn').onclick = function() {
                var inp = document.getElementById('replyInput');
                var msg = inp.value.trim();
                if (!msg || !currentUserId) return;
                var fd = new FormData();
                fd.append('action', 'send'); fd.append('user_id', currentUserId); fd.append('message', msg);
                fetch('chat_api.php', { method: 'POST', body: fd, credentials: 'same-origin' })
                    .then(function(r) { return r.json(); })
                    .then(function() { inp.value = ''; loadHistory(currentUserId, document.getElementById('chatHeader').textContent.replace('Chat with ', '').split(' (')[0]); });
            };

            loadUsers();
            setInterval(loadUsers, 15000);
            </script>
<?php include("navfoot.php"); ?>
