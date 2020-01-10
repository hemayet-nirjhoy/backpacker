<%-- 
    Document   : index
    Created on : Jul 16, 2019, 4:10:54 PM
    Author     : hemay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page= "header.jsp"/>
<%   if(session!=null){  //Condition for navigation bar
        if(session.getAttribute("userName")!=null) { %> 
    <jsp:include page="navebar.jsp" />
    <%   }
        else if(session.getAttribute("adminName")!=null){ %>
    <jsp:include page="adminNavebar.jsp" />
<%    }
}// End of navigation condition %>

                <div id ="gap">
                    <!--img src="img/back.png"/-->
<!--                    <img src="img/backpacker.png"  style="width: 260px; margin-left:40%"/>-->
                </div>
<!--            <div class="top_header">-->
            
<!--            </div>-->
                <div class="content">
                    <!--<img src="img/text.png" style="width: 100%;height: 100%;background: #ffffff"></img>-->
                    <h1 style="text-align: Center; font-family:sans-serif;font-size: 140px;">BACKPACKER</h1>
                    <p style="text-align: center; font-family:cursive; margin: 0; padding: 0; font-size: 60px;">A Safe Journey to Destination</p>
                </div>

 <jsp:include page="footer.jsp" />