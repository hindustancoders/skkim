<?php
/**
 * Router for PHP built-in server (mimics apifolder/.htaccess rewrite):
 * - Extension-less URLs like /apifolder/api/webapi/Login -> Login.php
 * - Static files served directly
 * - / -> index.html
 */
$uri = urldecode(parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));
$path = $_SERVER['DOCUMENT_ROOT'] . $uri;

// exact file exists -> serve as-is
if ($uri !== '/' && file_exists($path) && !is_dir($path)) {
    return false;
}

// extension-less rewrite: path + .php
if ($uri !== '/' && is_file($path . '.php')) {
    chdir(dirname($path . '.php'));
    require $path . '.php';
    return true;
}

// directory without trailing slash -> 301 redirect (mimics Apache mod_dir so relative URLs resolve)
if (is_dir($path) && $uri !== '/' && substr($uri, -1) !== '/') {
    $qs = ($_SERVER['QUERY_STRING'] ?? '') !== '' ? '?' . $_SERVER['QUERY_STRING'] : '';
    header('Location: ' . $uri . '/' . $qs, true, 301);
    return true;
}

// directory index: try index.php then index.html
if (is_dir($path)) {
    if (is_file($path . '/index.php')) {
        chdir($path);
        require $path . '/index.php';
        return true;
    }
    if (is_file($path . '/index.html')) {
        header('Content-Type: text/html; charset=utf-8');
        readfile($path . '/index.html');
        return true;
    }
}

// root fallback -> index.html (SPA)
if ($uri === '/' || $uri === '') {
    if (is_file($_SERVER['DOCUMENT_ROOT'] . '/index.html')) {
        header('Content-Type: text/html; charset=utf-8');
        readfile($_SERVER['DOCUMENT_ROOT'] . '/index.html');
        return true;
    }
}

// try SPA fallback: unknown non-file routes -> index.html
if (!preg_match('/\.(png|jpg|jpeg|gif|css|js|ico|svg|woff2?|ttf|json|mp4|webp)$/i', $uri)) {
    if (is_file($_SERVER['DOCUMENT_ROOT'] . '/index.html')) {
        header('Content-Type: text/html; charset=utf-8');
        readfile($_SERVER['DOCUMENT_ROOT'] . '/index.html');
        return true;
    }
}

http_response_code(404);
echo "404 Not Found: " . htmlspecialchars($uri);
return true;
