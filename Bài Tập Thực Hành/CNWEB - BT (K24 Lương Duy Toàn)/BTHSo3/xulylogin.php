<?php
session_start();
include "connect.php";

// kiểm tra tài khoản trong bảng admin
$username = $_POST['username'];
$password = $_POST['password'];

$sql = "SELECT * FROM admin WHERE username = '$username' AND password = '$password'";
$result = mysqli_query($link, $sql);

if (mysqli_num_rows($result) > 0) {
    // đúng tài khoản thì lưu session
    $_SESSION['username'] = $username;
    header("Location: index.php");
} else {
    echo "Sai username hoặc password. <a href='login.php'>Thử lại</a>";
}
mysqli_close($link);
?>
