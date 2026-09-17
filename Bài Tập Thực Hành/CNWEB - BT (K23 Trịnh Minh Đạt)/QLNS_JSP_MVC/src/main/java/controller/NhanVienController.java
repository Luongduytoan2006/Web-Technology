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

import model.bean.NhanVienBean;
import model.bean.PhongBanBean;
import model.bo.NhanVienBO;
import model.bo.PhongBanBO;

@WebServlet("/nhanvien")
public class NhanVienController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private NhanVienBO nhanVienBO = new NhanVienBO();
    private PhongBanBO phongBanBO = new PhongBanBO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Kiểm tra đăng nhập đơn giản
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
                    showNhanVienList(request, response);
                    break;
                case "search":
                    searchNhanVien(request, response);
                    break;
                case "add":
                    showAddForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    showDeleteConfirmation(request, response);
                    break;
                case "deleteMultiple":
                    showDeleteMultipleConfirmation(request, response);
                    break;
                default:
                    showNhanVienList(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi: " + e.getMessage());
            try {
                showNhanVienList(request, response);
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
                    addNhanVien(request, response);
                    break;
                case "edit":
                    updateNhanVien(request, response);
                    break;
                case "delete":
                    deleteNhanVien(request, response);
                    break;
                case "confirmDeleteMultiple":
                    deleteMultipleNhanVien(request, response);
                    break;
                default:
                    showNhanVienList(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi: " + e.getMessage());
            try {
                if ("add".equals(action)) {
                    showAddForm(request, response);
                } else if ("edit".equals(action)) {
                    showEditForm(request, response);
                } else {
                    showNhanVienList(request, response);
                }
            } catch (Exception ex) {
                throw new ServletException(ex);
            }
        }
    }

    // Hiển thị danh sách nhân viên
    private void showNhanVienList(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ArrayList<NhanVienBean> dsNhanVien = nhanVienBO.getAllNhanVien();
        ArrayList<PhongBanBean> dsPhongBan = phongBanBO.getAllPhongBan();
        request.setAttribute("dsNhanVien", dsNhanVien);
        request.setAttribute("dsPhongBan", dsPhongBan);
        
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/nhanvien-list.jsp");
        rd.forward(request, response);
    }

    // Tìm kiếm nhân viên
    private void searchNhanVien(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String keyword = request.getParameter("keyword");
        String idpb = request.getParameter("idpb");
        
        ArrayList<NhanVienBean> dsNhanVien;
        if ((keyword == null || keyword.trim().isEmpty()) && 
            (idpb == null || idpb.trim().isEmpty() || "".equals(idpb))) {
            dsNhanVien = nhanVienBO.getAllNhanVien();
        } else {
            dsNhanVien = nhanVienBO.searchAdvanced(keyword, idpb);
        }
        
        ArrayList<PhongBanBean> dsPhongBan = phongBanBO.getAllPhongBan();
        request.setAttribute("dsNhanVien", dsNhanVien);
        request.setAttribute("dsPhongBan", dsPhongBan);
        request.setAttribute("keyword", keyword);
        request.setAttribute("selectedIdpb", idpb);
        
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/nhanvien-list.jsp");
        rd.forward(request, response);
    }

    // Hiển thị form thêm nhân viên
    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ArrayList<PhongBanBean> dsPhongBan = phongBanBO.getAllPhongBan();
        request.setAttribute("dsPhongBan", dsPhongBan);
        
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/nhanvien-form.jsp");
        rd.forward(request, response);
    }

    // Hiển thị form sửa nhân viên
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String idnv = request.getParameter("id");
        NhanVienBean nhanVien = nhanVienBO.getNhanVienById(idnv);
        ArrayList<PhongBanBean> dsPhongBan = phongBanBO.getAllPhongBan();
        
        request.setAttribute("nhanVien", nhanVien);
        request.setAttribute("dsPhongBan", dsPhongBan);
        request.setAttribute("isEdit", true);
        
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/nhanvien-form.jsp");
        rd.forward(request, response);
    }

    // Thêm nhân viên mới
    private void addNhanVien(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String idnv = request.getParameter("idnv");
        String hoten = request.getParameter("hoten");
        String idpb = request.getParameter("idpb");
        String diachi = request.getParameter("diachi");

        NhanVienBean nv = new NhanVienBean();
        nv.setIdnv(idnv);
        nv.setHoten(hoten);
        nv.setIdpb(idpb);
        nv.setDiachi(diachi);

        if (nhanVienBO.addNhanVien(nv)) {
            response.sendRedirect(request.getContextPath() + "/nhanvien?success=add");
        } else {
            throw new Exception("Không thể thêm nhân viên");
        }
    }

    // Cập nhật nhân viên
    private void updateNhanVien(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String idnv = request.getParameter("idnv");
        String hoten = request.getParameter("hoten");
        String idpb = request.getParameter("idpb");
        String diachi = request.getParameter("diachi");

        NhanVienBean nv = new NhanVienBean();
        nv.setIdnv(idnv);
        nv.setHoten(hoten);
        nv.setIdpb(idpb);
        nv.setDiachi(diachi);

        if (nhanVienBO.updateNhanVien(nv)) {
            response.sendRedirect(request.getContextPath() + "/nhanvien?success=edit");
        } else {
            throw new Exception("Không thể cập nhật nhân viên");
        }
    }

    // Xóa nhân viên
    private void deleteNhanVien(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String idnv = request.getParameter("id");
        
        if (nhanVienBO.deleteNhanVien(idnv)) {
            response.sendRedirect(request.getContextPath() + "/nhanvien?success=delete");
        } else {
            response.sendRedirect(request.getContextPath() + "/nhanvien?error=delete");
        }
    }

    // Xóa nhiều nhân viên
    private void deleteMultipleNhanVien(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String[] selectedIds = request.getParameterValues("selectedIds");
        
        if (selectedIds == null || selectedIds.length == 0) {
            response.sendRedirect(request.getContextPath() + "/nhanvien?error=noselection");
            return;
        }
        
        int deletedCount = nhanVienBO.deleteMultipleNhanVien(selectedIds);
        if (deletedCount > 0) {
            response.sendRedirect(request.getContextPath() + "/nhanvien?success=deletemultiple&count=" + deletedCount);
        } else {
            response.sendRedirect(request.getContextPath() + "/nhanvien?error=deletemultiple");
        }
    }
    
    // Hiển thị trang xác nhận xóa một nhân viên
    private void showDeleteConfirmation(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String idnv = request.getParameter("id");
        NhanVienBean nhanVien = nhanVienBO.getNhanVienById(idnv);
        
        if (nhanVien == null) {
            response.sendRedirect(request.getContextPath() + "/nhanvien?error=notfound");
            return;
        }
        
        request.setAttribute("nhanVien", nhanVien);
        
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/nhanvien-delete.jsp");
        rd.forward(request, response);
    }
    
    // Hiển thị trang xác nhận xóa nhiều nhân viên
    private void showDeleteMultipleConfirmation(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String[] selectedIds = request.getParameterValues("selectedIds");
        
        if (selectedIds == null || selectedIds.length == 0) {
            response.sendRedirect(request.getContextPath() + "/nhanvien?error=noselection");
            return;
        }
        
        ArrayList<NhanVienBean> selectedNhanVien = new ArrayList<>();
        for (String id : selectedIds) {
            NhanVienBean nv = nhanVienBO.getNhanVienById(id);
            if (nv != null) {
                selectedNhanVien.add(nv);
            }
        }
        
        request.setAttribute("selectedNhanVien", selectedNhanVien);
        
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/nhanvien-delete.jsp");
        rd.forward(request, response);
    }
}