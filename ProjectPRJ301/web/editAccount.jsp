<%@ page import="models.Account, dal.Admin_AccountDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String idStr = request.getParameter("id");
    Account account = null;
    if (idStr != null) {
        int id = Integer.parseInt(idStr);
        Admin_AccountDAO dao = new Admin_AccountDAO();
        account = dao.getAccountByID(id);
    }
%>
<html>
    <head>
        <title>Chỉnh Sửa Tài Khoản</title>
    </head>
    <body>
        <h2>Chỉnh Sửa Tài Khoản</h2>
        <form action="AdminAccount" method="POST">
            <input type="hidden" name="id" value="<%= account.getAccId() %>">
            Username: <input type="text" name="username" value="<%= account.getUsername() %>"><br>
            Email: <input type="text" name="email" value="<%= account.getEmail() %>"><br>
            Password: <input type="text" name="password" value="<%= account.getPassword() %>"><br>
            Role ID: <input type="number" name="roleId" value="<%= account.getRoleId() %>"><br>
            <button type="submit">Lưu</button>
            <a href="AdminAccount.jsp">Hủy</a>

        </form>
    </body>
</html>
