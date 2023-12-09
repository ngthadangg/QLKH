package modelDAO;


import modelBEAN.Course;
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
        List<Course> courses = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM giangvien WHERE email = ?"))
        {
            statement.setString(1, email);

            try (ResultSet resultSet = statement.executeQuery()){
                return resultSet.getInt("IDGV");
            }

        }

    }
    public void closeConnection() {
        DBUtil.closeConnection(connection);
    }
}
