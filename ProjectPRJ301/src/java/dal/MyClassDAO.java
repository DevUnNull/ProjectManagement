package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import models.MyClass;  // Import model MyClass

/**
 * Lớp MyClassDAO thực hiện các thao tác truy vấn liên quan đến bảng "class" trong cơ sở dữ liệu.
 */
public class MyClassDAO extends DBContext {
    
    // Constructor: gọi super() để khởi tạo kết nối từ DBContext
    public MyClassDAO(){
        super();
    }
    
    /**
     * Phương thức lấy toàn bộ danh sách lớp học từ bảng "class".
     * @return List<MyClass> - danh sách các đối tượng MyClass
     */
    public List<MyClass> getAllClass(){
        List<MyClass> classList = new ArrayList<>();
        
        try {
            // Truy vấn SQL lấy tất cả dữ liệu từ bảng class
            String sql = "SELECT * FROM class";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            // Duyệt qua từng dòng dữ liệu trả về
            while (rs.next()) {
                int id = rs.getInt("Class_ID"); // Giả sử Class_ID là số nguyên
                String name = rs.getString("Class_Name");
                int departmentId = rs.getInt("Department_ID");
                
                // Tạo đối tượng MyClass và thêm vào danh sách
                MyClass myClass = new MyClass(id, name, departmentId);
                classList.add(myClass);
            }
            
            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();  // In lỗi ra console để dễ debug
        }
        
        return classList;
    }
    
    /**
     * Phương thức thêm một lớp học mới vào database.
     * @param myClass đối tượng MyClass chứa dữ liệu lớp học cần thêm.
     */
    public void insertClass(MyClass myClass) {
        String sql = "INSERT INTO class (Class_ID, Class_Name, Department_ID) VALUES (?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            // Sử dụng đúng kiểu dữ liệu: Class_ID là int, Class_Name là String, Department_ID là int
            stmt.setInt(1, myClass.getClaId());
            stmt.setString(2, myClass.getClaName());
            stmt.setInt(3, myClass.getDepId());
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
