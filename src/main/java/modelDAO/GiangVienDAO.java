package modelDAO;


import modelBEAN.Course;
import modelBEAN.GiangVien;
import util.DBUtil;
import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class GiangVienDAO {
    Connection connection = DBUtil.getConnection();

    public GiangVienDAO() throws SQLException {
    }
    public int getIDGVByEmail(String email) throws SQLException {

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM giangvien WHERE email = ?"))
        {
            statement.setString(1, email);

            try (ResultSet resultSet = statement.executeQuery()){
                if (resultSet.next()) {
                    return resultSet.getInt("giangvien_id");
                } else {
                    // Giảng viên không tồn tại
                    return -1;
                }
            }

        } catch (SQLException e) {
            System.err.println("Lỗi khi lấy IDGV: " + e.getMessage());
            throw e;
        }

    }
    public GiangVien getGiangVienByID(int IDGV) throws  SQLException{
        GiangVien giangVien = null;

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM giangvien WHERE giangvien_id = ?"))
        {
            statement.setInt(1, IDGV);

            try (ResultSet resultSet = statement.executeQuery()){
                if (resultSet.next()) {
                    giangVien = new GiangVien();
                    giangVien.setIDGV(resultSet.getInt("giangvien_id"));
                    giangVien.setName(resultSet.getString("ho_ten"));
                    giangVien.setEmail(resultSet.getString("email"));
                }
            }

        } catch (SQLException e) {
            System.err.println("Lỗi khi lấy IDGV: " + e.getMessage());
            throw e;
        }
        return giangVien;
    }
    public List<Course> getCoursesByTeacherId(int IDGV) throws SQLException {
        List<Course> courses = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM course WHERE giangvien_id = ?");
        ) {
            statement.setInt(1, IDGV);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Course course = new Course();
                    course.setCourse_id(resultSet.getInt("course_id"));
                    course.setCourse_name(resultSet.getString("course_name"));
                    // Các trường khác tương tự
                    System.out.println("course_id: "+ course.getCourse_id() + " course_name: " + course.getCourse_name());

                    courses.add(course);
                }
            }catch (SQLException e){
                System.out.println("IDGV: " + IDGV);
                System.err.println("Lỗi khi lấy course: " + e.getMessage());
            }

        }

        return courses;
    }
    public void closeConnection() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }
}
