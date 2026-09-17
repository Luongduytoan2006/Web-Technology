<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác Nhận Xóa Nhân Viên - QLNS</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8ed 100%);
            color: #444;
            line-height: 1.6;
            padding: 30px 0;
        }
        
        .container {
            max-width: 850px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .header {
            background: linear-gradient(135deg, #ff416c 0%, #ff4b2b 100%);
            color: white;
            padding: 30px;
            border-radius: 16px;
            margin-bottom: 30px;
            box-shadow: 0 10px 20px rgba(255, 65, 108, 0.2);
            position: relative;
            overflow: hidden;
        }
        
        .header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://i.imgur.com/8BZrPcr.png');
            opacity: 0.05;
            z-index: 0;
        }
        
        .header h1 {
            position: relative;
            z-index: 1;
            font-size: 28px;
            font-weight: 700;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 10px;
        }
        
        .header p {
            position: relative;
            z-index: 1;
            opacity: 0.9;
            font-size: 16px;
        }
        
        .nav-menu {
            display: flex;
            gap: 15px;
            margin-top: 20px;
            position: relative;
            z-index: 1;
            flex-wrap: wrap;
        }
        
        .nav-menu a {
            color: white;
            text-decoration: none;
            padding: 10px 18px;
            border-radius: 50px;
            background: rgba(255,255,255,0.2);
            transition: all 0.3s;
            font-weight: 500;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 7px;
        }
        
        .nav-menu a:hover {
            background: rgba(255,255,255,0.3);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .confirm-card {
            background: white;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            border-left: 8px solid #ff416c;
            animation: fadeIn 0.5s ease-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .warning-icon {
            font-size: 70px;
            color: #ff416c;
            text-align: center;
            margin-bottom: 25px;
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }
        
        .employee-info {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 25px;
            margin: 25px 0;
            border-left: 5px solid #4e73df;
            transition: all 0.3s;
            animation: slideIn 0.5s ease-out;
        }
        
        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }
        
        .employee-info:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transform: translateY(-3px);
        }
        
        .info-row {
            display: flex;
            margin-bottom: 12px;
        }
        
        .info-label {
            font-weight: 500;
            width: 150px;
            color: #495057;
            display: flex;
            align-items: center;
            gap: 7px;
        }
        
        .info-value {
            flex: 1;
            color: #212529;
            padding: 3px 0;
        }
        
        .info-value strong {
            color: #ff416c;
        }
        
        .btn {
            padding: 14px 28px;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            font-size: 15px;
            font-weight: 600;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            min-width: 160px;
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
        
        .btn:hover::before {
            left: 100%;
        }
        
        .btn-danger {
            background: linear-gradient(135deg, #ff416c 0%, #ff4b2b 100%);
            color: white;
        }
        
        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 7px 15px rgba(255, 65, 108, 0.4);
        }
        
        .btn-danger:active {
            transform: translateY(0);
        }
        
        .btn-secondary {
            background: linear-gradient(135deg, #8e9eab 0%, #eef2f3 100%);
            color: #444;
        }
        
        .btn-secondary:hover {
            transform: translateY(-2px);
            box-shadow: 0 7px 15px rgba(142, 158, 171, 0.4);
        }
        
        .btn-secondary:active {
            transform: translateY(0);
        }
        
        .form-actions {
            display: flex;
            gap: 15px;
            margin-top: 35px;
            justify-content: center;
            flex-wrap: wrap;
        }
        
        .alert-warning {
            background: linear-gradient(to right, #fff9c4, #fff8e1);
            border-left: 5px solid #ffc107;
            color: #856404;
            padding: 20px;
            border-radius: 12px;
            margin: 25px 0;
            font-size: 15px;
            position: relative;
            box-shadow: 0 5px 15px rgba(255, 193, 7, 0.1);
        }
        
        .alert-warning strong {
            display: flex;
            align-items: center;
            gap: 7px;
            margin-bottom: 10px;
            font-size: 16px;
        }
        
        h2, h3, h4 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }
        
        h2 {
            font-size: 26px;
        }
        
        h3 {
            font-size: 22px;
            margin-top: 30px;
        }
        
        h4 {
            font-size: 18px;
            text-align: left;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }
            
            .confirm-card {
                padding: 25px 20px;
            }
            
            .form-actions {
                flex-direction: column;
            }
            
            .info-row {
                flex-direction: column;
            }
            
            .info-label {
                width: auto;
                margin-bottom: 5px;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1><i class="fas fa-exclamation-triangle"></i> Xác Nhận Xóa Nhân Viên</h1>
            <p>Hệ thống quản lý nhân sự</p>
            <div class="nav-menu">
                <a href="${pageContext.request.contextPath}/nhanvien"><i class="fas fa-users"></i> Nhân Viên</a>
                <a href="${pageContext.request.contextPath}/phongban"><i class="fas fa-building"></i> Phòng Ban</a>
                <a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Đăng Xuất</a>
            </div>
        </div>

        <!-- Confirmation Form -->
        <div class="confirm-card">
            <div class="warning-icon"><i class="fas fa-exclamation-triangle"></i></div>
            
            <h2 style="color: #ff416c;">
                CẢNH BÁO: Xóa Nhân Viên
            </h2>
            
            <div class="alert-warning">
                <strong><i class="fas fa-exclamation-circle"></i> Lưu ý:</strong> 
                Hành động này sẽ xóa vĩnh viễn thông tin nhân viên và không thể hoàn tác!
            </div>
            
            <c:choose>
                <c:when test="${not empty selectedNhanVien}">
                    <!-- Multiple employees -->
                    <h3><i class="fas fa-clipboard-list"></i> Danh sách nhân viên sẽ bị xóa (${selectedNhanVien.size()} người):</h3>
                    
                    <c:forEach var="nv" items="${selectedNhanVien}" varStatus="status">
                        <div class="employee-info">
                            <h4>
                                <i class="fas fa-user-circle"></i> Nhân viên ${status.index + 1}
                            </h4>
                            <div class="info-row">
                                <span class="info-label"><i class="fas fa-id-card"></i> Mã NV:</span>
                                <span class="info-value"><strong>${nv.idnv}</strong></span>
                            </div>
                            <div class="info-row">
                                <span class="info-label"><i class="fas fa-user"></i> Họ tên:</span>
                                <span class="info-value"><strong>${nv.hoten}</strong></span>
                            </div>
                            <div class="info-row">
                                <span class="info-label"><i class="fas fa-building"></i> Phòng ban:</span>
                                <span class="info-value">${nv.idpb}</span>
                            </div>
                            <div class="info-row">
                                <span class="info-label"><i class="fas fa-map-marker-alt"></i> Địa chỉ:</span>
                                <span class="info-value">${nv.diachi}</span>
                            </div>
                        </div>
                    </c:forEach>
                    
                    <form action="${pageContext.request.contextPath}/nhanvien" method="post">
                        <input type="hidden" name="action" value="confirmDeleteMultiple">
                        <c:forEach var="nv" items="${selectedNhanVien}">
                            <input type="hidden" name="selectedIds" value="${nv.idnv}">
                        </c:forEach>
                        
                        <div class="form-actions">
                            <button type="submit" class="btn btn-danger">
                                <i class="fas fa-trash-alt"></i> Xác Nhận Xóa Tất Cả
                            </button>
                            <a href="${pageContext.request.contextPath}/nhanvien" class="btn btn-secondary">
                                <i class="fas fa-ban"></i> Hủy Bỏ
                            </a>
                        </div>
                    </form>
                </c:when>
                
                <c:otherwise>
                    <!-- Single employee -->
                    <h3><i class="fas fa-user"></i> Thông tin nhân viên sẽ bị xóa:</h3>
                    
                    <div class="employee-info">
                        <div class="info-row">
                            <span class="info-label"><i class="fas fa-id-card"></i> Mã NV:</span>
                            <span class="info-value"><strong>${nhanVien.idnv}</strong></span>
                        </div>
                        <div class="info-row">
                            <span class="info-label"><i class="fas fa-user"></i> Họ tên:</span>
                            <span class="info-value"><strong>${nhanVien.hoten}</strong></span>
                        </div>
                        <div class="info-row">
                            <span class="info-label"><i class="fas fa-building"></i> Phòng ban:</span>
                            <span class="info-value">${nhanVien.idpb}</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label"><i class="fas fa-map-marker-alt"></i> Địa chỉ:</span>
                            <span class="info-value">${nhanVien.diachi}</span>
                        </div>
                    </div>
                    
                    <form action="${pageContext.request.contextPath}/nhanvien" method="post">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="${nhanVien.idnv}">
                        
                        <div class="form-actions">
                            <button type="submit" class="btn btn-danger">
                                <i class="fas fa-trash-alt"></i> Xác Nhận Xóa
                            </button>
                            <a href="${pageContext.request.contextPath}/nhanvien" class="btn btn-secondary">
                                <i class="fas fa-ban"></i> Hủy Bỏ
                            </a>
                        </div>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>