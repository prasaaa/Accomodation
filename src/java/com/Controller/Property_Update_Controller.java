package com.Controller;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Property_INSERT;
import com.DatabaseHandle.Property_UPDATE;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Prasad
 */
public class Property_Update_Controller extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private String property_name, property_price, property_address, property_type, property_avalability;
    private Connection coni;
    private String query;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            property_name = request.getParameter("property_name");
            property_price = request.getParameter("property_price");
            property_address = request.getParameter("property_address");
            property_type = request.getParameter("property_type");
            property_avalability = request.getParameter("property_avalability");

            HttpSession se = request.getSession();
            int property_id = (Integer) se.getAttribute("property_id");

            coni = ConnectionManager.getConnection();

            query = "update into property (property_name,property_price,property_address,property_type,property_avalability) values(?,?,?,?,?)";

            Property_UPDATE pu = new Property_UPDATE(coni, query, property_name, property_price, property_address, property_type, property_avalability);
            pu.update_Property_table();

            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/owner_home.jsp");
            dispatcher.forward(request, response);
        }
    }

    public Property_Update_Controller() {
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
