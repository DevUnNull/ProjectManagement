<%@page import="java.util.List" %>
<%@page import="dto.ClassJoin" %>
<%
    List<ClassJoin> cla = (List<ClassJoin>) session.getAttribute("class");
        if(cla == null || cla.isEmpty()){
            System.out.println("Trống");
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
        <h2>Thông Tin Lớp Học</h2>
        <ul>
            <% for (ClassJoin c : cla) { %>
            <li><a href="allStudent.jsp&ClassName=<%= c.getClaName() %>"><%= c.getClaName() %></a></li>
                <% } %>
        </ul>

    </body>
</html>