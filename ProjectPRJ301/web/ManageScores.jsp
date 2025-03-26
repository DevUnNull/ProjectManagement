<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, models.Student"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="SidebarTeacher.jsp"/>


<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Điểm Sinh Viên</title>
    <link rel="stylesheet" href="CSS/style.css">
    <script>
        function addScore(studentId) {
            let score = document.getElementById("score-" + studentId).value;
            fetch("teacher", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: "studentId=" + studentId + "&score=" + score
            }).then(response => response.text()).then(data => {
                if (data === "success") {
                    alert("Thêm điểm thành công!");
                    location.reload();
                } else {
                    alert("Thêm điểm thất bại!");
                }
            });
        }
    </script>
</head>
<body>

    <h2>Thêm Điểm Sinh Viên</h2>

    <table border="1">
        <tr>
            <th>Mã SV</th>
            <th>Họ và Tên</th>
            <th>Điểm</th>
            <th>Hành Động</th>
        </tr>
        <c:forEach var="student" items="${students}">
            <tr>
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td>
                    <c:choose>
                        <c:when test="${student.score == null}">
                            <input type="text" id="score-${student.id}" placeholder="Nhập điểm">
                        </c:when>
                        <c:otherwise>
                            ${student.score} <!-- Hiển thị điểm nếu đã có -->
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:if test="${student.score == null}">
                        <button onclick="addScore('${student.id}')">Thêm Điểm</button>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>
