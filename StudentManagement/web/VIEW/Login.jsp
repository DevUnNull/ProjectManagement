<%-- 
    Document   : Login
    Created on : Mar 14, 2025, 10:11:43 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quản Lý Sinh Viên</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../CSS/Login.css">
    <div class="logo-container">
        <a href="http://localhost:9999/StudentManagement" target="_blank">
            <img src="../IMAGE/fptulogo-removebg-preview.png" alt="FPT Logo" class="logo"/>
        </a>
    </div>

    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="wrapper">
        <form action="login" method="post">
            <h1>Login</h1>

            <div class="input-box">
                <input type="text" placeholder="Email" name="email" required>
                <i class='bx bx-user-circle'></i>
            </div>

            <div class="input-box">
                <input type="password" placeholder="Password" name="password" required>
                <i class='bx bxs-lock-open'></i>
            </div>

            <div class="remember-forgot">
                <label><input type="checkbox"> Remember password</label>
                <a href="#">Forgot password?</a>
            </div>

            <button type="submit" class="btn">Đăng Nhập</button>

            <!--            <div class="register-link">
                            <p>Don't have an account? <a href="http://localhost:9999/PROJECT/register">Register</a></p>
                        </div>-->
            <span style="color: red">${mes}</span>

        </form>
    </div>
</body>
</html>

