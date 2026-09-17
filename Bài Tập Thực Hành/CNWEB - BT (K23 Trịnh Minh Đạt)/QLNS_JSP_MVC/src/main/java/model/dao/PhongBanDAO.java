package model.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.bean.PhongBanBean;
import util.DatabaseConnection;

public class PhongBanDAO {
    
    // Lấy tất cả phòng ban
    public List<PhongBanBean> getAllPhongBan() throws Exception {
        List<PhongBanBean> list = new ArrayList<>();
        String sql = "SELECT * FROM phongban ORDER BY idpb";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                PhongBanBean pb = new PhongBanBean();
                pb.setIdpb(rs.getString("idpb"));
                pb.setTenpb(rs.getString("tenpb"));
                pb.setMota(rs.getString("mota"));
                list.add(pb);
            }
        }
        
        return list;
    }
    
    // Lấy phòng ban theo ID
    public PhongBanBean getPhongBanById(String idpb) throws Exception {
        PhongBanBean pb = null;
        String sql = "SELECT * FROM phongban WHERE idpb = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, idpb);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    pb = new PhongBanBean();
                    pb.setIdpb(rs.getString("idpb"));
                    pb.setTenpb(rs.getString("tenpb"));
                    pb.setMota(rs.getString("mota"));
                }
            }
        }
        
        return pb;
    }
    
    // Thêm phòng ban mới
    public boolean addPhongBan(PhongBanBean pb) throws Exception {
        String sql = "INSERT INTO phongban (idpb, tenpb, mota) VALUES (?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, pb.getIdpb());
            ps.setString(2, pb.getTenpb());
            ps.setString(3, pb.getMota());
            
            return ps.executeUpdate() > 0;
        }
    }
    
    // Cập nhật phòng ban
    public boolean updatePhongBan(PhongBanBean pb) throws Exception {
        String sql = "UPDATE phongban SET tenpb = ?, mota = ? WHERE idpb = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, pb.getTenpb());
            ps.setString(2, pb.getMota());
            ps.setString(3, pb.getIdpb());
            
            return ps.executeUpdate() > 0;
        }
    }
    
    // Xóa phòng ban (chỉ khi không có nhân viên)
    public boolean deletePhongBan(String idpb) throws Exception {
        // Kiểm tra xem phòng ban có nhân viên không
        if (hasEmployees(idpb)) {
            throw new Exception("Không thể xóa phòng ban vì vẫn còn nhân viên trong phòng ban này!");
        }
        
        String sql = "DELETE FROM phongban WHERE idpb = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, idpb);
            
            return ps.executeUpdate() > 0;
        }
    }
    
    // Kiểm tra phòng ban có nhân viên hay không
    public boolean hasEmployees(String idpb) throws Exception {
        String sql = "SELECT COUNT(*) FROM nhanvien WHERE idpb = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, idpb);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        
        return false;
    }
    
    // Kiểm tra ID phòng ban đã tồn tại
    public boolean isIdpbExists(String idpb) throws Exception {
        String sql = "SELECT COUNT(*) FROM phongban WHERE idpb = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, idpb);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        
        return false;
    }
    
    // Đếm số nhân viên trong phòng ban
    public int countEmployeesInPhongBan(String idpb) throws Exception {
        String sql = "SELECT COUNT(*) FROM nhanvien WHERE idpb = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, idpb);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        
        return 0;
    }

    // Kiểm tra tên phòng ban đã tồn tại (trừ idpb hiện tại nếu update)
    public boolean isTenPhongBanExists(String tenpb, String excludeIdpb) throws Exception {
        String sql = "SELECT COUNT(*) FROM phongban WHERE tenpb = ?" + (excludeIdpb != null ? " AND idpb <> ?" : "");
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, tenpb);
            if (excludeIdpb != null) {
                ps.setString(2, excludeIdpb);
            }
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }
}
