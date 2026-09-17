package model.bo;

import java.util.List;

import model.bean.Khoa;
import model.dao.KhoaDao;

public class KhoaBo {
	private KhoaDao khoaDao = new KhoaDao();
	public List<Khoa> getAllKhoa() {
		return khoaDao.getAllKhoa();
	}
	public Khoa getKhoaById(String mssv) {
		return khoaDao.getKhoaById(mssv);
	}
}
