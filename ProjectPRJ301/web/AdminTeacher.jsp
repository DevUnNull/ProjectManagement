<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarAdmin.jsp"/>
<div class="content">
 

    <title>Admin - Teacher Management</title>
     <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .content {
            width: 90%;
            max-width: 1200px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            background: #fff;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        th {
            background: #007bff;
            color: white;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background: #f9f9f9;
        }

        tr:hover {
            background: #e9ecef;
        }

        .btn {
            display: inline-block;
            padding: 8px 14px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: 0.3s;
            margin: 5px;
            border: none;
        }

        .edit {
            background-color: #ffc107;
            color: black;
        }

        .delete {
            background-color: #dc3545;
            color: white;
        }

        .btn:hover {
            filter: brightness(90%);
        }
    </style>


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

</div>

</body>
</html>
