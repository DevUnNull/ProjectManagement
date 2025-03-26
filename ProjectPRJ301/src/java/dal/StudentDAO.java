/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import models.Student;

/**
 *
 * @author PHAM THAI AN
 */
public class StudentDAO extends DBContext{
    public StudentDAO() {
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
        }
        return student;
    }  
}
