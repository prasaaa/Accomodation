
package com.DatabaseHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Prasad
 */
public class Property_UPDATE {
    
        private Connection c;
	public ResultSet rs;
	private PreparedStatement ps = null;
	private String property_name,property_price,property_address,property_type,property_avalability;
        private String query;
    
    
        public Property_UPDATE(Connection c,String query,String property_name, String property_price, String property_address, String property_type, String property_avalability){
    
            this.property_name = property_name;
            this.property_price = property_price;
            this.property_address = property_address;
            this.property_type = property_type;
            this.property_avalability = property_avalability;
    
            
            this.c =  c;
            this.query = query;
}
    

    public void update_Property_table() {
        
		try {
			ps =  c.prepareStatement(query);
                                               
			ps.setString(1,property_name);
                        ps.setString(2,property_price);
                        ps.setString(3,property_address);
			ps.setString(4,property_type);
                        ps.setString(5,property_avalability);
			
                        
			ps.execute();
			
		}catch (Exception e) {
                    
			System.out.println(e);
                        
		}
		
	
    }
    
}
