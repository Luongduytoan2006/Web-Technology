<?php
// tắt exception để tự hiện lỗi mysqli_error()
mysqli_report(MYSQLI_REPORT_OFF);

// kết nối csdl DULIEU
$link = mysqli_connect("localhost", "root", "", "DULIEU");

if (!$link) {
    die("Kết nối thất bại: " . mysqli_connect_error());
}

// để hiển thị tiếng việt
mysqli_set_charset($link, "utf8mb4");
?>
