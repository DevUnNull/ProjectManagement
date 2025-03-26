//Chỉ xử lý dữ liệu bên Student
package controllers;

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

@WebServlet(name="StudentController", urlPatterns={"/student"})
public class StudentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        // Lấy session và kiểm tra quyền truy cập
        Account account = (Account) req.getSession().getAttribute("account");
        if (account == null || account.getRoleId() != 3) {
            resp.sendRedirect("Login.jsp"); // Chuyển hướng về trang đăng nhập nếu không có quyền
            return;
        }

        Student stu = (Student) session.getAttribute("student");
        //Hiển thị thông tin Student
        if(stu == null){
            resp.sendRedirect("Login.jsp");
        }else{
            req.setAttribute("student", stu);
            req.getRequestDispatcher("viewInfoStudent.jsp").forward(req, resp);
        }
        //Hiển thị thông tin lớp học
    }
}
