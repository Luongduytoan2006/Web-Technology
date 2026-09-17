package model.bo;
import model.dao.*;
import model.bean.*;
public class AdminBo {
	private AdminDao adminDao = new AdminDao();
	public boolean isValidUser(String username, String password) {
		return adminDao.isValidUser(username, password);
	}
	public void addUser(String username, String password) {
		adminDao.addUser(new Admin(username, password));
	}
}
