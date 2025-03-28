<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="SidebarAdmin.jsp"/>
<%@page  import="models.Account" %>
<%
    Account account = (Account) session.getAttribute("account");
    if (account == null || account.getRoleId() != 1) {
        response.sendRedirect("Login.jsp"); // Chuyển về trang đăng nhập nếu không phải giáo viên
        return;
    }
%>
<div class="content">

    <title>Admin - Account Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
        }

        h1 {
            color: #333;
        }

        form {
            margin-bottom: 15px;
        }

        input[type="text"], input[type="submit"], button {
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            cursor: pointer;
        }

        input[type="text"] {
            width: 200px;
        }

        button {
            background-color: #007bff;
            color: white;
            border: none;
        }

        button:hover {
            background-color: #0056b3;
        }

        input[type="submit"] {
            background-color: #28a745;
            color: white;
            font-size: 14px;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        table th {
            background-color: #007bff;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        a.btn, button.btn {
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 3px;
            display: inline-block;
        }

        a.edit, button.edit {
            background-color: #ffc107;
            color: black;
        }

        a.delete, button.delete {
            background-color: #dc3545;
            color: white;
            border: none;
        }

        a.edit:hover, button.edit:hover {
            background-color: #e0a800;
        }

        a.delete:hover, button.delete:hover {
            background-color: #c82333;
        }
    </style>

    <h1>Account List</h1>

    <!-- Form thêm tài khoản -->
    <form action="AdminCreateAccount.jsp" method="get">
        <input type="submit" value="Thêm Tài Khoản">
    </form>

    <!-- Form tìm kiếm tài khoản -->
    <form action="Admin_AccountController" method="GET">
        <input type="text" name="searchID" placeholder="Nhập ID Tài Khoản" 
               value="<%= request.getParameter("searchID") != null ? request.getParameter("searchID") : "" %>">
        <button type="submit">Tìm kiếm</button>
    </form>

    <!-- Hiển thị thông báo -->
    <c:if test="${not empty message}">
        <p style="color: green;">${message}</p>
    </c:if>
    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>

    <!-- Hiển thị thông báo thành công sau khi xóa -->
    <c:if test="${not empty sessionScope.successMessage}">
        <p style="color: green; font-weight: bold;">${sessionScope.successMessage}</p>
        <% session.removeAttribute("successMessage"); %> <!-- Xóa thông báo sau khi hiển thị -->
    </c:if>


    <!-- Bảng danh sách tài khoản -->
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Role ID</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="account" items="${listA}">
            <tr>
                <td>${account.accId}</td>
                <td>${account.username}</td>
                <td>${account.email}</td>
                <td>${account.roleId}</td>
                <td>
                    <a href="editAccount.jsp?id=${account.accId}" class="btn edit">Sửa</a>

                    <!-- Form xóa tài khoản sử dụng POST -->
                    <form action="Admin_AccountController" method="POST" style="display:inline;">
                        <input type="hidden" name="id" value="${account.accId}">
                        <input type="hidden" name="action" value="delete">
                        <button type="button" class="btn delete" onclick="confirmDelete(this.form)">Xóa</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<script>
    function confirmDelete(form) {
        if (confirm("Bạn có chắc chắn muốn xóa tài khoản này không?")) {
            form.submit();
        }
    }
</script>
