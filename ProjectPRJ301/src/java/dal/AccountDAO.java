/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import models.Account;

/**
 *
 * @author PHAM THAI AN
 */
public class AccountDAO extends DBContext{
    public AccountDAO(){
        super();
    }
    //Login function
    public Account login(String email, String password){
        Account account = null;
        try {
            String sql = "SELECT * FROM Account where email=? AND password=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                int id = rs.getInt("Account_ID");
                String name =  rs.getString("Username");
                String emailData =  rs.getString("Email");
                String passwordData =  rs.getString("Password");
                int role = rs.getInt("Role_ID");
                account = new Account(id, name, emailData, passwordData, role);
            }
            
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
        }
        return account;
    }
    public static void main(String[] args) {
        System.out.println(new AccountDAO().login("an@gmail.com", "123"));
    }
}
