/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers;

import dal.AdminGradeDAO;
import dto.GradeDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "AdminGradeController", urlPatterns = {"/admin/grades"})
public class AdminGradeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Tạo đối tượng DAO để lấy danh sách điểm
        AdminGradeDAO gradeDAO = new AdminGradeDAO();
        List<GradeDTO> gradeList = gradeDAO.getAllGrades();

        // Đưa danh sách điểm vào request để gửi sang JSP
        request.setAttribute("gradeList", gradeList);

        // Chuyển hướng đến trang AdminGrade.jsp để hiển thị dữ liệu
        request.getRequestDispatcher("AdminGrade.jsp").forward(request, response);
    }
}
