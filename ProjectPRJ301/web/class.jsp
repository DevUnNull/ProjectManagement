<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarStudent.jsp"/>
<%@page import="java.util.List" %>
<%@page import="dto.ClassJoin" %>

<div class="content">

    <%
        List<ClassJoin> cla = (List<ClassJoin>) session.getAttribute("class");
        if(cla == null || cla.isEmpty()){
            System.out.println("Trống");
            return;
        }
    %>



    <title>Thông Tin Lớp Học</title>
    <style>
        /* Reset CSS cơ bản */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        /* Khung chứa toàn bộ nội dung */
        .container {
            background-color: #fff;
            width: 400px;            /* Chiều rộng tùy ý */
            margin: 50px auto;       /* Căn giữa container */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        ul {
            list-style: none;  /* Bỏ chấm đầu dòng */
            padding: 0;
        }

        li {
            margin-bottom: 10px;
        }

        a {
            display: block;              /* Giúp cả khối a có thể click */
            text-decoration: none;       /* Bỏ gạch chân */
            color: #333;                 /* Màu chữ */
            padding: 10px 15px;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
        }

        a:hover {
            background-color: #f0f0f0;   /* Màu nền khi hover */
            color: #000;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Thông Tin Lớp Học</h2>
        <ul>
            <% for (ClassJoin c : cla) { %>
            <li>
                <a href="student?action=all&ClassName=<%= c.getClaName() %>">
                    <%= c.getClaName() %>
                </a>
            </li>
            <% } %>
        </ul>
    </div>


</div>

</body>
</html>
