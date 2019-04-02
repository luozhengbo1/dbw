<?php
//检测权限

function checkAdmin(){

$this->show("das");

}

function myUrl()
{
   return urlencode('http://'.$_SERVER['SERVER_NAME'].':'.$_SERVER["SERVER_PORT"].$_SERVER["REQUEST_URI"]);
}
?>