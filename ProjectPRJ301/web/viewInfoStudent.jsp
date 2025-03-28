<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Student" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@page  import="models.Account" %>
<%
    Account account = (Account) session.getAttribute("account");
    if (account == null || account.getRoleId() != 3) {
        response.sendRedirect("Login.jsp"); // Chuyển về trang đăng nhập nếu không phải giáo viên
        return;
    }
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thông Tin Sinh Viên</title>
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
                max-width: 1200px; /* Độ rộng tối đa trang, bạn chỉnh theo ý muốn */
                margin: 0 auto;    /* Căn giữa toàn bộ .wrapper */
            }

            /* Sidebar style (import từ SidebarStudent.jsp) */
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
                margin: 0 auto; /* Căn giữa theo chiều ngang */
            }
            h2 {
                color: #333;
                margin-bottom: 20px;
                text-align: center;
            }
            /* Phong cách form hai cột: label (trái) - input (phải) */
            .form-group {
                display: flex;
                align-items: center;
                margin-bottom: 15px;
            }
            .form-group label {
                flex: 0 0 150px;   /* Độ rộng cố định cho nhãn */
                font-weight: 600;
                color: #333;
                margin-right: 10px;
            }
            .form-group input {
                flex: 1;          /* Ô nhập chiếm phần còn lại */
                padding: 8px 10px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 4px;
                background: #f9f9f9;
            }
            /* Ô input chỉ để đọc, không sửa được */
            .form-group input[readonly] {
                background: #e9ecef;
                cursor: not-allowed;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar -->
            <div class="sidebar">
                <c:import url="SidebarStudent.jsp"/>
            </div>
            <!-- Main content -->
            <div class="content">
                <%
                    Student stu = (Student) session.getAttribute("student");
                    if (stu == null) {
                        response.sendRedirect("Login.jsp");
                        return;
                    }
                %>
                <div class="container">
                    <h2>Thông Tin Sinh Viên</h2>
                    <form>
                        <div class="form-group">
                            <label>Mã Sinh Viên</label>
                            <input type="text" value="<%= stu.getStuId() %>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Họ Tên</label>
                            <input type="text" value="<%= stu.getStuName() %>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Năm Sinh</label>
                            <input type="text" value="<%= stu.getBirthyear() %>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Giới Tính</label>
                            <input type="text" value="<%= stu.getGender() %>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Địa Chỉ</label>
                            <input type="text" value="<%= stu.getAddress() %>" readonly>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
