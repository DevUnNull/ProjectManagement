package dao;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Student;

public class Admin_StudentDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Student> getAllStudents() {
        List<Student> list = new ArrayList<>();
        String query = "SELECT * FROM Student";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
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
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, studentID);
            rs = ps.executeQuery();
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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // Trả về null nếu không tìm thấy
    }

    public void updateStudent(String id, String name, int birthyear, String gender, String phone, String email, String address, int claId, int accId) {
        String query = "UPDATE Student SET Full_Name=?, BirthYear=?, Gender=?, Phone=?, Email=?, Address=?, Class_ID=?, Account_ID=? WHERE Student_ID=?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setInt(2, birthyear);
            ps.setString(3, gender);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setString(6, address);
            ps.setInt(7, claId);
            ps.setInt(8, accId);
            ps.setString(9, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteStudent(String studentID) {
        String query = "DELETE FROM Student WHERE Student_ID = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, studentID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Admin_StudentDAO dao = new Admin_StudentDAO();
        List<Student> list = dao.getAllStudents();
        for (Student student : list) {
            System.out.println(student);
        }
    }
}
