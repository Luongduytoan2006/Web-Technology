package model.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import model.bean.*;

public class StudentDao {
	Connection conn = null;
	public List<Student> getAllStudent() {
		if (conn == null) {
            try {
                conn = ConnectDatabase.getMySQLConnection();
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

        String sql = "SELECT * FROM sinhvien";
        List<Student> users = new ArrayList<Student>();
		try {
			PreparedStatement preSt = conn.prepareStatement(sql);
			ResultSet rs = preSt.executeQuery();
			while (rs.next()) {
				
				String mssv = rs.getString("mssv");
				String hovaten = rs.getString("hovaten");
				String makhoa = rs.getString("makhoa");
				boolean gioitinh = rs.getBoolean("gioitinh");
				users.add(new Student(mssv,hovaten,gioitinh,makhoa));	
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return users;
	}
	public Student getStudentById(String mssv) {
		if (conn == null) {
            try {
                conn = ConnectDatabase.getMySQLConnection();
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

        String sql = "SELECT * FROM sinhvien";
        List<Student> users = new ArrayList<Student>();
		try {
			PreparedStatement preSt = conn.prepareStatement(sql);
			ResultSet rs = preSt.executeQuery();
			while (rs.next()) {
				if (rs.getString("mssv").equals(mssv))
				{	
					//System.out.println(mssv + ", " + rs.getString("mssv"));
					String hovaten = rs.getString("hovaten");
					String makhoa = rs.getString("makhoa");
					boolean gioitinh = rs.getBoolean("gioitinh");
					return new Student(mssv,hovaten,gioitinh,makhoa);	
				}
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return null;
	}
	public List<Student> findStudentBymakhoa(String makhoa) {
		
        List<Student> userAlls = getAllStudent();
        List<Student> users = new ArrayList<Student>();
		for(Student user: userAlls) {
			if (user.getMakhoa().equals(makhoa)) {
				users.add(user);
			}
			
		}
		return users;
	}
	
	
	public void addStudent(Student user) {
		if (conn == null) {
            try {
                conn = ConnectDatabase.getMySQLConnection();
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }
        }
        String sql = "INSERT INTO sinhvien (mssv, hovaten, gioitinh, makhoa) VALUES (?, ?, ?, ?)";
        
        try {
            PreparedStatement preSt = conn.prepareStatement(sql);
            preSt.setString(1, user.getMssv());
            preSt.setString(2, user.getHovaten());
            preSt.setBoolean(3, user.isGioitinh());
            preSt.setString(4, user.getMakhoa());
            
            preSt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } 
	}
	
	public void updateStudent(Student user) {
		if (conn == null) {
            try {
                conn = ConnectDatabase.getMySQLConnection();
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }
        }
        String sql = "UPDATE sinhvien SET hovaten = ?, gioitinh = ?, makhoa = ? WHERE mssv = ?";
        
        try {
            PreparedStatement preSt = conn.prepareStatement(sql);
            preSt.setString(1, user.getHovaten());
            preSt.setBoolean(2, user.isGioitinh());
            preSt.setString(3, user.getMakhoa());
            preSt.setString(4, user.getMssv());
            preSt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } 
	}
	
	public void deleteStudent(String mssv) {
		if (conn == null) {
            try {
                conn = ConnectDatabase.getMySQLConnection();
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }
        }
        String sql = "DELETE FROM sinhvien WHERE mssv = ?";
        
        try {
            PreparedStatement preSt = conn.prepareStatement(sql);
            preSt.setString(1, mssv);
            preSt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } 
	}
	
	public boolean checkmssv(String mssv) {
		if (conn == null) {
            try {
                conn = ConnectDatabase.getMySQLConnection();
            } catch (Exception e) {
                e.printStackTrace();
                return true;
            }
        }

        String sql = "SELECT * FROM sinhvien WHERE mssv = ?";
        
		try {
			PreparedStatement preSt = conn.prepareStatement(sql);
			preSt.setString(1,mssv);
			ResultSet rs = preSt.executeQuery();
			rs.last();
			int size = rs.getRow();
			if (size > 0) {
				return true;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return false;
	}
	
	


}
