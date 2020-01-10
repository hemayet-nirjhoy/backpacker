<%-- 
    Document   : header
    Created on : Jul 16, 2019, 4:11:47 PM
    Author     : hemay
--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*" %>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css"/>

    </head>
    <body>
        <div class = "main_container">
            
                <div class="navebar" >
                    <ul>
                        <li><a href="#">Bus Operator</a></li>
                        <% 
                            String signinValue = "Signin";
                            try{
                                
                            if(session.getAttribute("adminName").toString()!=null && session!=null){
                                signinValue = session.getAttribute("adminName").toString();
                                %>
                        <li><a href="adminProfile.jsp"><% out.println(signinValue);%></a></li>
                        <%
                            }
                             else{ %>
                           <li><a href="signin.jsp"><% out.println(signinValue);%></a></li>
                           <li><a href="adminSignin.jsp">Admin</a></li>
                                <%}   
                            }
                            catch(Exception ex){
                                 %>
                           <li><a href="signin.jsp"><% out.println(signinValue);%></a></li>
                           <li><a href="adminSignin.jsp">Admin</a></li>
                                <%
                            }
                        %>
                        
                    </ul>
                </div>
        