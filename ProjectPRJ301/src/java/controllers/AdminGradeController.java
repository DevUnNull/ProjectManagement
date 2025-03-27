package controllers;

import dal.AdminGradeDAO;
import dto.GradeDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "AdminGradeController", urlPatterns = {"/AdminGradeController"})
public class AdminGradeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchStudentId = request.getParameter("searchStudentId");
        String searchSemester = request.getParameter("searchSemester");

        AdminGradeDAO gradeDAO = new AdminGradeDAO();
        List<GradeDTO> gradeList;
        
        // Nếu có tham số tìm kiếm, gọi phương thức tìm kiếm; nếu không thì lấy tất cả
        if ((searchStudentId != null && !searchStudentId.trim().isEmpty()) ||
            (searchSemester != null && !searchSemester.trim().isEmpty())) {
            gradeList = gradeDAO.searchGrades(searchStudentId, searchSemester);
        } else {
            gradeList = gradeDAO.getAllGrades();
        }
        
        request.setAttribute("gradeList", gradeList);
        
        // Nếu chưa có SemesterDAO, sử dụng list tĩnh cho dropdown Học kỳ
        java.util.List<String> semesterList = java.util.Arrays.asList(
                "SPRING2024", "SUMMER2024", "FALL2024", "SPRING2025", "SUMMER2025", "FALL2025");
        request.setAttribute("semesterList", semesterList);

        request.getRequestDispatcher("AdminGrade.jsp").forward(request, response);
    }
}
