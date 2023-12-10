package modelDAO;

import modelBEAN.Course;
import modelBEAN.GiangVien;
import modelBEAN.SinhVien;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SinhVienDAO {
    static Connection connection;

    static {
        try {
            connection = DBUtil.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public SinhVienDAO() throws SQLException{

    }

    public static SinhVien getSVByIDSV(int IDSV) throws  SQLException{
        SinhVien sinhvien = null;

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM sinhvien WHERE sinhvien_id = ?"))
        {
            statement.setInt(1, IDSV);

            try (ResultSet resultSet = statement.executeQuery()){
                if (resultSet.next()) {
                    sinhvien = new SinhVien();
                    sinhvien.setIDSV(resultSet.getInt("sinhvien_id"));
                    sinhvien.setName(resultSet.getString("ho_ten"));
                    sinhvien.setEmail(resultSet.getString("email"));
                }
            }

        } catch (SQLException e) {
            System.err.println("Lỗi khi lấy IDGV: " + e.getMessage());
            throw e;
        }
        return sinhvien;

    }
    public static List<SinhVien> getAllSinhVienByCourseID(int courseID) throws SQLException{
        List<SinhVien> sinhViens = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM sinhvien_course WHERE course_id = ?")
        ) {
            statement.setInt(1, courseID);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    SinhVien sinhVien = new SinhVien();
                    sinhVien.setIDSV(resultSet.getInt("sinhvien_id"));

                    sinhVien = getSVByIDSV(sinhVien.getIDSV());

                    sinhViens.add(sinhVien);
                }
            }
        }
        return sinhViens;
    }

}
