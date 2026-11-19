<?php
/**
 * ============================================================
 *  BHARAT GAMES - MASTER CONFIG  (DEPLOYMENT: SIRF YE FILE EDIT KARO)
 * ============================================================
 *  cPanel par upload ke baad bas YAHI 4 DATABASE values change
 *  karo (STEP 2 in DEPLOYMENT-cPanel.txt). Poore site ka baaki
 *  code (25+ files) isi file se DB credentials uthata hai aur
 *  domain/URL automatic detect karta hai — kuch aur edit karne
 *  ki zarurat nahi.
 *
 *  Include karne ka tareeka (har file khud karta hai):
 *    require_once __DIR__ . '/../config.php';   // subfolders se
 *    require_once __DIR__ . '/config.php';      // root se
 * ============================================================
 */
if (!defined('BG_CONFIG_LOADED')) {
    define('BG_CONFIG_LOADED', 1);

    /* --------------------------------------------------------
     * STEP 2 (cPanel): IN 4 VALUES KO CHANGE KARO
     * cPanel -> MySQL Databases se milne wale values daalo.
     * Local testing ke liye niche wale defaults rehne do.
     * -------------------------------------------------------- */
    if (!defined('DB_SERVER'))   define('DB_SERVER',   '127.0.0.1');
    if (!defined('DB_USERNAME')) define('DB_USERNAME', 'bhar42501_SQL');
    if (!defined('DB_PASSWORD')) define('DB_PASSWORD', 'BharatG7_Kx9mQ2vL');
    if (!defined('DB_NAME'))     define('DB_NAME',     'bhar42501_SQL');

    /* --------------------------------------------------------
     * DOMAIN — AUTOMATIC (kuch change karne ki zarurat nahi)
     * Browser/web requests par host auto-detect hota hai
     * ($_SERVER['HTTP_HOST'] — https/http dono handle hote hain,
     * Cloudflare/proxy ke liye X-Forwarded-Proto bhi).
     *
     * CLI/cron ke liye (jaha $_SERVER nahi hota) niche wala
     * SITE_DOMAIN optional hai: apna domain daal do to cron se
     * bheje gaye links (emails/notifications) usi se banenge.
     * Khali chhod do to cron links sirf relative rahenge.
     * -------------------------------------------------------- */
    if (!defined('SITE_DOMAIN')) define('SITE_DOMAIN', '');   // e.g. 'https://yourdomain.com'

    if (!defined('BG_SITE_BASE_URL')) {
        $__host = '';
        $__scheme = 'https';
        if (!empty($_SERVER['HTTP_HOST']) || !empty($_SERVER['SERVER_NAME'])) {
            $__host = $_SERVER['HTTP_HOST']
                ?? $_SERVER['SERVER_NAME']
                ?? '';
            if (isset($_SERVER['HTTP_X_FORWARDED_PROTO'])) {
                $__scheme = strtolower(trim(explode(',', $_SERVER['HTTP_X_FORWARDED_PROTO'])[0]));
            } elseif (
                (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== '' && $_SERVER['HTTPS'] !== 'off')
                || (isset($_SERVER['SERVER_PORT']) && intval($_SERVER['SERVER_PORT']) === 443)
            ) {
                $__scheme = 'https';
            } else {
                $__scheme = 'http';
            }
        }
        if ($__host === '' && SITE_DOMAIN !== '') {
            // CLI/cron fallback — SITE_DOMAIN se nikaalo
            $__p = parse_url(SITE_DOMAIN);
            $__host = $__p['host'] ?? '';
            if ($__host !== '' && isset($__p['scheme'])) $__scheme = $__p['scheme'];
        }
        define('BG_SITE_BASE_URL', ($__host !== '') ? $__scheme . '://' . $__host : '');
    }

    /* Helper: full URL (domain auto) — $path '/' se shuru hona chahiye */
    if (!function_exists('site_url')) {
        function site_url($path = '') {
            $base = BG_SITE_BASE_URL;
            if ($base === '' && SITE_DOMAIN !== '') $base = rtrim(SITE_DOMAIN, '/');
            return $base !== '' ? $base . '/' . ltrim($path, '/') : '/' . ltrim($path, '/');
        }
    }
}
