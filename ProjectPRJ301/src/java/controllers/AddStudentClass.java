package controllers;

import dal.ClassStudentDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Student;

@WebServlet(name = "AddStudentClass", urlPatterns = {"/AddStudentClass"})
public class AddStudentClass extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String stuId = request.getParameter("stuId");
            String stuName = request.getParameter("stuName");
            String birthyearStr = request.getParameter("birthyear");
            String gender = request.getParameter("gender");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String claIdStr = request.getParameter("claId");
            
            // Kiểm tra dữ liệu null hoặc rỗng
            if (stuId == null || stuName == null || birthyearStr == null || 
                gender == null || phone == null || email == null || address == null || claIdStr == null ||
                stuId.isEmpty() || stuName.isEmpty() || birthyearStr.isEmpty() || 
                gender.isEmpty() || phone.isEmpty() || email.isEmpty() || address.isEmpty() || claIdStr.isEmpty()) {
                response.sendRedirect("add_student.jsp?msg=Thiếu thông tin sinh viên");
                return;
            }

            // Chuyển đổi dữ liệu số
            int birthyear = Integer.parseInt(birthyearStr);
            int claId = Integer.parseInt(claIdStr);
            
            // Xử lý Account_ID (nếu có trong request hoặc lấy từ session)
            int accId = 0; // Giá trị mặc định hoặc có thể lấy từ database/session
            
            // Tạo đối tượng Student
            Student newStudent = new Student(stuId, stuName, birthyear, gender, phone, email, address, claId, accId);
            
            // Thêm vào database
            ClassStudentDAO dao = new ClassStudentDAO();
            dao.addStudent(newStudent);

            // Chuyển hướng về trang chi tiết lớp
            response.sendRedirect("ClassDetail?classID=" + claId);
        } catch (NumberFormatException e) {
            response.sendRedirect("AddStudent.jsp?msg=Lỗi nhập dữ liệu số");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AddStudent.jsp?msg=Lỗi hệ thống");
        }
    }
}
