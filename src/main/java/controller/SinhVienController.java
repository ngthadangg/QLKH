package controller;

import modelBEAN.Course;
import modelBEAN.SinhVien;
import modelBEAN.Video;
import modelDAO.CourseDAO;
import modelDAO.GiangVienDAO;
import modelDAO.SinhVienDAO;
import modelDAO.VideoDAO;
import util.DBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
@WebServlet("/sinhvienController")
public class SinhVienController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private int courseID ;

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public int getCourseID() {
        return courseID;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin giảng viên từ session (đã đăng nhập)
        String courseId = request.getParameter("courseId");

        setCourseID(Integer.parseInt(courseId));
        System.out.println("CourseID dua vao DoGet:"+ courseId);

        SinhVienDAO sinhVienDAO = null;

        try {
            sinhVienDAO = new SinhVienDAO();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        List<SinhVien> sinhViens = null;
        try {
            sinhViens = SinhVienDAO.getAllSinhVienByCourseID(Integer.parseInt(courseId));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // Hiển thị danh sách các video
        request.setAttribute("sinhviens", sinhViens);
        request.getServletContext().getRequestDispatcher("/viewSV.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("studentEmail");
        int courseID = getCourseID();
        System.out.println(("Course_ID: "+ courseID+ " email : " + email));

        if (email != null && !email.isEmpty()) {
            SinhVienDAO sinhVienDAO = null;

            try {
                sinhVienDAO = new SinhVienDAO();
                int IDSV = sinhVienDAO.getIDSVByEmail(email);
                System.out.println("IDSV: "+ IDSV);

                // Kiểm tra IDSV trước khi thêm vào khoá học
                if (IDSV != 0) {
                    sinhVienDAO.addSinhVienToCourse(IDSV, courseID);

                    List<SinhVien> sinhViens = SinhVienDAO.getAllSinhVienByCourseID(courseID);

                    // Hiển thị danh sách sinh viên
                    request.setAttribute("sinhviens", sinhViens);
                    request.getServletContext().getRequestDispatcher("/viewSV.jsp").forward(request, response);
                } else {
                    // Xử lý trường hợp không tìm thấy sinh viên
                    System.err.println("Không tìm thấy sinh viên cho email: " + email);
                    request.setAttribute("errorMessage", "Không tìm thấy sinh viên cos email: " + email);
                    request.getServletContext().getRequestDispatcher("/viewSV.jsp").forward(request, response);
                }
            } catch (SQLException e) {
                // Xử lý lỗi một cách chặt chẽ hơn (ghi log hoặc hiển thị thông báo lỗi)
                e.printStackTrace();
                throw new RuntimeException("Lỗi khi thực hiện các thao tác cơ sở dữ liệu", e);
            }
        }
    }

}

