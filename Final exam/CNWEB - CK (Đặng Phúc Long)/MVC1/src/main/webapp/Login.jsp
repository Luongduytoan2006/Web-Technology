<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="login-container">
        <h2>Đăng Nhập</h2>
        <form method="POST" action="login">
            
            <label for="username">Tên đăng nhập:</label>
            <input type="text" name="username" required>
            
            <label for="password">Mật khẩu:</label>
            <input type="password"  name="password" required>
            
            
            <div class="button-group">
                <input type="submit" value="Đăng nhập">
                <a href="javascript:history.back()">Hủy</a>
            </div>
        </form>
        
    </div>
</body>
</html>
