<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="model.bean.*" %>
<%@ page import="model.bo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<%

	if (request.getSession() == null || request.getSession().getAttribute("username") == null) {
		response.sendRedirect("Login.jsp");
	}
	KhoaBo khoaBo = new KhoaBo();
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xóa người dùng</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<%

	Student student = (Student) request.getAttribute("student");
	String username = (String) request.getSession().getAttribute("username");
%>
<h2>Welcome my friend, <%= username%></h2>

<div class="container-info">
        <h1>Bạn có muốn xóa người dùng này không?</h1>
        <form method="POST" action="delete">
	        <h1 class="title-info">Thông tin sinh viên</h1>
	        <p class='student-info'>Mã số sinh viên:  <%= student.getMssv() %></p>
	        <p class='student-info'>Tên sinh viên: <%= student.getHovaten() %></p>
	        <p class='student-info'>Giới tính:<%= (student.isGioitinh()?"Nam":"Nữ") %></p>
	        <p class='student-info'>Khoa: <%=khoaBo.getKhoaById(student.getMakhoa()).getTenkhoa() %></p>
            <input type="hidden" name="mssv" value="<%= student.getMssv() %>">
            <div class="button-group">
                <input type="submit" value="Xóa">
                <a href="javascript:history.back()">Quay lại</a>
            </div>
            
        </form>
    </div>
</body>
</html>
