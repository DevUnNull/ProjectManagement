
package dal;

import models.Teacher;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TeacherDAO extends DBContext{
    public TeacherDAO(){
        super();
    }
    public Teacher getTeacher(int accId){
        Teacher teacher = null;
        try {
            String sql = "SELECT * FROM Teacher WHERE Account_ID = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, accId);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
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
}
