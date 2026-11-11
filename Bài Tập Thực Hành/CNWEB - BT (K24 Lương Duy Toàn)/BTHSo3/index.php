<?php
session_start();
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>BÀI TẬP THỰC HÀNH SỐ 3</h2>

    <?php if (isset($_SESSION['username'])) { ?>
        <p>Xin chào <?php echo $_SESSION['username']; ?> - <a href="logout.php">Đăng xuất</a></p>
    <?php } else { ?>
        <p><a href="login.php">Đăng nhập</a></p>
    <?php } ?>

    <ul>
        <li><a href="xemthongtinnv.php">Xem thông tin nhân viên</a></li>
        <li><a href="xemthongtinpb.php">Xem thông tin phòng ban</a></li>
        <li><a href="timkiem.php">Tìm kiếm nhân viên</a></li>
        <!-- chức năng khi đã đăng nhập -->
        <?php if (isset($_SESSION['username'])) { ?>
            <li><a href="chen.php">Chèn nhân viên</a></li>
            <li><a href="capnhat.php">Cập nhật phòng ban</a></li>
            <li><a href="xoa.php">Xóa nhân viên</a></li>
            <li><a href="xoatatca.php">Xóa nhiều nhân viên</a></li>
        <?php } ?>
    </ul>
</body>
</html>
