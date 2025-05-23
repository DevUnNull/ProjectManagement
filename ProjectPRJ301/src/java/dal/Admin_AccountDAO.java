package dal;

import dal.DBContext;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Account;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class Admin_AccountDAO {

    public List<Account> getAllAccounts() {
        List<Account> list = new ArrayList<>();
        String query = "SELECT * FROM Account";
        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new Account(
                        rs.getInt("Account_ID"),
                        rs.getString("Username"),
                        rs.getString("Email"),
                        rs.getString("Password"),
                        rs.getInt("Role_ID")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Account getAccountByID(int accountID) {
        String query = "SELECT * FROM Account WHERE Account_ID = ?";
        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, accountID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Account(
                            rs.getInt("Account_ID"),
                            rs.getString("Username"),
                            rs.getString("Email"),
                            rs.getString("Password"),
                            rs.getInt("Role_ID")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // Trả về null nếu không tìm thấy
    }

    public boolean updateAccount(int id, String username, String email, String password, int roleId) {
        String query = "UPDATE Account SET Username=?, Email=?, Password=?, Role_ID=? WHERE Account_ID=?";
        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setInt(4, roleId);
            ps.setInt(5, id);

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0; // Trả về true nếu có ít nhất một dòng bị ảnh hưởng
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false; // Trả về false nếu có lỗi xảy ra
    }

    public void deleteAccount(int accountId) {
        String query = "DELETE FROM Account WHERE Account_ID = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, accountId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean insertAccount(String username, String email, String password, int roleID, HttpSession session) {
        String checkEmailSQL = "SELECT COUNT(*) FROM Account WHERE Email = ?";
        String insertSQL = "INSERT INTO Account (Account_ID, Username, Email, Password, Role_ID) "
                + "VALUES ((SELECT ISNULL(MAX(Account_ID), 0) + 1 FROM Account), ?, ?, ?, ?)";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement checkStmt = conn.prepareStatement(checkEmailSQL)) {

            checkStmt.setString(1, email);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                session.setAttribute("errorMessage", "❌ Email đã tồn tại, không thể thêm tài khoản mới!");
                return false;
            }

            try (PreparedStatement insertStmt = conn.prepareStatement(insertSQL)) {
                insertStmt.setString(1, username);
                insertStmt.setString(2, email);
                insertStmt.setString(3, password);
                insertStmt.setInt(4, roleID);

                int rowsInserted = insertStmt.executeUpdate();
                return rowsInserted > 0;
            }

        } catch (SQLException e) {
            session.setAttribute("errorMessage", "Không thể thêm tài khoản do lỗi hệ thống!");
            return false;
        }
    }


}
