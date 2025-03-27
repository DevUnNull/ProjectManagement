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
                <img src="IMAGE/avatar-trang-1.jpg" alt="Teacher">
                <p class="username"><c:if test="${not empty account}">
                    <div class="sidebar-user">
                        <p><strong>${account.username}</strong></p>
                    </div>
                </c:if></p>
            </div>

            <ul>
                <li><a href=""><i class="far fa-window-maximize"></i>Thông tin Lớp Học</a></li>
                <li><a href="ManageScores.jsp"><i class="fas fa-trophy"></i>Quản Lý Điểm</a></li>                
                <li><a href="viewInfoTeacher.jsp"><i class="fas fa-user"></i> Thông tin cá nhân</a></li>               
            </ul>

            <div class="logout">
                <a href="Login.jsp"><i class="fas fa-sign-out-alt"></i> Đăng Xuất</a>
            </div>
            

        </div>