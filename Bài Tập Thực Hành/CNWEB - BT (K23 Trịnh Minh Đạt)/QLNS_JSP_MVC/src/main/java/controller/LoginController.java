package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.AdminBean;
import model.bo.AdminBO;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminBO adminBO = new AdminBO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Nếu đã đăng nhập rồi thì chuyển về trang chính
        HttpSession session = request.getSession();
        if (session.getAttribute("admin") != null) {
            response.sendRedirect(request.getContextPath() + "/nhanvien");
            return;
        }

        // Hiển thị form đăng nhập
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            AdminBean admin = adminBO.authenticate(username, password);
            
            if (admin != null) {
                // Đăng nhập thành công
                HttpSession session = request.getSession();
                session.setAttribute("admin", admin);
                session.setMaxInactiveInterval(30 * 60); // 30 phút
                
                response.sendRedirect(request.getContextPath() + "/nhanvien");
            } else {
                // Đăng nhập thất bại
                request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi: " + e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
            rd.forward(request, response);
        }
    }
}
