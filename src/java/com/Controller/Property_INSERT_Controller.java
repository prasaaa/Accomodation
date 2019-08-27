/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controller;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Property_INSERT;
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
public class Property_INSERT_Controller extends HttpServlet {

    
    private static final long serialVersionUID = 1L;
    private String property_name,property_price,property_address,property_type,property_avalability;
    private Connection coni;
    private String query;
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         

        
        property_name=request.getParameter("property_name");
        property_price=request.getParameter("property_price");
        property_address=request.getParameter("property_address");
        property_type=request.getParameter("property_type");
        property_avalability=request.getParameter("property_avalability");
       
    
    
        
        coni = ConnectionManager.getConnection();
       
	query = "insert into property (property_name,property_price,property_address,property_type,property_avalability) values(?,?,?,?,?)";
		
		Property_INSERT pi =new Property_INSERT(coni,query,property_name,property_price,property_address,property_type,property_avalability);
		pi.insert_Property_table();
		
		
		
		RequestDispatcher dispatcher = getServletContext(). getRequestDispatcher("/owner_home.jsp");
        dispatcher.forward(request,response);
        }
    }
    public Property_INSERT_Controller() {
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
