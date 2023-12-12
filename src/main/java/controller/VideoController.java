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
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/videoController")
public class VideoController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int videoID = Integer.parseInt(request.getParameter("videoID"));
        // Lấy danh sách các video cho khóa học
        VideoDAO videoDAO = null;
        try {
            videoDAO = new VideoDAO();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        Video video = videoDAO.getVideoByVideoID(videoID);

        Sinhvien_course_BO sinhvienCourseBo = new Sinhvien_course_BO();
        List<Integer> studentIDs = sinhvienCourseBo.getListSVbyCourseID(video.getCourse_id());
        List<SinhVien> sinhViens = new ArrayList<>();
        for(int id : studentIDs){
            SinhVienBO sinhVienBO = new SinhVienBO();
            SinhVien sinhVien = sinhVienBO.getSinhVienById(id);
            sinhViens.add(sinhVien);
        }
        for(SinhVien sinhVien : sinhViens) System.out.println(sinhVien.getName());
        request.setAttribute("sinhViens", sinhViens);
        request.setAttribute("video", video);
        request.getServletContext().getRequestDispatcher("/viewVideo.jsp").forward(request, response);

    }
}
