package modelBEAN;

public class GiangVien {
    private int IDGV;
    private  String email;
    private  String password;

    public GiangVien(int IDGV, String email, String password){
        this.IDGV = IDGV;
        this.email = email;
        this.password = password;
    }

    public void setIDGV(int IDGV) {
        this.IDGV = IDGV;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIDGV() {
        return IDGV;
    }


}
