package controllers;

import dal.AdminGradeDAO;
import dto.GradeDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "EditGradeController", urlPatterns = {"/EditGrade"})
public class EditGradeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentId = request.getParameter("studentId");
        String subjectId = request.getParameter("subjectId");
        String semesterId = request.getParameter("semesterId");

        AdminGradeDAO gradeDAO = new AdminGradeDAO();
        GradeDTO grade = gradeDAO.getGradeByIds(studentId, subjectId, semesterId);

        if (grade == null) {
            request.setAttribute("error", "Không tìm thấy dữ liệu điểm.");
        } else {
            request.setAttribute("grade", grade);
        }

        request.getRequestDispatcher("EditGrade.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentId = request.getParameter("studentId");
        String subjectId = request.getParameter("subjectId");
        String semesterId = request.getParameter("semesterId");
        float midTerm = Float.parseFloat(request.getParameter("midTerm"));
        float finalExam = Float.parseFloat(request.getParameter("finalExam"));

        AdminGradeDAO gradeDAO = new AdminGradeDAO();
        boolean isUpdated = gradeDAO.updateGrade(studentId, subjectId, semesterId, midTerm, finalExam);

        if (isUpdated) {
            request.getSession().setAttribute("successMessage", "Cập nhật điểm thành công!");
            response.sendRedirect("AdminGradeController");
        } else {
            request.setAttribute("error", "Cập nhật điểm thất bại. Vui lòng thử lại!");
            doGet(request, response); // Quay lại trang chỉnh sửa nếu thất bại
        }
    }

}
