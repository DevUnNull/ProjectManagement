<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Information</title>
    <style>
        /* Xóa margin/padding mặc định và sử dụng box-sizing để dễ kiểm soát layout */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Thiết lập font, dùng flex cho body để chia sidebar và content */
        body {
            font-family: Arial, sans-serif;
            display: flex;        /* Chia màn hình thành 2 phần: sidebar và content */
            min-height: 100vh;    /* Chiều cao tối thiểu bằng 100% chiều cao màn hình */
            background-color: #f9f9f9;
        }

        /* Sidebar chiếm một chiều rộng cố định */
        .sidebar {
            width: 250px;
            background-color: #2c3e50;  /* Màu nền cho sidebar */
        }

        /* Khu vực nội dung chiếm phần còn lại */
        .content {
            flex: 1;            /* Tự co giãn chiếm hết phần còn lại của màn hình */
            padding: 20px;      /* Khoảng cách trong để nội dung đẹp hơn */
            background-color: #fff;
        }

        /* Tiêu đề */
        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        /* Định dạng bảng */
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
    <!-- Sidebar bên trái -->
    <div class="sidebar">
        <c:import url="SidebarStudent.jsp"/>
    </div>

    <!-- Nội dung (bảng) bên phải -->
    <div class="content">
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
