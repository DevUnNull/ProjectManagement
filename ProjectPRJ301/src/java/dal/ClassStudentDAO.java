package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Student;

public class ClassStudentDAO extends DBContext {

    public ClassStudentDAO() {
        super();
    }

    public Student getStudent(int accId) {
        Student student = null;
        try {
            String sql = "SELECT * FROM Student WHERE Account_ID = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, accId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String id = rs.getString("Student_ID");
                String name = rs.getString("Full_Name");
                int dob = rs.getInt("BirthYear");
                String gender = rs.getString("Gender");
                String phone = rs.getString("Phone");
                String email = rs.getString("Email");
                String address = rs.getString("Address");
                int claId = rs.getInt("Class_ID");
                int acId = rs.getInt("Account_ID");  // Lấy đúng Account_ID từ DB

                student = new Student(id, name, dob, gender, phone, email, address, claId, acId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return student;
    }

    public List<Student> getStudentsByClass(int classId) {
        List<Student> studentList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Student WHERE Class_ID = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, classId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String id = rs.getString("Student_ID");
                String name = rs.getString("Full_Name");
                int dob = rs.getInt("BirthYear");
                String gender = rs.getString("Gender");
                String phone = rs.getString("Phone");
                String email = rs.getString("Email");
                String address = rs.getString("Address");
                int acId = rs.getInt("Account_ID");

                Student student = new Student(id, name, dob, gender, phone, email, address, classId, acId);
                studentList.add(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return studentList;
    }

    public boolean addStudent(Student student) {
        try {
            // Kiểm tra xem Student_ID đã tồn tại chưa
            String checkSql = "SELECT COUNT(*) FROM Student WHERE Student_ID = ?";
            PreparedStatement checkStmt = connection.prepareStatement(checkSql);
            checkStmt.setString(1, student.getStuId());
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                return false; // Student_ID đã tồn tại
            }

            // Chỉ thêm Student_ID, Full_Name và Class_ID, các thông tin khác có thể cập nhật sau
            String sql = "INSERT INTO Student (Student_ID, Full_Name, Class_ID, Account_ID) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, student.getStuId());
            stmt.setString(2, student.getStuName());
            stmt.setInt(3, student.getClaId());
            stmt.setInt(4, student.getAccId());
            stmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
public Student getStudentById(String stuId) {
    Student student = null;
    try {
        String sql = "SELECT * FROM Student WHERE Student_ID = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1, stuId);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            String id = rs.getString("Student_ID");
            String name = rs.getString("Full_Name");
            int dob = rs.getInt("BirthYear");
            String gender = rs.getString("Gender");
            String phone = rs.getString("Phone");
            String email = rs.getString("Email");
            String address = rs.getString("Address");
            int claId = rs.getInt("Class_ID");
            int acId = rs.getInt("Account_ID");

            student = new Student(id, name, dob, gender, phone, email, address, claId, acId);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return student;
}
public boolean updateStudentClass(String stuId, int newClassId) {
    try {
        String sql = "UPDATE Student SET Class_ID = ? WHERE Student_ID = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setInt(1, newClassId);
        stmt.setString(2, stuId);
        int rowsUpdated = stmt.executeUpdate();
        return rowsUpdated > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

}
