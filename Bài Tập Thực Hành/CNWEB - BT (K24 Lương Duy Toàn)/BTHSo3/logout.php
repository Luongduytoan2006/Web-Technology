<?php
session_start();
// xoá session rồi về trang chủ
session_destroy();
header("Location: index.php");
?>
