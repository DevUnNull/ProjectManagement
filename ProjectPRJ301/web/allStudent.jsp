<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarStudent.jsp"/>

        <div class="content">
        


    <body>
        <form action="student" method="get">
            <input type="hidden" name="action" value="allStudent"/>
        </form>
        <c:if test="${not empty allstudent}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Student Name</th>
                        <th>Gender</th>
                        <th>Birth Year</th>
                        <th>Address</th>
                        <th>Phone</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach var="s" items="${allstudent}">
                        <tr>
                            <td>${s.getStuId()}</td>
                            <td>${s.getStuName()}</td>
                            <td>${s.getGender()}</td>
                            <td>${s.getByear()}</td>
                            <td>${s.getAddress()}</td>
                            <td>${s.getPhone()}</td>
                            <td>${s.getEmail()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
 
        </div>

    </body>
</html>
