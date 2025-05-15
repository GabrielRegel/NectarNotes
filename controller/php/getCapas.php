<?php
header('Content-Type: application/json');

$directory = '../../pictures/Capas';
$files = [];

if (is_dir($directory)) {
    if ($handle = opendir($directory)) {
        while (($file = readdir($handle)) !== false) {
            if ($file !== '.' && $file !== '..') {
                $files[] = $file;
            }
        }
        closedir($handle);
    }
}

echo json_encode($files);
?>