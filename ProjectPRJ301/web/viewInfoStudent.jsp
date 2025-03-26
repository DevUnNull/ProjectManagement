<%@page import="models.Student" %>
<%
    Student stu = (Student) session.getAttribute("student");
        if(stu == null){
            response.sendRedirect("Login.jsp");
            return ;
        }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Thông Tin Sinh Viên</h2>
        <p><b>Mã Sinh Viên:</b> <%= stu.getStuId() %></p>
        <p><b>Họ Tên:</b> <%= stu.getStuName() %></p>
        <p><b>Năm Sinh:</b> <%= stu.getBirthyear() %></p>
        <p><b>Giới Tính:</b> <%= stu.getGender() %></p>
        <p><b>Địa chỉ:</b> <%= stu.getAddress() %></p>
        
    </body>
</html>
