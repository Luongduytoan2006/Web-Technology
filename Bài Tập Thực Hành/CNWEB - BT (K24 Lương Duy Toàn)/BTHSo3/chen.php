<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}
include "connect.php";

// chèn nhân viên mới khi bấm nút chèn
if (isset($_POST['chen'])) {
    $idnv   = $_POST['IDNV'];
    $hoten  = $_POST['Hoten'];
    $idpb   = $_POST['IDPB'];
    $diachi = $_POST['Diachi'];

    $sql = "INSERT INTO nhanvien VALUES ('$idnv', '$hoten', '$idpb', '$diachi')";
    if (mysqli_query($link, $sql)) {
        echo "Chèn thành công!";
    } else {
        echo "Lỗi: " . mysqli_error($link);
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chèn nhân viên</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <form action="chen.php" method="post">
        <table border="1" cellpadding="5" cellspacing="0">
            <tr><th colspan="2">Chèn nhân viên</th></tr>
            <tr><td>IDNV</td>   <td><input type="text" name="IDNV"></td></tr>
            <tr><td>Họ tên</td> <td><input type="text" name="Hoten"></td></tr>
            <tr><td>IDPB</td>   <td><input type="text" name="IDPB"></td></tr>
            <tr><td>Địa chỉ</td><td><input type="text" name="Diachi"></td></tr>
            <tr><td colspan="2"><input type="submit" name="chen" value="Chèn"></td></tr>
        </table>
    </form>
    <p><a href="xemthongtinnv.php">Xem danh sách nhân viên</a> | <a href="index.php">Trang chủ</a></p>
</body>
</html>
