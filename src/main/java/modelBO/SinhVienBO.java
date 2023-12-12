package modelBO;

import modelBEAN.SinhVien;
import modelDAO.SinhVienDAO;
import java.sql.SQLException;

public class SinhVienBO {
    public SinhVien getSinhVienById(int IDSV){
        try {
            SinhVienDAO sinhVienDAO = new SinhVienDAO();
            SinhVien sinhVien = sinhVienDAO.getSVByIDSV(IDSV);
            return  sinhVien;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}