<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignUp</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="login-container">
        <h2>Đăng Kí</h2>
        <form method="POST" action="signup">
            
            <label for="username">Tên đăng nhập:</label>
            <input type="text" name="username" required>
            
            <label for="password">Mật khẩu:</label>
            <input type="password"  name="password" required>
            
            <input type="submit" value="Đăng kí">
        </form>
        
    </div>
</body>
</html>

