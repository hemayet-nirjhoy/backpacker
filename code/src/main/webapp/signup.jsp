<%-- 
    Document   : signup
    Created on : Jul 16, 2019, 4:12:30 PM
    Author     : hemay
--%>
<%@page import="back.Login"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp" />
    <%
        boolean mismatchPassword=false;
        String userName= "Enter name";
        String userEmail = "Enter Email";
        String password = "Password";
        String rePassword = "Retype Password";
        String userPhone = "11 Digit Mobile No";
        String userGender = null;
        String userHomeCity = "Home City";
        String userLivingCity = "Living City";
        if(request.getParameter("email")!=null && request.getParameter("pass")!=null && request.getParameter("repass")!=null&& request.getParameter("phone")!=null){
            
           userName = request.getParameter("name");
           userEmail = request.getParameter("email");
           password = request.getParameter("pass");
           rePassword = request.getParameter("repass");
           userPhone  = request.getParameter("phone");
           userGender = request.getParameter("gender");
           userHomeCity = request.getParameter("homecity");
           userLivingCity = request.getParameter("livingcity");
            
           out.println("Password: "+password);
           out.println("RE-Password: "+rePassword);
            
            if(password==rePassword){
                mismatchPassword = true;
                out.println("Mismatch Password: "+mismatchPassword);
                }
            else{
            
                out.println("This email and password is: "+userEmail+"\n "+password);
                Login ob = new Login();

                String temp = ob.Customer_signup(userName,userEmail,password,userPhone,userGender,userHomeCity, userLivingCity);

                if(temp=="Registration successful"){
                    response.sendRedirect("signin.jsp");
                }
                else{
                    out.print("Login Failed");
                } 
            }
        }   
    %>
    
    <div id ="gap">
                    <!--img src="img/back.png"/-->
<!--                    <img src="img/backpacker.png"  style="width: 260px; margin-left:40%"/>-->
     </div>
    
    <div class="content"> 
        <form action="">
                <div class="sign_up">
                    
                    <p style="">  <% 
                if(mismatchPassword==true){
                out.println("Password mismathc!");
                    %></p>
                        
                    <!--label for = "uname"><b>Name </b></label-->
                    <input type = "text" value="<% out.println(userName);%> " name ="name" required>
                    <!--label for = "email"><b>Email&nbsp;&nbsp;&nbsp;</b></label-->
                    <input type = "text" value="<% out.println(userEmail);%>"  name ="email" required><br>
                    <!--label for = "phone"><b>Phone</b></label-->
                    <select placeholder = "Enter region" name= "country">
                        <option>Bangladesh</option>
                        <option>India </option>
                        <option>Pakistan </option>
                        <option>U.S.A</option>	
                    </select>
                    <input type = "text" value="<% out.println(userPhone);%>" name ="phone" required><br>
                    <!--label for = "city"><b>Home City &nbsp;</b></label-->
                    <input type = "text" value="<% out.println(userHomeCity);%>" name ="homecity" required>
                    <!--label for = "city"><b>Living City &nbsp;</b></label><br-->
                    <input type = "text" value="<% out.println(userLivingCity);%>" name ="livingcity" required><br>
                    <!--label type = "text"><b>Gender</b></label--><br>
                    <input type = "radio" name ="gender" value="Male"> Male
                    <input type = "radio" name ="gender" value="Female"> Female
                    <input type = "radio" name ="gender" value="others"> Other's <br>
                    <!--label for= "psw"><b>Password</b></label--><br>
                    <input type = "password" placeholder="Enter Password" name="pass" required> 
                    <!--label for= "psw"><b>Retype Password</b></label-->
                    <input type = "password" placeholder="Re Enter Password" name="repass" required><br>
                    <button type="submit"><b>Submit</b></button>
                    
                    <% }
                    else{ %>
                    
                    <!--label for = "uname"><b>Name </b></label-->
                    <input type = "text" placeholder="<% out.println(userName);%> " name ="name" required>
                    <!--label for = "email"><b>Email&nbsp;&nbsp;&nbsp;</b></label-->
                    <input type = "text" placeholder="<% out.println(userEmail);%>"  name ="email" required><br>
                    <!--label for = "phone"><b>Phone</b></label-->
                    <select placeholder = "Enter region" name= "country">
                        <option>Bangladesh</option>
                        <option>India </option>
                        <option>Pakistan </option>
                        <option>U.S.A</option>	
                    </select>
                    <input type = "text" placeholder="<% out.println(userPhone);%>" name ="phone" required><br>
                    <!--label for = "city"><b>Home City &nbsp;</b></label-->
                    <input type = "text" placeholder="<% out.println(userHomeCity);%>" name ="homecity" required>
                    <!--label for = "city"><b>Living City &nbsp;</b></label><br-->
                    <input type = "text" placeholder="<% out.println(userLivingCity);%>" name ="livingcity" required><br>
                    <!--label type = "text"><b>Gender</b></label--><br>
                    <input type = "radio" name ="gender" value="Male"> Male
                    <input type = "radio" name ="gender" value="Female"> Female
                    <input type = "radio" name ="gender" value="others"> Other's <br>
                    <!--label for= "psw"><b>Password</b></label--><br>
                    <input type = "password" placeholder="Enter Password" name="pass" required> 
                    <!--label for= "psw"><b>Retype Password</b></label-->
                    <input type = "password" placeholder="Re Enter Password" name="repass" required><br>
                    <button type="submit"><b>Submit</b></button>
                       <% }
                        %>
                    
                </div> 
        </form>
    </div>
 <jsp:include page="footer.jsp" />
