package model.dao;
import java.sql.*;

import model.bean.*;
public class AdminDao {
	Connection conn = null;
	public boolean isValidUser(String username, String password) {
		if (conn == null) {
            try {
                conn = ConnectDatabase.getMySQLConnection();
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }

        String sql = "SELECT * FROM admin";
        
		try {
			PreparedStatement preSt = conn.prepareStatement(sql);
			
			ResultSet rs = preSt.executeQuery();
			while (rs.next()) {
			
				if (username.equals(rs.getString("username")) && password.equals(rs.getString("password"))) {
					return true;
				};
				
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return false;
	}
	
	public void addUser(Admin ad) {
		if (conn == null) {
            try {
                conn = ConnectDatabase.getMySQLConnection();
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }
        }
        String sql = "INSERT INTO admin (username, password) VALUES (?, ?)";
        
        try {
            PreparedStatement preSt = conn.prepareStatement(sql);
            preSt.setString(1, ad.getUsername());
            preSt.setString(2, ad.getPassword());
    
            preSt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } 
	}

}
