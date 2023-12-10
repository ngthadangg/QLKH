package modelBEAN;

public class SinhVien {
    private  int IDSV;
    private  String name;

    private String email;
    private  String password;

    public  SinhVien (){

    }

    public  SinhVien(int IDSV,String name,  String email, String password){
        this.IDSV = IDSV;
        this.name = name;
        this.email = email;
        this.password = password;
    }
    public int getIDSV() {
        return IDSV;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
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
