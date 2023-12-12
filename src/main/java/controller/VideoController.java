package controller;

import modelBEAN.SinhVien;
import modelBEAN.Video;
import modelBO.SinhVienBO;
import modelBO.Sinhvien_course_BO;
import modelDAO.SinhVienDAO;
import modelDAO.VideoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/videoController")
public class VideoController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int videoID = Integer.parseInt(request.getParameter("videoID"));
        // Lấy danh sách các video cho khóa học
        try {
            VideoDAO videoDAO = new VideoDAO();
            Video video = videoDAO.getVideoByVideoID(videoID);
            System.out.println("Khoá học: " + video.getCourse_id());
            List<SinhVien> sinhViens = SinhVienDAO.getAllSinhVienByCourseID(video.getCourse_id());

            for(SinhVien sinhVien : sinhViens) System.out.println(sinhVien.getName());

            request.setAttribute("sinhVienss", sinhViens);
            request.setAttribute("video", video);
            request.getServletContext().getRequestDispatcher("/viewVideo.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int videoID = Integer.parseInt(req.getParameter("videoID"));
        // Lấy danh sách các video cho khóa học
        VideoDAO videoDAO = null;
        try {
            videoDAO = new VideoDAO();
            Video video = videoDAO.getVideoByVideoID(videoID);
            List<SinhVien> sinhViens = null;
            sinhViens = SinhVienDAO.getAllSinhVienByCourseID(video.getCourse_id());
            for(SinhVien sinhVien : sinhViens) System.out.println(sinhVien.getName());

            req.setAttribute("sinhVienss", sinhViens);
            req.setAttribute("video", video);
            req.getServletContext().getRequestDispatcher("/viewVideo.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
