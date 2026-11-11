<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <form action="xulylogin.php" method="post">
        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th colspan="2">Đăng nhập</th>
            </tr>
            <tr>
                <td>Username</td>
                <td><input type="text" name="username"></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" name="login" value="Đăng nhập"></td>
            </tr>
        </table>
    </form>
</body>
</html>
