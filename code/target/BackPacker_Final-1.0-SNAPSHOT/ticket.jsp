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
                
                <%
                                    Trip tp=new Trip();
                                    String tripId=request.getParameter("tripId");
//                                    ArrayList<String> seats= new ArrayList<String>();
//                                    seats.add(request.getParameter("seat"));
                                    String[] seats=request.getParameterValues("seat");
                                    String source=null;
                                    String destination= null;
                                    String time=null;
                                    String date = null;
                                   String operator=null;
                                   String busType=null;
                                   String busBrand=null;
                                   String fare= null;
                                    try{                          
                                        ResultSet tripRes = tp.findTripById(tripId);
                                        while(tripRes.next()){
                                            source=tripRes.getString("source");
                                            destination= tripRes.getString("destination");
                                            date=tripRes.getString("date");
                                            time=tripRes.getString("time");
                                            busBrand=tripRes.getString("company");
                                            busType=tripRes.getString("bus_type");
                                            operator=tripRes.getString("operator");
                                            fare=tripRes.getString("fare");
                                        }
                                        Booking bookticket= new Booking();
                                        boolean ensureBooking = bookticket.confirmTicket(seats, tripId, passenger.getCustomerEmail());
                                    }catch(Exception ex){
                                        out.println("Exception in Trip select: "+ ex);
                                    }
                                    
                                %>
                     <div class="ticketContent" >
                        <div class="ticketInfo" id="printTable">
                            <h1 style="text-align: center;">Confirmed Ticket - BACKPACKER</h1>
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
                                    <td><p>Seats</p></td>
                                    <td><p><% int countSeat=0;
                                        for(String seat:seats){
                                            countSeat++;
                                        out.print(seat+",\t");
                                    }
                                            %></p></td>
                                </tr>
                                <tr>
                                    <td><p>Total Fare </p></td>
                                  <td><p><% 
                                      int totalFare=Integer.parseInt(fare);
                                      out.println(countSeat*totalFare);
                                      %></p></td>
                                </tr>
                            </table>
                                
                        </div>
                                <button style="float: right;height: auto; text-align: center;border-radius: 2px; margin: 30px;" onclick="printData()">
                                    <p style="font-family: cursive;font-size: 20px; margin: 0px; padding: 0px;"><strong>Print Ticket</strong></p>
                                </button>

                                <script>
                                function printData()
                                {
                                   var divToPrint=document.getElementById("printTable");
                                   newWin= window.open("");
                                   newWin.document.write(divToPrint.outerHTML);
                                   newWin.print();
                                   newWin.close();
                                }
                                </script>
                    </div>
                                                   


<jsp:include page="footer.jsp"/>

