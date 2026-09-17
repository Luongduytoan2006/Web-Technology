<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Phòng Ban - QLNS</title>
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
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            padding: 30px;
            border-radius: 16px;
            margin-bottom: 30px;
            box-shadow: 0 10px 20px rgba(106, 17, 203, 0.2);
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
        
        .nav-menu a:hover, .nav-menu a.active {
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
        
        .actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            flex-wrap: wrap;
            gap: 20px;
        }
        
        .actions h2 {
            color: #6a11cb;
            font-size: 24px;
            font-weight: 700;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 10px;
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
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white; 
            box-shadow: 0 4px 15px rgba(106, 17, 203, 0.3);
        }
        
        .btn-primary:hover {
            box-shadow: 0 6px 20px rgba(106, 17, 203, 0.5);
        }
        
        .btn-danger { 
            background: linear-gradient(135deg, #e74a3b 0%, #be2617 100%);
            color: white;
            box-shadow: 0 4px 15px rgba(231, 74, 59, 0.3);
        }
        
        .btn-danger:hover {
            box-shadow: 0 6px 20px rgba(231, 74, 59, 0.5);
        }
        
        .btn-success { 
            background: linear-gradient(135deg, #1cc88a 0%, #13855c 100%);
            color: white;
            box-shadow: 0 4px 15px rgba(28, 200, 138, 0.3);
        }
        
        .btn-success:hover {
            box-shadow: 0 6px 20px rgba(28, 200, 138, 0.5);
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
        
        .table-container {
            overflow-x: auto;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
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
            vertical-align: middle;
        }
        
        .alert {
            padding: 16px 20px;
            margin-bottom: 25px;
            border-radius: 12px;
            position: relative;
            animation: slideIn 0.5s ease-out;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }
        
        .alert-icon {
            font-size: 22px;
        }
        
        .alert-success {
            background: linear-gradient(135deg, #d4edda 0%, #c3e6cb 100%);
            border-left: 5px solid #1cc88a;
            color: #155724;
            box-shadow: 0 4px 15px rgba(28, 200, 138, 0.15);
        }
        
        .alert-danger {
            background: linear-gradient(135deg, #f8d7da 0%, #f5c6cb 100%);
            border-left: 5px solid #e74a3b;
            color: #721c24;
            box-shadow: 0 4px 15px rgba(231, 74, 59, 0.15);
        }
        
        .search-box {
            display: flex;
            gap: 15px;
            align-items: center;
            flex-wrap: wrap;
        }
        
        .form-control {
            padding: 12px 16px;
            border: 2px solid #e1e5ea;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s;
            background: #f8fafc;
            color: #333;
        }
        
        .form-control:focus {
            outline: none;
            border-color: #6a11cb;
            box-shadow: 0 0 0 3px rgba(106, 17, 203, 0.15);
            background: #fff;
        }
        
        .no-data {
            text-align: center;
            padding: 60px 20px;
            color: #5a5c69;
        }
        
        .no-data h3 {
            color: #6a11cb;
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
        
        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            animation: fadeInModal 0.3s ease;
        }
        
        @keyframes fadeInModal {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        .modal-content {
            background-color: white;
            margin: 10% auto;
            padding: 30px;
            border-radius: 16px;
            width: 450px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
            transform: translateY(0);
            animation: slideInModal 0.3s ease;
        }
        
        @keyframes slideInModal {
            from { transform: translateY(50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e3e6f0;
        }
        
        .modal-header h3 {
            color: #e74a3b;
            margin: 0;
            font-size: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .close {
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
            color: #a0aec0;
            transition: all 0.3s;
        }
        
        .close:hover {
            color: #e74a3b;
        }
        
        .modal-body {
            margin-bottom: 25px;
            color: #5a5c69;
            line-height: 1.6;
        }
        
        .modal-body p {
            margin-bottom: 12px;
        }
        
        .modal-body strong {
            color: #e74a3b;
        }
        
        .text-danger {
            color: #e74a3b;
            display: flex;
            align-items: center;
            gap: 7px;
        }
        
        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
        }
        
        .department-action-btn {
            display: flex;
            gap: 8px;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }
            
            .content-card {
                padding: 25px 20px;
            }
            
            .actions {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .search-box {
                flex-direction: column;
                align-items: stretch;
            }
            
            .nav-menu {
                flex-wrap: wrap;
            }
            
            .modal-content {
                width: 95%;
                padding: 20px;
            }
            
            .modal-footer {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
            
            .department-action-btn {
                flex-wrap: wrap;
                justify-content: space-between;
            }
            
            .department-action-btn .btn {
                flex: 1;
                min-width: 80px;
                padding: 8px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1><i class="fas fa-building"></i> Quản Lý Phòng Ban</h1>
            <p>Hệ thống quản lý nhân sự - Phòng Ban</p>
            <div class="nav-menu">
                <a href="${pageContext.request.contextPath}/nhanvien"><i class="fas fa-users"></i> Nhân Viên</a>
                <a href="${pageContext.request.contextPath}/phongban" class="active"><i class="fas fa-building"></i> Phòng Ban</a>
                <a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Đăng Xuất</a>
            </div>
        </div>

        <!-- Alerts -->
        <c:if test="${param.success eq 'add'}">
            <div class="alert alert-success">
                <i class="fas fa-check-circle alert-icon"></i>
                <div>Thêm phòng ban thành công!</div>
            </div>
        </c:if>
        <c:if test="${param.success eq 'edit'}">
            <div class="alert alert-success">
                <i class="fas fa-check-circle alert-icon"></i>
                <div>Cập nhật phòng ban thành công!</div>
            </div>
        </c:if>
        <c:if test="${param.success eq 'delete'}">
            <div class="alert alert-success">
                <i class="fas fa-check-circle alert-icon"></i>
                <div>Xóa phòng ban thành công!</div>
            </div>
        </c:if>
        <c:if test="${param.error eq 'delete'}">
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-circle alert-icon"></i>
                <div>Không thể xóa phòng ban. Vui lòng thử lại!</div>
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-circle alert-icon"></i>
                <div>${error}</div>
            </div>
        </c:if>

        <!-- Main Content -->
        <div class="content-card">
            <div class="actions">
                <h2><i class="fas fa-list"></i> Danh Sách Phòng Ban</h2>
                <a href="${pageContext.request.contextPath}/phongban?action=add" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Thêm Phòng Ban
                </a>
            </div>

            <!-- Table -->
            <div class="table-container">
                <c:choose>
                    <c:when test="${not empty dsPhongBan}">
                        <table>
                            <thead>
                                <tr>
                                    <th>Mã PB</th>
                                    <th>Tên Phòng Ban</th>
                                    <th>Mô Tả</th>
                                    <th>Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="pb" items="${dsPhongBan}">
                                    <tr>
                                        <td><strong>${pb.idpb}</strong></td>
                                        <td>${pb.tenpb}</td>
                                        <td>${pb.mota}</td>
                                        <td>
                                            <div class="department-action-btn">
                                                <a href="${pageContext.request.contextPath}/phongban?action=view&id=${pb.idpb}" 
                                                   class="btn btn-primary btn-sm"><i class="fas fa-eye"></i> Xem</a>
                                                <a href="${pageContext.request.contextPath}/phongban?action=edit&id=${pb.idpb}" 
                                                   class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Sửa</a>
                                                <button onclick="confirmDelete('${pb.idpb}', '${pb.tenpb}')" 
                                                        class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i> Xóa</button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="no-data">
                            <i class="fas fa-building-circle-xmark"></i>
                            <h3>Chưa có phòng ban nào</h3>
                            <p>Hãy thêm phòng ban đầu tiên!</p>
                            <a href="${pageContext.request.contextPath}/phongban?action=add" class="btn btn-primary">
                                <i class="fas fa-plus"></i> Thêm Phòng Ban
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div id="deleteModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3><i class="fas fa-exclamation-triangle"></i> Xác Nhận Xóa</h3>
                <span class="close" onclick="closeDeleteModal()">&times;</span>
            </div>
            <div class="modal-body">
                <p>Bạn có chắc chắn muốn xóa phòng ban:</p>
                <p><strong id="deletePhongBanName"></strong> (<span id="deletePhongBanId"></span>)?</p>
                <p class="text-danger"><i class="fas fa-exclamation-circle"></i> Hành động này không thể hoàn tác!</p>
            </div>
            <div class="modal-footer">
                <button onclick="closeDeleteModal()" class="btn btn-secondary"><i class="fas fa-ban"></i> Hủy</button>
                <button onclick="executeDelete()" class="btn btn-danger"><i class="fas fa-trash-alt"></i> Xóa</button>
            </div>
        </div>
    </div>

    <script>
        let deletePhongBanId = '';

        function confirmDelete(idpb, tenpb) {
            deletePhongBanId = idpb;
            document.getElementById('deletePhongBanId').textContent = idpb;
            document.getElementById('deletePhongBanName').textContent = tenpb;
            document.getElementById('deleteModal').style.display = 'block';
        }

        function closeDeleteModal() {
            document.getElementById('deleteModal').style.display = 'none';
            deletePhongBanId = '';
        }

        function executeDelete() {
            if (deletePhongBanId) {
                window.location.href = '${pageContext.request.contextPath}/phongban?action=delete&id=' + deletePhongBanId;
            }
        }

        // Close modal when clicking outside
        window.onclick = function(event) {
            const modal = document.getElementById('deleteModal');
            if (event.target === modal) {
                closeDeleteModal();
            }
        }

        // Auto hide alerts after 5 seconds
        setTimeout(function() {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                alert.style.opacity = '0';
                alert.style.transition = 'opacity 0.5s ease';
                setTimeout(() => {
                    alert.style.display = 'none';
                }, 500);
            });
        }, 5000);
    </script>
</body>
</html>