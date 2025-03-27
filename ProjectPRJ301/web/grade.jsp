<%@page import="java.util.List" %>
<%@page import="dto.InfoGrade" %>

<%
    List<InfoGrade> ig = (List<InfoGrade>) session.getAttribute("infograde");
    if (ig == null || ig.isEmpty()) {
%>
        <p>Khong co du lieu diem.</p>
<%
    } else {
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
</body>
</html>

<% } %>
