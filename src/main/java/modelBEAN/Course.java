package modelBEAN;

public class Course {
    private int course_id;
    private  String course_name;
    private int IDGV;

    public  Course(){

    }
    public Course(int course_id, String course_name, int IDGV){
        this.course_id = course_id;
        this.course_name = course_name;
        this.IDGV = IDGV;
    }
    public int getCourse_id() {
        return course_id;
    }

    public int getIDGV() {
        return IDGV;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public void setIDGV(int IDGV) {
        this.IDGV = IDGV;
    }
}
