<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}
include "connect.php";

// lấy thông tin phòng ban cần sửa theo id
$idpb = $_GET['IDPB'];
$result = mysqli_query($link, "SELECT * FROM phongban WHERE IDPB = '$idpb'");
$row = mysqli_fetch_assoc($result);
mysqli_close($link);
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sửa phòng ban</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <form action="xulicapnhat.php" method="post">
        <table border="1" cellpadding="5" cellspacing="0">
            <tr><th colspan="2">Sửa phòng ban</th></tr>
            <tr>
                <td>IDPB</td>
                <td><input type="text" name="IDPB" value="<?php echo $row['IDPB']; ?>" readonly></td>
            </tr>
            <tr>
                <td>Tên phòng ban</td>
                <td><input type="text" name="Tenpb" value="<?php echo $row['Tenpb']; ?>"></td>
            </tr>
            <tr>
                <td>Mô tả</td>
                <td><input type="text" name="Mota" value="<?php echo $row['Mota']; ?>"></td>
            </tr>
            <tr><td colspan="2"><input type="submit" value="Lưu"></td></tr>
        </table>
    </form>
</body>
</html>
