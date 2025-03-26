package dal;

import models.Teacher;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import models.Student;
import java.util.ArrayList;
import java.util.List;

public class TeacherDAO extends DBContext {

    public TeacherDAO() {
        super();
    }

    public Teacher getTeacher(int accId) {
        Teacher teacher = null;
        try {
            String sql = "SELECT * FROM Teacher WHERE Account_ID = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, accId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String id = rs.getString("Teacher_ID");
                String name = rs.getString("Full_Name");
                int dob = rs.getInt("BirthYear");
                String gender = rs.getString("Gender");
                String phone = rs.getString("Phone");
                String email = rs.getString("Email");
                String address = rs.getString("Address");
                int claId = rs.getInt("Class_ID");
                int acId = rs.getInt("Account_ID");
                teacher = new Teacher(id, name, dob, gender, phone, email, address, claId, acId);
            }
        } catch (Exception e) {
        }
        return teacher;
    }

    public List<Student> getStudentsByClass(String classId) {
        List<Student> students = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Student WHERE Class_ID = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, classId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                students.add(new Student(
                        rs.getString("Student_ID"),
                        rs.getString("Full_Name"),
                        rs.getInt("BirthYear"),
                        rs.getString("Gender"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Address"),
                        rs.getInt("Class_ID"),
                        rs.getInt("Account_ID")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return students;
    }

    public boolean updateStudentScore(String studentId, double score) {
        try {
            String sql = "UPDATE Score SET Score_Value = ? WHERE Student_ID = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setDouble(1, score);
            stmt.setString(2, studentId);
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
