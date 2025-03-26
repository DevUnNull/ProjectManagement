package controllers;

import dal.ClassStudentDAO; // Đổi từ StudentDAO sang ClassStudentDAO
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Student;

@WebServlet("/ClassDetail")
public class ClassDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String classIdStr = request.getParameter("classID");

        try {
            int classId = Integer.parseInt(classIdStr);
            ClassStudentDAO studentDAO = new ClassStudentDAO(); // Đổi tên DAO
            List<Student> students = studentDAO.getStudentsByClass(classId);

            request.setAttribute("students", students);
            request.getRequestDispatcher("ClassDetail.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("classManagement?error=InvalidClassID");
        }
    }
}
