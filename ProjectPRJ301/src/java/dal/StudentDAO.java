
package dal;

import dto.ClassJoin;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Student;

/**
 *
 * @author PHAM THAI AN
 */
public class StudentDAO extends DBContext {

    public StudentDAO() {
        super();
    }

    //Hiển thị thông tin cá nhân
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
                int acId = rs.getInt("Account_ID");
                student = new Student(id, name, dob, gender, phone, email, address, claId, accId);
            }
        } catch (Exception e) {
        }
        return student;
    }

    //Hiển thị thông tin lớp học
    public List<ClassJoin> getClass(int accId) {
        List<ClassJoin> list = new ArrayList<>();
        try {
            String sql = "select c.Class_Name from Student s\n"
                    + "join Class c on s.Class_ID = c.Class_ID\n"
                    + "where s.Account_ID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, accId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String claName = rs.getString("Class_Name");
                ClassJoin cj = new ClassJoin(accId, claName);
                list.add(cj);
            }
        } catch (Exception e) {
        }
        return list;
    }

}