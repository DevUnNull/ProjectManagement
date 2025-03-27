<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarAdmin.jsp"/>
<%@ page import="java.util.List" %>
<%@ page import="dto.GradeDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách điểm sinh viên</title>
    <style>
        /* Style chung cho body */
        body {
            font-family: Arial, sans-serif;
            background: #eef2f5;
            margin: 0;
            padding: 0;
        }
        /* Nội dung chính sẽ đẩy sang phải theo chiều rộng của sidebar (giả sử 250px) */
        .content {
            width: calc(100% - 250px);
            margin-left: 250px;
            padding: 30px 40px;
            background: #fff;
            min-height: 100vh;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }
        /* Thanh tìm kiếm */
        .search-form {
            text-align: center;
            margin-bottom: 25px;
        }
        .search-form input[type="text"],
        .search-form select {
            padding: 8px;
            width: 200px;
            margin: 0 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }
        .search-form button {
            padding: 8px 16px;
            background: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        .search-form button:hover {
            background: #0056b3;
        }
        /* Bảng dữ liệu */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px 10px;
            text-align: left;
            font-size: 14px;
        }
        th {
            background: #f2f2f2;
            font-weight: 600;
        }
        tr:nth-child(even) {
            background: #fafafa;
        }
        /* Nút Update */
        .edit-btn {
            display: inline-block;
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 13px;
        }
        .edit-btn:hover {
            background-color: #0056b3;
        }
        /* Thông báo lỗi */
        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="content">
    <h2>Danh sách điểm sinh viên</h2>
    
    <!-- Thanh tìm kiếm: Nhập StudentID và chọn Học kỳ -->
    <form class="search-form" action="${pageContext.request.contextPath}/AdminGradeController" method="get">
        <input type="text" name="searchStudentId" placeholder="Nhập StudentID" value="${param.searchStudentId}">
        <select name="searchSemester">
            <option value="">--Chọn Học kỳ--</option>
            <c:forEach var="semester" items="${semesterList}">
                <option value="${semester.semesterName}" <c:if test="${param.searchSemester == semester.semesterName}">selected</c:if>>
                    ${semester.semesterName}
                </option>
            </c:forEach>
        </select>
        <button type="submit">Tìm kiếm</button>
    </form>
    
    <!-- Hiển thị thông báo lỗi nếu có -->
    <c:if test="${not empty errorMessage}">
        <div class="error-message">${errorMessage}</div>
    </c:if>
    
    <!-- Bảng điểm -->
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
            <th>Update</th>
        </tr>
        <c:choose>
            <c:when test="${not empty gradeList}">
                <c:forEach var="grade" items="${gradeList}">
                    <tr>
                        <td>${grade.studentId}</td>
                        <td>${grade.studentName}</td>
                        <td>${grade.className}</td>
                        <td>${grade.subjectName}</td>
                        <td>${grade.semesterName}</td>
                        <td>${grade.midTerm}</td>
                        <td>${grade.finalExam}</td>
                        <td>${grade.totalGrade}</td>
                        <td>
                            <a class="edit-btn" href="${pageContext.request.contextPath}/EditGrade?studentId=${grade.studentId}&subjectId=${grade.subjectId}&semesterId=${grade.semesterId}">
                                Update
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="9" style="text-align: center;">Không có dữ liệu</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </table>
</div>
</body>
</html>
