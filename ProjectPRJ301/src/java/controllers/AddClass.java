    package controllers;

    import dal.MyClassDAO;
    import java.io.IOException;
    import jakarta.servlet.ServletException;
    import jakarta.servlet.annotation.WebServlet;
    import jakarta.servlet.http.HttpServlet;
    import jakarta.servlet.http.HttpServletRequest;
    import jakarta.servlet.http.HttpServletResponse;
    import models.MyClass;

    @WebServlet("/AddClass")
    public class AddClass extends HttpServlet {

        // Nếu cần hỗ trợ cả GET thì chuyển tiếp đến form nhập liệu
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            request.getRequestDispatcher("AddClass.jsp").forward(request, response);
        }

        // Xử lý dữ liệu từ form khi người dùng bấm submit (POST)
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            // Lấy dữ liệu từ form
            String classIDStr = request.getParameter("classID");
            String className = request.getParameter("className");
            String departmentStr = request.getParameter("departmentID");

            try {
                int classID = Integer.parseInt(classIDStr.trim());
                int depID = Integer.parseInt(departmentStr.trim());

                MyClassDAO dao = new MyClassDAO();

                // Kiểm tra nếu lớp học đã tồn tại
                if (dao.isClassExisted(className)) {
                    request.setAttribute("error", "Lớp học đã tồn tại");
                    request.getRequestDispatcher("classManagement").forward(request, response);
                    return;
                }

                // Nếu chưa tồn tại thì thêm vào
                MyClass myClass = new MyClass(classID, className, depID);
                dao.insertClass(myClass);

                response.sendRedirect("classManagement");
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Dữ liệu nhập không hợp lệ!");
                request.getRequestDispatcher("classManagement").forward(request, response);
            }
        }

    }
