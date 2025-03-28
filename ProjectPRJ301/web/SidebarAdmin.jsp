<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@page  import="models.Account" %>
<%
    Account account = (Account) session.getAttribute("account");
    if (account == null || account.getRoleId() != 1) {
        response.sendRedirect("Login.jsp"); // Chuyển về trang đăng nhập nếu không phải giáo viên
        return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang Quản Lý</title>
        <link rel="stylesheet" href="CSS/Menu.css">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Import jQuery -->
    </head>
    <body>

        <div class="sidebar">
            <!-- Thông tin tài khoản -->
            <div class="user-info">
                <img src="IMAGE/avatar-trang-1.jpg" alt="Admin">
                <p class="username"><c:if test="${not empty account}">
                    <div class="sidebar-user">
                        <p><strong>${account.username}</strong></p>
                    </div>
                </c:if></p>
            </div>

            <ul>
                <li><a href="http://localhost:9999/ProjectPRJ301/Admin_AccountController"><i class="fas fa-users-cog"></i> Quản Lý Tài Khoản</a></li>
                <li><a href="http://localhost:9999/ProjectPRJ301/classManagement"><i class="fas fa-school"></i> Quản Lý Lớp Học</a></li>
                <li><a href="http://localhost:9999/ProjectPRJ301/Admin_StudentController"><i class="fas fa-list-alt"></i> Quản Lý Sinh Viên</a></li>
                <li><a href="http://localhost:9999/ProjectPRJ301/Admin_TeacherController" ><i class="far fa-window-maximize"></i> Quản Lý Giáo Viên</a></li>
                <li><a href="http://localhost:9999/ProjectPRJ301/AdminGradeController"><i class="fas fa-trophy"></i> Quản Lý Điểm</a></li>
            </ul>

            <div class="logout">
                <a href="Login.jsp"><i class="fas fa-sign-out-alt"></i> Đăng Xuất</a>
            </div>


        </div>

        <!-- Khu vực hiển thị nội dung động -->
        <!--    <div id="contentArea">
                <h2>Chào mừng đến với Trang Quản Lý</h2>
                <p>Hãy chọn một chức năng từ menu bên trái.</p>
            </div>-->

        <script>
            function loadContent(page) {
                $.ajax({
                    url: page,
                    type: "GET",
                    success: function (data) {
                        $("#contentArea").html(data); // Chèn nội dung vào #contentArea
                    },
                    error: function () {
                        alert("Không thể tải nội dung. Vui lòng thử lại!");
                    }
                });
            }
        </script>

    </body>
</html>
