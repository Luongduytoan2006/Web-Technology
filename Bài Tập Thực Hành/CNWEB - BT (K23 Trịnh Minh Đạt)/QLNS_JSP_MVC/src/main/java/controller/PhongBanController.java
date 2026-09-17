package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.PhongBanBean;
import model.bean.NhanVienBean;
import model.bo.PhongBanBO;
import model.bo.NhanVienBO;

@WebServlet("/phongban")
public class PhongBanController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PhongBanBO phongBanBO = new PhongBanBO();
    private NhanVienBO nhanVienBO = new NhanVienBO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Kiểm tra đăng nhập
        HttpSession session = request.getSession();
        if (session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "list":
                    showPhongBanList(request, response);
                    break;
                case "add":
                    showAddForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deletePhongBan(request, response);
                    break;
                case "view":
                    viewPhongBanEmployees(request, response);
                    break;
                default:
                    showPhongBanList(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi: " + e.getMessage());
            try {
                showPhongBanList(request, response);
            } catch (Exception ex) {
                throw new ServletException(ex);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Kiểm tra đăng nhập
        HttpSession session = request.getSession();
        if (session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        
        try {
            switch (action) {
                case "add":
                    addPhongBan(request, response);
                    break;
                case "edit":
                    updatePhongBan(request, response);
                    break;
                default:
                    showPhongBanList(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi: " + e.getMessage());
            try {
                if ("add".equals(action)) {
                    showAddFormWithError(request, response);
                } else if ("edit".equals(action)) {
                    showEditFormWithError(request, response);
                } else {
                    showPhongBanList(request, response);
                }
            } catch (Exception ex) {
                throw new ServletException(ex);
            }
        }
    }

    // Hiển thị danh sách phòng ban
    private void showPhongBanList(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ArrayList<PhongBanBean> dsPhongBan = phongBanBO.getAllPhongBan();
        request.setAttribute("dsPhongBan", dsPhongBan);
        
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/phongban-list.jsp");
        rd.forward(request, response);
    }

    // Hiển thị form thêm phòng ban
    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/phongban-form.jsp");
        rd.forward(request, response);
    }

    // Hiển thị form sửa phòng ban
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String idpb = request.getParameter("id");
        PhongBanBean phongBan = phongBanBO.getPhongBanById(idpb);
        
        request.setAttribute("phongBan", phongBan);
        request.setAttribute("isEdit", true);
        
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/phongban-form.jsp");
        rd.forward(request, response);
    }

    // Thêm phòng ban mới
    private void addPhongBan(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String idpb = request.getParameter("idpb");
        String tenpb = request.getParameter("tenpb");
        String mota = request.getParameter("mota");

        PhongBanBean pb = new PhongBanBean();
        pb.setIdpb(idpb);
        pb.setTenpb(tenpb);
        pb.setMota(mota);

        if (phongBanBO.addPhongBan(pb)) {
            request.setAttribute("success", "Thêm phòng ban thành công!");
            response.sendRedirect(request.getContextPath() + "/phongban");
        } else {
            throw new Exception("Không thể thêm phòng ban");
        }
    }

    // Hiển thị form thêm với lỗi (giữ lại dữ liệu đã nhập)
    private void showAddFormWithError(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // Tạo PhongBanBean từ dữ liệu đã nhập để giữ lại trên form
        PhongBanBean pb = new PhongBanBean();
        pb.setIdpb(request.getParameter("idpb"));
        pb.setTenpb(request.getParameter("tenpb"));
        pb.setMota(request.getParameter("mota"));
        
        request.setAttribute("phongBan", pb);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/phongban-form.jsp");
        rd.forward(request, response);
    }

    // Cập nhật phòng ban
    private void updatePhongBan(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String idpb = request.getParameter("idpb");
        String tenpb = request.getParameter("tenpb");
        String mota = request.getParameter("mota");

        PhongBanBean pb = new PhongBanBean();
        pb.setIdpb(idpb);
        pb.setTenpb(tenpb);
        pb.setMota(mota);

        if (phongBanBO.updatePhongBan(pb)) {
            request.setAttribute("success", "Cập nhật phòng ban thành công!");
            response.sendRedirect(request.getContextPath() + "/phongban");
        } else {
            throw new Exception("Không thể cập nhật phòng ban");
        }
    }

    // Hiển thị form sửa với lỗi (giữ lại dữ liệu đã nhập)
    private void showEditFormWithError(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // Tạo PhongBanBean từ dữ liệu đã nhập để giữ lại trên form
        PhongBanBean pb = new PhongBanBean();
        pb.setIdpb(request.getParameter("idpb"));
        pb.setTenpb(request.getParameter("tenpb"));
        pb.setMota(request.getParameter("mota"));
        
        request.setAttribute("phongBan", pb);
        request.setAttribute("isEdit", true);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/phongban-form.jsp");
        rd.forward(request, response);
    }

    // Xóa phòng ban
    private void deletePhongBan(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String idpb = request.getParameter("id");
        
        if (phongBanBO.deletePhongBan(idpb)) {
            request.setAttribute("success", "Xóa phòng ban thành công!");
        } else {
            request.setAttribute("error", "Không thể xóa phòng ban");
        }
        
        response.sendRedirect(request.getContextPath() + "/phongban");
    }

    // Xem danh sách nhân viên trong phòng ban
    private void viewPhongBanEmployees(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String idpb = request.getParameter("id");
        
        // Lấy thông tin phòng ban
        PhongBanBean phongBan = phongBanBO.getPhongBanById(idpb);
        
        // Lấy danh sách nhân viên của phòng ban
        ArrayList<NhanVienBean> dsNhanVien = nhanVienBO.getNhanVienByPhongBan(idpb);
        
        request.setAttribute("phongBan", phongBan);
        request.setAttribute("dsNhanVien", dsNhanVien);
        
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/nhanvien-phongban.jsp");
        rd.forward(request, response);
    }
}
