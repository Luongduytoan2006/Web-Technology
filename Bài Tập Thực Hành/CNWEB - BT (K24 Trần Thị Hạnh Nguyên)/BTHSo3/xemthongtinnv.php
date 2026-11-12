<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php
    include 'connect.php';
    $query = "SELECT * FROM nhanvien";
    $result = mysqli_query($conn, $query);
    if (!$result) {
        die("Truy vấn thất bại: " . mysqli_error($conn));
    }
    echo `<table> border='1'>
            <tr>
                <th>Mã NV</th>
                <th>Họ Tên</th>
                <th>ID Phòng ban</th>
                <th>Địa Chỉ</th>
            </tr>`;
    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>";
        echo "<td>" . $row[0] . "</td>";
        echo "<td>" . $row[1] . "</td>";
        echo "<td>" . $row[2] . "</td>";
        echo "<td>" . $row[3] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
    ?>
</body>

</html>