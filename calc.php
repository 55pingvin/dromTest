<?php

function getSumCount()
{

    $num = shell_exec('find -type f -name count  -exec cat {} \;');

    $num = explode(PHP_EOL, $num);
    $result = 0;

    foreach ($num as $sumNum) {
        $result += $sumNum;
    }

    echo(
    sprintf(
        '%s: %s %s',
        'Сумма',
        $result,
        PHP_EOL
    ));

}


getSumCount();
