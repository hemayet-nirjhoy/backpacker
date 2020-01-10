<%-- 
    Document   : cancel
    Created on : Aug 4, 2019, 1:00:13 PM
    Author     : hemay
--%>

<%@page import="back.Booking"%>
<%@page import="admin.Trip"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String tripId = request.getParameter("tripId");
            String seat = request.getParameter("seat");
            String customerEmail = request.getParameter("customerEmail");
            
            Booking ob =new Booking();
            
             boolean ensure = ob.cancelTicket(seat, tripId);
              if(ensure==true){
                  response.sendRedirect("profile.jsp");
              }
              else{
                  out.println("Failed");
              }
        
        
        %>
    </body>
</html>
