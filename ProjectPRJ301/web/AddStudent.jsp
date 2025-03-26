<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarAdmin.jsp"/>
<div class="content">



        <title>Thêm Sinh Viên</title>
        <style>
            .container {
                width: 50%;
                margin: 50px auto;
                padding: 20px;
                border: 1px solid #ddd;
                background-color: #f9f9f9;
                text-align: center;
            }
            form {
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            input, select {
                width: 80%;
                padding: 10px;
                margin: 5px 0;
                border: 1px solid #ddd;
                border-radius: 5px;
            }
            button {
                padding: 10px 20px;
                background-color: #28a745;
                color: white;
                border: none;
                cursor: pointer;
                margin-top: 10px;
            }
            button:hover {
                background-color: #218838;
            }
            .back-button {
                display: inline-block;
                margin-top: 10px;
                padding: 10px 20px;
                background-color: #dc3545;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }
            .back-button:hover {
                background-color: #c82333;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Thêm Sinh Viên</h2>
            <form action="AddStudentClass" method="post">
                <input type="hidden" name="claId" value="${param.classID}"> 

                <label>Mã Sinh Viên:</label>
                <input type="text" name="stuId" required>

                <label>Họ và Tên:</label>
                <input type="text" name="stuName" required>

                <label>Năm Sinh:</label>
                <input type="number" name="birthyear" required>

                <label>Giới Tính:</label>
                <select name="gender">
                    <option value="Nam">Nam</option>
                    <option value="Nữ">Nữ</option>
                </select>

                <label>Số Điện Thoại:</label>
                <input type="text" name="phone" required>

                <label>Email:</label>
                <input type="email" name="email" required>

                <label>Địa Chỉ:</label>
                <input type="text" name="address" required>

                <button type="submit">Thêm Sinh Viên</button>
            </form>

            <a href="ClassDetail?classID=${param.classID}" class="back-button">Quay lại</a>
        </div>


</div>

</body>
</html>
