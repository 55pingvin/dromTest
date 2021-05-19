<?php

function getSum(string $path, string $base_path = null, string $filename = 'count'): int
{
    $base_path .= basename($path) . '/';

    $result = 0;

    foreach(glob($path . '/*') as $file) {
        if (is_dir($file)) {
            $result += getSum($file, $base_path, $filename);
        } elseif (basename($file) === $filename) {

            $countFile = $path . '/' . basename($file);

            $f = fopen($countFile, 'rb');
            $result += (int)fgets($f);

            fclose($f);

        }
    }

    return $result;
}

function getSumCount()
{
    $argDir = getopt("p::");

    $dir = $argDir['p'] ?? '/tmp/counter'; // TODO: доработать для работы с другими операционными системами

    $files = getSum($dir);

    echo('Result: ' . $files . PHP_EOL);

}


getSumCount();
