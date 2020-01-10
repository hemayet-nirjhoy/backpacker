/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import back.Login;
import static back.Login.conn;
import static java.lang.System.out;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;

/**
 *
 * @author hemay
 */
public class AdminLogin {
    public static  Connection conn = null;
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://localhost:3306/backpacker?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

   //  Database credentials
   static final String USER = "root";
   static final String PASS = "";
   
   
   String adminName;
   String adminEmail;
   String adminId;

    public static Connection getConn() {
        return conn;
    }

    public static void setConn(Connection conn) {
        AdminLogin.conn = conn;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }
   
   
   
   public AdminLogin() throws ClassNotFoundException{
         try {
            //        Class.forName(DRIVER);
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.conn = DriverManager.getConnection(DB_URL,USER,PASS);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
   
       public String check_login(String email, String pass){
        try {
            /*Statement state = conn.createStatement();
            ResultSet res = state.executeQuery("SELECT * FROM `admin` WHERE name=\"Nirjhoy\" and pass=\"nothing\"");*/
            String userName="No-One";
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM `admin` WHERE email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet res = ps.executeQuery();
            while(res.next()){
                userName = res.getString("name");        
            }
            return userName;
        } catch (SQLException ex) {
            out.println("Statement doesnot created");
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "No-One";
    }
        public void userInfo(AdminLogin ob) throws SQLException{
        PreparedStatement st = conn.prepareStatement("SELECT * FROM `admin` WHERE email=?");
            st.setString(1, ob.getAdminEmail());
        ResultSet res = st.executeQuery();
        while(res.next()){
//            System.out.println("Name: "+res.getString("name"));
//            System.out.println("Email: "+res.getString("email"));
            String temp = res.getString("name").toString();
            System.out.println("This is test: "+temp);
            ob.setAdminId(res.getString("id").toString());
            ob.setAdminName(temp);
//            System.out.println("this is getter function: "+ getCustomerName());
            ob.setAdminEmail(res.getString("email").toString());
        }
        
    }
        
      public ResultSet availableTrip() throws SQLException{
          Statement st = conn.createStatement();
//          PreparedStatement st = conn.prepareStatement("SELECT * FROM trip where date>=? and time>=?");
//          st.setString(1, date);
//          st.setString(2, time);
          ResultSet res = st.executeQuery("SELECT * FROM trip ORDER BY date desc");
          return res;
      }

    
}
