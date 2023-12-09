package modelBO;

import modelBEAN.Course;
import modelDAO.CourseDAO;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class CourseBO {
    private Connection connection;
    private CourseDAO courseDAO;

    public CourseBO(Connection connection) throws SQLException {
        this.connection = connection;
        this.courseDAO = new CourseDAO();
    }

    public List<Course> getAllCourses() throws SQLException {
        return courseDAO.getAllCourses();
    }

    public void addCourse(Course course) throws SQLException {
        // Kiểm tra các điều kiện, xử lý logic kinh doanh, sau đó gọi DAO để thêm vào cơ sở dữ liệu
        // ...

        courseDAO.addCourse(course);
    }

    // Các phương thức khác tương tự

    // Đảm bảo đóng kết nối sau mỗi hoạt động với cơ sở dữ liệu
    public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
