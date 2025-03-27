package dao;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Student;

public class Admin_StudentDAO {

    public List<Student> getAllStudents() {
        List<Student> list = new ArrayList<>();
        String query = "SELECT * FROM Student";
        
        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                list.add(new Student(
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
        return list;
    }

    public Student getStudentByID(String studentID) {
        String query = "SELECT * FROM Student WHERE Student_ID = ?";
        
        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setString(1, studentID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Student(
                            rs.getString("Student_ID"),
                            rs.getString("Full_Name"),
                            rs.getInt("BirthYear"),
                            rs.getString("Gender"),
                            rs.getString("Phone"),
                            rs.getString("Email"),
                            rs.getString("Address"),
                            rs.getInt("Class_ID"),
                            rs.getInt("Account_ID")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateStudent(String id, String name, int birthyear, String gender, String phone, String email, String address, int claId, int accId) {
    String sql = "UPDATE Student SET Full_Name=?, BirthYear=?, Gender=?, Phone=?, Email=?, Address=?, Class_ID=?, Account_ID=? WHERE Student_ID=?";
    try (Connection conn = new DBContext().getConnection();  // ✅ Gọi DBContext đúng cách
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, name);
        stmt.setInt(2, birthyear);
        stmt.setString(3, gender);
        stmt.setString(4, phone);
        stmt.setString(5, email);
        stmt.setString(6, address);
        stmt.setInt(7, claId);
        stmt.setInt(8, accId);
        stmt.setString(9, id);

        int rowsUpdated = stmt.executeUpdate();
        return rowsUpdated > 0; // Trả về true nếu có bản ghi được cập nhật

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}




    public boolean deleteStudent(String studentID) {
        String query = "DELETE FROM Student WHERE Student_ID = ?";
        
        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setString(1, studentID);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean addStudent(Student student) {
        String query = "INSERT INTO Student (Student_ID, Full_Name, BirthYear, Gender, Phone, Email, Address, Class_ID, Account_ID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setString(1, student.getStuId());
            ps.setString(2, student.getStuName());
            ps.setInt(3, student.getBirthyear());
            ps.setString(4, student.getGender());
            ps.setString(5, student.getPhone());
            ps.setString(6, student.getEmail());
            ps.setString(7, student.getAddress());
            ps.setInt(8, student.getClaId());
            ps.setInt(9, student.getAccId());
            
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}