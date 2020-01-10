/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package back;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hemay
 */
public class Booking {
    String tripId;
    String tripSource;
    String tripDestination;
    String tripDate;
    String tripTime;
    String tripBusType;
    String tripBusBrand;
    String tripAvailableSeat;
    String tripBusOperator;
    String tripFare;
    
     public static  Connection conn = null;
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://localhost:3306/backpacker?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

   //  Database credentials
   static final String USER = "root";
   static final String PASS = "";

    public Booking()throws ClassNotFoundException{
         try {
            //        Class.forName(DRIVER);
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.conn = DriverManager.getConnection(DB_URL,USER,PASS);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 
    
    public ResultSet Seats(String tripId) throws SQLException{
        Statement st=conn.createStatement();
        String sql = "SELECT * FROM booking WHERE trip_id='"+tripId+"'";
        ResultSet res = st.executeQuery(sql);
        return res;
    }
    
    public boolean confirmTicket(String[] seats, String tripId, String passengerEmail ) throws SQLException{
        
        for(String seat:seats){
            PreparedStatement st=conn.prepareStatement("UPDATE booking SET customer_email=? WHERE trip_id=? AND seat_no=?");
            st.setString(1, passengerEmail);
            st.setString(2,tripId);
            st.setString(3,seat);
            st.executeUpdate();
        }
        return true;
    }
    
    public boolean cancelTicket(String seat, String tripId) throws SQLException{
        
            PreparedStatement st=conn.prepareStatement("UPDATE booking SET customer_email=? WHERE trip_id=? AND seat_no=?");
            st.setString(1, "Not-Sold");
            st.setString(2,tripId);
            st.setString(3,seat);
            st.executeUpdate();
        return true;
    }
    
    
} 
