package modelDAO;

import modelBEAN.Course;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {
    private Connection connection;

    public CourseDAO(Connection connection) {
        this.connection = connection;
    }

    public List<Course> getAllCourses() throws SQLException {
        // Lấy danh sách các khóa học từ cơ sở dữ liệu
        List<Course> courses = new ArrayList<>();

        // Thực hiện truy vấn SQL và xử lý kết quả ResultSet
        // ...

        return courses;
    }

    public void addCourse(Course course) throws SQLException {
        // Thêm một khóa học vào cơ sở dữ liệu
        // ...

    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    // Các phương thức khác tương tự
}
