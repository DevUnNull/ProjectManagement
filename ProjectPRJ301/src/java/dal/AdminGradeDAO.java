package dal;

import dto.GradeDTO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminGradeDAO extends DBContext {

    public AdminGradeDAO(){
        super();
    }

    public List<GradeDTO> getAllGrades() {
        List<GradeDTO> gradeList = new ArrayList<>();

        String sql = "SELECT " +
                "s.Student_ID, " +
                "s.Full_Name AS Student_Name, " +
                "c.Class_Name, " +
                "sub.Subject_Name, " +
                "sem.Semester_Name, " +
                "g.Mid_term, " +
                "g.Final_Exam, " +
                "g.Total_Grade " +
                "FROM Grade g " +
                "JOIN Student s ON g.Student_ID = s.Student_ID " +
                "JOIN Class c ON s.Class_ID = c.Class_ID " +
                "JOIN Subject sub ON g.Subject_ID = sub.Subject_ID " +
                "JOIN Semester sem ON g.Semester_ID = sem.Semester_ID " +
                "ORDER BY c.Class_Name, s.Student_ID, sem.Semester_ID;";

        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                // Lấy dữ liệu từ ResultSet
                String studentId = rs.getString("Student_ID");
                String studentName = rs.getString("Student_Name");
                String className = rs.getString("Class_Name");
                String subjectName = rs.getString("Subject_Name");
                String semesterName = rs.getString("Semester_Name");
                float midTerm = rs.getFloat("Mid_term");
                float finalExam = rs.getFloat("Final_Exam");
                float totalGrade = rs.getFloat("Total_Grade");

                // Tạo đối tượng GradeDTO và thêm vào danh sách
                GradeDTO grade = new GradeDTO(studentId, studentName, className, subjectName,
                                              semesterName, midTerm, finalExam, totalGrade);
                gradeList.add(grade);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // In lỗi ra console để dễ debug
        }

        return gradeList;
    }
    
}
