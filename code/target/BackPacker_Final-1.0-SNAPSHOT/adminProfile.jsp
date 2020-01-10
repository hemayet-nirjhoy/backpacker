<%-- 
    Document   : index
    Created on : Jul 16, 2019, 4:10:54 PM
    Author     : hemay
--%>

<%@page import="admin.AdminLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page= "adminHeader.jsp"/>
<jsp:include page= "adminNavebar.jsp"/>

                <div id ="gap">
                    <!--img src="img/back.png"/-->
<!--                    <img src="img/backpacker.png"  style="width: 260px; margin-left:40%"/>-->
                </div>
                <%
                    AdminLogin ob = new AdminLogin();
                    try{
                        if(session.getAttribute("adminName").toString()==null){
                            response.sendRedirect("adminSignin.jsp");
                        }
                        String email= session.getAttribute("adminEmail").toString();
                        ob.setAdminEmail(email);
                        ob.userInfo(ob);
                       }catch (Exception ex){
                           response.sendRedirect("adminSignin.jsp");
                       }                    
                %>
 
                    <div class="profileContent">
                        <div class="profileInfo">
                            <h1 style="text-align: center;"><% out.println(ob.getAdminName());%></h1>
                            <table>
                                <tr>
                                    <td><p>Email </p></td>
                                    <td><p>:</p></td>
                                  <td><p><%=ob.getAdminEmail()%></p></td>
                                </tr>
                                <tr>
                            </table>
                        </div>
                    </div>
                    


<jsp:include page="footer.jsp"/>

