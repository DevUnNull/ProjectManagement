//Chỉ xử lý dữ liệu bên Teacher
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Teacher;

@WebServlet(name = "TeacherController", urlPatterns = {"/teacher"})
public class TeacherController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Teacher te = (Teacher) session.getAttribute("teacher");
        if (te == null) {
            resp.sendRedirect("Login.jsp");
        } else {
            req.setAttribute("teacher", te);
            req.getRequestDispatcher("viewInfoTeacher.jsp").forward(req, resp);
        }
    }
}
