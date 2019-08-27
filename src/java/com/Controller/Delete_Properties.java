
package com.Controller;

import com.DBConnection.ConnectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Prasad
 */
public class Delete_Properties extends HttpServlet {

    
    private static final long serialVersionUID = 1L;
    private String user_id;

    private Connection coni;
    private String query;

    public Delete_Properties() {
        super();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            Connection coni = null;

            int property_id = Integer.parseInt(request.getParameter("property_id"));

           
            try {
                //Class.forName("com.mysql.jdbc.Driver");
                coni = ConnectionManager.getConnection();
               

                String query = "delete from property where property_id=" + property_id;
                
                Statement stmt = coni.createStatement();

                System.out.println("stmt ok");
                int i = stmt.executeUpdate(query);

                System.out.println("excute ok");
                if (i > 0) {
                    System.out.println("redirect start");
                    response.sendRedirect("properties_list.jsp");
                    System.out.println("redirect end");
                }
                coni.close();
            } catch (Exception e) {

                e.printStackTrace();
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
