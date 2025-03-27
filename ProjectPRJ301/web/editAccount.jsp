<%@ page import="models.Account, dal.Admin_AccountDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession sessionObj = request.getSession();
    String successMessage = (String) sessionObj.getAttribute("successMessage");
    Account updatedAccount = (Account) sessionObj.getAttribute("updatedAccount");

    String idStr = request.getParameter("id");
    Account account = null;

    if (updatedAccount != null && updatedAccount.getAccId() == Integer.parseInt(idStr)) {
        account = updatedAccount; // ✅ Giữ lại dữ liệu sau khi cập nhật
    } else {
        if (idStr != null && !idStr.trim().isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                Admin_AccountDAO dao = new Admin_AccountDAO();
                account = dao.getAccountByID(id);
            } catch (NumberFormatException e) {
                account = null;
            }
        }
    }
    // 🔥 Xóa thông báo sau khi hiển thị để tránh lặp lại
    sessionObj.removeAttribute("successMessage");
    sessionObj.removeAttribute("updatedAccount");
%>

<html>
    <head>
        <title>Chỉnh Sửa Tài Khoản</title>
    </head>
    <body>
        <h2>Chỉnh Sửa Tài Khoản</h2>

        <% if (successMessage != null) { %>
        <p style="color: green;"><%= successMessage %></p>
        <% } %>

        <% if (account == null) { %>
        <p style="color: red;">Tài khoản không tồn tại hoặc ID không hợp lệ!</p>
        <a href="AdminAccount.jsp">Quay lại</a>
        <% } else { %>
        <form action="Admin_AccountController" method="POST">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= account.getAccId() %>">

            Username: <input type="text" name="username" value="<%= account.getUsername() %>"><br>
            Email: <input type="text" name="email" value="<%= account.getEmail() %>"><br>
            Password: <input type="text" name="password" value="<%= account.getPassword() %>"><br>
            Role ID: <input type="number" name="roleId" value="<%= account.getRoleId() %>"><br>

            <button type="submit" onclick="sessionStorage.setItem('saved', 'true');">Lưu</button>

            <button type="button" onclick="goBack();">Quay Lại</button>

            <script>
                function goBack() {
                    if (sessionStorage.getItem("saved") === "true") {
                        sessionStorage.setItem("saved", "false"); // Reset lại saved
                        window.history.go(-2); // Quay lại 2 bước nếu đã ấn Lưu
                    } else {
                        window.history.back(); // Quay lại 1 bước nếu chưa ấn Lưu
                    }
                }
            </script>

        </form>
        <% } %>
    </body>
</html>
