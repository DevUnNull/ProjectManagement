
import dal.ClassStudentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import models.Student;

@WebServlet(name = "AddStudentClass", urlPatterns = {"/AddStudentClass"})
public class AddStudentClass extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String stuId = request.getParameter("stuId");
            String stuName = request.getParameter("stuName");
            String classIdParam = request.getParameter("classID");

            if (classIdParam == null || classIdParam.isEmpty()) {
                request.setAttribute("msg", "Lỗi: Không tìm thấy Class_ID!");
                request.setAttribute("status", "error");
                request.getRequestDispatcher("AddStudent.jsp").forward(request, response);
                return;
            }
            int claId = Integer.parseInt(classIdParam);

            if (stuId == null || stuName == null || stuId.isEmpty() || stuName.isEmpty()) {
                request.setAttribute("msg", "Vui lòng nhập mã sinh viên và họ tên!");
                request.setAttribute("status", "warning");
                request.getRequestDispatcher("AddStudent.jsp").forward(request, response);
                return;
            }

            HttpSession session = request.getSession();
            Integer accIdObj = (Integer) session.getAttribute("accountId");
            int accId = (accIdObj != null) ? accIdObj : 0;

            ClassStudentDAO dao = new ClassStudentDAO();
            Student existingStudent = dao.getStudentById(stuId);

            if (existingStudent != null) {
                if (existingStudent.getClaId() != claId) {
                    dao.updateStudentClass(stuId, claId);
                    request.setAttribute("msg", "Sinh viên đã tồn tại, cập nhật lớp học!");
                    request.setAttribute("status", "warning");
                } else {
                    request.setAttribute("msg", "Sinh viên đã tồn tại trong lớp này!");
                    request.setAttribute("status", "error");
                }
                request.getRequestDispatcher("AddStudent.jsp").forward(request, response);
                return;
            }

            Student newStudent = new Student(stuId, stuName, 2000, "Nam", "", "", "", claId, accId);
            boolean success = dao.addStudent(newStudent);

            if (success) {
                request.setAttribute("msg", "Thêm sinh viên thành công!");
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("msg", "Lỗi: Mã sinh viên đã tồn tại!");
                request.setAttribute("status", "error");
            }
            request.getRequestDispatcher("AddStudent.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("msg", "Lỗi: Class_ID không hợp lệ!");
            request.setAttribute("status", "error");
            request.getRequestDispatcher("AddStudent.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "Lỗi hệ thống, vui lòng thử lại!");
            request.setAttribute("status", "error");
            request.getRequestDispatcher("AddStudent.jsp").forward(request, response);
        }
    }
}
