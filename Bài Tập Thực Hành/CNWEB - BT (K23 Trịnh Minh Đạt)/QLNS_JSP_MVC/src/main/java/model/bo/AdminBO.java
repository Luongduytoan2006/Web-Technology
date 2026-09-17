package model.bo;

import model.bean.AdminBean;
import model.dao.AdminDAO;

import java.sql.SQLException;

public class AdminBO {
    private AdminDAO adminDAO;
    
    public AdminBO() {
        this.adminDAO = new AdminDAO();
    }
    
    /**
     * Xác thực đăng nhập admin
     * @param username Tên đăng nhập
     * @param password Mật khẩu
     * @return AdminBean nếu đăng nhập thành công, null nếu không
     */
    public AdminBean authenticate(String username, String password) {
        try {
            // Kiểm tra tham số đầu vào
            if (username == null || username.trim().isEmpty() || 
                password == null || password.trim().isEmpty()) {
                return null;
            }
            
            // Tìm admin theo username
            AdminBean admin = adminDAO.findByUsername(username.trim());
            
            // Kiểm tra admin có tồn tại và mật khẩu đúng không
            if (admin != null && admin.getPassword().equals(password)) {
                return admin;
            }
            
            return null;
        } catch (SQLException e) {
            System.err.println("Lỗi khi xác thực đăng nhập: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    
    /**
     * Xác thực đăng nhập admin
     * @param username Tên đăng nhập
     * @param password Mật khẩu
     * @return true nếu đăng nhập thành công, false nếu không
     */
    public boolean validateLogin(String username, String password) {
        try {
            // Kiểm tra tham số đầu vào
            if (username == null || username.trim().isEmpty() || 
                password == null || password.trim().isEmpty()) {
                return false;
            }
            
            // Tìm admin theo username
            AdminBean admin = adminDAO.findByUsername(username.trim());
            
            // Kiểm tra admin có tồn tại và mật khẩu đúng không
            if (admin != null && admin.getPassword().equals(password)) {
                return true;
            }
            
            return false;
        } catch (SQLException e) {
            System.err.println("Lỗi khi xác thực đăng nhập: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * Lấy thông tin admin theo username
     * @param username Tên đăng nhập
     * @return AdminBean hoặc null nếu không tìm thấy
     */
    public AdminBean getAdminByUsername(String username) {
        try {
            if (username == null || username.trim().isEmpty()) {
                return null;
            }
            
            return adminDAO.findByUsername(username.trim());
        } catch (SQLException e) {
            System.err.println("Lỗi khi lấy thông tin admin: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    
    /**
     * Thêm admin mới
     * @param admin AdminBean cần thêm
     * @return true nếu thêm thành công, false nếu không
     */
    public boolean addAdmin(AdminBean admin) {
        try {
            // Validate admin data
            if (!validateAdminData(admin)) {
                return false;
            }
            
            // Kiểm tra username đã tồn tại chưa
            AdminBean existingAdmin = adminDAO.findByUsername(admin.getUsername());
            if (existingAdmin != null) {
                System.out.println("Username đã tồn tại: " + admin.getUsername());
                return false;
            }
            
            return adminDAO.insert(admin);
        } catch (SQLException e) {
            System.err.println("Lỗi khi thêm admin: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * Cập nhật thông tin admin
     * @param admin AdminBean cần cập nhật
     * @return true nếu cập nhật thành công, false nếu không
     */
    public boolean updateAdmin(AdminBean admin) {
        try {
            // Validate admin data
            if (!validateAdminData(admin)) {
                return false;
            }
            
            return adminDAO.update(admin);
        } catch (SQLException e) {
            System.err.println("Lỗi khi cập nhật admin: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * Xóa admin theo username
     * @param username Tên đăng nhập cần xóa
     * @return true nếu xóa thành công, false nếu không
     */
    public boolean deleteAdmin(String username) {
        try {
            if (username == null || username.trim().isEmpty()) {
                return false;
            }
            
            return adminDAO.delete(username.trim());
        } catch (SQLException e) {
            System.err.println("Lỗi khi xóa admin: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * Thay đổi mật khẩu admin
     * @param username Tên đăng nhập
     * @param oldPassword Mật khẩu cũ
     * @param newPassword Mật khẩu mới
     * @return true nếu thay đổi thành công, false nếu không
     */
    public boolean changePassword(String username, String oldPassword, String newPassword) {
        try {
            // Validate parameters
            if (username == null || username.trim().isEmpty() || 
                oldPassword == null || oldPassword.trim().isEmpty() ||
                newPassword == null || newPassword.trim().isEmpty()) {
                return false;
            }
            
            // Xác thực mật khẩu cũ
            if (!validateLogin(username, oldPassword)) {
                return false;
            }
            
            // Cập nhật mật khẩu mới
            AdminBean admin = new AdminBean(username.trim(), newPassword.trim());
            return adminDAO.update(admin);
        } catch (Exception e) {
            System.err.println("Lỗi khi thay đổi mật khẩu: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * Validate dữ liệu admin
     * @param admin AdminBean cần validate
     * @return true nếu dữ liệu hợp lệ, false nếu không
     */
    private boolean validateAdminData(AdminBean admin) {
        if (admin == null) {
            return false;
        }
        
        String username = admin.getUsername();
        String password = admin.getPassword();
        
        // Kiểm tra username
        if (username == null || username.trim().isEmpty()) {
            System.out.println("Username không được để trống");
            return false;
        }
        
        if (username.length() < 3 || username.length() > 50) {
            System.out.println("Username phải có độ dài từ 3-50 ký tự");
            return false;
        }
        
        // Kiểm tra password
        if (password == null || password.trim().isEmpty()) {
            System.out.println("Password không được để trống");
            return false;
        }
        
        if (password.length() < 6 || password.length() > 100) {
            System.out.println("Password phải có độ dài từ 6-100 ký tự");
            return false;
        }
        
        return true;
    }
}