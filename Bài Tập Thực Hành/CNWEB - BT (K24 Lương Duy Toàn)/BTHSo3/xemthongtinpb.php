<?php
include "connect.php";

// lấy danh sách phòng ban
$sql = "SELECT * FROM phongban";
$result = mysqli_query($link, $sql);
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông tin phòng ban</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>THÔNG TIN PHÒNG BAN</h2>

    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>IDPB</th>
            <th>Tên phòng ban</th>
            <th>Mô tả</th>
            <th>Nhân viên</th>
        </tr>
        <?php while ($row = mysqli_fetch_assoc($result)) { ?>
            <tr>
                <td><?php echo $row['IDPB']; ?></td>
                <td><?php echo $row['Tenpb']; ?></td>
                <td><?php echo $row['Mota']; ?></td>
                <td>
                    <!-- xem nhân viên theo phòng ban -->
                    <a href="xemthongtinNVPB.php?IDPB=<?php echo $row['IDPB']; ?>">Xem nhân viên</a>
                </td>
            </tr>
        <?php } ?>
    </table>

    <?php mysqli_close($link); ?>
    <p><a href="index.php">Về trang chủ</a></p>
</body>
</html>
