<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Import Sidebar để giữ nguyên sidebar như trang danh sách điểm -->
<c:import url="SidebarAdmin.jsp"/>
<%@ page import="dto.GradeDTO" %>
<%@page  import="models.Account" %>
<%
    Account account = (Account) session.getAttribute("account");
    if (account == null || account.getRoleId() != 1) {
        response.sendRedirect("Login.jsp"); // Chuyển về trang đăng nhập nếu không phải giáo viên
        return;
    }
%>

<%
    GradeDTO grade = (GradeDTO) request.getAttribute("grade");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chỉnh sửa điểm</title>
        <style>
            /* Style chung cho body */
            body {
                font-family: Arial, sans-serif;
                background: #eef2f5;
                margin: 0;
                padding: 0;
            }

            /* 
             * Chừa khoảng trống cho sidebar 250px
             * => phần nội dung (content) sẽ dạt sang phải 
             */
            .content {
                width: calc(100% - 250px); /* tính toán phần còn lại cho content */
                margin-left: 250px;        /* đẩy sang phải 250px */
                padding: 30px 40px;        /* khoảng cách xung quanh nội dung */
                background: #fff;          /* nền trắng cho phần content */
                min-height: 100vh;         /* chiều cao tối thiểu bằng toàn màn hình */
            }

            /* Khung chứa form */
            .form-container {
                max-width: 600px;          /* chiều rộng tối đa của form */
                margin: 0 auto;            /* căn giữa form trong content */
                background: #ffffff;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
                padding: 30px 40px;
            }

            h2 {
                text-align: center;
                color: #333;
                margin-bottom: 25px;
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
                display: inline-block;
                margin-top: 20px;
                color: #007bff;
                text-decoration: none;
                font-size: 15px;
            }
            .back-link:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="content">
            <div class="form-container">
                <h2>Chỉnh sửa điểm</h2>

                <!-- Trường hợp không tìm thấy grade -->
                <c:if test="${empty grade}">
                    <p class="error-message">Không tìm thấy dữ liệu điểm.</p>
                </c:if>

                <!-- Trường hợp tìm thấy grade -->
                <c:if test="${not empty grade}">
                    <form action="${pageContext.request.contextPath}/EditGrade" method="post">
                        <!-- Hidden fields để truyền StudentID, SubjectID, SemesterID -->
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
                        <input type="number" step="0.01" name="midTerm"
                               value="<%= String.format("%.2f", grade.getMidTerm()) %>"
                               required>

                        <label>Điểm cuối kỳ:</label>
                        <input type="number" step="0.01" name="finalExam"
                               value="<%= String.format("%.2f", grade.getFinalExam()) %>"
                               required>

                        <button type="submit">Cập nhật</button>

                        <!-- Nếu có lỗi cập nhật -->
                        <c:if test="${not empty error}">
                            <p class="error-message" style="color: red; font-weight: bold;">${error}</p>
                        </c:if>

                    </form>
                </c:if>

                <br>
                <!-- Link quay lại trang danh sách điểm -->
                <a href="${pageContext.request.contextPath}/AdminGradeController" class="back-link">Quay lại</a>
            </div>
        </div>
    </body>
</html>
