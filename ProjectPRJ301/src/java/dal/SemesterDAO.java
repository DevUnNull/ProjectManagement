package dal;

import dto.SemesterDTO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SemesterDAO extends DBContext {

    public SemesterDAO() {
        super();
    }

    public List<SemesterDTO> getAllSemesters() {
        List<SemesterDTO> list = new ArrayList<>();
        String sql = "SELECT Semester_ID, Semester_Name FROM Semester ORDER BY Semester_ID";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                int semesterId = rs.getInt("Semester_ID");
                String semesterName = rs.getString("Semester_Name");
                list.add(new SemesterDTO(semesterId, semesterName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
