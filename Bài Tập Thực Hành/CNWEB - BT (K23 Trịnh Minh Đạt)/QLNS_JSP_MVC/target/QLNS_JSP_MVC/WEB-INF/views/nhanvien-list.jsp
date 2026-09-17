<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quản Lý Nhân Viên</title>
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
        background: linear-gradient(135deg, #4e73df 0%, #224abe 100%);
        color: white;
        padding: 30px;
        border-radius: 16px;
        margin-bottom: 30px;
        box-shadow: 0 10px 20px rgba(78, 115, 223, 0.2);
        position: relative;
        overflow: hidden;
        display: flex;
        justify-content: space-between;
        align-items: center;
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
    
    .header-content {
        position: relative;
        z-index: 1;
    }
    
    .header h2 {
        margin: 0;
        color: white;
        font-size: 28px;
        font-weight: 700;
        margin-bottom: 5px;
        text-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .header p {
        margin: 0;
        opacity: 0.9;
    }
    
    .user-info {
        position: relative;
        z-index: 1;
        color: white;
        text-align: right;
        font-size: 14px;
    }
    
    .user-info a {
        color: white;
        text-decoration: none;
        margin-left: 10px;
        padding: 8px 16px;
        background: rgba(255,255,255,0.2);
        border-radius: 50px;
        transition: all 0.3s;
        display: inline-flex;
        align-items: center;
        gap: 7px;
        font-weight: 500;
    }
    
    .user-info a:hover {
        background: rgba(255,255,255,0.3);
        transform: translateY(-2px);
    }
    
    .navigation {
        background: white;
        padding: 18px 25px;
        border-radius: 16px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.08);
        margin-bottom: 30px;
        display: flex;
        flex-wrap: wrap;
        gap: 15px;
    }
    
    .navigation a {
        text-decoration: none;
        color: #4e73df;
        font-weight: 600;
        padding: 10px 20px;
        border-radius: 50px;
        transition: all 0.3s;
        font-size: 14px;
        display: inline-flex;
        align-items: center;
        gap: 7px;
    }
    
    .navigation a:hover {
        background: #f8f9fc;
        transform: translateY(-2px);
    }
    
    .navigation a.active {
        background: #4e73df;
        color: white;
        box-shadow: 0 4px 15px rgba(78, 115, 223, 0.3);
    }
    
    .navigation a.active:hover {
        background: #3a5fd9;
    }
    
    .controls {
        background: white;
        padding: 25px;
        border-radius: 16px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        margin-bottom: 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
        gap: 20px;
    }
    
    .search-form {
        display: flex;
        gap: 15px;
        align-items: center;
        flex: 1;
    }
    
    .search-inputs {
        display: flex;
        gap: 15px;
        align-items: center;
        flex-wrap: wrap;
        flex: 1;
    }
    
    .search-form input[type="text"], .search-form select {
        padding: 12px 16px;
        border: 2px solid #e1e5ea;
        border-radius: 8px;
        font-size: 15px;
        transition: all 0.3s;
        background: #f8fafc;
        color: #333;
        flex: 1;
        min-width: 200px;
    }
    
    .search-form input[type="text"]:focus, .search-form select:focus {
        outline: none;
        border-color: #4e73df;
        box-shadow: 0 0 0 3px rgba(78, 115, 223, 0.15);
        background: #fff;
    }
    
    .search-form select {
        appearance: none;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%23a0aec0' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M6 9l6 6 6-6'%3E%3C/path%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-position: right 12px center;
        padding-right: 40px;
    }
    
    .action-buttons {
        display: flex;
        gap: 15px;
        flex-wrap: wrap;
    }
    
    .phongban-badge {
        background: linear-gradient(135deg, #e3f2fd 0%, #bbdefb 100%);
        color: #1565c0;
        padding: 5px 12px;
        border-radius: 50px;
        font-size: 13px;
        font-weight: 500;
        display: inline-flex;
        align-items: center;
        gap: 5px;
        box-shadow: 0 2px 5px rgba(21, 101, 192, 0.15);
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
    
    .btn-danger { 
        background: linear-gradient(135deg, #e74a3b 0%, #be2617 100%);
        color: white;
        box-shadow: 0 4px 15px rgba(231, 74, 59, 0.3);
    }
    
    .btn-danger:hover {
        box-shadow: 0 6px 20px rgba(231, 74, 59, 0.5);
    }
    
    .btn-info { 
        background: linear-gradient(135deg, #36b9cc 0%, #258391 100%);
        color: white;
        box-shadow: 0 4px 15px rgba(54, 185, 204, 0.3);
    }
    
    .btn-info:hover {
        box-shadow: 0 6px 20px rgba(54, 185, 204, 0.5);
    }
    
    .table-container {
        background: white;
        border-radius: 16px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        overflow: hidden;
        animation: fadeIn 0.5s ease-out;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    table { 
        width: 100%; 
        border-collapse: collapse; 
    }
    
    th, td { 
        border: none; 
        padding: 16px; 
        text-align: left; 
    }
    
    th { 
        background: #f8f9fc; 
        font-weight: 600;
        color: #5a5c69;
        text-transform: uppercase;
        font-size: 13px;
        letter-spacing: 0.5px;
    }
    
    tr {
        border-bottom: 1px solid #e3e6f0;
    }
    
    tr:last-child {
        border-bottom: none;
    }
    
    tr:hover {
        background-color: #f8f9fc;
    }
    
    td {
        color: #5a5c69;
        font-size: 14px;
        vertical-align: middle;
    }
    
    .actions {
        white-space: nowrap;
        display: flex;
        gap: 8px;
    }
    
    .actions .btn {
        padding: 8px 16px;
        font-size: 13px;
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
    
    .empty-message {
        text-align: center;
        padding: 60px 20px;
        color: #5a5c69;
        font-style: normal;
    }
    
    .empty-message h3 {
        font-size: 24px;
        margin-bottom: 15px;
        color: #4e73df;
    }
    
    .empty-message p {
        margin-bottom: 20px;
        font-size: 16px;
    }
    
    .empty-message i {
        font-size: 60px;
        color: #d1d3e2;
        margin-bottom: 20px;
        display: block;
    }
    
    input[type="checkbox"] {
        width: 18px;
        height: 18px;
        accent-color: #4e73df;
        cursor: pointer;
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
    }
    
    .modal-footer {
        display: flex;
        justify-content: flex-end;
        gap: 15px;
    }
    
    @media (max-width: 768px) {
        .container {
            padding: 15px;
        }
        
        .header {
            flex-direction: column;
            align-items: flex-start;
        }
        
        .user-info {
            margin-top: 15px;
            text-align: left;
        }
        
        .controls {
            padding: 20px;
        }
        
        .search-form {
            flex-direction: column;
            align-items: stretch;
        }
        
        .search-inputs {
            flex-direction: column;
        }
        
        .action-buttons {
            justify-content: center;
            width: 100%;
        }
        
        .btn {
            width: 100%;
        }
        
        .modal-content {
            width: 95%;
            padding: 20px;
        }
        
        .modal-footer {
            flex-direction: column;
        }
    }
</style>
<script>
let deleteNhanVienId = '';

function confirmDelete(id, name) {
    // Redirect to confirmation page instead of showing modal
    window.location.href = '${pageContext.request.contextPath}/nhanvien?action=delete&id=' + id;
}

function closeDeleteModal() {
    document.getElementById('deleteModal').style.display = 'none';
    deleteNhanVienId = '';
}

function executeDelete() {
    if (deleteNhanVienId) {
        window.location.href = '${pageContext.request.contextPath}/nhanvien?action=delete&id=' + deleteNhanVienId;
    }
}

function toggleSelectAll() {
    const selectAll = document.getElementById('selectAll');
    const checkboxes = document.querySelectorAll('.select-item');
    
    checkboxes.forEach(checkbox => {
        checkbox.checked = selectAll.checked;
    });
    
    updateDeleteButton();
}

function updateDeleteButton() {
    const checkboxes = document.querySelectorAll('.select-item:checked');
    const deleteBtn = document.getElementById('deleteSelectedBtn');
    
    if (checkboxes.length > 0) {
        deleteBtn.style.display = 'inline-flex';
        deleteBtn.textContent = 'Xóa đã chọn (' + checkboxes.length + ')';
    } else {
        deleteBtn.style.display = 'none';
    }
}

function deleteSelected() {
    const checkboxes = document.querySelectorAll('.select-item:checked');
    if (checkboxes.length === 0) {
        alert('Vui lòng chọn ít nhất một nhân viên để xóa!');
        return;
    }
    
    // Redirect to confirmation page instead of using confirm()
    const form = document.createElement('form');
    form.method = 'GET';
    form.action = '${pageContext.request.contextPath}/nhanvien';
    
    const actionInput = document.createElement('input');
    actionInput.type = 'hidden';
    actionInput.name = 'action';
    actionInput.value = 'deleteMultiple';
    form.appendChild(actionInput);
    
    checkboxes.forEach(checkbox => {
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'selectedIds';
        input.value = checkbox.value;
        form.appendChild(input);
    });
    
    document.body.appendChild(form);
    form.submit();
}
</script>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="header-content">
                <h2>HỆ THỐNG QUẢN LÝ NHÂN SỰ</h2>
                <p>Quản lý thông tin nhân viên và phòng ban</p>
            </div>
            <div class="user-info">
                Xin chào, <strong>${sessionScope.admin.username}</strong>
                <a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
            </div>
        </div>

        <div class="navigation">
            <a href="${pageContext.request.contextPath}/nhanvien" class="active"><i class="fas fa-users"></i> Quản lý nhân viên</a>
            <a href="${pageContext.request.contextPath}/phongban"><i class="fas fa-building"></i> Quản lý phòng ban</a>
        </div>

        <!-- Thông báo thành công/lỗi -->
        <c:if test="${param.success == 'add'}">
            <div class="alert alert-success">
                <i class="fas fa-check-circle alert-icon"></i>
                <div>Thêm nhân viên thành công!</div>
            </div>
        </c:if>
        <c:if test="${param.success == 'edit'}">
            <div class="alert alert-success">
                <i class="fas fa-check-circle alert-icon"></i>
                <div>Cập nhật nhân viên thành công!</div>
            </div>
        </c:if>
        <c:if test="${param.success == 'delete'}">
            <div class="alert alert-success">
                <i class="fas fa-check-circle alert-icon"></i>
                <div>Xóa nhân viên thành công!</div>
            </div>
        </c:if>
        <c:if test="${param.success == 'deletemultiple'}">
            <div class="alert alert-success">
                <i class="fas fa-check-circle alert-icon"></i>
                <div>Đã xóa ${param.count} nhân viên thành công!</div>
            </div>
        </c:if>
        <c:if test="${param.error == 'delete'}">
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-circle alert-icon"></i>
                <div>Không thể xóa nhân viên!</div>
            </div>
        </c:if>
        <c:if test="${param.error == 'deletemultiple'}">
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-circle alert-icon"></i>
                <div>Không thể xóa các nhân viên được chọn!</div>
            </div>
        </c:if>
        <c:if test="${param.error == 'noselection'}">
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-circle alert-icon"></i>
                <div>Vui lòng chọn ít nhất một nhân viên để xóa!</div>
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-circle alert-icon"></i>
                <div>${error}</div>
            </div>
        </c:if>

        <div class="controls">
            <form class="search-form" method="get" action="${pageContext.request.contextPath}/nhanvien">
                <input type="hidden" name="action" value="search">
                <div class="search-inputs">
                    <input type="text" name="keyword" placeholder="Tìm theo tên, mã NV, địa chỉ..." value="${keyword}">
                    <select name="idpb">
                        <option value="">-- Tất cả phòng ban --</option>
                        <c:forEach items="${dsPhongBan}" var="pb">
                            <option value="${pb.idpb}" ${pb.idpb == selectedIdpb ? 'selected' : ''}>
                                ${pb.idpb} - ${pb.tenpb}
                            </option>
                        </c:forEach>
                    </select>
                    <button type="submit" class="btn btn-info"><i class="fas fa-search"></i> Tìm kiếm</button>
                </div>
                <c:if test="${not empty keyword or not empty selectedIdpb}">
                    <a href="${pageContext.request.contextPath}/nhanvien" class="btn btn-primary"><i class="fas fa-sync-alt"></i> Hiển thị tất cả</a>
                </c:if>
            </form>
            
            <div class="action-buttons">
                <a href="${pageContext.request.contextPath}/nhanvien?action=add" class="btn btn-success"><i class="fas fa-plus"></i> Thêm nhân viên</a>
                <button type="button" id="deleteSelectedBtn" class="btn btn-danger" onclick="deleteSelected()" style="display:none;">
                    <i class="fas fa-trash-alt"></i> Xóa đã chọn
                </button>
            </div>
        </div>

        <div class="table-container">
            <c:choose>
                <c:when test="${empty dsNhanVien}">
                    <div class="empty-message">
                        <i class="fas fa-user-slash"></i>
                        <c:choose>
                            <c:when test="${not empty keyword}">
                                <h3>Không tìm thấy nhân viên</h3>
                                <p>Không tìm thấy nhân viên nào với từ khóa "${keyword}"</p>
                            </c:when>
                            <c:otherwise>
                                <h3>Chưa có nhân viên nào</h3>
                                <p>Chưa có nhân viên nào trong hệ thống.</p>
                                <a href="${pageContext.request.contextPath}/nhanvien?action=add" class="btn btn-success"><i class="fas fa-plus"></i> Thêm nhân viên đầu tiên</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:when>
                <c:otherwise>
                    <table>
                        <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" id="selectAll" onchange="toggleSelectAll()">
                                </th>
                                <th>Mã NV</th>
                                <th>Họ Tên</th>
                                <th>Phòng Ban</th>
                                <th>Địa chỉ</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${dsNhanVien}" var="nv">
                                <tr>
                                    <td>
                                        <input type="checkbox" name="selectedIds" value="${nv.idnv}" 
                                               class="select-item" onchange="updateDeleteButton()">
                                    </td>
                                    <td><strong><c:out value="${nv.idnv}" /></strong></td>
                                    <td><c:out value="${nv.hoten}" /></td>
                                    <td>
                                        <c:forEach items="${dsPhongBan}" var="pb">
                                            <c:if test="${pb.idpb == nv.idpb}">
                                                <span class="phongban-badge"><i class="fas fa-building"></i> ${pb.idpb} - ${pb.tenpb}</span>
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                    <td><c:out value="${nv.diachi}" /></td>
                                    <td class="actions">
                                        <a href="${pageContext.request.contextPath}/nhanvien?action=edit&id=${nv.idnv}" 
                                           class="btn btn-warning"><i class="fas fa-edit"></i> Sửa</a>
                                        <a href="javascript:confirmDelete('${nv.idnv}', '${nv.hoten}')" 
                                           class="btn btn-danger"><i class="fas fa-trash-alt"></i> Xóa</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Delete Confirmation Modal -->
        <div id="deleteModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h3><i class="fas fa-exclamation-triangle"></i> Xác Nhận Xóa</h3>
                    <span class="close" onclick="closeDeleteModal()">&times;</span>
                </div>
                <div class="modal-body">
                    <p>Bạn có chắc chắn muốn xóa nhân viên:</p>
                    <p><strong id="deleteNhanVienName"></strong> (ID: <span id="deleteNhanVienId"></span>)?</p>
                    <p class="text-danger"><i class="fas fa-exclamation-circle"></i> Hành động này không thể hoàn tác!</p>
                </div>
                <div class="modal-footer">
                    <button onclick="closeDeleteModal()" class="btn btn-secondary"><i class="fas fa-ban"></i> Hủy</button>
                    <button onclick="executeDelete()" class="btn btn-danger"><i class="fas fa-trash-alt"></i> Xóa</button>
                </div>
            </div>
        </div>
    </div>

    <script>
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