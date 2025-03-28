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
            <h1>Bạn đang truy cập bằng quyền của Học Sinh</h1>
            <p></p>
        </div>

    </body>
</html>
