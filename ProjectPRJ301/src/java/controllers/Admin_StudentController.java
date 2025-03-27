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

        Admin_StudentDAO dao = new Admin_StudentDAO();
        List<Student> list = dao.getAllStudents(); // Lấy danh sách sinh viên

        // Xử lý tìm kiếm
        String searchID = request.getParameter("searchID");
        if (searchID != null && !searchID.trim().isEmpty()) {
            Student student = dao.getStudentByID(searchID);
            if (student != null) {
                list = new ArrayList<>();
                list.add(student);
            } else {
                request.setAttribute("searchMessage", "Không tìm thấy sinh viên có mã: " + searchID);
            }
        }

        // Gửi danh sách sinh viên lên JSP
        request.setAttribute("listP", list);
        request.getRequestDispatcher("AdminStudent.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            deleteStudent(request, response);
        } else {
            processRequest(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentID = request.getParameter("id");

        if (studentID == null || studentID.trim().isEmpty()) {
            request.setAttribute("errorMessage", "ID không hợp lệ!");
            request.getRequestDispatcher("AdminStudent.jsp").forward(request, response);
            return;
        }

        Admin_StudentDAO studentDAO = new Admin_StudentDAO();
        boolean success = studentDAO.deleteStudent(studentID);

        if (success) {
            request.setAttribute("message", "Xóa sinh viên thành công!");
        } else {
            request.setAttribute("errorMessage", "Lỗi! Không thể xóa sinh viên.");
        }

        response.sendRedirect("Admin_StudentController");
    }

    @Override
    public String getServletInfo() {
        return "Admin Student Controller Servlet";
    }
}
