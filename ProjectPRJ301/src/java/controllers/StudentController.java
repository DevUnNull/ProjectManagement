//Chỉ xử lý dữ liệu bên Student
package controllers;

import dal.StudentDAO;
import dto.ClassJoin;
import dto.InfoGrade;
import dto.StudentJoin;
import dto.SubJoin;
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

@WebServlet(name = "StudentController", urlPatterns = {"/student"})
public class StudentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        StudentDAO stuDAO = new StudentDAO();
        String action = req.getParameter("action");

        // Kiểm tra quyền truy cập
        Account account = (Account) req.getSession().getAttribute("account");
        if (account == null || account.getRoleId() != 3) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        // Hiển thị danh sách sinh viên trong lớp (nếu action=all)
        if ("all".equals(action)) {
            String claName = req.getParameter("ClassName");
            List<StudentJoin> sj = stuDAO.getStudent(claName);
            req.setAttribute("allstudent", sj);
            req.getRequestDispatcher("allStudent.jsp").forward(req, resp);
            return; // Dừng lại, không chạy xuống dưới
        }
        
        // Hien thi thong tin mon hoc
        if ("sub".equals(action)) {
            String suName = req.getParameter("subName");
            SubJoin subj = stuDAO.getInfoSubject(suName);

            List<SubJoin> subjects = new ArrayList<>();
            if (subj != null) {
                subjects.add(subj);
            }

            req.setAttribute("subb", subjects);
            req.getRequestDispatcher("Infosubject.jsp").forward(req, resp);
            return;
        }

        // Hiển thị thông tin sinh viên
        Student stu = (Student) session.getAttribute("student");
        if (stu != null) {
            req.setAttribute("student", stu);
            req.getRequestDispatcher("viewInfoStudent.jsp").forward(req, resp);
            return; // Dừng lại, tránh chạy tiếp
        }

        // Hiển thị thông tin lớp học
        List<ClassJoin> cl = (List<ClassJoin>) session.getAttribute("class");
        if (cl != null) {
            req.setAttribute("class", cl);
            req.getRequestDispatcher("class.jsp").forward(req, resp);
            return; // Dừng lại
        }
        //Hien thi diem cua student
        List<InfoGrade> ig = (List<InfoGrade>) session.getAttribute("infograde");
        if (ig == null) {
            resp.sendRedirect("Login.jsp");
            return;
        } else {
            req.setAttribute("grade", ig);
            req.getRequestDispatcher("grade.jsp").forward(req, resp);
        }

        // Nếu không có gì hợp lệ, quay lại trang đăng nhập
        resp.sendRedirect("Login.jsp");
    }

}
