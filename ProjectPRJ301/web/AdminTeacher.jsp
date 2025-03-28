<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarAdmin.jsp"/>
<div class="content">
    <%@page  import="models.Account" %>
<%
    Account account = (Account) session.getAttribute("account");
    if (account == null || account.getRoleId() != 1) {
        response.sendRedirect("Login.jsp"); // Chuyển về trang đăng nhập nếu không phải giáo viên
        return;
    }
%>


    <title>Admin - Teacher Management</title>
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
    font-size: 24px;
    color: #333;
    margin-bottom: 20px;
    text-align: center;
}

form {
    display: flex;
    gap: 10px;
    margin-bottom: 15px;
}

input[type="text"] {
    padding: 8px;
    width: 200px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

button, input[type="submit"] {
    padding: 8px 12px;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
}

button {
    background-color: #007bff;
}

button:hover {
    background-color: #0056b3;
}

input[type="submit"] {
    background-color: #28a745;
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

a.btn {
    padding: 5px 10px;
    text-decoration: none;
    border-radius: 3px;
    font-size: 14px;
}

a.edit {
    background-color: #ffc107;
    color: black;
}

a.delete {
    background-color: #dc3545;
    color: white;
}

a.edit:hover {
    background-color: #e0a800;
}

a.delete:hover {
    background-color: #c82333;
}
    </style>


    <h1>Teacher List</h1>

    <form action="Admin_TeacherController" method="GET">
        <input type="text" name="searchID" placeholder="Nhập Mã Giáo Viên" 
               value="<%= request.getParameter("searchID") != null ? request.getParameter("searchID") : "" %>">
        <button type="submit">Tìm kiếm</button>
    </form>



    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Birth Year</th>
            <th>Gender</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Address</th>
            <th>Class ID</th>
            <th>Account ID</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="teacher" items="${listT}">
            <tr>
                <td>${teacher.teId}</td>
                <td>${teacher.teName}</td>
                <td>${teacher.birthyear}</td>
                <td>${teacher.gender}</td>
                <td>${teacher.phone}</td>
                <td>${teacher.email}</td>
                <td>${teacher.address}</td>
                <td>${teacher.claId}</td>
                <td>${teacher.accId}</td>
                <td>
                    <a href="editTeacher.jsp?id=${teacher.teId}" class="btn edit">Sửa</a>
                    <a href="deleteTeacher?id=${teacher.teId}" class="btn delete">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>

</div>

</body>
</html>
