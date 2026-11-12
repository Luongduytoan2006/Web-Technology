<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "dulieu";

// Kết nối
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Kiểm tra
if (!$conn) {
    die("Kết nối thất bại: " . mysqli_connect_error());
}

mysqli_set_charset($conn, "utf8");
