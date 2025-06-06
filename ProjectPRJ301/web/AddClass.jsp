<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarAdmin.jsp"/>
<%@page  import="models.Account" %>
<%
    Account account = (Account) session.getAttribute("account");
    if (account == null || account.getRoleId() != 1) {
        response.sendRedirect("Login.jsp"); // Chuyển về trang đăng nhập nếu không phải giáo viên
        return;
    }
%>
<div class="content">


    <title>Thêm Lớp Học Mới</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .form-container {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            background-color: #f9f9f9;
        }
        .form-container h2 {
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4285f4;
            border: none;
            color: #fff;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #3367d6;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Thêm Lớp Học Mới</h2>
        <form action="AddClass" method="post">
            
            <div class="form-group">
                <label for="className">Tên lớp:</label>
                <input type="text" name="className" id="className" required>
            </div>
            <div class="form-group">
                <label for="departmentID">Mã khoa:</label>
                <input type="text" name="departmentID" id="departmentID" required>
            </div>
            <div class="form-group">
                <input type="submit" value="Thêm lớp">
            </div>
            <c:if test="${not empty error}">
                <p style="color: red;">${error}</p>
            </c:if>

        </form>
        <a href="classManagement">Quay lại danh sách lớp</a>
    </div>


</div>

</body>
</html>
