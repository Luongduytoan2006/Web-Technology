package model.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import model.bean.Khoa;
import model.bean.Khoa;

import java.sql.*;


public class KhoaDao {
	private Connection conn = null;
	public List<Khoa> getAllKhoa() {
		if (conn == null) {
            try {
                conn = ConnectDatabase.getMySQLConnection();
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

        String sql = "SELECT * FROM khoa";
        List<Khoa> users = new ArrayList<Khoa>();
		try {
			PreparedStatement preSt = conn.prepareStatement(sql);
			ResultSet rs = preSt.executeQuery();
			while (rs.next()) {
				
				String makhoa = rs.getString("makhoa");
				String tenkhoa = rs.getString("tenkhoa");
				
				users.add(new Khoa(makhoa,tenkhoa));	
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return users;
	}
	public Khoa getKhoaById(String mssv) {
		if (conn == null) {
            try {
                conn = ConnectDatabase.getMySQLConnection();
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

        String sql = "SELECT * FROM khoa";
        List<Khoa> users = new ArrayList<Khoa>();
		try {
			PreparedStatement preSt = conn.prepareStatement(sql);
			ResultSet rs = preSt.executeQuery();
			while (rs.next()) {
				if (rs.getString("makhoa").equals(mssv))
				{	
					
					String tenkhoa = rs.getString("tenkhoa");
					String makhoa = rs.getString("makhoa");
					
					return new Khoa(makhoa,tenkhoa);	
				}
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return null;
	}

}
