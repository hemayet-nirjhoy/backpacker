<%-- 
    Document   : index
    Created on : Jul 16, 2019, 4:10:54 PM
    Author     : hemay
--%>

<%@page import="java.sql.*"%>
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
 
                    <div class="scheduledTripContent">
                        <div class="scheduledTripInfo">
                            <h1 style="text-align: center;">Available Trip</h1>
                            <table>
                                <tr>
                                <th><p>Id</p></th>
                                <th><p>Source</p></th>
                                <th><p>Destination</p></th>
                                <th><p>Date</p></th>
                                <th><p>Time</p></th>
                                <th><p>Bus Type</p></th>
                                <th><p>Company</p></th>
                                <th><p>Available Seat</p></th>
                                <th><p>Operator</p></th>
                                <th><p>Fare</p></th>
                                <th><p>Edit</p></th>
                                <th><p>Delete</p></th>
                                </tr>
                                <%
                                        ResultSet res = ob.availableTrip();
                                        while(res.next()){
                                                                                                         
                                    %>
                                <tr>
                                    <td><p><%=res.getString("id")%></p></td>
                                    <td><p><%=res.getString("source")%></p></td>
                                    <td><p><%=res.getString("destination")%></p></td>
                                    <td><p><%=res.getString("date")%></p></td>
                                    <td><p><%=res.getString("time")%></p></td>
                                    <td><p><%=res.getString("bus_type")%></p></td>
                                    <td><p><%=res.getString("company")%></p></td>
                                    <td><p><%=res.getString("available_seat")%></p></td>
                                    <td><p><%=res.getString("operator")%></p></td>
                                    <td><p><%=res.getString("fare")%></p></td>
                                    <td><a href="editTrip.jsp?editTripId=<%=res.getString("id")%>" style="color: #7b241c; text-decoration: none; font-weight: bold;"><p>Edit</p></a></td>
                                    <td><a href="deleteTrip.jsp?deleteTripId=<%=res.getString("id")%>" style="color:red;text-decoration: none;font-weight: bold;"><p>Delete</p></a></td>                                    
                                </tr>
                                <%} %>
                                <tr>
                            </table>
                        </div>
                    </div>
                    


<jsp:include page="footer.jsp"/>

