
package com.Controller;

import com.DBConnection.ConnectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Prasad
 */
public class login_Controller extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private String user_email,user_password,user_type;
    private Connection coni;
    private String query;
    private PreparedStatement ps;
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            try {
                 user_email=request.getParameter("user_email");
                user_password=request.getParameter("user_password");
                
                String query = "select * from user where user_email=? and user_password=?"; 
                coni = ConnectionManager.getConnection();
                
                ps = coni.prepareStatement(query);
                
               
               
                      ps.setString(1, user_email);
                ps.setString(2, user_password);

                ResultSet rst = ps.executeQuery();

                if(rst.next()){
                    String type = rst.getString(user_type);
                if ("admin".equals(type)) {
                    response.sendRedirect("admin_home.jsp");
                    //System.out.println("Good morning.");
                } else if ("owners".equals(type)) {
                    response.sendRedirect("owners_home.jsp");
                    
                    //System.out.println("Good day.");
                } else {
                    //System.out.println("Good evening.");
                }
                }
                else{
                    
                }


                
                
            } catch (Exception e) {
            }
        }
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
