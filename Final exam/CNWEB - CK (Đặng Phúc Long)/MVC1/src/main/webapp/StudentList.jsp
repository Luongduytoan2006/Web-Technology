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
    <title>Danh sách Sinh viên</title>
    <link rel="stylesheet" href="style.css">
    
</head>
<body>
    <%
    
			KhoaBo khoaBo = new KhoaBo();
    		
        	String username = (String) request.getSession().getAttribute("username");
        	String value = (String) request.getAttribute("value");
        	List<Student> allStudent = (List<Student>) request.getAttribute("students");
        	List<Khoa> khoas = (List<Khoa>) request.getAttribute("khoas");
    %>
    <script>
    
        function searchKhoa() {
            const elementSelect = document.getElementById("khoa");
            const selectedValue = elementSelect.value;
            console.log(selectedValue);
            const url = "search?value=" + encodeURIComponent(selectedValue);
            console.log(url);
            window.location.href = url;

        }
    </script>
    
    <h2>Welcome my friend, <%=username%></h2>
    <div style="display:flex;justify-content: space-between;">
        <div>
            <label>Tìm kiếm theo khoa</label>
            <select id="khoa" style="padding:10px;border-radius: 5px;">
			    <option value='all' <%= (value.equals("all") ? "selected" : "") %>>Tất cả</option>
			    <%
			        for (Khoa k : khoas) {
			    %>
			        <option value='<%= k.getMakhoa() %>' <%= (value.equals(k.getMakhoa()) ? "selected" : "") %>><%= k.getTenkhoa() %></option>
			    <%
			        }
			    %>   
			</select>
            <a onclick="searchKhoa()" class="back-link">Tìm kiếm</a>
        </div>
        
        <a href="add" class="back-link">Thêm sinh viên</a>
    </div>
    <table>
        <caption>Danh sách sinh viên</caption>
        <tr>
            <th class="student-index">STT</th>
            <th class="student-id">Mã sinh viên</th>
            <th class="student-name">Tên sinh viên</th>
            <th class="student-age">Giới tính</th>
            <th class="student-university">Khoa</th>
            <th class="student-details"></th>
            <th class="student-details"></th>
            
        </tr>
        
        <%
                
                        	int cnt = 0;
                        	for (Student st : allStudent) {
                        		++cnt;
                %>	
        		<tr>
        		<td><%= cnt %></td>
                <td><%= st.getMssv() %></td>
                <td><%= st.getHovaten() %></td>
                <td><%= (st.isGioitinh()?"Nam":"Nữ") %></td>
                <td><%= khoaBo.getKhoaById(st.getMakhoa()).getTenkhoa() %></td>
                
                <td><a href='update?mssv=<%= st.getMssv()%>'>Cập nhật</a></td>
                <td><a href='delete?mssv=<%= st.getMssv()%>'>Xóa</a></td></tr>
        <%
        	}
        %>
        
    </table>
    
    <p><a href="javascript:history.back()" class="back-link">Quay Lại</a></p>
    
</body>
</html>