<?php
include "connect.php";

// lấy danh sách nhân viên
$sql = "SELECT * FROM nhanvien";
$result = mysqli_query($link, $sql);
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông tin nhân viên</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>THÔNG TIN NHÂN VIÊN</h2>

    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>IDNV</th>
            <th>Họ tên</th>
            <th>IDPB</th>
            <th>Địa chỉ</th>
        </tr>
        <?php
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . $row['IDNV'] . "</td>";
            echo "<td>" . $row['Hoten'] . "</td>";
            echo "<td>" . $row['IDPB'] . "</td>";
            echo "<td>" . $row['Diachi'] . "</td>";
            echo "</tr>";
        }

        mysqli_close($link);
        ?>
    </table>

    <p><a href="index.php">Về trang chủ</a></p>
</body>
</html>
