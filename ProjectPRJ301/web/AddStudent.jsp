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
            <div class="form-group">
                <label for="stuName">Họ và tên:</label>
                <input type="text" name="stuName" id="stuName" required>
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

<!-- CSS cập nhật cho các trạng thái thông báo -->
<style>
    .alert.success {
        color: green;
    }
    .alert.error {
        color: red;
    }
    .alert.warning {
        color: orange;
    }
</style>
