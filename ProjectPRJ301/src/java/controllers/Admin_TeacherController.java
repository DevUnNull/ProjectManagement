/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.Admin_TeacherDAO;
import models.Teacher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class Admin_TeacherController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // B1: Lấy dữ liệu từ DAO
        Admin_TeacherDAO dao = new Admin_TeacherDAO();
        List<Teacher> list;

        // B2: Kiểm tra nếu có tìm kiếm theo Teacher_ID
        String searchID = request.getParameter("searchID");
        if (searchID != null && !searchID.trim().isEmpty()) {
            Teacher teacher = dao.getTeacherByID(searchID);
            list = new ArrayList<>();
            if (teacher != null) {
                list.add(teacher);
            }
        } else {
            list = dao.getAllTeachers(); // Nếu không tìm kiếm, lấy tất cả giáo viên
        }

        // B3: Đưa dữ liệu lên JSP
        request.setAttribute("listT", list);
        request.getRequestDispatcher("AdminTeacher.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Admin Teacher Controller Servlet";
    }
}
