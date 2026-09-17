package model.bo;

import java.util.ArrayList;
import java.util.List;
import model.bean.PhongBanBean;
import model.dao.PhongBanDAO;

public class PhongBanBO {
    private PhongBanDAO phongBanDAO = new PhongBanDAO();
    
    public ArrayList<PhongBanBean> getAllPhongBan() throws Exception {
        List<PhongBanBean> list = phongBanDAO.getAllPhongBan();
        return new ArrayList<>(list);
    }
    
    public PhongBanBean getPhongBanById(String idpb) throws Exception {
        return phongBanDAO.getPhongBanById(idpb);
    }
    

    public boolean addPhongBan(PhongBanBean pb) throws Exception {
        // Kiểm tra trùng tên phòng ban
        if (phongBanDAO.isTenPhongBanExists(pb.getTenpb(), null)) {
            throw new Exception("Tên phòng ban đã tồn tại!");
        }
        return phongBanDAO.addPhongBan(pb);
    }

    public boolean updatePhongBan(PhongBanBean pb) throws Exception {
        // Kiểm tra trùng tên phòng ban (trừ chính nó)
        if (phongBanDAO.isTenPhongBanExists(pb.getTenpb(), pb.getIdpb())) {
            throw new Exception("Tên phòng ban đã tồn tại!");
        }
        return phongBanDAO.updatePhongBan(pb);
    }
    
    public boolean deletePhongBan(String idpb) throws Exception {
        return phongBanDAO.deletePhongBan(idpb);
    }
}
