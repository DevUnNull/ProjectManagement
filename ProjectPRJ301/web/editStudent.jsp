<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Student"%>

<%
    // Lấy thông tin sinh viên từ request
    Student s = (Student) request.getAttribute("listP");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Chỉnh sửa sinh viên</title>
</head>
<body>
    <h2 align="center">Chỉnh sửa thông tin sinh viên</h2>

    <!-- Form chỉnh sửa thông tin sinh viên -->
    <form action="EditStudent" method="post">
        <!-- Truyền ID sinh viên (ẩn đi để tránh chỉnh sửa) -->
        <input type="hidden" name="id" value="<%= s.getStuId() %>">
        
        <table align="center">
            <tr>
                <td>Tên:</td>
                <td><input type="text" name="name" value="<%= s.getStuName() %>"></td>
            </tr>
            <tr>
                <td>Năm Sinh:</td>
                <td><input type="number" name="birthyear" value="<%= s.getBirthyear() %>"></td>
            </tr>
            <tr>
                <td>Giới tính:</td>
                <td>
                    <select name="gender">
                        <option value="Nam" <%= s.getGender().equals("Nam") ? "selected" : "" %>>Nam</option>
                        <option value="Nữ" <%= s.getGender().equals("Nữ") ? "selected" : "" %>>Nữ</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Điện thoại:</td>
                <td><input type="text" name="phone" value="<%= s.getPhone() %>"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="email" name="email" value="<%= s.getEmail() %>"></td>
            </tr>
            <tr>
                <td>Địa chỉ:</td>
                <td><input type="text" name="address" value="<%= s.getAddress() %>"></td>
            </tr>
            <tr>
                <td>Lớp:</td>
                <td><input type="number" name="claId" value="<%= s.getClaId() %>"></td>
            </tr>
            <tr>
                <td>Tài khoản:</td>
                <td><input type="number" name="accId" value="<%= s.getAccId() %>"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Lưu thay đổi">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
