<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="models.Account" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Thêm Tài Khoản</title>
    </head>
    <body>
        <h2>Thêm Tài Khoản Mới</h2>

        <%-- Hiển thị thông báo --%>
        <% 
        String errorMessage = (String) session.getAttribute("errorMessage");
        String successMessage = (String) session.getAttribute("successMessage");

    if (errorMessage != null) { 
        %>
        <p style="color: red;"><%= errorMessage %></p>
        <% 
                session.removeAttribute("errorMessage"); // Xóa lỗi sau khi hiển thị
            }

            if (successMessage != null) { 
        %>
        <p style="color: green;"><%= successMessage %></p>
        <% 
                session.removeAttribute("successMessage"); // Xóa thông báo sau khi hiển thị
            } 
        %>


        <form action="Admin_AccountController" method="POST">
            <input type="hidden" name="action" value="create">

            <label>Username:</label>
            <input type="text" name="username" required><br>

            <label>Email:</label>
            <input type="email" name="email" required><br>

            <label>Password:</label>
            <input type="password" name="password" required><br>

            <label>Role ID:</label>
            <input type="number" name="roleId" required><br>

            <button type="submit" onclick="sessionStorage.setItem('saved', 'true');">Thêm Tài Khoản</button>
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

    </body>
</html>

