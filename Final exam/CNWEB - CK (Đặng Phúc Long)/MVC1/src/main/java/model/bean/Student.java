package model.bean;

public class Student {
	public Student(String mssv, String hovaten, boolean gioitinh, String khoa) {
		super();
		this.mssv = mssv;
		this.hovaten = hovaten;
		this.gioitinh = gioitinh;
		this.makhoa = khoa;
	}
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	private String mssv;
	private String hovaten;
	private boolean gioitinh;
	private String makhoa;
	public String getMssv() {
		return mssv;
	}
	public void setMssv(String mssv) {
		this.mssv = mssv;
	}
	public String getHovaten() {
		return hovaten;
	}
	public void setHovaten(String hovaten) {
		this.hovaten = hovaten;
	}
	public boolean isGioitinh() {
		return gioitinh;
	}
	public void setGioitinh(boolean gioitinh) {
		this.gioitinh = gioitinh;
	}
	public String getMakhoa() {
		return makhoa;
	}
	public void setMakhoa(String makhoa) {
		this.makhoa = makhoa;
	}
	

}
