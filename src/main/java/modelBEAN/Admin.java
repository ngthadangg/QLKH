package modelBEAN;

public class Admin {
    private int IDAd;
    private  String email;
    private  String password;

    public  Admin(){    

    }
    public  Admin(int IDAd, String email, String password){
        this.IDAd = IDAd;
        this.email = email;
        this.password = password;
    }
    public int getIDAd() {
        return IDAd;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setIDAd(int IDAd) {
        this.IDAd = IDAd;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}

