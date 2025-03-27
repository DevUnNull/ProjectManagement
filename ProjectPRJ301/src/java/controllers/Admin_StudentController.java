/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.Admin_StudentDAO;
import models.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class Admin_StudentController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // B1: Lấy dữ liệu từ DAO
        Admin_StudentDAO dao = new Admin_StudentDAO();
        List<Student> list = dao.getAllStudents(); // Lấy toàn bộ danh sách sinh viên

        // B2: Kiểm tra nếu có tìm kiếm theo Student_ID
        String searchID = request.getParameter("searchID");
        if (searchID != null && !searchID.trim().isEmpty()) {
            Student student = dao.getStudentByID(searchID);
            if (student != null) {
                list = new ArrayList<>(); // Xóa danh sách cũ, chỉ hiển thị sinh viên tìm được
                list.add(student);
            } else {
                request.setAttribute("searchMessage", "Không tìm thấy sinh viên có mã: " + searchID);
            }
        }

        // B3: Đưa dữ liệu lên JSP
        request.setAttribute("listP", list);
        request.getRequestDispatcher("AdminStudent.jsp").forward(request, response);
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
        return "Admin Student Controller Servlet";
    }
}
