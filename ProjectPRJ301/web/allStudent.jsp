<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .content {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <c:import url="SidebarStudent.jsp"/>
    <div class="content">
        <form action="student" method="get">
            <input type="hidden" name="action" value="allStudent"/>
        </form>
        <c:if test="${not empty allstudent}">
            <h2>Danh sách sinh viên của lớp học</h2>
            <table>
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Student Name</th>
                        <th>Gender</th>
                        <th>Birth Year</th>
                        <th>Address</th>
                        <th>Phone</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="s" items="${allstudent}">
                        <tr>
                            <td>${s.getStuId()}</td>
                            <td>${s.getStuName()}</td>
                            <td>${s.getGender()}</td>
                            <td>${s.getByear()}</td>
                            <td>${s.getAddress()}</td>
                            <td>${s.getPhone()}</td>
                            <td>${s.getEmail()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</body>
</html>
