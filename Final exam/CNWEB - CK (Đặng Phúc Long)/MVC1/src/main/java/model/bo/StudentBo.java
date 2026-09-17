package model.bo;
import model.bean.*;
import model.dao.*;
import java.util.*;
public class StudentBo {
	private StudentDao studentDao = new StudentDao();
	public List<Student> getAllStudent() {
		return studentDao.getAllStudent();
	}
	public Student getStudentById(String mssv) {
		return studentDao.getStudentById(mssv);
	}
	public void addStudent(Student st) {
		studentDao.addStudent(st);
	}
	public void updateStudent(Student st) {
		studentDao.updateStudent(st);
	}
	public void deleteStudent(String mssv) {
		studentDao.deleteStudent(mssv);
	}
	public boolean checkmssv(String mssv) {
		return studentDao.checkmssv(mssv);
	}
	
	public List<Student> findStudentByKhoa(String khoa) {
		return studentDao.findStudentBymakhoa(khoa);
	}
	
}
