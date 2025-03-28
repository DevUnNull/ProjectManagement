<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarStudent.jsp"/>
<%@page  import="models.Account" %>
<%
    Account account = (Account) session.getAttribute("account");
    if (account == null || account.getRoleId() != 3) {
        response.sendRedirect("Login.jsp"); // Chuyển về trang đăng nhập nếu không phải giáo viên
        return;
    }
%>
        <div class="content">
            


            <style>
                
            </style>
            
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
   
    
        <c:forEach var="s" items="${subb}">
            <h2>Thông tin môn học </h2>
            <p><b>Mã môn học:</b>${s.getSubId()}</p>
            <p><b>Tên môn học:</b>${s.getSubName()}</p>
            <p><b>Số tín chỉ:</b>${s.getCreValue()}</p>


        </c:forEach>


        </div>

    </body>
</html>
