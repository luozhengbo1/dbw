<?php
function printOrder($device_no,$key,$times,$orderInfo){ // $times打印次数
    $selfMessage = array(
        'deviceNo'=>$device_no,
        'printContent'=>$orderInfo,
        'key'=>$key,
        'times'=>$times
    );
    $url = "http://open.printcenter.cn:8080/addOrder";
    $options = array(
        'http' => array(
            'header' => "Content-type: application/x-www-form-urlencoded ",
            'method'  => 'POST',
            'content' => http_build_query($selfMessage),
        ),
    );
    $context  = stream_context_create($options);
    $result = file_get_contents($url, false, $context);
    return $result;
}