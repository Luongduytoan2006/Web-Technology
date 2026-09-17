package model.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.bean.NhanVienBean;
import util.DatabaseConnection;

public class NhanVienDAO {
    
    // Lấy tất cả nhân viên
    public List<NhanVienBean> getAllNhanVien() throws Exception {
        List<NhanVienBean> list = new ArrayList<>();
        String sql = "SELECT * FROM nhanvien ORDER BY idnv";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                NhanVienBean nv = new NhanVienBean();
                nv.setIdnv(rs.getString("idnv"));
                nv.setHoten(rs.getString("hoten"));
                nv.setIdpb(rs.getString("idpb"));
                nv.setDiachi(rs.getString("diachi"));
                list.add(nv);
            }
        }
        
        return list;
    }
    
    // Lấy nhân viên theo ID
    public NhanVienBean getNhanVienById(String idnv) throws Exception {
        NhanVienBean nv = null;
        String sql = "SELECT * FROM nhanvien WHERE idnv = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, idnv);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    nv = new NhanVienBean();
                    nv.setIdnv(rs.getString("idnv"));
                    nv.setHoten(rs.getString("hoten"));
                    nv.setIdpb(rs.getString("idpb"));
                    nv.setDiachi(rs.getString("diachi"));
                }
            }
        }
        
        return nv;
    }
    
    // Thêm nhân viên mới
    public boolean addNhanVien(NhanVienBean nv) throws Exception {
        String sql = "INSERT INTO nhanvien (idnv, hoten, idpb, diachi) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, nv.getIdnv());
            ps.setString(2, nv.getHoten());
            ps.setString(3, nv.getIdpb());
            ps.setString(4, nv.getDiachi());
            
            return ps.executeUpdate() > 0;
        }
    }
    
    // Cập nhật nhân viên
    public boolean updateNhanVien(NhanVienBean nv) throws Exception {
        String sql = "UPDATE nhanvien SET hoten = ?, idpb = ?, diachi = ? WHERE idnv = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, nv.getHoten());
            ps.setString(2, nv.getIdpb());
            ps.setString(3, nv.getDiachi());
            ps.setString(4, nv.getIdnv());
            
            return ps.executeUpdate() > 0;
        }
    }
    
    // Xóa nhân viên
    public boolean deleteNhanVien(String idnv) throws Exception {
        String sql = "DELETE FROM nhanvien WHERE idnv = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, idnv);
            
            return ps.executeUpdate() > 0;
        }
    }
    
    // Xóa nhiều nhân viên
    public int deleteMultipleNhanVien(String[] idnvList) throws Exception {
        if (idnvList == null || idnvList.length == 0) {
            return 0;
        }
        
        StringBuilder sql = new StringBuilder("DELETE FROM nhanvien WHERE idnv IN (");
        for (int i = 0; i < idnvList.length; i++) {
            sql.append("?");
            if (i < idnvList.length - 1) {
                sql.append(",");
            }
        }
        sql.append(")");
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            
            for (int i = 0; i < idnvList.length; i++) {
                ps.setString(i + 1, idnvList[i]);
            }
            
            return ps.executeUpdate();
        }
    }
    
    // Tìm kiếm nhân viên nâng cao
    public List<NhanVienBean> searchNhanVien(String keyword, String idpb) throws Exception {
        List<NhanVienBean> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM nhanvien WHERE 1=1");
        List<String> params = new ArrayList<>();
        
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql.append(" AND (idnv LIKE ? OR hoten LIKE ? OR diachi LIKE ?)");
            String searchKeyword = "%" + keyword.trim() + "%";
            params.add(searchKeyword);
            params.add(searchKeyword);
            params.add(searchKeyword);
        }
        
        if (idpb != null && !idpb.trim().isEmpty()) {
            sql.append(" AND idpb = ?");
            params.add(idpb.trim());
        }
        
        sql.append(" ORDER BY idnv");
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            
            for (int i = 0; i < params.size(); i++) {
                ps.setString(i + 1, params.get(i));
            }
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    NhanVienBean nv = new NhanVienBean();
                    nv.setIdnv(rs.getString("idnv"));
                    nv.setHoten(rs.getString("hoten"));
                    nv.setIdpb(rs.getString("idpb"));
                    nv.setDiachi(rs.getString("diachi"));
                    list.add(nv);
                }
            }
        }
        
        return list;
    }
    
    // Lấy nhân viên theo phòng ban
    public List<NhanVienBean> getNhanVienByPhongBan(String idpb) throws Exception {
        List<NhanVienBean> list = new ArrayList<>();
        String sql = "SELECT * FROM nhanvien WHERE idpb = ? ORDER BY idnv";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, idpb);
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    NhanVienBean nv = new NhanVienBean();
                    nv.setIdnv(rs.getString("idnv"));
                    nv.setHoten(rs.getString("hoten"));
                    nv.setIdpb(rs.getString("idpb"));
                    nv.setDiachi(rs.getString("diachi"));
                    list.add(nv);
                }
            }
        }
        
        return list;
    }
    
    // Kiểm tra ID nhân viên đã tồn tại
    public boolean isIdnvExists(String idnv) throws Exception {
        String sql = "SELECT COUNT(*) FROM nhanvien WHERE idnv = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, idnv);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        
        return false;
    }
}