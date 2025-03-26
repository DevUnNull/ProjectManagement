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
    String className = request.getParameter("className");
    String departmentStr = request.getParameter("departmentID");

    try {
        MyClassDAO dao = new MyClassDAO();

        // Kiểm tra nếu tên lớp bị thiếu
        if (className == null || className.trim().isEmpty()) {
            request.setAttribute("error", "Tên lớp không được để trống!");
            request.getRequestDispatcher("AddClass.jsp").forward(request, response);
            return;
        }

        // Kiểm tra nếu mã khoa bị thiếu
        if (departmentStr == null || departmentStr.trim().isEmpty()) {
            request.setAttribute("error", "Mã khoa không được để trống!");
            request.getRequestDispatcher("AddClass.jsp").forward(request, response);
            return;
        }

        // Kiểm tra xem mã khoa có tồn tại không
        if (!dao.isDepartmentExisted(departmentStr)) {
            request.setAttribute("error", "Mã khoa không tồn tại!");
            request.getRequestDispatcher("AddClass.jsp").forward(request, response);
            return;
        }

        // Kiểm tra nếu lớp học đã tồn tại
        if (dao.isClassExisted(className)) {
            request.setAttribute("error", "Lớp học đã tồn tại!");
            request.getRequestDispatcher("AddClass.jsp").forward(request, response);
            return;
        }

        // Nếu hợp lệ thì thêm vào
        MyClass myClass = new MyClass(0, className, departmentStr);
        dao.insertClass(myClass);
        response.sendRedirect("classManagement");
    } catch (Exception e) {
        request.setAttribute("error", "Lỗi hệ thống! Vui lòng thử lại.");
        request.getRequestDispatcher("AddClass.jsp").forward(request, response);
    }
}


}
