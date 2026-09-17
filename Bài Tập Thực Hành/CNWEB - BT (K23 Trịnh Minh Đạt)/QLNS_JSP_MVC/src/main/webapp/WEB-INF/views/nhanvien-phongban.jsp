<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nhân Viên Phòng ${phongBan.tenpb} - QLNS</title>
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
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .header {
            background: linear-gradient(135deg, #1cc88a 0%, #13855c 100%);
            color: white;
            padding: 30px;
            border-radius: 16px;
            margin-bottom: 30px;
            box-shadow: 0 10px 20px rgba(28, 200, 138, 0.2);
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
            pointer-events: none;
        }
        
        .header h1 {
            position: relative;
            z-index: 1;
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 10px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        
        .header p {
            position: relative;
            z-index: 1;
            opacity: 0.9;
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
        
        .content-card {
            background: white;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            margin-bottom: 30px;
            animation: fadeIn 0.5s ease-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .content-card h2 {
            color: #1cc88a;
            margin-bottom: 25px;
            font-size: 24px;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 10px;
            position: relative;
            padding-bottom: 15px;
        }
        
        .content-card h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 60px;
            height: 4px;
            background: linear-gradient(90deg, #1cc88a, #13855c);
            border-radius: 2px;
        }
        
        .phongban-info {
            background: linear-gradient(135deg, #e8f5e9 0%, #c8e6c9 100%);
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 30px;
            border-left: 6px solid #1cc88a;
            box-shadow: 0 5px 15px rgba(28, 200, 138, 0.15);
            transition: all 0.3s;
        }
        
        .phongban-info:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(28, 200, 138, 0.2);
        }
        
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }
        
        .info-item {
            display: flex;
            align-items: center;
        }
        
        .info-label {
            font-weight: 600;
            margin-right: 15px;
            color: #2e7d32;
            display: flex;
            align-items: center;
            gap: 8px;
            min-width: 120px;
        }
        
        .info-value {
            color: #444;
            font-size: 15px;
        }
        
        .info-value strong {
            color: #1cc88a;
            font-size: 16px;
        }
        
        .stats-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            background: linear-gradient(135deg, #4e73df 0%, #224abe 100%);
            color: white;
            padding: 25px 20px;
            border-radius: 16px;
            text-align: center;
            box-shadow: 0 10px 20px rgba(78, 115, 223, 0.2);
            position: relative;
            overflow: hidden;
            transition: all 0.3s;
        }
        
        .stat-card::before {
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
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(78, 115, 223, 0.3);
        }
        
        .stat-number {
            font-size: 42px;
            font-weight: bold;
            margin-bottom: 10px;
            position: relative;
            z-index: 1;
        }
        
        .stat-label {
            font-size: 15px;
            opacity: 0.9;
            position: relative;
            z-index: 1;
            font-weight: 500;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
        }
        
        .table-container {
            overflow-x: auto;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 5px;
        }
        
        th, td {
            padding: 16px;
            text-align: left;
            border-bottom: 1px solid #e3e6f0;
        }
        
        th {
            background: #f8f9fc;
            font-weight: 600;
            color: #5a5c69;
            text-transform: uppercase;
            font-size: 13px;
            letter-spacing: 0.5px;
        }
        
        tr:hover {
            background: #f8f9fc;
        }
        
        td {
            color: #5a5c69;
            font-size: 14px;
        }
        
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
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
        
        .btn:hover {
            transform: translateY(-2px);
        }
        
        .btn:active {
            transform: translateY(0);
        }
        
        .btn-primary { 
            background: linear-gradient(135deg, #4e73df 0%, #224abe 100%);
            color: white; 
            box-shadow: 0 4px 15px rgba(78, 115, 223, 0.3);
        }
        
        .btn-primary:hover {
            box-shadow: 0 6px 20px rgba(78, 115, 223, 0.5);
        }
        
        .btn-secondary { 
            background: linear-gradient(135deg, #8e9eab 0%, #eef2f3 100%);
            color: #444;
            box-shadow: 0 4px 15px rgba(142, 158, 171, 0.3);
        }
        
        .btn-secondary:hover {
            box-shadow: 0 6px 20px rgba(142, 158, 171, 0.5);
        }
        
        .btn-warning { 
            background: linear-gradient(135deg, #f6c23e 0%, #dda20a 100%);
            color: white;
            box-shadow: 0 4px 15px rgba(246, 194, 62, 0.3);
        }
        
        .btn-warning:hover {
            box-shadow: 0 6px 20px rgba(246, 194, 62, 0.5);
        }
        
        .btn-sm {
            padding: 8px 16px;
            font-size: 13px;
        }
        
        .no-data {
            text-align: center;
            padding: 60px 20px;
            color: #5a5c69;
        }
        
        .no-data h3 {
            color: #1cc88a;
            font-size: 24px;
            margin-bottom: 15px;
        }
        
        .no-data p {
            margin-bottom: 25px;
            font-size: 16px;
        }
        
        .no-data i {
            font-size: 60px;
            color: #d1d3e2;
            margin-bottom: 20px;
            display: block;
        }
        
        .actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            flex-wrap: wrap;
            gap: 20px;
        }
        
        .actions h2 {
            margin-bottom: 0;
            padding-bottom: 0;
        }
        
        .actions h2::after {
            display: none;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }
            
            .content-card {
                padding: 25px 20px;
            }
            
            .info-grid {
                grid-template-columns: 1fr;
            }
            
            .stats-section {
                grid-template-columns: 1fr;
            }
            
            .actions {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .actions div {
                display: flex;
                flex-direction: column;
                width: 100%;
                gap: 10px;
            }
            
            .actions div .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1><i class="fas fa-users"></i> Nhân Viên Phòng ${phongBan.tenpb}</h1>
            <p>Hệ thống quản lý nhân sự - Chi tiết phòng ban</p>
            <div class="nav-menu">
                <a href="${pageContext.request.contextPath}/nhanvien"><i class="fas fa-users"></i> Nhân Viên</a>
                <a href="${pageContext.request.contextPath}/phongban"><i class="fas fa-building"></i> Phòng Ban</a>
                <a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Đăng Xuất</a>
            </div>
        </div>

        <!-- Department Info -->
        <div class="content-card">
            <h2><i class="fas fa-building"></i> Thông Tin Phòng Ban</h2>
            <div class="phongban-info">
                <div class="info-grid">
                    <div class="info-item">
                        <span class="info-label"><i class="fas fa-id-card"></i> Mã PB:</span>
                        <span class="info-value"><strong>${phongBan.idpb}</strong></span>
                    </div>
                    <div class="info-item">
                        <span class="info-label"><i class="fas fa-tag"></i> Tên PB:</span>
                        <span class="info-value"><strong>${phongBan.tenpb}</strong></span>
                    </div>
                    <div class="info-item" style="grid-column: 1 / -1;">
                        <span class="info-label"><i class="fas fa-align-left"></i> Mô tả:</span>
                        <span class="info-value">${phongBan.mota}</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Statistics -->
        <div class="stats-section">
            <div class="stat-card">
                <div class="stat-number">${dsNhanVien.size()}</div>
                <div class="stat-label"><i class="fas fa-users"></i> Tổng Nhân Viên</div>
            </div>
            <div class="stat-card" style="background: linear-gradient(135deg, #1cc88a 0%, #13855c 100%); box-shadow: 0 10px 20px rgba(28, 200, 138, 0.2);">
                <div class="stat-number">${phongBan.idpb}</div>
                <div class="stat-label"><i class="fas fa-building"></i> Mã Phòng Ban</div>
            </div>
        </div>

        <!-- Employee List -->
        <div class="content-card">
            <div class="actions">
                <h2><i class="fas fa-list"></i> Danh Sách Nhân Viên</h2>
                <div>
                    <a href="${pageContext.request.contextPath}/nhanvien?action=add" class="btn btn-primary">
                        <i class="fas fa-user-plus"></i> Thêm Nhân Viên
                    </a>
                    <a href="${pageContext.request.contextPath}/phongban" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Quay Lại
                    </a>
                </div>
            </div>

            <div class="table-container">
                <c:choose>
                    <c:when test="${not empty dsNhanVien}">
                        <table>
                            <thead>
                                <tr>
                                    <th>Mã NV</th>
                                    <th>Họ Tên</th>
                                    <th>Địa Chỉ</th>
                                    <th>Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="nv" items="${dsNhanVien}">
                                    <tr>
                                        <td><strong>${nv.idnv}</strong></td>
                                        <td>${nv.hoten}</td>
                                        <td>${nv.diachi}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/nhanvien?action=edit&id=${nv.idnv}" 
                                               class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Sửa</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="no-data">
                            <i class="fas fa-user-slash"></i>
                            <h3>Chưa có nhân viên nào</h3>
                            <p>Phòng ban này chưa có nhân viên. Hãy thêm nhân viên đầu tiên!</p>
                            <a href="${pageContext.request.contextPath}/nhanvien?action=add" class="btn btn-primary">
                                <i class="fas fa-user-plus"></i> Thêm Nhân Viên
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</body>
</html>