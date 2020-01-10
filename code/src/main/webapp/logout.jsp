<%-- 
    Document   : logout
    Created on : Jul 26, 2019, 9:53:10 PM
    Author     : hemay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String  logoutValue = request.getParameter("logoutValue");
        session.invalidate();
        response.sendRedirect("index.jsp");
%>
