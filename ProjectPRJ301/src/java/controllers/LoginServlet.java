package controllers;

import dal.AccountDAO;
import dal.StudentDAO;
import dal.TeacherDAO;
import dto.ClassJoin;
import dto.InfoGrade;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
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
                    resp.sendRedirect("Login.jsp");
                    return;
                }
            } else if (acc.getRoleId() == 3) {
                // Xử lý lưu thông tin sinh viên
                StudentDAO stuDAO = new StudentDAO();
                Student stu = stuDAO.getStudent(acc.getAccId());
                if (stu != null) {
                    session.setAttribute("student", stu);
                } else {
                    resp.sendRedirect("Login.jsp");
                    return; // Dừng lại nếu không tìm thấy sinh viên
                }

                // Xử lý lưu danh sách lớp học
                List<ClassJoin> cl = stuDAO.getClass(acc.getAccId());
                if (cl != null) {
                    session.setAttribute("class", cl);
                } else {
                    session.setAttribute("class", new ArrayList<>()); // Gán danh sách rỗng để tránh lỗi null
                }

                // Student xem diem
                 List<InfoGrade> ig = stuDAO.getInfoGrade(acc.getAccId());

                    if (ig != null) {
                        session.setAttribute("infograde", ig);
                    } else {
                        session.setAttribute("infograde", new ArrayList<>()); // Tránh lỗi null
                    }

                    resp.sendRedirect("ViewStudent.jsp"); // Chuyển hướng sau khi lưu dữ liệu
                } else {
                    resp.sendRedirect("Login.jsp");

                
                
                // Chỉ redirect sau khi đã lưu cả student và class
                resp.sendRedirect("ViewStudent.jsp");
            }

        } else {
            req.setAttribute("Msg", "Tài khoản hoặc mật khẩu không chính xác!");
            req.getRequestDispatcher("Login.jsp").forward(req, resp);
        }

    }

}
