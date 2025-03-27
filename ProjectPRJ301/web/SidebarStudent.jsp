<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu Bên Trái</title>
        <link rel="stylesheet" href="CSS/Menu.css">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <div class="sidebar">
            <!-- Thông tin tài khoản -->
            <div class="user-info">
                <img src="IMAGE/avatar-trang-1.jpg" alt="Student">
                <p class="username">

                <c:if test="${not empty account}">
                    <div class="sidebar-user">
                        <p><strong>${account.username}</strong></p>
                    </div>
                </c:if></p>
            </div>

            <ul>
                <li><a href="viewInfoStudent.jsp"><i class="fas fa-user"></i></i> Thông tin cá nhân</a></li>
                <li><a href="class.jsp"><i class="far fa-window-maximize"></i>Lớp Học</a></li>
                <li><a href="grade.jsp"><i class="fas fa-trophy"></i>Xem Điểm</a></li>                
            </ul>


            <div class="logout">
                <a href="Login.jsp"><i class="fas fa-sign-out-alt"></i> Đăng Xuất</a>
            </div>
           

        </div>
