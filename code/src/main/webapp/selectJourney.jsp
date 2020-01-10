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
        <h1 style="text-align: center;">Select Trip</h1>
        <form action="availableTrip.jsp">
            <table>
                <tr>
                <td><p>Source </p></td>
                <td><p>:</p></td>
                <td><select placeholder = "Trip Source" name= "source" required>
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
                <td><select placeholder = "Trip Source" name= "destination" required>
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
                        <input type="date" name="date" required>
                    </td>
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

