<%@page  import="models.Teacher" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Teacher te = (Teacher) session.getAttribute("teacher");
        if(te == null){
            response.sendRedirect("Login.jsp");
            return ;
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Thông Tin Sinh Viên</h2>
        <p><b>Mã Sinh Viên:</b> <%= te.getTeId() %></p>
        <p><b>Họ Tên:</b> <%= te.getTeName() %></p>
        <p><b>Năm Sinh:</b> <%= te.getBirthyear() %></p>
        <p><b>Giới Tính:</b> <%= te.getGender() %></p>
        <p><b>Địa chỉ:</b> <%= te.getAddress() %></p>
        <p><b>Số Điện Thoại:</b> <%= te.getPhone() %></p>
        <p><b>Email:</b> <%= te.getEmail() %></p>
    </body>
</html>