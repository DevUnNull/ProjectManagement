<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarAdmin.jsp"/>
<%@ page import="dto.GradeDTO" %>

<%
    GradeDTO grade = (GradeDTO) request.getAttribute("grade");
%>

<style>
    body {
        background: #eef2f5;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .content {
        max-width: 600px;
        margin: 50px auto;
        padding: 30px 40px;
        background: #ffffff;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 30px;
    }
    label {
        font-weight: 600;
        color: #555;
        display: block;
        margin-top: 15px;
    }
    input[type="text"],
    input[type="number"] {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 15px;
        box-sizing: border-box;
        transition: border-color 0.3s ease;
    }
    input[type="text"]:focus,
    input[type="number"]:focus {
        border-color: #007bff;
        outline: none;
    }
    button {
        width: 100%;
        padding: 12px;
        background: #007bff;
        color: #fff;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 25px;
        transition: background 0.3s ease;
    }
    button:hover {
        background: #0056b3;
    }
    .error-message {
        color: red;
        text-align: center;
        margin-top: 15px;
    }
    .back-link {
        display: block;
        text-align: center;
        margin-top: 20px;
        color: #007bff;
        text-decoration: none;
        font-size: 15px;
    }
    .back-link:hover {
        text-decoration: underline;
    }
</style>

<div class="content">
    <h2>Chỉnh sửa điểm</h2>

    <c:if test="${empty grade}">
        <p class="error-message">Không tìm thấy dữ liệu điểm.</p>
    </c:if>

    <c:if test="${not empty grade}">
        <form action="${pageContext.request.contextPath}/EditGrade" method="post">
            <input type="hidden" name="studentId" value="<%= grade.getStudentId() %>">
            <input type="hidden" name="subjectId" value="<%= grade.getSubjectId() %>">
            <input type="hidden" name="semesterId" value="<%= grade.getSemesterId() %>">

            <label>Mã sinh viên:</label>
            <input type="text" value="<%= grade.getStudentId() %>" disabled>

            <label>Tên sinh viên:</label>
            <input type="text" value="<%= grade.getStudentName() %>" disabled>

            <label>Lớp:</label>
            <input type="text" value="<%= grade.getClassName() %>" disabled>

            <label>Môn học:</label>
            <input type="text" value="<%= grade.getSubjectName() %>" disabled>

            <label>Học kỳ:</label>
            <input type="text" value="<%= grade.getSemesterName() %>" disabled>

            <label>Điểm giữa kỳ:</label>
            <input type="number" step="0.01" name="midTerm" value="<%= String.format("%.2f", grade.getMidTerm()) %>" required>

            <label>Điểm cuối kỳ:</label>
            <input type="number" step="0.01" name="finalExam" value="<%= String.format("%.2f", grade.getFinalExam()) %>" required>

            <button type="submit">Cập nhật</button>

            <c:if test="${not empty error}">
                <p class="error-message">${error}</p>
            </c:if>
        </form>
    </c:if>

    <a href="http://localhost:9999/ProjectPRJ301/AdminGradeController" class="back-link">Quay lại</a>
</div>
