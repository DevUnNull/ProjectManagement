<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarAdmin.jsp"/>
<div class="content">
 
<!DOCTYPE html>

<title>Chi tiết lớp học</title>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
        margin-top: 20px;
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 10px;
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
    .container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        border: 1px solid #ddd;
        background-color: #f9f9f9;
        text-align: center;
    }
    .action-buttons {
        margin-top: 20px;
    }
    .btn {
        padding: 10px 20px;
        color: white;
        border: none;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
        margin: 5px;
    }
    .btn-back {
        background-color: #4285f4;
    }
    .btn-back:hover {
        background-color: #3367d6;
    }
    .btn-add {
        background-color: #34A853;
    }
    .btn-add:hover {
        background-color: #2c8c44;
    }
</style>

<div class="container">
    <h2>Danh sách sinh viên trong lớp</h2>
    
    <table>
        <tr>
            <th>Mã Sinh Viên</th>
            <th>Họ và Tên</th>
            <th>Năm Sinh</th>
            <th>Giới Tính</th>
            <th>Số Điện Thoại</th>
            <th>Email</th>
            <th>Địa Chỉ</th>
        </tr>
        <c:forEach var="student" items="${students}">
            <tr>
                <td>${student.stuId}</td>
                <td>${student.stuName}</td>
                <td>${student.birthyear}</td>
                <td>${student.gender}</td>
                <td>${student.phone}</td>
                <td>${student.email}</td>
                <td>${student.address}</td>
            </tr>
        </c:forEach>
        <c:if test="${empty students}">
            <tr>
                <td colspan="7">Không có sinh viên nào trong lớp này.</td>
            </tr>
        </c:if>
    </table>

    <div class="action-buttons">
        <a href="classManagement" class="btn btn-back">Quay lại</a>
        <a href="AddStudent.jsp?classID=${param.classID}" class="btn btn-add">Thêm Sinh Viên</a>
    </div>

</div>

</div>

</body>
</html>
