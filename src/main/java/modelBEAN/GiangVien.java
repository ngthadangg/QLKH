package modelBEAN;

public class GiangVien {
    private int IDGV;
    private  String email;
    private  String password;
    private  String name;

    public GiangVien(){

    }

    public GiangVien(int IDGV, String email, String password, String name){
        this.IDGV = IDGV;
        this.email = email;
        this.password = password;
        this.name = name;
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

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
