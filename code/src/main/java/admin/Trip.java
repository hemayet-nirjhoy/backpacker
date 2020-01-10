/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

/**
 *
 * @author hemay
 */

import static admin.AdminLogin.DB_URL;
import back.Login;
import static back.Login.conn;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;


public class Trip {
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

    public Trip()throws ClassNotFoundException{
         try {
            //        Class.forName(DRIVER);
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.conn = DriverManager.getConnection(DB_URL,USER,PASS);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }  

    public String getTripId() {
        return tripId;
    }
    public void setTripId(String tripId) {
        this.tripId = tripId;
    }
    public String getTripSource() {
        return tripSource;
    }

    public void setTripSource(String tripSource) {
        this.tripSource = tripSource;
    }

    public String getTripDestination() {
        return tripDestination;
    }

    public void setTripDestination(String tripDestination) {
        this.tripDestination = tripDestination;
    }

    public String getTripDate() {
        return tripDate;
    }

    public void setTripDate(String tripDate) {
        this.tripDate = tripDate;
    }

    public String getTripTime() {
        return tripTime;
    }

    public void setTripTime(String tripTime) {
        this.tripTime = tripTime;
    }

    public String getTripBusType() {
        return tripBusType;
    }

    public void setTripBusType(String tripBusType) {
        this.tripBusType = tripBusType;
    }

    public String getTripBusBrand() {
        return tripBusBrand;
    }

    public void setTripBusBrand(String tripBusBrand) {
        this.tripBusBrand = tripBusBrand;
    }

    public String getTripAvailableSeat() {
        return tripAvailableSeat;
    }

    public void setTripAvailableSeat(String tripAvailableSeat) {
        this.tripAvailableSeat = tripAvailableSeat;
    }

    public String getTripBusOperator() {
        return tripBusOperator;
    }

    public void setTripBusOperator(String tripBusOperator) {
        this.tripBusOperator = tripBusOperator;
    }

    public String getTripFare() {
        return tripFare;
    }

    public void setTripFare(String tripFare) {
        this.tripFare = tripFare;
    }
    
    public boolean Scheduler(String source,String destination, String date, String time, String busType, String busBrand, String availableSeat,String operator, String fare) throws SQLException{
//        PreparedStatement st = conn.prepareStatement("INSERT INTO trip SET name=?,email=?,password=?,contact_no=?,gender=?,home_city=?,living_city=? WHERE id=?");

       
       Statement st = conn.createStatement();
       String sql = "INSERT INTO trip (source,destination,date,time,bus_type,company,available_seat,operator,fare) "+
               "VALUES('"+source+"','"+destination+"','"+date+"','"+time+"','"+busType+"', '"+busBrand+"' ,'"+availableSeat+"','"+operator+"','"+fare+"')";
       st.executeUpdate(sql);
       sql="SELECT * FROM trip ORDER by id DESC LIMIT 1";
       ResultSet id = st.executeQuery(sql);
       String currentTripId=null;
       while(id.next()){
           currentTripId=id.getString("id");
       }
       for(int i=0;i<Integer.parseInt(availableSeat);i++){
           String seatStatus="Not-Sold";
           String seat="A";
          for(int j=1;j<=4;j++){
              seat="A"+j;
              sql = "INSERT INTO booking (trip_id,customer_email,seat_no) "+
               "VALUES('"+currentTripId+"','"+seatStatus+"','"+seat+"')";
              st.executeUpdate(sql);
              i++;
          }
          for(int j=1;j<=4;j++){
              seat="B"+j;
              sql = "INSERT INTO booking (trip_id,customer_email,seat_no) "+
               "VALUES('"+currentTripId+"','"+seatStatus+"','"+seat+"')";
              st.executeUpdate(sql);
              i++;
          }
          if(Integer.parseInt(availableSeat)==9){
              break;
          }
          for(int j=1;j<=4;j++){
              seat="C"+j;
              sql = "INSERT INTO booking (trip_id,customer_email,seat_no) "+
               "VALUES('"+currentTripId+"','"+seatStatus+"','"+seat+"')";
              st.executeUpdate(sql);
              i++;
          }
           
       }

            return true;
    }
    public boolean editScheduler(String id,String source,String destination, String date, String time, String busType, String busBrand, String availableSeat,String operator, String fare) throws SQLException{
//        PreparedStatement st = conn.prepareStatement("INSERT INTO trip SET name=?,email=?,password=?,contact_no=?,gender=?,home_city=?,living_city=? WHERE id=?");

       
        PreparedStatement st = conn.prepareStatement("UPDATE trip SET source=?,destination=?,date=?,time=?,bus_type=?,company=?,available_seat=?,operator=?,fare=? WHERE id=?");
            st.setString(1,source);
            st.setString(2,destination);
            st.setString(3,date);
            st.setString(4,time);
            st.setString(5,busType);
            st.setString(6,busBrand);
            st.setString(7,availableSeat);
            st.setString(8, operator);
            st.setString(9,fare);
            st.setString(10, id);
            st.executeUpdate();

            return true;
    }
    
    public void setValue(Trip ob) throws SQLException{
        PreparedStatement st = conn.prepareStatement("SELECT * FROM trip where id=?");
        st.setString(1,ob.getTripId());
        ResultSet res = st.executeQuery();
        while(res.next()){
            ob.setTripSource(res.getString("source"));
            ob.setTripDestination(res.getString("destination"));
            ob.setTripDate(res.getString("date"));
            ob.setTripTime(res.getString("time"));
            ob.setTripBusType(res.getString("bus_type"));
            ob.setTripBusBrand(res.getString("company"));
            ob.setTripAvailableSeat(res.getString("available_seat"));
            ob.setTripBusOperator(res.getString("operator"));
            ob.setTripFare(res.getString("fare"));
        }
    }
    public boolean deleteTrip(String id) throws SQLException{
        PreparedStatement st = conn.prepareStatement("DELETE FROM trip where id=?");
        st.setString(1, id);
        st.executeUpdate();
        return true;
    }
    public ResultSet availableTrip(String source, String destination,String date) throws SQLException{
//          Statement st = conn.createStatement();
          PreparedStatement st = conn.prepareStatement("SELECT * FROM trip where date=? AND source='"+source+"' AND destination='"+destination+"'");
          st.setString(1, date);
//          st.setString(2,source);
//          st.setString(3,destination);
          
          ResultSet res = st.executeQuery();
          return res;
      }
    
    public ResultSet findTripById(String id) throws SQLException{
        PreparedStatement st = conn.prepareStatement("SELECT * FROM trip where id=?");
        st.setString(1,id);
        ResultSet res=st.executeQuery();
        return res;
    }
    public ResultSet findTripByCustomerEmail(String passengerEmail) throws SQLException{
        LocalDate todayDate = LocalDate.now();
        PreparedStatement st = conn.prepareStatement("SELECT * FROM trip,booking where customer_email=? and trip.date>?");
        st.setString(1,passengerEmail);
        st.setString(2, todayDate.toString());
        ResultSet res=st.executeQuery();
        
        return res;
    }
    
   /* public static void main(String[] argc) throws ClassNotFoundException, SQLException{
        String sql="SELECT * FROM trip ORDER by id DESC LIMIT 1";
        Trip ob= new Trip();
        Statement st=conn.createStatement();
       ResultSet id = st.executeQuery(sql);
       String currentTripId=null;
       while(id.next()){
           currentTripId=id.getString("id");
           System.out.println("Current ID: "+currentTripId);
       }
    }*/
}
