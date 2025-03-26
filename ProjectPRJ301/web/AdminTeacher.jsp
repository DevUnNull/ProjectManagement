<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Teacher Management</title>
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
    <h1>Teacher List</h1>
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
                    <a href="editTeacher?id=${teacher.teId}" class="btn edit">Sửa</a>
                    <a href="deleteTeacher?id=${teacher.teId}" class="btn delete">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>