package controllers;

import dal.Admin_AccountDAO;
import models.Account;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Admin_AccountController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // B1: Lấy dữ liệu từ DAO
        Admin_AccountDAO dao = new Admin_AccountDAO();
        List<Account> list;

        // B2: Kiểm tra nếu có tìm kiếm theo Account_ID
        String searchID = request.getParameter("searchID");
        if (searchID != null && !searchID.trim().isEmpty()) {
            try {
                int accountID = Integer.parseInt(searchID); // Chuyển đổi sang số nguyên
                Account account = dao.getAccountByID(accountID);
                list = new ArrayList<>();
                if (account != null) {
                    list.add(account);
                }
            } catch (NumberFormatException e) {
                list = new ArrayList<>(); // Nếu nhập sai định dạng, trả về danh sách rỗng
            }
        } else {
            list = dao.getAllAccounts(); // Nếu không tìm kiếm, lấy tất cả tài khoản
        }

        // B3: Đưa dữ liệu lên JSP
        request.setAttribute("listA", list);
        request.getRequestDispatcher("AdminAccount.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String action = request.getParameter("action");

    if ("update".equals(action)) {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int roleId = Integer.parseInt(request.getParameter("roleId"));

        Admin_AccountDAO dao = new Admin_AccountDAO();
        dao.updateAccount(id, username, email, password, roleId);

        response.sendRedirect("AdminAccount.jsp?message=Account updated successfully");
    } else {
        processRequest(request, response);
    }
}


    @Override
    public String getServletInfo() {
        return "Admin Account Controller Servlet";
    }
}
