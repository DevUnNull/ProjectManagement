package controllers;

import dal.AdminGradeDAO;
import dal.SemesterDAO;
import dto.GradeDTO;
import dto.SemesterDTO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
        
        // Nếu người dùng đã nhập mã sinh viên mà không có kết quả
        if (gradeList.isEmpty() && searchStudentId != null && !searchStudentId.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Mã sinh viên không tồn tại, hoặc không có điểm kì này!");
        }
        
        request.setAttribute("gradeList", gradeList);
        
        // Sử dụng SemesterDAO để lấy danh sách kỳ học từ DB
        SemesterDAO semDAO = new SemesterDAO();
        List<SemesterDTO> semesterList = semDAO.getAllSemesters();
        request.setAttribute("semesterList", semesterList);

        request.getRequestDispatcher("AdminGrade.jsp").forward(request, response);
    }
}
