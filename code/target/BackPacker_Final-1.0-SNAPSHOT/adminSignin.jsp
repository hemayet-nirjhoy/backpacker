<%-- 
    Document   : signin
    Created on : Jul 16, 2019, 4:11:57 PM
    Author     : hemayet
--%>

<%@page import="admin.AdminLogin"%>
<%@page import="back.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page = "header.jsp" />
        <div id ="gap">
            <!--img src="img/back.png"/>
            <img src="img/backpacker.png"  style="width: 260px; margin-left:40%"/-->
        </div>
        
    <%
        String temp = null  ;
        if(request.getParameter("email")!=null && request.getParameter("pass")!=null){
            
            String adminEmail = request.getParameter("email");
            String adminPassword = request.getParameter("pass");
            
            //out.println("This email and password is: "+userEmail+"\n "+password);
            AdminLogin ob = new AdminLogin();
            
            
            temp=ob.check_login(adminEmail,adminPassword);
            String check="No-One";
//            out.println("This is temp: "+temp);
            if(temp.compareTo(check)!=0){
                session.setAttribute("adminName", temp);
                session.setAttribute("adminEmail",adminEmail);
                response.sendRedirect("adminProfile.jsp");
            }
            else{
                //out.print("Login Failed");
            }           
        }   
    %>
              
    <div class="ProfileContent">
        <form action="adminSignin.jsp" method="post">
                <div class="sign_in">
                    <!--label for = "uname"><b>Username</b></label><br-->
                    <input type = "text" placeholder="Admin Email" name ="email" required><br>
                    <!--label for= "psw"><b>Password</b></label><br-->
                    <input type = "password" placeholder="Enter Password" name="pass" required><br>                    
                    <button type="submit"><b>Login</b></button>
                    <p style="color:#b70000;"><%if(temp=="No-One"){out.println("Username or password is inCorrect!");} %></p>
                    <a href="signup.jsp" style="text-decoration: none; margin-left: 15px;"><p style=" color: #FFC300;">Request to the authority for any Problem.</p></a>
                </div>           
            </form>
        </div>

        
        <jsp:include page="footer.jsp" />
