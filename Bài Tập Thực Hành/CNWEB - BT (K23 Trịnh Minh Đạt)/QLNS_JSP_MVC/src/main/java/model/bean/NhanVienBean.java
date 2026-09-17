package model.bean;

public class NhanVienBean {
    private String idnv;
    private String hoten;
    private String idpb;
    private String diachi;
    
    public NhanVienBean() {
    }
    
    public NhanVienBean(String idnv, String hoten, String idpb, String diachi) {
        this.idnv = idnv;
        this.hoten = hoten;
        this.idpb = idpb;
        this.diachi = diachi;
    }
    
    public String getIdnv() {
        return idnv;
    }
    
    public void setIdnv(String idnv) {
        this.idnv = idnv;
    }
    
    public String getHoten() {
        return hoten;
    }
    
    public void setHoten(String hoten) {
        this.hoten = hoten;
    }
    
    public String getIdpb() {
        return idpb;
    }
    
    public void setIdpb(String idpb) {
        this.idpb = idpb;
    }
    
    public String getDiachi() {
        return diachi;
    }
    
    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }
    
    @Override
    public String toString() {
        return "NhanVienBean{" +
                "idnv='" + idnv + '\'' +
                ", hoten='" + hoten + '\'' +
                ", idpb='" + idpb + '\'' +
                ", diachi='" + diachi + '\'' +
                '}';
    }
}
