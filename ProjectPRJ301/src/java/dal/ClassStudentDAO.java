    package dal;

    import java.sql.PreparedStatement;
    import java.sql.ResultSet;
    import java.util.ArrayList;
    import java.util.List;
    import models.Student;

    public class ClassStudentDAO extends DBContext {
        public ClassStudentDAO() {
            super();
        }

        public Student getStudent(int accId) {
            Student student = null;
            try {
                String sql = "SELECT * FROM Student WHERE Account_ID = ?";
                PreparedStatement stmt = connection.prepareStatement(sql);
                stmt.setInt(1, accId);
                ResultSet rs = stmt.executeQuery();
                if(rs.next()){
                    String id = rs.getString("Student_ID");
                    String name = rs.getString("Full_Name");
                    int dob = rs.getInt("BirthYear");
                    String gender = rs.getString("Gender");
                    String phone = rs.getString("Phone");
                    String email = rs.getString("Email");
                    String address = rs.getString("Address");
                    int claId = rs.getInt("Class_ID");
                    int acId = rs.getInt("Account_ID");  // Lấy đúng Account_ID từ DB

                    student = new Student(id, name, dob, gender, phone, email, address, claId, acId);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return student;
        }

        public List<Student> getStudentsByClass(int classId) {
            List<Student> studentList = new ArrayList<>();
            try {
                String sql = "SELECT * FROM Student WHERE Class_ID = ?";
                PreparedStatement stmt = connection.prepareStatement(sql);
                stmt.setInt(1, classId);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("Student_ID");
                    String name = rs.getString("Full_Name");
                    int dob = rs.getInt("BirthYear");
                    String gender = rs.getString("Gender");
                    String phone = rs.getString("Phone");
                    String email = rs.getString("Email");
                    String address = rs.getString("Address");
                    int acId = rs.getInt("Account_ID");

                    Student student = new Student(id, name, dob, gender, phone, email, address, classId, acId);
                    studentList.add(student);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return studentList;
        }

        public void addStudent(Student student) {
            try {
                String sql = "INSERT INTO Student (Student_ID, Full_Name, BirthYear, Gender, Phone, Email, Address, Class_ID, Account_ID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = connection.prepareStatement(sql);
                stmt.setString(1, student.getStuId());
                stmt.setString(2, student.getStuName());
                stmt.setInt(3, student.getBirthyear());
                stmt.setString(4, student.getGender());
                stmt.setString(5, student.getPhone());
                stmt.setString(6, student.getEmail());
                stmt.setString(7, student.getAddress());
                stmt.setInt(8, student.getClaId());
                stmt.setInt(9, student.getAccId()); // Thêm Account_ID vào DB
                stmt.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
