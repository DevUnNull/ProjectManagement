package dal;

import dto.GradeDTO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminGradeDAO extends DBContext {

    public AdminGradeDAO() {
        super();
    }

    public List<GradeDTO> getAllGrades() {
        List<GradeDTO> gradeList = new ArrayList<>();

        String sql = "SELECT "
                + "s.Student_ID, "
                + "s.Full_Name AS Student_Name, "
                + "c.Class_Name, "
                + "sub.Subject_ID, "
                + // Thêm Subject_ID
                "sub.Subject_Name, "
                + "sem.Semester_ID, "
                + // Thêm Semester_ID
                "sem.Semester_Name, "
                + "g.Mid_term, "
                + "g.Final_Exam, "
                + "g.Total_Grade "
                + "FROM Grade g "
                + "JOIN Student s ON g.Student_ID = s.Student_ID "
                + "JOIN Class c ON s.Class_ID = c.Class_ID "
                + "JOIN Subject sub ON g.Subject_ID = sub.Subject_ID "
                + "JOIN Semester sem ON g.Semester_ID = sem.Semester_ID "
                + "ORDER BY c.Class_Name, s.Student_ID, sem.Semester_ID;";

        try (PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                // Lấy dữ liệu từ ResultSet
                String studentId = rs.getString("Student_ID");
                String studentName = rs.getString("Student_Name");
                String className = rs.getString("Class_Name");
                String subjectId = rs.getString("Subject_ID"); // Lấy Subject_ID
                String subjectName = rs.getString("Subject_Name");
                String semesterId = rs.getString("Semester_ID"); // Lấy Semester_ID
                String semesterName = rs.getString("Semester_Name");
                float midTerm = rs.getFloat("Mid_term");
                float finalExam = rs.getFloat("Final_Exam");
                float totalGrade = rs.getFloat("Total_Grade");

                // Tạo đối tượng GradeDTO và thêm vào danh sách
                GradeDTO grade = new GradeDTO(studentId, studentName, className, subjectId, subjectName,
                        semesterId, semesterName, midTerm, finalExam, totalGrade);
                gradeList.add(grade);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // In lỗi ra console để dễ debug
        }

        return gradeList;
    }

    public GradeDTO getGradeByIds(String studentId, String subjectId, String semesterId) {
        String sql = "SELECT s.Student_ID, s.Full_Name AS Student_Name, c.Class_Name, "
                + "sub.Subject_ID, sub.Subject_Name, sem.Semester_ID, sem.Semester_Name, "
                + "g.Mid_term, g.Final_Exam, g.Total_Grade "
                + "FROM Grade g "
                + "JOIN Student s ON g.Student_ID = s.Student_ID "
                + "JOIN Class c ON s.Class_ID = c.Class_ID "
                + "JOIN Subject sub ON g.Subject_ID = sub.Subject_ID "
                + "JOIN Semester sem ON g.Semester_ID = sem.Semester_ID "
                + "WHERE g.Student_ID = ? AND g.Subject_ID = ? AND g.Semester_ID = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, studentId);
            stmt.setString(2, subjectId);
            stmt.setString(3, semesterId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new GradeDTO(
                            rs.getString("Student_ID"),
                            rs.getString("Student_Name"),
                            rs.getString("Class_Name"),
                            rs.getString("Subject_ID"),
                            rs.getString("Subject_Name"),
                            rs.getString("Semester_ID"),
                            rs.getString("Semester_Name"),
                            rs.getFloat("Mid_term"),
                            rs.getFloat("Final_Exam"),
                            rs.getFloat("Total_Grade")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
public boolean updateGrade(String studentId, String subjectId, String semesterId, float midTerm, float finalExam) {
    String sql = "UPDATE Grade SET Mid_term = ?, Final_Exam = ?, Total_Grade = ? "
               + "WHERE Student_ID = ? AND Subject_ID = ? AND Semester_ID = ?";
    
    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        // Làm tròn đến 2 chữ số thập phân
        midTerm = Math.round(midTerm * 100.0f) / 100.0f;
        finalExam = Math.round(finalExam * 100.0f) / 100.0f;
        float totalGrade = Math.round((midTerm * 0.4f + finalExam * 0.6f) * 100.0f) / 100.0f;
        
        stmt.setFloat(1, midTerm);
        stmt.setFloat(2, finalExam);
        stmt.setFloat(3, totalGrade);
        stmt.setString(4, studentId);
        stmt.setString(5, subjectId);
        stmt.setString(6, semesterId);
        
        int rowsAffected = stmt.executeUpdate();
        return rowsAffected > 0; // Nếu có ít nhất một dòng được cập nhật, trả về true
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}
public List<GradeDTO> searchGrades(String studentId, String semester) {
    List<GradeDTO> gradeList = new ArrayList<>();
    String sql = "SELECT s.Student_ID, s.Full_Name AS Student_Name, c.Class_Name, "
               + "sub.Subject_ID, sub.Subject_Name, sem.Semester_ID, sem.Semester_Name, "
               + "g.Mid_term, g.Final_Exam, g.Total_Grade "
               + "FROM Grade g "
               + "JOIN Student s ON g.Student_ID = s.Student_ID "
               + "JOIN Class c ON s.Class_ID = c.Class_ID "
               + "JOIN Subject sub ON g.Subject_ID = sub.Subject_ID "
               + "JOIN Semester sem ON g.Semester_ID = sem.Semester_ID "
               + "WHERE s.Student_ID LIKE ? AND sem.Semester_Name LIKE ? "
               + "ORDER BY c.Class_Name, s.Student_ID, sem.Semester_ID;";
    
    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        // Nếu giá trị tìm kiếm rỗng, sử dụng ký tự '%' để tìm tất cả
        String studentParam = (studentId == null || studentId.trim().isEmpty()) 
                                ? "%" 
                                : "%" + studentId.trim() + "%";
        String semesterParam = (semester == null || semester.trim().isEmpty()) 
                                ? "%" 
                                : "%" + semester.trim() + "%";
        stmt.setString(1, studentParam);
        stmt.setString(2, semesterParam);
        
        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                GradeDTO grade = new GradeDTO(
                    rs.getString("Student_ID"),
                    rs.getString("Student_Name"),
                    rs.getString("Class_Name"),
                    rs.getString("Subject_ID"),
                    rs.getString("Subject_Name"),
                    rs.getString("Semester_ID"),
                    rs.getString("Semester_Name"),
                    rs.getFloat("Mid_term"),
                    rs.getFloat("Final_Exam"),
                    rs.getFloat("Total_Grade")
                );
                gradeList.add(grade);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return gradeList;
}


}


