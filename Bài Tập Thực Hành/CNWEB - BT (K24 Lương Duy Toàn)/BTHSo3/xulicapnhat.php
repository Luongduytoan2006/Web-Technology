<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}
include "connect.php";

// cập nhật phòng ban theo id
$idpb  = $_POST['IDPB'];
$tenpb = $_POST['Tenpb'];
$mota  = $_POST['Mota'];

$sql = "UPDATE phongban SET Tenpb = '$tenpb', Mota = '$mota' WHERE IDPB = '$idpb'";
mysqli_query($link, $sql);
mysqli_close($link);

// xong thì quay lại danh sách
header("Location: capnhat.php");
?>
