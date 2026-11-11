<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}
include "connect.php";

// xoá nhân viên theo id
if (isset($_GET['IDNV'])) {
    $idnv = $_GET['IDNV'];
    mysqli_query($link, "DELETE FROM nhanvien WHERE IDNV = '$idnv'");
}

// lấy lại danh sách mới nhất để view
$result = mysqli_query($link, "SELECT * FROM nhanvien");
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xóa nhân viên</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>XÓA NHÂN VIÊN</h2>
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>IDNV</th>
            <th>Họ tên</th>
            <th>IDPB</th>
            <th>Địa chỉ</th>
            <th></th>
        </tr>
        <?php
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . $row['IDNV'] . "</td>";
            echo "<td>" . $row['Hoten'] . "</td>";
            echo "<td>" . $row['IDPB'] . "</td>";
            echo "<td>" . $row['Diachi'] . "</td>";
            echo "<td><a href='xoa.php?IDNV=" . $row['IDNV'] . "'>Xóa</a></td>";
            echo "</tr>";
        }
        mysqli_close($link);
        ?>
    </table>
    <p><a href="index.php">Trang chủ</a></p>
</body>
</html>
