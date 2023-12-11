package controller;

import modelBEAN.Course;
import modelBEAN.Video;
import modelDAO.CourseDAO;
import modelDAO.GiangVienDAO;
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

@WebServlet("/courseController")
public class CourseController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private int courseID ;

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin giảng viên từ session (đã đăng nhập)
        String courseId = request.getParameter("courseId");

        // Lấy danh sách các video cho khóa học
        VideoDAO videoDAO = null;
        try {
            videoDAO = new VideoDAO();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        List<Video> videos = null;
        try {
            videos = videoDAO.getAllVideoByCourseID(Integer.parseInt(courseId));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // Hiển thị danh sách các video
        request.setAttribute("videos", videos);

        int courseIdInt = Integer.parseInt(courseId);
        System.out.println("courseInt: "+ courseIdInt);

        request.setAttribute("courseId", courseIdInt);
        setCourseID(courseIdInt);


        request.getServletContext().getRequestDispatcher("/viewcourse.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String videoTitle = request.getParameter("videoTitle");
        String videoPath = request.getParameter("videoPath");
        String courseIDString = request.getParameter("courseId");
        int courseId = getCourseID();

        System.out.println("Course ID do post: "+ courseId);


        if (videoTitle != null && videoPath != null && !videoTitle.isEmpty() && !videoPath.isEmpty()) {


            // Use the retrieved course ID

            Video video = new Video();

            video.setVideo_title(videoTitle);
            video.setCourse_id(courseId);
            video.setFile_path(videoPath);

            VideoDAO videoDAO = null;
            try {
                videoDAO = new VideoDAO();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                videoDAO.addVideoToCourse(video);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            List<Video> videos = null;
            try {
                videos = videoDAO.getAllVideoByCourseID(courseId);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            request.setAttribute("videos", videos);
        } else {
            // Xử lý lỗi nếu dữ liệu không hợp lệ
            request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin video.");
        }

        // Chuyển hướng về trang hiển thị danh sách video
        RequestDispatcher dispatcher = request.getRequestDispatcher("/viewcourse.jsp");
        dispatcher.forward(request, response);

    }
}
