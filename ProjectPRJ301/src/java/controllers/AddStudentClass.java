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

            if (stuId == null || stuName == null || birthyearStr == null
                    || gender == null || phone == null || email == null || address == null || claIdStr == null
                    || stuId.isEmpty() || stuName.isEmpty() || birthyearStr.isEmpty()
                    || gender.isEmpty() || phone.isEmpty() || email.isEmpty() || address.isEmpty() || claIdStr.isEmpty()) {
                response.sendRedirect("AddStudent.jsp?msg=Vui lòng điền đầy đủ thông tin!");
                return;
            }

            try {
                int birthyear = Integer.parseInt(birthyearStr);
                int claId = Integer.parseInt(claIdStr);

                if (birthyear < 1900 || birthyear > 2025) {
                    response.sendRedirect("AddStudent.jsp?msg=Năm sinh không hợp lệ!");
                    return;
                }

                int accId = 0; // Giá trị mặc định hoặc lấy từ session/database

                Student newStudent = new Student(stuId, stuName, birthyear, gender, phone, email, address, claId, accId);
                ClassStudentDAO dao = new ClassStudentDAO();
                dao.addStudent(newStudent);

                response.sendRedirect("ClassDetail?classID=" + claId);
            } catch (NumberFormatException e) {
                response.sendRedirect("AddStudent.jsp?msg=Năm sinh phải là số nguyên hợp lệ!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AddStudent.jsp?msg=Lỗi hệ thống, vui lòng thử lại!");
        }
    }

}
