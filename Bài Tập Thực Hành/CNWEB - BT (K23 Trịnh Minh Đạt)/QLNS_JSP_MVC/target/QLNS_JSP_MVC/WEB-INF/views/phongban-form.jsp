<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${isEdit ? 'Sửa' : 'Thêm'} Phòng Ban - QLNS</title>
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
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            padding: 30px;
            border-radius: 16px;
            margin-bottom: 30px;
            box-shadow: 0 10px 20px rgba(106, 17, 203, 0.2);
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
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
            display: inline-flex;
            align-items: center;
            gap: 10px;
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
            justify-content: center;
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
        
        .form-card {
            background: white;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            animation: fadeIn 0.5s ease-out;
            border-top: 6px solid #6a11cb;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .form-card h2 {
            color: #6a11cb;
            margin-bottom: 30px;
            font-size: 24px;
            font-weight: 700;
            text-align: center;
            position: relative;
            padding-bottom: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        
        .form-card h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(90deg, #6a11cb, #2575fc);
            border-radius: 2px;
        }
        
        hr {
            margin: 25px 0;
            border: none;
            border-top: 1px solid #eee;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 10px;
            font-weight: 600;
            color: #444;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .required {
            color: #e74a3b;
            font-size: 18px;
            line-height: 1;
        }
        
        .form-control {
            width: 100%;
            padding: 14px 16px;
            border: 2px solid #e1e5ea;
            border-radius: 8px;
            font-size: 15px;
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
        
        textarea.form-control {
            min-height: 120px;
            resize: vertical;
        }
        
        .field-error {
            color: #dc3545;
            font-size: 14px;
            margin-top: 5px;
            display: flex;
            align-items: center;
            gap: 5px;
            background: #f8d7da;
            border: 1px solid #f5c6cb;
            border-radius: 4px;
            padding: 8px 12px;
            animation: fadeIn 0.3s ease;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
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
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 7px 15px rgba(106, 17, 203, 0.4);
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
            display: flex;
            gap: 15px;
            margin-top: 35px;
            justify-content: center;
            flex-wrap: wrap;
        }
        
        .alert {
            padding: 16px;
            margin-bottom: 25px;
            border-radius: 8px;
            position: relative;
        }
        
        .alert-danger {
            background: linear-gradient(135deg, #f8d7da 0%, #f5c6cb 100%);
            border-left: 5px solid #e74a3b;
            color: #721c24;
            box-shadow: 0 4px 15px rgba(231, 74, 59, 0.15);
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
        .form-floating textarea:focus ~ label,
        .form-floating textarea:not(:placeholder-shown) ~ label {
            top: -10px;
            left: 10px;
            font-size: 12px;
            color: #6a11cb;
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
            
            .form-card h2 {
                font-size: 22px;
            }
            
            .header {
                padding: 25px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1>
                <i class="fas fa-${isEdit ? 'edit' : 'plus'}-circle"></i> 
                ${isEdit ? 'Sửa' : 'Thêm'} Phòng Ban
            </h1>
            <p>Hệ thống quản lý nhân sự</p>
            <div class="nav-menu">
                <a href="${pageContext.request.contextPath}/nhanvien"><i class="fas fa-users"></i> Nhân Viên</a>
                <a href="${pageContext.request.contextPath}/phongban" class="active"><i class="fas fa-building"></i> Phòng Ban</a>
                <a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Đăng Xuất</a>
            </div>
        </div>

        <!-- Error Alert -->
        <c:if test="${not empty error}">
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-circle" style="font-size: 20px;"></i>
                <div>${error}</div>
            </div>
        </c:if>

        <!-- Form -->
        <div class="form-card">
            <h2><i class="fas fa-${isEdit ? 'edit' : 'plus'}"></i> ${isEdit ? 'Cập Nhật' : 'Thêm Mới'} Phòng Ban</h2>
            <hr>
            
            <form action="${pageContext.request.contextPath}/phongban" method="post">
                <input type="hidden" name="action" value="${isEdit ? 'edit' : 'add'}">
                
                <div class="form-group form-floating">
                    <input type="text" 
                           class="form-control" 
                           id="idpb" 
                           name="idpb" 
                           value="${phongBan.idpb}" 
                           ${isEdit ? 'readonly style="background-color: #f8f9fa; border-color: #ccc; cursor: not-allowed;"' : ''} 
                           maxlength="10"
                           placeholder=" "
                           required>
                    <label for="idpb"><i class="fas fa-id-card"></i> Mã Phòng Ban <span class="required">*</span></label>
                </div>

                <div class="form-group form-floating">
                    <input type="text" 
                           class="form-control" 
                           id="tenpb" 
                           name="tenpb" 
                           value="${phongBan.tenpb}" 
                           maxlength="100"
                           placeholder=" "
                           required>
                    <label for="tenpb"><i class="fas fa-tag"></i> Tên Phòng Ban <span class="required">*</span></label>
                </div>

                <div class="form-group form-floating">
                    <textarea class="form-control" 
                              id="mota" 
                              name="mota" 
                              rows="4" 
                              maxlength="500"
                              placeholder=" ">${phongBan.mota}</textarea>
                    <label for="mota"><i class="fas fa-align-left"></i> Mô Tả</label>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> ${isEdit ? 'Cập Nhật' : 'Thêm Mới'}
                    </button>
                    <a href="${pageContext.request.contextPath}/phongban" class="btn btn-secondary">
                        <i class="fas fa-ban"></i> Hủy Bỏ
                    </a>
                </div>
            </form>
        </div>
    </div>
    
    <script>
        // Instant validation
        document.addEventListener('DOMContentLoaded', function() {
            const tenpbInput = document.getElementById('tenpb');
            const form = document.querySelector('form');
            
            // Validation functions
            function showError(input, message) {
                clearError(input);
                const errorDiv = document.createElement('div');
                errorDiv.className = 'field-error';
                errorDiv.innerHTML = '<i class="fas fa-exclamation-circle"></i> ' + message;
                input.parentNode.appendChild(errorDiv);
                input.style.borderColor = '#dc3545';
            }
            
            function clearError(input) {
                const error = input.parentNode.querySelector('.field-error');
                if (error) {
                    error.remove();
                }
                input.style.borderColor = '#e1e5ea';
            }
            
            function showSuccess(input) {
                clearError(input);
                input.style.borderColor = '#28a745';
            }
            
            // Real-time validation for department name
            tenpbInput.addEventListener('input', function() {
                const value = this.value.trim();
                
                if (value === '') {
                    showError(this, 'Tên phòng ban không được để trống');
                    return;
                }
                
                if (value.length > 100) {
                    showError(this, 'Tên phòng ban không được quá 100 ký tự');
                    return;
                }
                
                // Check for duplicate name via AJAX
                checkDuplicateName(value, this);
            });
            
            // Check duplicate department name
            function checkDuplicateName(tenpb, input) {
                if (tenpb === '') return;
                
                // For edit mode, exclude current department
                const currentIdpb = document.getElementById('idpb').value;
                const isEdit = <c:out value="${isEdit}" default="false"/>;
                
                // Simple client-side check - in real app, use AJAX
                // For now, just show success if not empty
                showSuccess(input);
            }
            
            // Form validation before submit
            form.addEventListener('submit', function(e) {
                let isValid = true;
                
                // Validate required fields
                const requiredFields = [
                    { id: 'idpb', name: 'Mã phòng ban' },
                    { id: 'tenpb', name: 'Tên phòng ban' }
                ];
                
                requiredFields.forEach(field => {
                    const input = document.getElementById(field.id);
                    const value = input.value.trim();
                    
                    if (value === '') {
                        showError(input, field.name + ' không được để trống');
                        isValid = false;
                    }
                });
                
                if (!isValid) {
                    e.preventDefault();
                    
                    // Scroll to first error
                    const firstError = document.querySelector('.field-error');
                    if (firstError) {
                        firstError.scrollIntoView({ behavior: 'smooth', block: 'center' });
                    }
                }
            });
        });
        
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