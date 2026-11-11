<?php
include "connect.php";

$tieuchi = "IDNV";
$tukhoa  = "";

// tìm nhân viên theo tiêu chí đã chọn
if (isset($_POST['search'])) {
    $tieuchi = $_POST['tieuchi'];
    $tukhoa  = $_POST['tukhoa'];

    $sql = "SELECT * FROM nhanvien WHERE $tieuchi LIKE '%$tukhoa%'";
    $result = mysqli_query($link, $sql);
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tìm kiếm thông tin</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <form action="timkiem.php" method="post">
        <table border="1" cellpadding="8" cellspacing="0">
            <tr>
                <th>Tìm Kiếm Thông Tin</th>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="tieuchi" value="IDNV"   <?php if ($tieuchi == "IDNV")   echo "checked"; ?>> IDNV
                    <input type="radio" name="tieuchi" value="Hoten"  <?php if ($tieuchi == "Hoten")  echo "checked"; ?>> Hoten
                    <input type="radio" name="tieuchi" value="Diachi" <?php if ($tieuchi == "Diachi") echo "checked"; ?>> Diachi
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="tukhoa" value="<?php echo $tukhoa; ?>">
                    <input type="submit" name="search" value="Search">
                </td>
            </tr>
        </table>
    </form>

    <?php
    // hiện kết quả sau khi bấm search
    if (isset($_POST['search'])) {
        echo "<h3>Kết quả tìm kiếm theo $tieuchi: \"$tukhoa\"</h3>";
        echo "<table border='1' cellpadding='5' cellspacing='0'>";
        echo "<tr><th>IDNV</th><th>Họ tên</th><th>IDPB</th><th>Địa chỉ</th></tr>";

        if (mysqli_num_rows($result) == 0) {
            echo "<tr><td colspan='4'>Không tìm thấy</td></tr>";
        }
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . $row['IDNV'] . "</td>";
            echo "<td>" . $row['Hoten'] . "</td>";
            echo "<td>" . $row['IDPB'] . "</td>";
            echo "<td>" . $row['Diachi'] . "</td>";
            echo "</tr>";
        }
        echo "</table>";
    }
    mysqli_close($link);
    ?>

    <p><a href="index.php">Về trang chủ</a></p>
</body>
</html>
