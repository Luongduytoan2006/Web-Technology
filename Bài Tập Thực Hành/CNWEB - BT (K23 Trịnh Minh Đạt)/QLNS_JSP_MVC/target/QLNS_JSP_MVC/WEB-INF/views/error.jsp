<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lỗi - Hệ thống Quản lý Nhân sự</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        font-family: 'Roboto', Arial, sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(135deg, #f5f7fa 0%, #e4e8ed 100%);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    
    .container {
        width: 90%;
        max-width: 800px;
        margin: 40px auto;
    }
    
    .error-container {
        background: white;
        padding: 50px;
        border-radius: 16px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.08);
        text-align: center;
        position: relative;
        overflow: hidden;
        animation: fadeIn 0.5s ease-out;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    .error-container::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 6px;
        height: 100%;
        background: linear-gradient(to bottom, #ff416c, #ff4b2b);
    }
    
    .error-icon {
        font-size: 84px;
        color: #ff416c;
        margin-bottom: 30px;
        animation: pulse 2s infinite;
    }
    
    @keyframes pulse {
        0% { transform: scale(1); }
        50% { transform: scale(1.05); }
        100% { transform: scale(1); }
    }
    
    .error-title {
        color: #333;
        font-size: 32px;
        font-weight: 700;
        margin-bottom: 20px;
        position: relative;
        display: inline-block;
    }
    
    .error-title::after {
        content: '';
        position: absolute;
        bottom: -10px;
        left: 50%;
        transform: translateX(-50%);
        width: 60px;
        height: 4px;
        background: linear-gradient(to right, #ff416c, #ff4b2b);
        border-radius: 2px;
    }
    
    .error-message {
        color: #555;
        font-size: 18px;
        margin-bottom: 40px;
        line-height: 1.6;
        font-weight: 300;
    }
    
    .btn {
        padding: 14px 28px;
        border: none;
        border-radius: 50px;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        font-weight: 500;
        margin: 8px;
        transition: all 0.3s ease;
        position: relative;
        overflow: hidden;
        z-index: 1;
    }
    
    .btn::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 0%;
        height: 100%;
        background: rgba(255,255,255,0.2);
        transition: all 0.3s ease;
        z-index: -1;
    }
    
    .btn:hover::before {
        width: 100%;
    }
    
    .btn-primary { 
        background: linear-gradient(135deg, #6e8efb, #4a6cf7); 
        color: white; 
        box-shadow: 0 4px 15px rgba(110,142,251,0.4);
    }
    
    .btn-primary:hover {
        box-shadow: 0 6px 20px rgba(110,142,251,0.6);
        transform: translateY(-2px);
    }
    
    .btn-secondary { 
        background: linear-gradient(135deg, #8e9eab, #eef2f3);
        color: #444; 
        box-shadow: 0 4px 15px rgba(142,158,171,0.3);
    }
    
    .btn-secondary:hover {
        box-shadow: 0 6px 20px rgba(142,158,171,0.5);
        transform: translateY(-2px);
    }
    
    .error-details {
        margin-top: 40px;
        padding: 25px;
        background-color: #f8fafc;
        border-radius: 12px;
        border-left: 4px solid #ff416c;
        text-align: left;
        font-family: 'Courier New', monospace;
        font-size: 14px;
        color: #444;
        white-space: pre-wrap;
        overflow-x: auto;
        box-shadow: inset 0 2px 4px rgba(0,0,0,0.06);
    }
    
    .error-details strong {
        display: block;
        margin-bottom: 10px;
        color: #ff416c;
    }
    
    @media (max-width: 768px) {
        .container {
            width: 95%;
            margin: 20px auto;
        }
        
        .error-container {
            padding: 30px 20px;
        }
        
        .error-icon {
            font-size: 64px;
        }
        
        .error-title {
            font-size: 24px;
        }
        
        .error-message {
            font-size: 16px;
        }
        
        .btn {
            padding: 12px 24px;
            font-size: 14px;
            display: block;
            width: 100%;
            margin: 10px 0;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <div class="error-container">
            <div class="error-icon">⚠</div>
            <h1 class="error-title">Đã xảy ra lỗi!</h1>
            
            <div class="error-message">
                <c:choose>
                    <c:when test="${not empty error}">
                        ${error}
                    </c:when>
                    <c:otherwise>
                        Hệ thống đang gặp sự cố. Vui lòng thử lại sau hoặc liên hệ quản trị viên.
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div>
                <a href="javascript:history.back()" class="btn btn-secondary">← Quay lại</a>
                <a href="${pageContext.request.contextPath}/nhanvien" class="btn btn-primary">Về trang chủ</a>
            </div>
            
            <c:if test="${not empty javax.servlet.error.exception}">
                <div class="error-details">
                    <strong>Chi tiết lỗi:</strong>
                    ${javax.servlet.error.exception.message}
                    
                    <c:if test="${not empty javax.servlet.error.exception.stackTrace}">
                        
Stack trace:
<c:forEach items="${javax.servlet.error.exception.stackTrace}" var="trace">
${trace}
</c:forEach>
                    </c:if>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>