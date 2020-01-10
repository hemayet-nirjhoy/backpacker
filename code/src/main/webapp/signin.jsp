<%-- 
    Document   : signin
    Created on : Jul 16, 2019, 4:11:57 PM
    Author     : hemayet
--%>

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
            
            String userEmail = request.getParameter("email");
            String password = request.getParameter("pass");
            
            //out.println("This email and password is: "+userEmail+"\n "+password);
            Login ob = new Login();
            
            
            temp=ob.check_login(userEmail,password);
//            out.println("This is temp: "+temp);
            if(temp!="No-One"){
                session.setAttribute("userName", temp);
                session.setAttribute("userEmail",userEmail);
                response.sendRedirect("profile.jsp");
            }
            else{
                //out.print("Login Failed");
            }           
        }   
    %>
              
    <div class="ProfileContent">
        <form action="signin.jsp" method="post">
                <div class="sign_in">
                    <!--label for = "uname"><b>Username</b></label><br-->
                    <input type = "text" placeholder="Enter Username" name ="email" required><br>
                    <!--label for= "psw"><b>Password</b></label><br-->
                    <input type = "password" placeholder="Enter Password" name="pass" required><br>                    
                    <button type="submit"><b>Login</b></button>
                    <p style="color:#b70000;"><%if(temp=="No-One"){out.println("Username or password is inCorrect!");} %></p>
                    <a href="signup.jsp" style="text-decoration: none; margin-left: 15px;"><p style=" color: #FFC300;">Do not have any account?</p></a>
                </div>           
            </form>
        </div>

        
        <jsp:include page="footer.jsp" />
