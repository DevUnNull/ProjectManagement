<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thông Tin Giáo Viên</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            .wrapper {
                display: flex;
                min-height: 100vh;
                max-width: 1200px;
                margin: 0 auto;
            }
            .sidebar {
                width: 250px;
                background: #fff;
                box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            }
            .content {
                flex: 1;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 40px;
                max-width: 800px;
            }
            .container {
                background: #fff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                width: 500px;
                margin: 0 auto;
            }
            h2 {
                color: #333;
                margin-bottom: 20px;
                text-align: center;
            }
            .form-group {
                display: flex;
                align-items: center;
                margin-bottom: 15px;
            }
            .form-group label {
                flex: 0 0 150px;
                font-weight: 600;
                color: #333;
                margin-right: 10px;
            }
            .form-group input {
                flex: 1;
                padding: 8px 10px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 4px;
                background: #f9f9f9;
            }
            .form-group input[readonly] {
                background: #e9ecef;
                cursor: not-allowed;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <div class="sidebar">
                <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
                <c:import url="SidebarTeacher.jsp"/>
            </div>
            <div class="content">
                <%@page import="models.Teacher" %>
                <%
                    Teacher te = (Teacher) session.getAttribute("teacher");
                    if (te == null) {
                        response.sendRedirect("Login.jsp");
                        return;
                    }
                %>
                <div class="container">
                    <h2>Thông Tin Giáo Viên</h2>
                    <form>
                        <div class="form-group">
                            <label>Mã Giáo Viên</label>
                            <input type="text" value="<%= te.getTeId() %>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Họ Tên</label>
                            <input type="text" value="<%= te.getTeName() %>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Năm Sinh</label>
                            <input type="text" value="<%= te.getBirthyear() %>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Giới Tính</label>
                            <input type="text" value="<%= te.getGender() %>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Địa Chỉ</label>
                            <input type="text" value="<%= te.getAddress() %>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Số Điện Thoại</label>
                            <input type="text" value="<%= te.getPhone() %>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="text" value="<%= te.getEmail() %>" readonly>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
