<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:forEach var="s" items="${subb}">
            <h2>Thông tin môn học </h2>
            <p><b>Mã môn học:</b>${s.getSubId()}</p>
            <p><b>Tên môn học:</b>${s.getSubName()}</p>
            <p><b>Số tín chỉ:</b>${s.getCreValue()}</p>


        </c:forEach>
    </body>
</html>
