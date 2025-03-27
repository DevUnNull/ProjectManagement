<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarStudent.jsp"/>
<%@page import="dto.InfoGrade" %>
 <%@page import="java.util.List" %>

        <div class="content">
           
            <style>
                /* Thiết lập cho khu vực nội dung chính */
.content {
    margin-left: 260px; /* để tránh chồng lên sidebar (nếu sidebar rộng 260px) */
    padding: 20px;
    background-color: #f9f9f9;
    font-family: Arial, sans-serif;
}

/* Tiêu đề */
h2 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

/* Style cho bảng */
table {
    width: 80%;
    margin: 0 auto; /* canh giữa bảng */
    border-collapse: collapse; /* gộp đường viền các ô */
    background-color: #fff;
    font-size: 16px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

/* Đường viền của bảng */
table, th, td {
    border: 1px solid #ccc;
}

/* Phần header của bảng (tiêu đề cột) */
th {
    background-color: #f2f2f2;
    color: #333;
    text-align: center;
    padding: 10px;
}

/* Các ô dữ liệu của bảng */
td {
    padding: 10px;
    text-align: center;
}

/* Link trong bảng */
td a {
    color: #007bff;
    text-decoration: none;
    font-weight: bold;
}

td a:hover {
    text-decoration: underline;
}

/* Thay đổi màu nền từng dòng cho dễ nhìn hơn (tùy chọn) */
tr:nth-child(even) {
    background-color: #fafafa;
}

            </style>

<%
    List<InfoGrade> ig = (List<InfoGrade>) session.getAttribute("infograde");
    if (ig == null || ig.isEmpty()) {
%>
        <p>Không có dữ liệu</p>
<%
    } else {
%>



    <title>Student's Grade Report</title>
</head>
<body>
    <h2>Grade Report</h2>

    <table border="1">
        <tr>
            <th>Subject Name</th>
            <th>Midterm Grade</th>
            <th>Final Exam Grade</th>
            <th>Total Score</th>
        </tr>

        <% for (InfoGrade igs : ig) { %>
        <tr>
            <td>
                <a href="student?action=sub&subName=<%= igs.getSubName() %>"><%= igs.getSubName() %> </a>            
            </td>
            <td><%= igs.getMidgrade() %></td>
            <td><%= igs.getFinalgrade() %></td>
            <td><%= igs.getTotal()%></td>
        </tr>
        <% } %>
    </table>


<% } %>

        </div>

    </body>
</html>
