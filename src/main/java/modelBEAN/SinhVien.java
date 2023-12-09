package modelBEAN;

public class SinhVien {
    private  int IDSV;
    private String email;
    private  String password;

    public  SinhVien(int IDSV, String email, String password){
        this.IDSV = IDSV;
        this.email = email;
        this.password = password;
    }
    public int getIDSV() {
        return IDSV;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public void setIDSV(int IDSV) {
        this.IDSV = IDSV;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
