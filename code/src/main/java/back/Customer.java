/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package back;

import static back.Login.DB_URL;
import static back.Login.conn;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

import static java.lang.System.out;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hemay
 */
public class Customer {
    String customerId;
    String customerName;
    String customerPhone;
    String customerEmail;
    String CustomerHomeCity;
    String CustomerLivingCity;
    String customerGender;
    
    /*************************/
     public static  Connection conn = null;
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://localhost:3306/backpacker?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

   //  Database credentials
   static final String USER = "root";
   static final String PASS = "";    
    /**************************/
   
   public Customer()throws ClassNotFoundException{
        try {
            //        Class.forName(DRIVER);
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.conn = DriverManager.getConnection(DB_URL,USER,PASS);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   public void setCustomerId(String customerId){
       this.customerId = customerId;
   }
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public void setCustomerHomeCity(String CustomerHomeCity) {
        this.CustomerHomeCity = CustomerHomeCity;
    }

    public void setCustomerLivingCity(String CustomerLivingCity) {
        this.CustomerLivingCity = CustomerLivingCity;
    }

    public void setCustomerGender(String customerGender) {
        this.customerGender = customerGender;
    }
    
    public String getCustomerId(){
        return customerId;
    }    

    public String getCustomerName() {
        return customerName;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public String getCustomerHomeCity() {
        return CustomerHomeCity;
    }

    public String getCustomerLivingCity() {
        return CustomerLivingCity;
    }

    public String getCustomerGender() {
        return customerGender;
    }
    
    
    
    public void userInfo(Customer ob) throws SQLException{
        PreparedStatement st = conn.prepareStatement("SELECT * FROM `customer` WHERE email=?");
            st.setString(1, ob.getCustomerEmail());
        ResultSet res = st.executeQuery();
        while(res.next()){
//            System.out.println("Name: "+res.getString("name"));
//            System.out.println("Email: "+res.getString("email"));
            String temp = res.getString("name").toString();
            System.out.println("This is test: "+temp);
            ob.setCustomerId(res.getString("id").toString());
            ob.setCustomerName(temp);
//            System.out.println("this is getter function: "+ getCustomerName());
            ob.setCustomerEmail(res.getString("email").toString());
            ob.setCustomerHomeCity(res.getString("home_city").toString());
            ob.setCustomerLivingCity(res.getString("living_city").toString());
            ob.setCustomerGender(res.getString("gender").toString());
            ob.setCustomerPhone(res.getString("contact_no").toString());
        }
        
    }
    
    public boolean updateProfile(String id,String name,String email, String password, String contact_no, String gender, String livingCity, String homeCity) throws SQLException{
        PreparedStatement st = conn.prepareStatement("UPDATE customer SET name=?,email=?,password=?,contact_no=?,gender=?,home_city=?,living_city=? WHERE id=?");
            st.setString(1,name);
            st.setString(2,email);
            st.setString(3,password);
            st.setString(4,contact_no);
            st.setString(5,gender);
            st.setString(6,homeCity);
            st.setString(7,livingCity);
            st.setString(8, id);
            st.executeUpdate();

                return true;
    }
    
    public ResultSet profilJourneyHistory(String email) throws SQLException{
        PreparedStatement st=conn.prepareStatement("SELECT * FROM trip, booking WHERE trip.id=booking.trip_id and customer_email=?");
        st.setString(1, email);
        ResultSet res = st.executeQuery();
        return res;
    }
    

/*    public static void main(String[] argc) throws SQLException{
        try {
            Customer ob = new Customer();
            ob.userInfo("nirjhoy@");
            System.out.println("Getter funcution: "+ ob.getCustomerName());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
    
    ************/
    
}
