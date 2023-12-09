package controller;

import modelBEAN.Course;
import modelDAO.CourseDAO;
import util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/courseController")
public class CourseController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = null;
        try {
            connection = DBUtil.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        CourseDAO courseService = new CourseDAO(connection);

        try {
            List<Course> courses = courseService.getAllCourses();
            // Thực hiện các thao tác khác với dữ liệu và chuyển hướng đến trang JSP tương ứng
            // ...
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(connection);
        }
    }

}
