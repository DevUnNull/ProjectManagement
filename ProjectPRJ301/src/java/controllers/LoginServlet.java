package controllers;

import dal.AccountDAO;
import dal.StudentDAO;
import dal.TeacherDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Account;
import models.Student;
import models.Teacher;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        AccountDAO accDAO = new AccountDAO();
        Account acc = accDAO.login(email, pass);
        if (acc != null) {
            HttpSession session = req.getSession();
            session.setAttribute("account", acc);

            if (acc.getRoleId() == 1) {
                resp.sendRedirect("ViewAdmin.jsp");
            } else if (acc.getRoleId() == 2) {
                TeacherDAO teacherDAO = new TeacherDAO();
                Teacher teacher = teacherDAO.getTeacher(acc.getAccId());
                if (teacher != null) {
                    session.setAttribute("teacher", teacher);
                    resp.sendRedirect("ViewTeacher.jsp");
                } else {
                    resp.sendRedirect("ViewTeacher.jsp");
                }
            } else if (acc.getRoleId() == 3) {
                StudentDAO stuDAO = new StudentDAO();
                Student stu = stuDAO.getStudent(acc.getAccId());
                if (stu != null) {
                    session.setAttribute("student", stu);
                    resp.sendRedirect("ViewStudent.jsp");
                } else {
                    resp.sendRedirect("Login.jsp");
                }
            }
        } else {
            req.setAttribute("Msg", "Tài khoản hoặc mật khẩu không chính xác!");
            req.getRequestDispatcher("Login.jsp").forward(req, resp);
        }

    }

}
