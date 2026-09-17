<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng nhập - Quản lý nhân sự</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        font-family: 'Roboto', Arial, sans-serif;
        background: linear-gradient(135deg, #4b6cb7 0%, #182848 100%);
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        position: relative;
        overflow: hidden;
    }
    
    body::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: url('https://i.imgur.com/8BZrPcr.png');
        opacity: 0.05;
        pointer-events: none;
    }
    
    .login-container {
        background: white;
        padding: 40px;
        border-radius: 16px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        width: 90%;
        max-width: 420px;
        position: relative;
        z-index: 1;
        overflow: hidden;
        animation: fadeIn 0.8s ease-out;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    .login-container::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 6px;
        background: linear-gradient(90deg, #4b6cb7, #182848);
        z-index: 2;
    }
    
    .login-title {
        text-align: center;
        color: #333;
        margin-bottom: 40px;
        font-size: 28px;
        font-weight: 700;
        position: relative;
    }
    
    .login-title::after {
        content: '';
        display: block;
        width: 60px;
        height: 4px;
        background: linear-gradient(90deg, #4b6cb7, #182848);
        margin: 12px auto 0;
        border-radius: 2px;
    }
    
    .form-group {
        margin-bottom: 24px;
        position: relative;
    }
    
    label {
        display: block;
        margin-bottom: 8px;
        color: #333;
        font-weight: 500;
        font-size: 14px;
        transition: all 0.3s;
    }
    
    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 14px 16px;
        border: 2px solid #e1e5ea;
        border-radius: 8px;
        font-size: 16px;
        transition: all 0.3s;
        background: #f8fafc;
        color: #333;
    }
    
    input[type="text"]:focus, input[type="password"]:focus {
        outline: none;
        border-color: #4b6cb7;
        box-shadow: 0 0 0 3px rgba(75,108,183,0.15);
        background: #fff;
    }
    
    .btn {
        width: 100%;
        padding: 16px;
        background: linear-gradient(90deg, #4b6cb7, #182848);
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.3s;
        box-shadow: 0 4px 10px rgba(75,108,183,0.3);
        position: relative;
        overflow: hidden;
    }
    
    .btn::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
        transition: all 0.6s;
    }
    
    .btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 7px 15px rgba(75,108,183,0.4);
    }
    
    .btn:hover::before {
        left: 100%;
    }
    
    .btn:active {
        transform: translateY(0);
    }
    
    .error {
        color: #721c24;
        margin-bottom: 20px;
        padding: 12px 16px;
        background-color: #f8d7da;
        border: 1px solid transparent;
        border-left: 4px solid #dc3545;
        border-radius: 8px;
        font-size: 14px;
        animation: shake 0.5s linear;
    }
    
    @keyframes shake {
        0% { transform: translateX(0); }
        20% { transform: translateX(-10px); }
        40% { transform: translateX(10px); }
        60% { transform: translateX(-7px); }
        80% { transform: translateX(7px); }
        100% { transform: translateX(0); }
    }
    
    .info {
        margin-top: 24px;
        padding: 16px;
        background-color: #e7f3ff;
        border-left: 4px solid #4b6cb7;
        border-radius: 8px;
        color: #0c5460;
        font-size: 14px;
        line-height: 1.5;
    }
    
    /* Floating label animation */
    .form-floating {
        position: relative;
    }
    
    .form-floating label {
        position: absolute;
        top: 14px;
        left: 16px;
        color: #6c757d;
        pointer-events: none;
        transition: 0.2s ease all;
    }
    
    .form-floating input:focus ~ label,
    .form-floating input:not(:placeholder-shown) ~ label {
        top: -10px;
        left: 10px;
        font-size: 12px;
        color: #4b6cb7;
        background: white;
        padding: 0 6px;
    }
    
    @media (max-width: 576px) {
        .login-container {
            width: 95%;
            padding: 30px 20px;
        }
    }
</style>
</head>
<body>
    <div class="login-container">
        <h2 class="login-title">ĐĂNG NHẬP</h2>
        
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
        
        <form method="post" action="${pageContext.request.contextPath}/login">
            <div class="form-group form-floating">
                <input type="text" id="username" name="username" required 
                       value="${param.username}" placeholder=" ">
                <label for="username">Tên đăng nhập</label>
            </div>
            
            <div class="form-group form-floating">
                <input type="password" id="password" name="password" required 
                       placeholder=" ">
                <label for="password">Mật khẩu</label>
            </div>
            
            <button type="submit" class="btn">Đăng nhập</button>
        </form>
        
        <div class="info">
            Chào mừng đến với hệ thống Quản lý Nhân sự. Vui lòng đăng nhập để tiếp tục.
        </div>
    </div>
</body>
</html>