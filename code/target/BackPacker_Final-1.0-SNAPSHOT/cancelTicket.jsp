<%-- 
    Document   : ticket.jsp
    Created on : Jul 29, 2019, 7:16:41 AM
    Author     : hemay
--%>

<%@page import="back.Booking"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="admin.Trip"%>
<%@page import="back.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page= "header.jsp"/>
<jsp:include page= "navebar.jsp"/>

                <div id ="gap">
                    <!--img src="img/back.png"/-->
<!--                    <img src="img/backpacker.png"  style="width: 260px; margin-left:40%"/>-->
                </div>
                <%
                    Customer passenger = new Customer();
                    try{
                        if(session.getAttribute("userName").toString()==null){
                            response.sendRedirect("signin.jsp");
                        }
                        String email= session.getAttribute("userEmail").toString();
                        String userEmail=email;
                        String passengerName=session.getAttribute("userName").toString();
                        passenger.setCustomerEmail(email);
                        passenger.userInfo(passenger);
                       }catch (Exception ex){
                           response.sendRedirect("signin.jsp");
                       }                    
                %>
                <div class="ticketContent" >
                    
                <%
                                    Trip tp=new Trip();
                                    String tripId=null;
//                                    ArrayList<String> seats= new ArrayList<String>();
//                                    seats.add(request.getParameter("seat"));
                                    String seats=null;
                                    String source=null;
                                    String destination= null;
                                    String time=null;
                                    String date = null;
                                   String operator=null;
                                   String busType=null;
                                   String busBrand=null;
                                   String fare= null;
                                    try{                          
                                        ResultSet tripRes = tp.findTripByCustomerEmail(passenger.getCustomerEmail());
                                        while(tripRes.next()){
                                            source=tripRes.getString("source");
                                            destination= tripRes.getString("destination");
                                            date=tripRes.getString("date");
                                            time=tripRes.getString("time");
                                            busBrand=tripRes.getString("company");
                                            busType=tripRes.getString("bus_type");
                                            operator=tripRes.getString("operator");
                                            fare=tripRes.getString("fare");
                                            seats=tripRes.getString("seat_no");
                                            tripId=tripRes.getString("trip_id");
                                    %>
                            <div class="ticketInfo">
                            <h1 style="text-align: center;">Cancel Ticket</h1>
                            <table >
                                <tr>
                                    <td><p>Passenger Name </p></td>
                                  <td><p><%=passenger.getCustomerName() %></p></td>
                                </tr>
                                <tr>
                                    <td><p>Journey </p></td>
                                  <td><p><%=source%> to <%=destination%></p></td>
                                </tr>
                                <tr>
                                    <td><p>Date & Time</p></td>
                                    <td><p><% out.println(date+"\t"+time); %></p></td>
                                </tr>
                                <tr>
                                    <td><p>Bus</p></td>
                                   <td><p><% out.println(operator+",\t"+busBrand+",\t"+busType);%></p></td>
                                </tr>
                                <tr>
                                    <td><p>Seat</p></td>
                                    <td><p><% 
                                        out.println(seats);
                                            %></p></td>
                                </tr>
                                <tr>
                                    <td><p>Trip Id</p></td>
                                    <td><p><% 
                                        out.println(tripId);
                                            %></p></td>
                                </tr>
                                <tr>
                                    <td><p>Total Fare </p></td>
                                  <td><p><% 
                                      int totalFare=Integer.parseInt(fare);
                                      out.println(totalFare);
                                      %></p></td>
                                </tr>
                            </table>
                                
                        </div>
                                <form action="cancel.jsp" method="get">
                                    <input type="hidden" name="customer_email" value="<%=passenger.getCustomerEmail() %>"/>
                                    <input type="hidden" name="seat" value="<%=seats%>"/>
                                    <input type="hidden" name="tripId" value="<%=tripId %>"/>
                                <input type="submit" value="Cancel Ticket" style="float: right;height: auto; text-align: center;border-radius: 2px; margin: 30px;"/>                   
                                    
                                </form>   
                                    
                                 <%   }// end of while
                                    }
                                    catch(Exception ex){
                                        out.println("Exception in Trip select: "+ ex);
                                    }
                                    
                                %>
                     
                      
                    </div>
</div>
                                                   


<jsp:include page="footer.jsp"/>

