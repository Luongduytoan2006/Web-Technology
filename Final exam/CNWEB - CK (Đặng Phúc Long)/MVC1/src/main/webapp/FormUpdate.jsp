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
    <title>Cập nhật Sinh viên</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<%

	
	String mssv = (String)request.getAttribute("mssv");
	String username = (String) request.getSession().getAttribute("username");
	Student user = (Student) request.getAttribute("student");
%>
<%
	List<Khoa> khoas = (List<Khoa>) request.getAttribute("khoas");
%>
<h2>Welcome my friend, <%= username %></h2>
<div class="form-update-student">
        <h1>Cập nhật thông tin sinh viên</h1>
        <form method="post" action="update">
            <div class="form-group">
                <label>Mã sinh viên</label>
                <input type="text" name="mssv" value="<%= user.getMssv() %>" readonly>
            </div>
            <div class="form-group">
                <label>Nhập tên</label>
                <input type="text" name="hovaten" value="<%= user.getHovaten() %>">
            </div>
            <div class="form-group">
                <label>Nhập giới tính</label>

                <input type="radio" name="gioitinh" <%=(user.isGioitinh()?"checked":"")%> value="Nam">Nam
                <input type="radio" name="gioitinh" <%=(!user.isGioitinh()?"checked":"")%> value="Nữ">Nữ
            </div>
            <div class="form-group">
                <label>Nhập khoa</label>
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
            <input type="submit" value="Cập nhật">
        </form>
    </div>
    
    
    <p><a href="javascript:history.back()" class="back-link">Quay lại</a></p>
</body>
</html>

