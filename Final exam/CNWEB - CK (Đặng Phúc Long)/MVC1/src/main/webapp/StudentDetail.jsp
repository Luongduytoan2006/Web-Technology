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
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết Sinh viên</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
	<%
	
			Student student = (Student) request.getAttribute("student");
	%>
    <div class="container-info">
        <h1 class="title-info">Thông tin sinh viên</h1>
        <p class='student-info'>Mã số sinh viên:  <%= student.getMssv() %></p>
        <p class='student-info'>Tên sinh viên: <%= student.getHovaten() %></p>
        <p class='student-info'>Giới tính:<%= (student.isGioitinh()?"Nam":"Nữ") %></p>
        <p class='student-info'>Khoa: <%= student.getKhoa() %></p>
        
        <p><a href="javascript:history.back()" class="back-link">Quay lại</a></p>
    </div>
</body>
</html>