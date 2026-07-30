<?php
declare(strict_types=1);

const APP_NAME = 'Control de Asistencia';
const INSTITUTION_NAME = 'IES "VÍCTOR RAÚL HAYA DE LA TORRE"';

// Simple .env parser function for zero-dependency approach
$envFile = __DIR__ . '/../.env';
if (file_exists($envFile)) {
    $lines = file($envFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        if (strpos(trim($line), '#') === 0) continue;
        list($name, $value) = explode('=', $line, 2);
        $name = trim($name);
        $value = trim($value);
        if (!array_key_exists($name, $_SERVER) && !array_key_exists($name, $_ENV)) {
            putenv(sprintf('%s=%s', $name, $value));
            $_ENV[$name] = $value;
            $_SERVER[$name] = $value;
        }
    }
}

// Configuración de Base de Datos
define('DB_HOST', $_ENV['DB_HOST'] ?? 'localhost');
define('DB_NAME', $_ENV['DB_NAME'] ?? 'control_asistencia');
define('DB_USER', $_ENV['DB_USER'] ?? 'root');
define('DB_PASS', $_ENV['DB_PASS'] ?? '');
define('DB_CHARSET', $_ENV['DB_CHARSET'] ?? 'utf8mb4');

define('TWILIO_ACCOUNT_SID', $_ENV['TWILIO_ACCOUNT_SID'] ?? 'AC15086a332a4c9c8cd5379a8323438271');
define('TWILIO_AUTH_TOKEN', $_ENV['TWILIO_AUTH_TOKEN'] ?? '230599ae1823331de0b873fb2d4bca75');
define('TWILIO_WHATSAPP_FROM', $_ENV['TWILIO_WHATSAPP_FROM'] ?? 'whatsapp:+14155238886');

function base_url(string $path = ''): string
{
    $base = rtrim(dirname($_SERVER['SCRIPT_NAME'] ?? ''), '/\\');
    return ($base === '' ? '' : $base) . '/' . ltrim($path, '/');
}

