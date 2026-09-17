package model.bean;

public class PhongBanBean {
    private String idpb;
    private String tenpb;
    private String mota;
    
    public PhongBanBean() {
    }
    
    public PhongBanBean(String idpb, String tenpb, String mota) {
        this.idpb = idpb;
        this.tenpb = tenpb;
        this.mota = mota;
    }
    
    public String getIdpb() {
        return idpb;
    }
    
    public void setIdpb(String idpb) {
        this.idpb = idpb;
    }
    
    public String getTenpb() {
        return tenpb;
    }
    
    public void setTenpb(String tenpb) {
        this.tenpb = tenpb;
    }
    
    public String getMota() {
        return mota;
    }
    
    public void setMota(String mota) {
        this.mota = mota;
    }
    
    @Override
    public String toString() {
        return "PhongBanBean{" +
                "idpb='" + idpb + '\'' +
                ", tenpb='" + tenpb + '\'' +
                ", mota='" + mota + '\'' +
                '}';
    }
}
