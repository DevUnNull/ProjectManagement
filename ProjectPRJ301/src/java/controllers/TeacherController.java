package controllers;

import dal.TeacherDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import models.Account;
import models.Student;
import models.Teacher;

@WebServlet(name = "TeacherController")
public class TeacherController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account account = (Account) req.getSession().getAttribute("account");
        if (account == null || account.getRoleId() != 2) {
            resp.sendRedirect("Login.jsp"); // Chuyển hướng về trang đăng nhập nếu không có quyền
            return;
        }

        Teacher te = (Teacher) session.getAttribute("teacher");
        if (te == null) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        req.setAttribute("teacher", te);
        
        String classId = req.getParameter("classId");
        if (classId != null) {
            // Lấy danh sách sinh viên của lớp
            TeacherDAO teacherDAO = new TeacherDAO();
            List<Student> students = teacherDAO.getStudentsByClass(classId);
            req.setAttribute("students", students);
            req.getRequestDispatcher("viewStudents.jsp").forward(req, resp);
            return;
        }

        req.getRequestDispatcher("viewInfoTeacher.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account account = (Account) req.getSession().getAttribute("account");
        if (account == null || account.getRoleId() != 2) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        String studentId = req.getParameter("studentId");
        String scoreStr = req.getParameter("score");

        if (studentId != null && scoreStr != null) {
            try {
                double score = Double.parseDouble(scoreStr);
                TeacherDAO teacherDAO = new TeacherDAO();
                boolean success = teacherDAO.updateStudentScore(studentId, score);
                
                if (success) {
                    resp.getWriter().write("success");
                } else {
                    resp.getWriter().write("fail");
                }
            } catch (NumberFormatException e) {
                resp.getWriter().write("invalid");
            }
        }
    }
}
