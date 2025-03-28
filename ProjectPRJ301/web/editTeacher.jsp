<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="models.Account" %>
<%
    Account account = (Account) session.getAttribute("account");
    if (account == null || account.getRoleId() != 1) {
        response.sendRedirect("Login.jsp"); // Chuyển về trang đăng nhập nếu không phải giáo viên
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Teacher</title>
</head>
<body>
    <h1>Edit Teacher</h1>
    <form action="editTeacher" method="post">
        <input type="hidden" name="id" value="${teacher.teId}" />
        <label>Name:</label>
        <input type="text" name="name" value="${teacher.teName}" required /><br/>
        
        <label>Birth Year:</label>
        <input type="number" name="birthyear" value="${teacher.birthyear}" required /><br/>
        
        <label>Gender:</label>
        <select name="gender">
            <option value="Male" ${teacher.gender == 'Male' ? 'selected' : ''}>Male</option>
            <option value="Female" ${teacher.gender == 'Female' ? 'selected' : ''}>Female</option>
        </select><br/>
        
        <label>Phone:</label>
        <input type="text" name="phone" value="${teacher.phone}" required /><br/>
        
        <label>Email:</label>
        <input type="email" name="email" value="${teacher.email}" required /><br/>
        
        <label>Address:</label>
        <input type="text" name="address" value="${teacher.address}" required /><br/>
        
        <label>Class ID:</label>
        <input type="number" name="claId" value="${teacher.claId}" required /><br/>
        
        <label>Account ID:</label>
        <input type="number" name="accId" value="${teacher.accId}" required /><br/>
        
        <button type="submit">Update</button>
        <a href="AdminTeacherController">Cancel</a>
    </form>
</body>
</html>
