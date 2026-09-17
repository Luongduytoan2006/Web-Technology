<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.bo.*" %>
<%@ page import="model.bean.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<%

	if (request.getSession() == null || request.getSession().getAttribute("username") == null) {
		response.sendRedirect("Login.jsp");
	}
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm sinh viên</title>
    <link rel="stylesheet" href="style.css">
    <script>
        function checkId(id) {
            /* alert(id); */
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "checkmssv", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    const response = xhr.responseText;
                    const jsonResponse = JSON.parse(response);
                    alert(jsonResponse);
                    alert(typeof(jsonResponse.message));
                    alert(jsonResponse.message);
                    if (jsonResponse.message == true) {
                        alert(`${id} đã tồn tại!`);
                    } 
                }
            };
            xhr.send("mssv=" + encodeURIComponent(id));
            
            //alert("đã gửi");
        }
    </script>
</head>
<body>
<%
	List<Khoa> khoas = (List<Khoa>) request.getAttribute("khoas");
%>
<div class="form-add-student">
        <h1>Thêm thông tin sinh viên</h1>
        <form method="post" action="add">
           
            <div class="form-group">
                <label>Nhập mã sinh viên:</label>
                <input type="text" name="mssv" onblur="checkId(this.value)" placeholder="102220197" required>
            </div>
            <div class="form-group">
                <label>Nhập tên:</label>
                <input type="text" name="hovaten" placeholder="Dang Phuc Long" required>
            </div>
            <div class="form-group">
                <label>Chọn giới tính:</label>
                <div>
                <input type="radio" name="gioitinh" value="Nam">Nam
                <input type="radio" name="gioitinh" value="Nữ">Nữ
                </div>
            </div>
            <div class="form-group">
                <label>Nhập khoa:</label>
                <select name="makhoa" style="padding:10px;border-radius: 5px;">
				    <%
				        for (Khoa k : khoas) {
				    %>
				        <option value='<%= k.getMakhoa() %>' ><%= k.getTenkhoa() %></option>
				    <%
				        }
				    %>   
				</select>
            </div>
            <input type="submit" value="Thêm">
        </form>
    </div>

    <p><a href="javascript:history.back()" class="back-link">Quay lại</a></p>
</body>
</html>
