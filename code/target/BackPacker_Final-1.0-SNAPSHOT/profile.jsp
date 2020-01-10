<%-- 
    Document   : index
    Created on : Jul 16, 2019, 4:10:54 PM
    Author     : hemay
--%>

<%@page import="back.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page= "header.jsp"/>
<jsp:include page= "navebar.jsp"/>

                <div id ="gap">
                    <!--img src="img/back.png"/-->
<!--                    <img src="img/backpacker.png"  style="width: 260px; margin-left:40%"/>-->
                </div>
                <%
                    Customer ob = new Customer();
                    try{
                        if(session.getAttribute("userName").toString()==null){
                            response.sendRedirect("signin.jsp");
                        }
                        String email= session.getAttribute("userEmail").toString();
                        ob.setCustomerEmail(email);
                        ob.userInfo(ob);
                       }catch (Exception ex){
                           response.sendRedirect("signin.jsp");
                       }                    
                %>
 
                    <div class="profileContent">
                        <div class="profileInfo">
                            <h1 style="text-align: center;"><% out.println(ob.getCustomerName());%></h1>
                            <table>
                                <tr>
                                    <td><p>Email </p></td>
                                    <td><p>:</p></td>
                                    <td><p><%=ob.getCustomerEmail()%></p></td>
                                    
                                </tr>
                                <tr>
                                    <td><p>Contact No </p></td>
                                    <td><p>:</p></td>
                                    <td><p><%=ob.getCustomerPhone() %></p></td>
                                </tr>
                                <tr>
                                    <td><p>Home City </p></td>
                                    <td><p>:</p></td>
                                    <td><p><%=ob.getCustomerHomeCity()%></p></td>
                                    
                                </tr>
                                <tr>
                                    <td><p>Living City</p></td>
                                    <td><p>:</p></td>
                                    <td><p><%=ob.getCustomerLivingCity()%></p></td>
                                </tr>
                                <tr>
                                    <td><p>Gender </p></td>
                                    <td><p>:</p></td>
                                    <td><p><%=ob.getCustomerGender()%></p></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    


<jsp:include page="footer.jsp"/>

