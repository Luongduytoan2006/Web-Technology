package model.bo;

import java.util.ArrayList;
import java.util.List;
import model.bean.NhanVienBean;
import model.dao.NhanVienDAO;

public class NhanVienBO {
    private NhanVienDAO nhanVienDAO = new NhanVienDAO();
    
    // Lấy tất cả nhân viên
    public ArrayList<NhanVienBean> getAllNhanVien() throws Exception {
        List<NhanVienBean> list = nhanVienDAO.getAllNhanVien();
        return new ArrayList<>(list);
    }
    
    // Lấy nhân viên theo ID
    public NhanVienBean getNhanVienById(String idnv) throws Exception {
        if (idnv == null || idnv.trim().isEmpty()) {
            throw new Exception("Mã nhân viên không được để trống!");
        }
        
        return nhanVienDAO.getNhanVienById(idnv.trim());
    }
    
    // Thêm nhân viên mới
    public boolean addNhanVien(NhanVienBean nv) throws Exception {
        // Validate input
        validateNhanVien(nv);
        
        // Kiểm tra ID đã tồn tại
        if (nhanVienDAO.isIdnvExists(nv.getIdnv())) {
            throw new Exception("Mã nhân viên '" + nv.getIdnv() + "' đã tồn tại!");
        }
        
        return nhanVienDAO.addNhanVien(nv);
    }
    
    // Cập nhật nhân viên
    public boolean updateNhanVien(NhanVienBean nv) throws Exception {
        // Validate input
        validateNhanVien(nv);
        
        // Kiểm tra nhân viên có tồn tại không
        NhanVienBean existing = nhanVienDAO.getNhanVienById(nv.getIdnv());
        if (existing == null) {
            throw new Exception("Không tìm thấy nhân viên với mã '" + nv.getIdnv() + "'!");
        }
        
        return nhanVienDAO.updateNhanVien(nv);
    }
    
    // Xóa nhân viên
    public boolean deleteNhanVien(String idnv) throws Exception {
        if (idnv == null || idnv.trim().isEmpty()) {
            throw new Exception("Mã nhân viên không được để trống!");
        }
        
        // Kiểm tra nhân viên có tồn tại không
        NhanVienBean existing = nhanVienDAO.getNhanVienById(idnv.trim());
        if (existing == null) {
            throw new Exception("Không tìm thấy nhân viên với mã '" + idnv + "'!");
        }
        
        return nhanVienDAO.deleteNhanVien(idnv.trim());
    }
    
    // Xóa nhiều nhân viên
    public int deleteMultipleNhanVien(String[] idnvList) throws Exception {
        if (idnvList == null || idnvList.length == 0) {
            throw new Exception("Vui lòng chọn ít nhất một nhân viên để xóa!");
        }
        
        return nhanVienDAO.deleteMultipleNhanVien(idnvList);
    }
    
    // Tìm kiếm nhân viên nâng cao
    public ArrayList<NhanVienBean> searchAdvanced(String keyword, String idpb) throws Exception {
        List<NhanVienBean> list = nhanVienDAO.searchNhanVien(keyword, idpb);
        return new ArrayList<>(list);
    }
    
    // Lấy nhân viên theo phòng ban
    public ArrayList<NhanVienBean> getNhanVienByPhongBan(String idpb) throws Exception {
        if (idpb == null || idpb.trim().isEmpty()) {
            throw new Exception("Mã phòng ban không được để trống!");
        }
        
        List<NhanVienBean> list = nhanVienDAO.getNhanVienByPhongBan(idpb.trim());
        return new ArrayList<>(list);
    }
    
    // Validate dữ liệu nhân viên
    private void validateNhanVien(NhanVienBean nv) throws Exception {
        if (nv == null) {
            throw new Exception("Thông tin nhân viên không được để trống!");
        }
        
        if (nv.getIdnv() == null || nv.getIdnv().trim().isEmpty()) {
            throw new Exception("Mã nhân viên không được để trống!");
        }
        
        if (nv.getHoten() == null || nv.getHoten().trim().isEmpty()) {
            throw new Exception("Họ tên nhân viên không được để trống!");
        }
        
        if (nv.getIdpb() == null || nv.getIdpb().trim().isEmpty()) {
            throw new Exception("Phòng ban không được để trống!");
        }
        
        if (nv.getDiachi() == null || nv.getDiachi().trim().isEmpty()) {
            throw new Exception("Địa chỉ không được để trống!");
        }
        
        // Trim các giá trị
        nv.setIdnv(nv.getIdnv().trim());
        nv.setHoten(nv.getHoten().trim());
        nv.setIdpb(nv.getIdpb().trim());
        nv.setDiachi(nv.getDiachi().trim());
        
        // Validate format
        if (nv.getIdnv().length() > 15) {
            throw new Exception("Mã nhân viên không được quá 15 ký tự!");
        }
        
        if (nv.getHoten().length() > 100) {
            throw new Exception("Họ tên không được quá 100 ký tự!");
        }
        
        if (nv.getDiachi().length() > 200) {
            throw new Exception("Địa chỉ không được quá 200 ký tự!");
        }
    }
}