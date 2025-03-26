package dao;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Teacher;

public class Admin_TeacherDAO {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Teacher> getAllTeachers() {
        List<Teacher> list = new ArrayList<>();
        String query = "SELECT * FROM Teacher";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Teacher(
                        rs.getString("Teacher_ID"),
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
    
    public Teacher getTeacherByID(String id) {
        String query = "SELECT * FROM Teacher WHERE Teacher_ID = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                return new Teacher(
                        rs.getString("Teacher_ID"),
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
        return null;
    }
    
    public void updateTeacher(String id, String name, int birthyear, String gender, String phone, String email, String address, int claId, int accId) {
        String query = "UPDATE Teacher SET Full_Name=?, BirthYear=?, Gender=?, Phone=?, Email=?, Address=?, Class_ID=?, Account_ID=? WHERE Teacher_ID=?";
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
    
    public void deleteTeacher(String teacherID) {
        String query = "DELETE FROM Teacher WHERE Teacher_ID = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, teacherID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        Admin_TeacherDAO dao = new Admin_TeacherDAO();
        List<Teacher> list = dao.getAllTeachers();
        for (Teacher teacher : list) {
            System.out.println(teacher);
        }
    }
}
