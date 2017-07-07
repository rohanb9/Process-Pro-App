<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>

<jsp:include page="basicswithlogin.jsp" />
<jsp:include page="header.jsp" />

	<section id="content">
  <% 
 	response.setContentType("text/html");  
            session.invalidate();  
    %>
         
    <b>You are successfully logged out!<b> 
  	<br><br><u><a href="/">Go To Home Page</a></u> 
      <%        
            out.close(); 
      
      %>
	</section>

<jsp:include page="sidebar.jsp" />
<jsp:include page="footer.jsp" />