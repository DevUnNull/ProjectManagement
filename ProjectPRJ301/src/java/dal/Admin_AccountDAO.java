package dal;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Account;

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

    public void deleteAccount(int accountID) {
        String query = "DELETE FROM Account WHERE Account_ID = ?";
        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, accountID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Account getAccountByUsername(String username) {
        String query = "SELECT * FROM Account WHERE Username = ?";
        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, username);
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

    public static void main(String[] args) {
        Admin_AccountDAO dao = new Admin_AccountDAO();
        List<Account> list = dao.getAllAccounts();
        for (Account account : list) {
            System.out.println(account.getUsername());
        }
    }
}
