/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package back;

import static java.lang.System.out;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

public class Login {
    public static  Connection conn = null;
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://localhost:3306/backpacker?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

   //  Database credentials
   static final String USER = "root";
   static final String PASS = "";
    
    public Login() throws ClassNotFoundException{
        try {
            //        Class.forName(DRIVER);
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.conn = DriverManager.getConnection(DB_URL,USER,PASS);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public String check_login(String name, String pass){
        try {
            /*Statement state = conn.createStatement();
            ResultSet res = state.executeQuery("SELECT * FROM `admin` WHERE name=\"Nirjhoy\" and pass=\"nothing\"");*/
            String userName="No-One";
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM `customer` WHERE email=? and password=?");
            ps.setString(1, name);
            ps.setString(2, pass);
            ResultSet res = ps.executeQuery();
            while(res.next()){
                userName = res.getString("name").toString();
            }
            return userName;
        } catch (SQLException ex) {
            out.println("Statement doesnot created");
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "No-One";
    }
    
    public String Customer_signup(String name, String email, String pass, String phone, String gender, String homecity, String livingcity) throws SQLException{
        String msg = "Registration successful";
       /* PreparedStatement ps = conn.prepareStatement("INSERT INTO customer (name,email,password,gender,contact_no,home_city,living_city) values(?,?,?,?,?,?,?)");
//        ps.setString(1,"");
        ps.setString(1,name);
        ps.setString(2,email);
        ps.setString(3, pass);
        ps.setString(4, phone);
        ps.setString(5,gender);
        ps.setString(6,homecity);
        ps.setString(7, livingcity);
        ps.executeUpdate();
        return "Sucessfully Registered.";  */  
       Statement st = conn.createStatement();
       String sql = "INSERT INTO customer (name,email,password,contact_no,gender,home_city,living_city) "+
               "VALUES('"+name+"','"+email+"','"+pass+"','"+phone+"','"+gender+"', '"+homecity+"' ,'"+livingcity+"')";
       st.executeUpdate(sql);
       return msg;
       
    }
    
    public void SampleQuery(){
        Statement st = null;
        try {
            st = conn.createStatement();
            ResultSet set = st.executeQuery("Select * from admin");
            while(set.next()){
                System.out.println("Name: "+set.getString("name"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static String check(){
//        System.out.println("This is just checking!");
        return "This is working";
    }
    
/*   public static void main(String[] argc){
        Login ob= new Login();
        ob.SampleQuery();
        
        
    }*/
    
}

