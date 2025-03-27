<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="models.Account" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarAdmin.jsp"/>
<div class="content">
 


        <title>Thêm Tài Khoản</title>

        <h2>Thêm Tài Khoản Mới</h2>
 
  <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh; /* Chiếm toàn bộ chiều cao màn hình */
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

    label {
        display: block;
        font-weight: bold;
        margin: 10px 0 5px;
        text-align: left;
    }

    input {
        width: 90%;
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
        background-color: #28a745;
        color: white;
    }

    button[type="submit"]:hover {
        background-color: #218838;
    }

    button[type="button"] {
        background-color: #dc3545;
        color: white;
    }

    button[type="button"]:hover {
        background-color: #c82333;
    }

    p {
        font-size: 14px;
        margin-bottom: 10px;
    }

    p[style="color: red;"] {
        color: red;
    }

    p[style="color: green;"] {
        color: green;
    }
</style>






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

 


</div>

</body>
</html>
