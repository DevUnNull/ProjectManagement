<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarAdmin.jsp"/>
<%@page import="java.util.List"%>
<%@page import="models.Student"%>
<div class="content">



        <title>Quản lý Sinh viên</title>
        <style>
            table {
                width: 80%;
                border-collapse: collapse;
                margin: 20px auto;
            }
            th, td {
                border: 1px solid black;
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            .btn {
                padding: 5px 10px;
                text-decoration: none;
                color: white;
                border-radius: 5px;
            }
            .edit {
                background-color: #007bff;
            }
            .delete {
                background-color: #dc3545;
            }
        </style>
   
        <h2 align="center">Quản lý Sinh viên</h2>
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
            <%
                List<Student> list = (List<Student>) request.getAttribute("listP");
                if (list != null) {
                    for (Student s : list) {
            %>
            <tr>
                <td><%= s.getStuId() %></td>
                <td><%= s.getStuName() %></td>
                <td><%= s.getBirthyear() %></td>
                <td><%= s.getGender() %></td>
                <td><%= s.getPhone() %></td>
                <td><%= s.getEmail() %></td>
                <td><%= s.getAddress() %></td>
                <td><%= s.getClaId() %></td>
                <td><%= s.getAccId() %></td>
                <td>
                    <a href="editStudent?id=<%= s.getStuId() %>" class="btn edit">Sửa</a>
                    <a href="deleteStudent?id=<%= s.getStuId() %>" class="btn delete">Xóa</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>


</div>

</body>
</html>
