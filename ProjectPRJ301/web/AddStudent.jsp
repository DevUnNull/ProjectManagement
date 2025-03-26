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
/* Định dạng khu vực nội dung chính */
.content {
    display: flex;
    justify-content: center; /* Căn giữa theo chiều ngang */
    align-items: center; /* Căn giữa theo chiều dọc */
    height: 100vh; /* Chiều cao 100% màn hình */
}

/* Định dạng container của form */
.form-container {
    width: 400px;
    background: #f8f9fa;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    margin-top: 20px;
}

/* Tiêu đề form */
.form-container h2 {
    text-align: center;
    color: #333;
}

/* Định dạng nhóm nhập liệu */
.form-group {
    margin-bottom: 15px;
}

/* Label cho input */
.form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

/* Ô nhập liệu */
.form-group input[type="text"] {
    width: 96%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

/* Nút submit */
.form-group input[type="submit"] {
    width: 100%;
    padding: 10px;
    background: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

.form-group input[type="submit"]:hover {
    background: #0056b3;
}

/* Định dạng thông báo */
.alert {
    padding: 10px;
    margin-top: 15px;
    border-radius: 5px;
    font-weight: bold;
    text-align: center;
}

/* Màu sắc cho thông báo */
.alert.success {
    background: #d4edda;
    color: #155724;
    border: 1px solid #c3e6cb;
}

.alert.error {
    background: #f8d7da;
    color: #721c24;
    border: 1px solid #f5c6cb;
}

/* Link quay lại */
.form-container a {
    display: block;
    text-align: center;
    margin-top: 10px;
    color: #007bff;
    text-decoration: none;
}

.form-container a:hover {
    text-decoration: underline;
}


</style>
