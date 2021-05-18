<?php

function getFileListByFileName(string $path, string $_base_path = null, string $filename = 'count'): int
{
    $_base_path .= basename($path) . '/';

    $out = 0;

    foreach(glob($path . '/*') as $file) {
        if (is_dir($file)) {
            $out += getFileListByFileName($file, $_base_path, $filename);
        } elseif (basename($file) === $filename) {

            $countFile = $path . '/' . basename($file);

            $f = fopen($countFile, 'rb');
            $out += (int)fgets($f);

            fclose($f);

        }
    }

    return $out;
}

function getSumCount()
{
    $argDir = getopt("d::");

    $dir = $argDir['d'] ?? '/tmp/counter'; // TODO: доработать для работы с другими операционными системами

    $files = getFileListByFileName($dir);

    echo('Result: ' . $files . PHP_EOL);

}


getSumCount();
