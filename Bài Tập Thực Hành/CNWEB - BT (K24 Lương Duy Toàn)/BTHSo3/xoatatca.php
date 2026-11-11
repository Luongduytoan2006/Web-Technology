<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}
include "connect.php";

// xoá các nhân viên đã tích chọn
if (isset($_POST['chon'])) {
    foreach ($_POST['chon'] as $idnv) {
        mysqli_query($link, "DELETE FROM nhanvien WHERE IDNV = '$idnv'");
    }
}

// lấy lại danh sách mới nhất để view
$result = mysqli_query($link, "SELECT * FROM nhanvien");
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xóa nhiều nhân viên</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>XÓA NHIỀU NHÂN VIÊN</h2>
    <form action="xoatatca.php" method="post">
        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th>Chọn</th>
                <th>IDNV</th>
                <th>Họ tên</th>
                <th>IDPB</th>
                <th>Địa chỉ</th>
            </tr>
            <?php
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr>";
                echo "<td><input type='checkbox' name='chon[]' value='" . $row['IDNV'] . "'></td>";
                echo "<td>" . $row['IDNV'] . "</td>";
                echo "<td>" . $row['Hoten'] . "</td>";
                echo "<td>" . $row['IDPB'] . "</td>";
                echo "<td>" . $row['Diachi'] . "</td>";
                echo "</tr>";
            }
            mysqli_close($link);
            ?>
        </table>
        <p><input type="submit" value="Xóa tất cả"></p>
    </form>
    <p><a href="index.php">Trang chủ</a></p>
</body>
</html>
