package controller;

import modelBEAN.Video;
import modelDAO.VideoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet("/videoController")
public class VideoController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("đã tới đây");
        int videoID = Integer.parseInt(request.getParameter("videoID"));
        // Lấy danh sách các video cho khóa học
        VideoDAO videoDAO = null;
        try {
            videoDAO = new VideoDAO();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        Video video = videoDAO.getVideoByVideoID(videoID);

        // Hiển thị danh sách các video
        request.setAttribute("video", video);


        request.setAttribute("video", video);
        request.getServletContext().getRequestDispatcher("/viewVideo.jsp").forward(request, response);

    }
}
