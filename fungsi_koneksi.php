<?php
  function koneksi_db(){
    $host = "localhost";
    $user = "root";
    $pass = "";
    $db   = "shipment";
     
    $link = mysql_connect($host,$user,$pass);
     
    mysql_select_db($db,$link);
     
    if (!$link) {
      echo "error : ".mysql_error();
    }
     
    return $link;
  }
?>