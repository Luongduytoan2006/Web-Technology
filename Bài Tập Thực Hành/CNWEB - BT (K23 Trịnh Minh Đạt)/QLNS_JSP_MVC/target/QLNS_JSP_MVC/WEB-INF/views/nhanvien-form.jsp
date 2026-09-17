<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><c:choose><c:when test="${isEdit}">Sửa</c:when><c:otherwise>Thêm</c:otherwise></c:choose> Nhân Viên</title>
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
        max-width: 700px;
        margin: 0 auto;
        padding: 0 20px;
    }
    
    .header {
        background: linear-gradient(135deg, #4e73df 0%, #224abe 100%);
        color: white;
        padding: 30px;
        border-radius: 16px;
        margin-bottom: 30px;
        box-shadow: 0 10px 20px rgba(78, 115, 223, 0.2);
        position: relative;
        overflow: hidden;
        text-align: center;
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
        margin-bottom: 10px;
        display: inline-flex;
        align-items: center;
        gap: 10px;
    }
    
    .form-card {
        background: white;
        border-radius: 16px;
        padding: 40px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        animation: fadeIn 0.5s ease-out;
        border-top: 6px solid #4e73df;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    .form-group {
        margin-bottom: 24px;
        position: relative;
    }
    
    label {
        display: block;
        margin-bottom: 8px;
        font-weight: 500;
        color: #444;
        display: flex;
        align-items: center;
        gap: 8px;
        transition: all 0.3s;
    }
    
    .required { 
        color: #e74a3b; 
        font-size: 18px;
        line-height: 1;
    }
    
    input[type="text"], select {
        width: 100%;
        padding: 14px 16px;
        border: 2px solid #e1e5ea;
        border-radius: 8px;
        font-size: 15px;
        transition: all 0.3s;
        background: #f8fafc;
        color: #333;
    }
    
    input[type="text"]:focus, select:focus {
        outline: none;
        border-color: #4e73df;
        box-shadow: 0 0 0 3px rgba(78, 115, 223, 0.15);
        background: #fff;
    }
    
    input[type="text"]::placeholder, select::placeholder {
        color: #a0aec0;
    }
    
    select {
        appearance: none;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%23a0aec0' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M6 9l6 6 6-6'%3E%3C/path%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-position: right 12px center;
        padding-right: 40px;
    }
    
    .btn {
        padding: 14px 28px;
        border: none;
        border-radius: 8px;
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
    
    .btn-primary {
        background: linear-gradient(135deg, #4e73df 0%, #224abe 100%);
        color: white;
    }
    
    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 7px 15px rgba(78, 115, 223, 0.4);
    }
    
    .btn-primary:active {
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
        margin-top: 35px;
        display: flex;
        justify-content: center;
        gap: 15px;
        flex-wrap: wrap;
    }
    
    .alert {
        padding: 16px;
        margin-bottom: 25px;
        border-radius: 8px;
        background-color: #f8d7da;
        border-left: 5px solid #e74a3b;
        color: #721c24;
        display: flex;
        align-items: flex-start;
        gap: 10px;
        font-size: 15px;
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
    
    .form-title {
        color: #444;
        margin-bottom: 30px;
        font-size: 24px;
        position: relative;
        padding-bottom: 15px;
        text-align: center;
        font-weight: 700;
    }
    
    .form-title::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 80px;
        height: 4px;
        background: linear-gradient(90deg, #4e73df, #224abe);
        border-radius: 2px;
    }
    
    .nav-menu {
        display: flex;
        justify-content: center;
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
    
    /* Floating inputs animation */
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
        background: transparent;
        padding: 0 5px;
    }
    
    .form-floating input:focus ~ label,
    .form-floating input:not(:placeholder-shown) ~ label,
    .form-floating select:focus ~ label,
    .form-floating select:not([value=""]):valid ~ label {
        top: -10px;
        left: 10px;
        font-size: 12px;
        color: #4e73df;
        background: white;
    }
    
    @media (max-width: 768px) {
        .container {
            padding: 15px;
        }
        
        .form-card {
            padding: 25px 20px;
        }
        
        .form-actions {
            flex-direction: column;
        }
        
        .btn {
            width: 100%;
        }
        
        .form-title {
            font-size: 22px;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>
                <c:choose>
                    <c:when test="${isEdit}">
                        <i class="fas fa-user-edit"></i> SỬA THÔNG TIN NHÂN VIÊN
                    </c:when>
                    <c:otherwise>
                        <i class="fas fa-user-plus"></i> THÊM NHÂN VIÊN MỚI
                    </c:otherwise>
                </c:choose>
            </h1>
            <div class="nav-menu">
                <a href="${pageContext.request.contextPath}/nhanvien"><i class="fas fa-users"></i> Nhân Viên</a>
                <a href="${pageContext.request.contextPath}/phongban"><i class="fas fa-building"></i> Phòng Ban</a>
                <a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Đăng Xuất</a>
            </div>
        </div>

        <div class="form-card">
            <c:if test="${not empty error}">
                <div class="alert">
                    <i class="fas fa-exclamation-circle" style="font-size: 20px;"></i>
                    <div>${error}</div>
                </div>
            </c:if>

            <form method="post" action="${pageContext.request.contextPath}/nhanvien">
                <input type="hidden" name="action" value="${isEdit ? 'edit' : 'add'}">
                
                <div class="form-group form-floating">
                    <input type="text" id="idnv" name="idnv" required 
                           value="${nhanVien.idnv}" 
                           ${isEdit ? 'readonly style="background-color: #f8f9fa; border-color: #ccc; cursor: not-allowed;"' : ''}
                           placeholder=" ">
                    <label for="idnv"><i class="fas fa-id-card"></i> Mã nhân viên <span class="required">*</span></label>
                </div>

                <div class="form-group form-floating">
                    <input type="text" id="hoten" name="hoten" required 
                           value="${nhanVien.hoten}" 
                           placeholder=" ">
                    <label for="hoten"><i class="fas fa-user"></i> Họ tên <span class="required">*</span></label>
                </div>

                <div class="form-group form-floating">
                    <select id="idpb" name="idpb" required>
                        <option value="">-- Chọn phòng ban --</option>
                        <c:forEach items="${dsPhongBan}" var="pb">
                            <option value="${pb.idpb}" ${pb.idpb == nhanVien.idpb ? 'selected' : ''}>
                                ${pb.idpb} - ${pb.tenpb}
                            </option>
                        </c:forEach>
                    </select>
                    <label for="idpb"><i class="fas fa-building"></i> Phòng ban <span class="required">*</span></label>
                </div>

                <div class="form-group form-floating">
                    <input type="text" id="diachi" name="diachi" 
                           value="${nhanVien.diachi}" 
                           placeholder=" ">
                    <label for="diachi"><i class="fas fa-map-marker-alt"></i> Địa chỉ</label>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">
                        <c:choose>
                            <c:when test="${isEdit}">
                                <i class="fas fa-save"></i> Cập nhật
                            </c:when>
                            <c:otherwise>
                                <i class="fas fa-plus-circle"></i> Thêm mới
                            </c:otherwise>
                        </c:choose>
                    </button>
                    <a href="${pageContext.request.contextPath}/nhanvien" class="btn btn-secondary">
                        <i class="fas fa-ban"></i> Hủy
                    </a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>