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
        .edit-btn {
            display: inline-block;
            padding: 5px 10px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .edit-btn:hover {
            background-color: #0056b3;
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
            <th>Update</th> <!-- Thêm cột chỉnh sửa -->
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
            <td>
                <a class="edit-btn" href="EditGrade?studentId=<%= grade.getStudentId() %>&subjectId=<%= grade.getSubjectId() %>&semesterId=<%= grade.getSemesterId() %>">Update</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="9">Không có dữ liệu</td>
        </tr>
        <% } %>
    </table>

</div>

</body>
</html>
