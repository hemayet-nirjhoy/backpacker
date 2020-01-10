<%-- 
    Document   : index
    Created on : Jul 16, 2019, 4:10:54 PM
    Author     : hemay
--%>

<%@page import="admin.Trip"%>
<%@page import="admin.AdminLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page= "header.jsp"/>
<jsp:include page= "adminNavebar.jsp"/>

<div id ="gap">
    <!--img src="img/back.png"/-->
<!--                    <img src="img/backpacker.png"  style="width: 260px; margin-left:40%"/>-->
</div>
<%
    Trip ob = new Trip();
    String tripId=null;
    try{
        tripId= request.getParameter("editTripId");
        if(session.getAttribute("adminName").toString()==null){
            response.sendRedirect("adminSignin.jsp");
        }
        String email= session.getAttribute("adminEmail").toString();
       }catch (Exception ex){
           response.sendRedirect("adminSignin.jsp");
       }                 
%>

<%    //////////// Update profile
    ob.setTripId(tripId);
    ob.setValue(ob);
    if(request.getParameter("editSchedule")!=null){
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String busType = request.getParameter("busType");
        String busBrand = request.getParameter("busBrand");
        String availableSeat = request.getParameter("availableSeat");
        String operator = request.getParameter("busOperator");
        String fare = request.getParameter("fare");        
        
        
        boolean ensureSchedule = ob.editScheduler( ob.getTripId(),source, destination, date, time, busType, busBrand, availableSeat, operator,fare);
        if(ensureSchedule==true){
            out.println("Sucessfully Updateaed data");
            response.sendRedirect("scheduledTrip.jsp");
        }
        else{
            out.println("There was a problem to update your data.");
        }        
    }
%>

<div class="profileContent">
    <div class="profileInfo">
        <h1 style="text-align: center;">Schedule Trip</h1>
        <form action="editTrip.jsp">
            <table>
                <tr>
                <td><p>Source </p></td>
                <td><p>:</p></td>
                <td><select value = "" name= "source" required>
                        <option><%=ob.getTripSource()%></option>
                        <option>Dhaka(Abdullahpur)</option>
                        <option>Dhaka(Mohakhali) </option>
                        <option>Dhaka(Gabtoli) </option>
                        <option>Dhaka(Saydabad) </option>
                        <option>Dhaka </option>
                        <option>Sylhet</option>
                        <option>Rangpur</option>
                        <option>Chittagong </option>
                        <option>Khulna</option>
                        <option>Jessore</option>
                        <option>Kustia</option>
                        <option>Sylhet</option>
                        <option>Rajshahi</option>
                        <option>Comilla</option>
                        <option>Narsingdi</option>
                        <option>Noakhali</option>
                        <option>Brahman-Baria</option>
                        <option>Tangail</option>
                        <option>Mymensingh</option>
                        <option>Barishal</option>	
                    </select></td>
                </tr>
                <tr>
                <td><p>Destination </p></td>
                <td><p>:</p></td>
                <td><select value="" name= "destination" required>
                        <option><%=ob.getTripDestination()%></option>
                        <option>Dhaka(Abdullahpur)</option>
                        <option>Dhaka(Mohakhali) </option>
                        <option>Dhaka(Gabtoli) </option>
                        <option>Dhaka(Saydabad) </option>
                        <option>Dhaka </option>
                        <option>Sylhet</option>
                        <option>Rangpur</option>
                        <option>Chittagong </option>
                        <option>Khulna</option>
                        <option>Jessore</option>
                        <option>Kustia</option>
                        <option>Sylhet</option>
                        <option>Rajshahi</option>
                        <option>Comilla</option>
                        <option>Narsingdi</option>
                        <option>Noakhali</option>
                        <option>Brahman-Baria</option>
                        <option>Tangail</option>
                        <option>Mymensingh</option>
                        <option>Barishal</option>	
                    </select></td>
                </tr>
                <tr>
                    <td><p>Trip Date</p></td>
                    <td><p>:</p></td>
                    <td>
                        <input type="date" name="date" value="<%=ob.getTripDate()%>" required>
                    </td>
                </tr>
                <tr>
                    <td><p>Trip Time</p></td>
                    <td><p>:</p></td>
                    <td>
                        <input type="text" value="<%=ob.getTripTime()%>" name="time" required>
                    </td>
                </tr>
                <tr>
                    <td><p>Bus Type</p></td>
                    <td><p>:</p></td>
                    <td>
                        <select value="" name= "busType" required>
                            <option><%=ob.getTripBusType()%></option>
                        <option>AC</option>
                        <option>Non-AC</option>
                    </td>
                </tr>
                <tr>
                    <td><p>Bus Brand</p></td>
                    <td><p>:</p></td>
                    <td>
                        <select  name= "busBrand" value=""required>
                            <option><%=ob.getTripBusBrand()%></option>
                        <option>Hino 1J Plus</option>
                        <option>Volvo</option>
                        <option>Hyundai Universe</option>
                        <option>Scania</option>
                        <option>Marcedez Benz</option>
                    </td>
                </tr>
                <tr>
                    <td><p>Available Seat</p></td>
                    <td><p>:</p></td>
                    <td>
                        <select  name= "availableSeat" value="" required>
                        <option><%=ob.getTripAvailableSeat()%></option>
                        <option>12</option>
                        <option>9</option>
                    </td>
                </tr>
                <tr>
                    <td><p>Bus Operator</p></td>
                    <td><p>:</p></td>
                    <td>
                        <select  name= "busOperator" value="" required>
                        <option><%=ob.getTripBusOperator()%></option>
                        <option>Hanif Enterprise</option>
                        <option>S.R  Travels (Pvt) Ltd</option>
                        <option>Shyamoli Poribahan</option>
                        <option>Green Line</option>
                        <option>Nabil Paribahan</option>
                        <option>National Travels</option>
                        <option>Desh Travels</option>
                        <option>Ena Transport</option>
                    </td>
                </tr>
                <tr>
                   <td><p>Per Seat Fare</p></td>
                   <td><input type="hidden" name="editSchedule" value="true"></td>
                   <td><input type="hidden" name="editTripId" value="<%=ob.getTripId()%>"></td>
                    <td><input type="text" value="<%=ob.getTripFare()%>" name="fare" required></td>  
                </tr>
                <tr>
                    <td><p></p></td>
                    <td><p></p></td>
                    
                    <td><button type="submit" style="height: 40px; width: 120px; font-size: 30px;border-radius: 10px;"><b>Submit</b></button></td>
                </tr>
                
            </table>
        </form>

    </div>
</div>



<jsp:include page="footer.jsp"/>

