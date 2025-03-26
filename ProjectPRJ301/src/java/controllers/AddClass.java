package controllers;

import dal.MyClassDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.MyClass;

@WebServlet("/AddClass")
public class AddClass extends HttpServlet {
    
    // Nếu cần hỗ trợ cả GET thì chuyển tiếp đến form nhập liệu
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("AddClass.jsp").forward(request, response);
    }
    
    // Xử lý dữ liệu từ form khi người dùng bấm submit (POST)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy dữ liệu từ form
        String classID = request.getParameter("classID");
        String className = request.getParameter("className");
        String departmentID = request.getParameter("departmentID");
        
        // Tạo đối tượng MyClass với dữ liệu nhận được
        MyClass myClass = new MyClass(classID, className, departmentID);
        
        // Gọi DAO để chèn dữ liệu vào database
        MyClassDAO dao = new MyClassDAO();
        dao.insertClass(myClass);
        
        // Chuyển hướng về trang danh sách lớp (có thể là servlet quản lý lớp)
        response.sendRedirect("ClassManagement");
    }
}
