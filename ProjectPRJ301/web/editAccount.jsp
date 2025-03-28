<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarAdmin.jsp"/>
<%@ page import="models.Account, dal.Admin_AccountDAO" %>
<%@page  import="models.Account" %>


<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh; /* Căn giữa toàn bộ màn hình */
    }

    .content {
        width: 100%;
        max-width: 450px;
        background: #fff;
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    h2 {
        margin-bottom: 20px;
        color: #333;
    }

    p {
        font-size: 14px;
        margin-bottom: 10px;
    }

    p[style="color: green;"] {
        color: green;
    }

    p[style="color: red;"] {
        color: red;
    }

    form {
        text-align: left;
    }

    label {
        font-weight: bold;
        display: block;
        margin: 10px 0 5px;
    }

    input {
        width: 94%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }

    button {
        width: 100%;
        padding: 10px;
        margin-top: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    button[type="submit"] {
        background-color: #007bff;
        color: white;
    }

    button[type="submit"]:hover {
        background-color: #0056b3;
    }

    button[type="button"] {
        background-color: #dc3545;
        color: white;
    }

    button[type="button"]:hover {
        background-color: #c82333;
    }

    a {
        display: block;
        margin-top: 15px;
        color: #007bff;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }
</style>

<div class="content">

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

    sessionObj.removeAttribute("successMessage");
    sessionObj.removeAttribute("updatedAccount");
%>

    <title>Chỉnh Sửa Tài Khoản</title>

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

        <label>Username:</label>
        <input type="text" name="username" value="<%= account.getUsername() %>">

        <label>Email:</label>
        <input type="text" name="email" value="<%= account.getEmail() %>">

        <label>Password:</label>
        <input type="text" name="password" value="<%= account.getPassword() %>">

        <label>Role ID:</label>
        <input type="number" name="roleId" value="<%= account.getRoleId() %>">

        <button type="submit" onclick="sessionStorage.setItem('saved', 'true');">Lưu</button>

       <button type="button" onclick="window.location.href='http://localhost:9999/ProjectPRJ301/Admin_AccountController';">Quay Lại</button>


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

</div>
