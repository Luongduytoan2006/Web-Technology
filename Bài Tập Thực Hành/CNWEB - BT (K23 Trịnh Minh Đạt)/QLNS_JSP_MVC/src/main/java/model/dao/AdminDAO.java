package model.dao;

import java.sql.*;
import model.bean.AdminBean;
import util.DatabaseConnection;

public class AdminDAO {
    
    /**
     * Tìm admin theo username
     * @param username Tên đăng nhập
     * @return AdminBean hoặc null nếu không tìm thấy
     * @throws SQLException
     */
    public AdminBean findByUsername(String username) throws SQLException {
        AdminBean admin = null;
        String sql = "SELECT * FROM admin WHERE username = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, username);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    admin = new AdminBean();
                    admin.setUsername(rs.getString("username"));
                    admin.setPassword(rs.getString("password"));
                }
            }
        } catch (Exception e) {
            throw new SQLException("Lỗi khi tìm admin: " + e.getMessage(), e);
        }
        
        return admin;
    }
    
    /**
     * Thêm admin mới
     * @param admin AdminBean cần thêm
     * @return true nếu thêm thành công
     * @throws SQLException
     */
    public boolean insert(AdminBean admin) throws SQLException {
        String sql = "INSERT INTO admin (username, password) VALUES (?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, admin.getUsername());
            ps.setString(2, admin.getPassword());
            
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            throw new SQLException("Lỗi khi thêm admin: " + e.getMessage(), e);
        }
    }
    
    /**
     * Cập nhật thông tin admin
     * @param admin AdminBean cần cập nhật
     * @return true nếu cập nhật thành công
     * @throws SQLException
     */
    public boolean update(AdminBean admin) throws SQLException {
        String sql = "UPDATE admin SET password = ? WHERE username = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, admin.getPassword());
            ps.setString(2, admin.getUsername());
            
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            throw new SQLException("Lỗi khi cập nhật admin: " + e.getMessage(), e);
        }
    }
    
    /**
     * Xóa admin theo username
     * @param username Tên đăng nhập cần xóa
     * @return true nếu xóa thành công
     * @throws SQLException
     */
    public boolean delete(String username) throws SQLException {
        String sql = "DELETE FROM admin WHERE username = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, username);
            
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            throw new SQLException("Lỗi khi xóa admin: " + e.getMessage(), e);
        }
    }
    
    /**
     * Kiểm tra username đã tồn tại chưa
     * @param username Tên đăng nhập cần kiểm tra
     * @return true nếu đã tồn tại
     * @throws SQLException
     */
    public boolean isUsernameExists(String username) throws SQLException {
        String sql = "SELECT COUNT(*) FROM admin WHERE username = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, username);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (Exception e) {
            throw new SQLException("Lỗi khi kiểm tra username: " + e.getMessage(), e);
        }
        
        return false;
    }
}