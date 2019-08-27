/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Prasad
 */
public class User_INSERT {
    private Connection c;
	public ResultSet rs;
	private PreparedStatement ps = null;
	private String query;
	private String user_firstName;
        private String user_lastName;
        private String user_gender;
        private String user_phone;
        private String user_email;
        private String user_password;
        private String user_type;
                        
         
   public User_INSERT(Connection c,String query,String user_firstName,String user_lastName,String user_gender,String user_phone,String user_email,String user_password,String user_type)
	{
		
		
		
		this.user_firstName=user_firstName;
                this.user_lastName=user_lastName;
                this.user_gender=user_gender;
                this.user_phone=user_phone;
                this.user_email=user_email;
                this.user_password=user_password;
                this.user_type=user_type;
               
		
		this.c = c;
		this.query = query;
	}

    public User_INSERT(Connection coni, String query, String property_name, String property_price, String property_address, String property_type, String property_avalability) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
   
   	public void insert_User_table()
	{
		try {
			ps =  c.prepareStatement(query);
                                               
			ps.setString(1,user_firstName);
                        ps.setString(2,user_lastName);
                        ps.setString(3,user_gender);
			ps.setString(4,user_phone);
                        ps.setString(5,user_email);
			ps.setString(6,user_password);
			ps.setString(7,user_type);
                        
			ps.execute();
			
		}catch (Exception e) {
                    
			System.out.println(e);
                        
		}
		
	
	}
         
         
         
         
}
