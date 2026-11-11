<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}
include "connect.php";

// lấy danh sách phòng ban để chọn sửa
$result = mysqli_query($link, "SELECT * FROM phongban");
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cập nhật phòng ban</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>CẬP NHẬT PHÒNG BAN</h2>
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>IDPB</th>
            <th>Tên phòng ban</th>
            <th>Mô tả</th>
            <th></th>
        </tr>
        <?php
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . $row['IDPB'] . "</td>";
            echo "<td>" . $row['Tenpb'] . "</td>";
            echo "<td>" . $row['Mota'] . "</td>";
            echo "<td><a href='form_capnhat.php?IDPB=" . $row['IDPB'] . "'>Sửa</a></td>";
            echo "</tr>";
        }
        mysqli_close($link);
        ?>
    </table>
    <p><a href="index.php">Trang chủ</a></p>
</body>
</html>
