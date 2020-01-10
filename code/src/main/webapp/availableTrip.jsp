
<%@page import="back.Booking"%>
<%-- 
    Document   : availabelTrip
    Created on : Jul 27, 2019, 11:02:19 PM
    Author     : hemay
--%>

<%@page import="back.Customer"%>
<%@page import="admin.Trip"%>
<%@page import="java.sql.*"%>
<%@page import="admin.AdminLogin"%>
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
                
                <%
                    if(request.getParameter("tripcancelId")!=null){
                        String cancelId = request.getParameter("tripCancelId");
                        String seat = request.getParameter("cancelSeat");
                        Booking ct = new Booking();
                        
                        boolean ensureCancel = ct.cancelTicket(seat, cancelId);
                    }
                
                
                %>
 
                    <div class="availableTripContent">
                        <div class="availableTripInfo">
                            
                            <%
                                    Trip tp=new Trip();
                                    String source=request.getParameter("source");
                                    String destination = request.getParameter("destination");
                                    String date = request.getParameter("date");
                                    try{                          
                                        ResultSet res = tp.availableTrip(source,destination,date);
                                        if(res.next()==false){  %>
                                        <tr> 
                                        <h1 style="text-align: center;"> <%="No Trip Available!"%></h1>
                                        </tr>
                                    <%   }
                                        else{
                                            res.previous();
                                            %>
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
                                <th><p>Operation</p></th>
                                </tr>
                                <%
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
                                    <td><a href="book.jsp?tripId=<%= res.getString("id")%>"><p>Select Seat</p></a></td>
                                </tr>
                                <%} // end of while
                               }//else 
                             }catch(Exception ex){
                                }%>
                                <tr>
                            </table>
                        </div>
                    </div>
                    


<jsp:include page="footer.jsp"/>

