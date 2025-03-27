<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Student"%>

<%
    // Lấy thông tin sinh viên từ request
    Student s = (Student) request.getAttribute("student");
    if (s == null) {
%>
        <h2 align="center" style="color: red;">Không tìm thấy sinh viên!</h2>
<%
        return;
    }
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
                <td><input type="text" name="name" value="<%= s.getStuName() %>" required></td>
            </tr>
            <tr>
                <td>Năm Sinh:</td>
                <td><input type="number" name="birthyear" value="<%= s.getBirthyear() %>" required></td>
            </tr>
            <tr>
                <td>Giới tính:</td>
                <td>
                    <select name="gender" required>
                        <option value="Nam" <%= "Nam".equals(s.getGender()) ? "selected" : "" %>>Nam</option>
                        <option value="Nữ" <%= "Nữ".equals(s.getGender()) ? "selected" : "" %>>Nữ</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Điện thoại:</td>
                <td><input type="text" name="phone" value="<%= s.getPhone() %>" required></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="email" name="email" value="<%= s.getEmail() %>" required></td>
            </tr>
            <tr>
                <td>Địa chỉ:</td>
                <td><input type="text" name="address" value="<%= s.getAddress() %>" required></td>
            </tr>
            <tr>
                <td>Lớp:</td>
                <td><input type="number" name="claId" value="<%= s.getClaId() %>" required></td>
            </tr>
            <tr>
                <td>Tài khoản:</td>
                <td><input type="number" name="accId" value="<%= s.getAccId() %>" required></td>
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
