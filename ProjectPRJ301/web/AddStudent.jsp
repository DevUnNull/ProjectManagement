<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarAdmin.jsp"/>

<div class="content">
    <div class="form-container">
        <h2>Thêm Sinh Viên Mới</h2>
        <form action="AddStudentClass" method="post">
            <div class="form-group">
                <label for="stuId">Mã sinh viên:</label>
                <input type="text" name="stuId" id="stuId" required>
            </div>

            <input type="hidden" name="classID" value="${param.classID}">

            <div class="form-group">
                <input type="submit" value="Thêm sinh viên">
            </div>
        </form>

        <!-- Hiển thị thông báo -->
        <c:if test="${not empty requestScope.msg}">
            <div class="alert ${requestScope.status}">
                <strong>Thông báo:</strong> <c:out value="${requestScope.msg}"/>
            </div>
        </c:if>

        <a href="ClassDetail?classID=${param.classID}">Quay lại danh sách sinh viên</a>
    </div>
</div>

<style>
/* Định dạng container chứa nội dung */
.content {
    margin-left: 250px; /* Giữ khoảng cách với sidebar */
    padding: 20px;
    background-color: #f4f4f4;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

/* Định dạng form thêm sinh viên */
.form-container {
    background: #ffffff;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.15);
    width: 100%;
    max-width: 450px;
    text-align: center;
}

.form-container h2 {
    color: #333;
    font-size: 24px;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 20px;
    text-align: left;
}

label {
    font-weight: bold;
    display: block;
    margin-bottom: 5px;
}

input[type="text"] {
    width: 95%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 16px;
}

input[type="submit"] {
    width: 100%;
    padding: 14px;
    background-color: #007bff;
    border: none;
    color: white;
    font-size: 18px;
    border-radius: 6px;
    cursor: pointer;
    transition: background 0.3s;
    margin-top: 10px;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

.alert {
    padding: 12px;
    border-radius: 6px;
    margin-top: 15px;
    font-size: 14px;
    text-align: center;
}

.alert.success {
    background-color: #d4edda;
    color: #155724;
    border: 1px solid #c3e6cb;
}

.alert.error {
    background-color: #f8d7da;
    color: #721c24;
    border: 1px solid #f5c6cb;
}

a {
    display: block;
    text-align: center;
    margin-top: 20px;
    text-decoration: none;
    color: #007bff;
    font-size: 16px;
}

a:hover {
    text-decoration: underline;
}
</style>
