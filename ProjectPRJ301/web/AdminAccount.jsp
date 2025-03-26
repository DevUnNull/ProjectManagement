<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarAdmin.jsp"/>
<div class="content">


    <title>Admin - Account Management</title>
    <style>
        .btn {
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 5px;
            margin: 2px;
        }
        .edit { background-color: yellow; }
        .delete { background-color: red; color: white; }
    </style>
</head>
<body>
    <h1>Account List</h1>
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
                    <a href="editAccount?id=${account.accId}" class="btn edit">Sửa</a>
                    <a href="deleteAccount?id=${account.accId}" class="btn delete">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>

</div>

</body>
</html>
