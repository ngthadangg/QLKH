package modelBO;

import modelBEAN.SinhVien;
import modelDAO.SinhVienDAO;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
    public List<SinhVien> getListSinhvienById(List<Integer> idlist ){
        System.out.println("đã tới");
        List<SinhVien> sinhViens = new ArrayList<>();
        for (int id : idlist){
            try {
                SinhVienDAO sinhVienDAO = new SinhVienDAO();
                SinhVien sinhVien = sinhVienDAO.getSVByIDSV(id);
                System.out.println(sinhVien.getName());
                sinhViens.add(sinhVien);

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return sinhViens;
    }

}