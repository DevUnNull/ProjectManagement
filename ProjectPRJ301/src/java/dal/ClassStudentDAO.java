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
            if(rs.next()){
                String id = rs.getString("Student_ID");
                String name = rs.getString("Full_Name");
                int dob = rs.getInt("BirthYear");
                String gender = rs.getString("Gender");
                String phone = rs.getString("Phone");
                String email = rs.getString("Email");
                String address = rs.getString("Address");
                int claId = rs.getInt("Class_ID");
                int acId = rs.getInt("Account_ID");
                student = new Student(id, name, dob, gender, phone, email, address, claId, accId);
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
}
