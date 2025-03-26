<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarAdmin.jsp"/>
<%@ page import="java.util.List" %>
<%@ page import="dto.GradeDTO" %>
<div class="content">



    <title>Danh sách điểm sinh viên</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>


    <h2>Danh sách điểm sinh viên</h2>
    <table>
        <tr>
            <th>Mã sinh viên</th>
            <th>Tên sinh viên</th>
            <th>Lớp</th>
            <th>Môn học</th>
            <th>Học kỳ</th>
            <th>Điểm giữa kỳ</th>
            <th>Điểm cuối kỳ</th>
            <th>Tổng điểm</th>
        </tr>
        <%
            List<GradeDTO> gradeList = (List<GradeDTO>) request.getAttribute("gradeList");
            if (gradeList != null) {
                for (GradeDTO grade : gradeList) {
        %>
        <tr>
            <td><%= grade.getStudentId() %></td>
            <td><%= grade.getStudentName() %></td>
            <td><%= grade.getClassName() %></td>
            <td><%= grade.getSubjectName() %></td>
            <td><%= grade.getSemesterName() %></td>
            <td><%= grade.getMidTerm() %></td>
            <td><%= grade.getFinalExam() %></td>
            <td><%= grade.getTotalGrade() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="8">Không có dữ liệu</td>
        </tr>
        <% } %>
    </table>


</div>

</body>
</html>
