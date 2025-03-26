package controllers;

import dao.Admin_TeacherDAO;
import models.Teacher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditTeacherController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String id = request.getParameter("id");
        Admin_TeacherDAO dao = new Admin_TeacherDAO();
        Teacher teacher = dao.getTeacherByID(id);
        request.setAttribute("teacher", teacher);
        request.getRequestDispatcher("editTeacher.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        int birthyear = Integer.parseInt(request.getParameter("birthyear"));
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int claId = Integer.parseInt(request.getParameter("claId"));
        int accId = Integer.parseInt(request.getParameter("accId"));
        
        Admin_TeacherDAO dao = new Admin_TeacherDAO();
        dao.updateTeacher(id, name, birthyear, gender, phone, email, address, claId, accId);
        
        response.sendRedirect("AdminTeacherController");
    }
}
