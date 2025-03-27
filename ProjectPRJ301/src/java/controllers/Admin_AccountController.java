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
import jakarta.servlet.http.HttpSession;

public class Admin_AccountController extends HttpServlet {

    private Admin_AccountDAO accountDAO = new Admin_AccountDAO();

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
                request.setAttribute("error", "ID không hợp lệ. Vui lòng nhập số nguyên!");
                list = new ArrayList<>(); // Trả về danh sách rỗng nếu nhập sai định dạng
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

        String action = request.getParameter("action");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                int roleId = Integer.parseInt(request.getParameter("roleId"));

                Admin_AccountDAO dao = new Admin_AccountDAO();
                dao.updateAccount(id, username, email, password, roleId);

                //  Lưu dữ liệu vào session
                HttpSession session = request.getSession();
                session.setAttribute("successMessage", "Tài khoản đã được cập nhật thành công!");
                session.setAttribute("updatedAccount", new Account(id, username, email, password, roleId));

                response.sendRedirect("editAccount.jsp?id=" + id);
                return; // ⬅ DỪNG XỬ LÝ Ở ĐÂY
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Dữ liệu nhập không hợp lệ!");
                request.getRequestDispatcher("editAccount.jsp").forward(request, response);
                return; // ⬅ DỪNG XỬ LÝ Ở ĐÂY
            }
        }

        if ("create".equals(action)) {
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            int roleId = Integer.parseInt(request.getParameter("roleId"));

            HttpSession session = request.getSession();
            Admin_AccountDAO dao = new Admin_AccountDAO();

            boolean isInserted = dao.insertAccount(username, email, password, roleId, session);

            if (isInserted) {
                session.setAttribute("successMessage", "✅ Tài khoản đã được thêm thành công!");
            }

            response.sendRedirect("AdminCreateAccount.jsp");
            return; // ⬅ DỪNG XỬ LÝ Ở ĐÂY
        }

        if ("delete".equals(action)) {
            try {
                int accountId = Integer.parseInt(request.getParameter("id"));
                System.out.println("ID cần xóa: " + accountId); // Debug kiểm tra ID

                // 🟢 Lấy thông tin tài khoản trước khi xóa
                Account accountToDelete = accountDAO.getAccountByID(accountId);
                String username = (accountToDelete != null) ? accountToDelete.getUsername() : "Không xác định";

                // 🗑 Xóa tài khoản
                accountDAO.deleteAccount(accountId);

                // ✅ Lưu thông báo vào session
                request.getSession().setAttribute("successMessage", "✅ Tài khoản '" + username + "' đã xóa thành công!");

                response.sendRedirect("Admin_AccountController");
                return; // ⬅ DỪNG XỬ LÝ Ở ĐÂY
            } catch (NumberFormatException e) {
                request.setAttribute("error", "ID không hợp lệ!");
                request.getRequestDispatcher("AdminAccount.jsp").forward(request, response);
                return; // ⬅ DỪNG XỬ LÝ Ở ĐÂY
            }
        }

        processRequest(request, response); // Chỉ gọi khi không có hành động nào khớp
    }

    @Override
    public String getServletInfo() {
        return "Admin Account Controller Servlet";
    }
}
