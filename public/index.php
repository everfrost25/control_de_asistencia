<?php
declare(strict_types=1);

require_once __DIR__ . '/../app/session.php';
start_app_session();
require_once __DIR__ . '/../app/helpers.php';

if (app_user()) {
    flush_pending_whatsapp_login_notification();
}

require __DIR__ . '/layout.php';
