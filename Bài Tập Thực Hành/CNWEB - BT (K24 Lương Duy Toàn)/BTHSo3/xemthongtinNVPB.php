<?php
include "connect.php";

// query lại db lấy nhân viên mới nhất theo phòng ban
$idpb = $_GET['IDPB'];
$sql = "SELECT * FROM nhanvien WHERE IDPB = '$idpb'";
$result = mysqli_query($link, $sql);
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nhân viên theo phòng ban</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>NHÂN VIÊN CỦA PHÒNG BAN <?php echo $idpb; ?></h2>

    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>IDNV</th>
            <th>Họ tên</th>
            <th>IDPB</th>
            <th>Địa chỉ</th>
        </tr>
        <?php
        if (mysqli_num_rows($result) == 0) {
            echo "<tr><td colspan='4'>Phòng ban này chưa có nhân viên</td></tr>";
        }

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

    <p><a href="xemthongtinpb.php">Quay lại danh sách phòng ban</a></p>
</body>
</html>
