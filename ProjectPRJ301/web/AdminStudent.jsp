<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarAdmin.jsp"/>
<%@page import="java.util.List"%>
<%@page import="models.Student"%>
<div class="content">



    <title>Quản lý Sinh viên</title>
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

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
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
            padding: 8px 12px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: 0.3s;
            margin: 5px;
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

    <h2 align="center">Quản lý Sinh viên</h2>


    <form action="Admin_StudentController" method="GET">
        <input type="text" name="searchID" placeholder="Nhập Mã Sinh Viên" 
               value="<%= request.getParameter("searchID") != null ? request.getParameter("searchID") : "" %>">
        <button type="submit">Tìm kiếm</button>
    </form>



    <table>
        <tr>
            <th>Mã Sinh viên</th>
            <th>Họ và Tên</th>
            <th>Năm Sinh</th>
            <th>Giới Tính</th>
            <th>Điện Thoại</th>
            <th>Email</th>
            <th>Địa Chỉ</th>
            <th>Lớp</th>
            <th>Tài Khoản</th>
            <th>Hành động</th>
        </tr>
        <c:forEach var="student" items="${listP}">
            <tr>
                <td>${student.stuId}</td>
                <td>${student.stuName}</td>
                <td>${student.birthyear}</td>
                <td>${student.gender}</td>
                <td>${student.phone}</td>
                <td>${student.email}</td>
                <td>${student.address}</td>
                <td>${student.claId}</td>
                <td>${student.accId}</td>
                <td>
                    <a href="editStudent.jsp?id=${student.stuId}" class="btn edit">Sửa</a>
                    <a href="javascript:void(0);" class="btn delete" onclick="confirmDelete(${student.stuId})">Xóa</a>
                </td>
            </tr>
        </c:forEach>

        <script>
            function confirmDelete(studentId) {
                if (confirm("Bạn có chắc chắn muốn xóa sinh viên này không?")) {
                    window.location.href = "Admin_StudentController?action=delete&id=" + studentId;
                }
            }
        </script>

        <c:if test="${not empty message}">
            <p style="color: green;">${message}</p>
        </c:if>
        <c:if test="${not empty error}">
            <p style="color: red;">${error}</p>
        </c:if>

 
    </table>


</div>

</body>
</html>
