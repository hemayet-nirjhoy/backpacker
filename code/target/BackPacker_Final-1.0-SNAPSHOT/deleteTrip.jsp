<%-- 
    Document   : deleteTrip
    Created on : Jul 27, 2019, 2:18:36 PM
    Author     : hemay
--%>

<%@page import="admin.Trip"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String tripId = request.getParameter("deleteTripId");
    
    Trip ob=new Trip();
    
    boolean ensureDelete = ob.deleteTrip(tripId);
    
if(ensureDelete==true){
    response.sendRedirect("scheduledTrip.jsp");
}



%>
