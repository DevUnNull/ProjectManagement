<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarAdmin.jsp"/>
 <%@page import="models.Student"%>
<%@page import="dao.Admin_StudentDAO"%>

<div class="content">
   

<%
    // Lấy studentId từ request
    String studentId = request.getParameter("id");
    if (studentId == null || studentId.trim().isEmpty()) {
        out.println("<h3 style='color:red; text-align:center;'>Student ID is missing!</h3>");
        return;
    }

    // Gọi DAO để lấy thông tin sinh viên
    Admin_StudentDAO dao = new Admin_StudentDAO();
    Student s = dao.getStudentByID(studentId);
    
    if (s == null) { 
        out.println("<h3 style='color:red; text-align:center;'>Student not found!</h3>");
        return;
    }

    // Lấy lỗi từ request nếu có
    String errorMessage = (String) request.getAttribute("errorMessage");
%>

<% if (errorMessage != null) { %>
    <p style="color: red; text-align: center;"><%= errorMessage %></p>
<% } %>

<form action="EditStudentController" method="post">
    <input type="hidden" name="id" value="<%= s.getStuId() %>">
    
    <table align="center">
        <tr>
            <td>Tên:</td>
            <td><input type="text" name="name" value="<%= s.getStuName() %>" required></td>
        </tr>
        <tr>
            <td>Năm Sinh:</td>
            <td><input type="number" name="birthyear" value="<%= s.getBirthyear() %>" min="1900" max="2025" required></td>
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
            <td><input type="number" name="claId" value="<%= s.getClaId() %>" min="1" required></td>
        </tr>
        <tr>
            <td>Tài khoản:</td>
            <td><input type="number" name="accId" value="<%= s.getAccId() %>" min="1" required></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Lưu thay đổi">
            </td>
        </tr>
    </table>
</form>

</div>

</body>
</html>
