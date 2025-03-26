/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers;

import dal.MyClassDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.MyClass;

/**
 *
 * @author Admin
 */
public class ClassManagement extends HttpServlet {
   

    

  
   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Tạo đối tượng DAO và lấy danh sách lớp học
        MyClassDAO dao = new MyClassDAO();
        List<MyClass> classList = dao.getAllClass();
        
        request.setAttribute("classList", classList);
        request.getRequestDispatcher("ClassManagement.jsp").forward(request, response);
        
        
    }


}
