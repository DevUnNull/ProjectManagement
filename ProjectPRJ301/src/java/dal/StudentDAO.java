package dal;

import dto.ClassJoin;
import dto.InfoGrade;
import dto.StudentJoin;
import dto.SubJoin;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Student;

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

    //Hien thi diem so
    public List<InfoGrade> getInfoGrade(int accId) {
        List<InfoGrade> list = new ArrayList<>();
        try {
            String sql = "select s.Student_ID, ss.Subject_Name, g.Mid_term, g.Final_Exam, g.Total_Grade from Student s \n"
                    + "	join Grade g on s.Student_ID = g.Student_ID\n"
                    + "	join Subject ss on g.Subject_ID = ss.Subject_ID\n"
                    + "where s.Account_ID = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, accId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String sId = rs.getString("Student_ID"); // Lấy từ DB
                String subname = rs.getString("Subject_Name");
                float midG = rs.getFloat("Mid_term");
                float finG = rs.getFloat("Final_Exam");
                float totalG = rs.getFloat("Total_Grade");

                // Tạo đối tượng InfoGrade
                InfoGrade ig = new InfoGrade(sId, subname, midG, finG, totalG);
                list.add(ig);
            }

        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra console để debug
        }
        return list;
    }

    //Hiển thị danh sách sinh viên trong lớp
    public List<StudentJoin> getStudent(String claName) {
        List<StudentJoin> list = new ArrayList<>();
        try {
            String sql = "select s.Student_ID, s.Full_Name, s.Gender,s.BirthYear, s.Address, s.Phone, s.Email from Class c \n"
                    + "join Student s on c.Class_ID = s.Class_ID\n"
                    + "where c.Class_Name =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, claName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String stuId = rs.getString("Student_ID");
                String stuName = rs.getString("Full_Name");
                String stuGender = rs.getString("Gender");
                int stuByear = rs.getInt("BirthYear");
                String stuAdd = rs.getString("Address");
                String stuPhone = rs.getString("Phone");
                String stuEmail = rs.getString("Email");
                StudentJoin sj = new StudentJoin(claName, stuId, stuName, stuGender, stuByear, stuAdd, stuPhone, stuEmail);
                list.add(sj);
            }
        } catch (Exception e) {
        }
        return list;
    }

    // Hien thi thong tin mon hoc
    public SubJoin getInfoSubject(String subName) {
        SubJoin sj = null;
        try {
            String sql = "select s.Subject_ID, s.Subject_Name, c.Credit_Value from Subject s \n"
                    + "	join Credit c on s.Credit_ID = c.Credit_ID\n"
                    + "	where s.Subject_Name = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, subName);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                int subid = rs.getInt("Subject_ID");
                String subN = rs.getString("Subject_Name");
                int creditV = rs.getInt("Credit_Value");
                sj = new SubJoin(subid, subName, creditV);
                
            }
        } catch (Exception e) {
        }return sj;
    } 
}



//
//package dal;
//
//import dto.ClassJoin;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//import models.Student;
//
///**
// *
// * @author PHAM THAI AN
// */
//public class StudentDAO extends DBContext {
//
//    public StudentDAO() {
//        super();
//    }
//
//    //Hiển thị thông tin cá nhân
//    public Student getStudent(int accId) {
//        Student student = null;
//        try {
//            String sql = "SELECT * FROM Student WHERE Account_ID = ?";
//            PreparedStatement stmt = connection.prepareStatement(sql);
//            stmt.setInt(1, accId);
//            ResultSet rs = stmt.executeQuery();
//            if (rs.next()) {
//                String id = rs.getString("Student_ID");
//                String name = rs.getString("Full_Name");
//                int dob = rs.getInt("BirthYear");
//                String gender = rs.getString("Gender");
//                String phone = rs.getString("Phone");
//                String email = rs.getString("Email");
//                String address = rs.getString("Address");
//                int claId = rs.getInt("Class_ID");
//                int acId = rs.getInt("Account_ID");
//                student = new Student(id, name, dob, gender, phone, email, address, claId, accId);
//            }
//        } catch (Exception e) {
//        }
//        return student;
//    }
//
//    //Hiển thị thông tin lớp học
//    public List<ClassJoin> getClass(int accId) {
//        List<ClassJoin> list = new ArrayList<>();
//        try {
//            String sql = "select c.Class_Name from Student s\n"
//                    + "join Class c on s.Class_ID = c.Class_ID\n"
//                    + "where s.Account_ID = ?";
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, accId);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                String claName = rs.getString("Class_Name");
//                ClassJoin cj = new ClassJoin(accId, claName);
//                list.add(cj);
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }
//
//}