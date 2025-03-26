<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách lớp học</title>
    <!-- Nhúng CSS nội tuyến -->
    <style>
        /* Style cho sidebar (nếu SidebarAdmin.jsp chưa có style riêng) */
        .sidebar {
            width: 200px;
            float: left;
            background-color: #f2f2f2;
            padding: 10px;
            box-sizing: border-box;
            min-height: 100vh;
        }
        /* Style cho phần content bên phải */
        .content {
            margin-left: 220px; /* để tạo khoảng cách với sidebar */
            padding: 20px;
        }
        /* Style cho bảng */
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f8f8f8;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        h2 {
            color: #333;
        }
    </style>
</head>
<body>
    <!-- Import SidebarAdmin.jsp, nếu file này chứa phần sidebar -->
    <c:import url="SidebarAdmin.jsp"/>
    
    <div class="content">
        <h2>Danh sách Lớp học</h2>
        <table>
            <tr>
                <th>Tên lớp</th>
            </tr>
            <c:forEach var="cls" items="${classList}">
                <tr>
                    <td>${cls.claName}</td>
                </tr>
            </c:forEach>
            <c:if test="${empty classList}">
                <tr>
                    <td colspan="1">Không có dữ liệu lớp học nào.</td>
                </tr>
            </c:if>
        </table>
        <input type="submit" value="Thêm Lớp" />
    </div>
</body>
</html>
