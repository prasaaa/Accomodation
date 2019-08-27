
package com.Controller;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.User_INSERT;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Prasad
 */
public class User_INSERT_Controller extends HttpServlet {
    
    

    private static final long serialVersionUID = 1L;
    private String user_firstName,user_lastName,user_gender,user_phone,user_email,user_password,user_type;
    private Connection coni;
    private String query;
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         

        
        user_firstName=request.getParameter("user_firstName");
        user_lastName=request.getParameter("user_lastName");
        user_gender=request.getParameter("user_gender");
        user_phone=request.getParameter("user_phone");
        user_email=request.getParameter("user_email");
        user_password=request.getParameter("user_password");
        user_type=request.getParameter("user_type");
    
    
        
        coni = ConnectionManager.getConnection();
       
	query = "insert into user (user_firstName,user_lastName,user_gender,user_phone,user_email,user_password,user_type) values(?,?,?,?,?,?,?)";
		
		User_INSERT ei =new User_INSERT(coni,query,user_firstName,user_lastName,user_gender,user_phone,user_email,user_password,user_type);
		ei.insert_User_table();
		
		
		
		RequestDispatcher dispatcher = getServletContext(). getRequestDispatcher("/login.jsp");
        dispatcher.forward(request,response);
        }
    }

    public User_INSERT_Controller() {
        super();
        
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
