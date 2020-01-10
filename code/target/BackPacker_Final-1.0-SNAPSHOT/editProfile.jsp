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
                
 <%    //////////// Update profile
    
    if(request.getParameter("updateProfile")!=null){
        String editName = request.getParameter("editName");
        String editEmail = request.getParameter("editEmail");
        String editPassword = request.getParameter("editPassword");
        String editGender = request.getParameter("editGender");
        String editLivingCity = request.getParameter("editLivingCity");
        String editHomeCity = request.getParameter("editHomeCity");
        String editPhone = request.getParameter("editPhone");
        String id=ob.getCustomerId();
        
        boolean ensureUpdate = ob.updateProfile(id, editName, editEmail, editPassword, editPhone, editGender, editLivingCity, editHomeCity);
        if(ensureUpdate==true){
            out.println("Sucessfully Updateaed data");
            response.sendRedirect("profile.jsp");
        }
        else{
            out.println("There was a problem to update your data.");
        }        
    }
%>

 
                    <div class="profileContent">
                        <div class="profileInfo">
                            <form action="" >
                                
                                <table>
                                    <tr>
                                        <td><p>Name</p></td>
                                        <td><p>:</p></td>
                                        <td><input type="text" name = "editName" value="<% out.println(ob.getCustomerName());%>" /></td>
                                    </tr>
                                    <tr>
                                      <td><p>Email </p></td>
                                      <td><p>:</p></td>
                                      <td><input type="text" name ="editEmail" value=  "<%=ob.getCustomerEmail()%>" </td>
                                    </tr>
                                    <tr>
                                        <td><p>Contact No </p></td>
                                        <td><p>:</p></td>
                                        <td><input type="text" name="editPhone" value="<%=ob.getCustomerPhone() %>"</td>
                                    </tr>
                                    <tr>
                                        <td><p>New Password </p></td>
                                        <td><p>:</p></td>
                                        <td><input type="password" name="editPassword" Placeholder="Enter New Password" required></td>
                                    </tr>
                                    <tr>
                                        <td><p>Home City</p></td>
                                        <td><p>:</p></td>
                                       <td><input type="text" name="editHomeCity" value="<%=ob.getCustomerHomeCity()%>"</td>
                                    </tr>
                                    <tr>
                                        <td><p>Living City</p></td>
                                        <td><p>:</p></td>
                                        <td><input type="text" name="editLivingCity" value="<%=ob.getCustomerLivingCity()%>"</td>
                                    </tr>
                                    <tr>
                                        <td><p>Gender </p></td>
                                        <td><p>:</p></td>
                                        <td><input type="text" name="editGender" value="<%=ob.getCustomerGender()%>"</td>
                                        <td><input type="hidden" name="updateProfile" value="true"</td>
                                        <td><input type="submit" value="Update" /></td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                    


<jsp:include page="footer.jsp"/>

