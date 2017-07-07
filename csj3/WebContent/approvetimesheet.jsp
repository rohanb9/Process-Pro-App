<%@page import="csjpro.Timesheet"%>
<%@page import="java.util.List"%>
<%@page import="csjpro.MySQLDataStoreUtilities"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>

<jsp:include page="basicswithstyles1.jsp" />
<jsp:include page="header.jsp" />

	<section id="content">
<%  

	MySQLDataStoreUtilities mysqlStore = new MySQLDataStoreUtilities();
	
	String useridstr = (String) session.getAttribute("userid");
	int sessionuserId = Integer.parseInt(useridstr);

	List<Timesheet> tList = mysqlStore.fetchAllTimesheetsByManager(sessionuserId);

	 for(Timesheet t :tList){
		  	
		  	if(t.isIsapproved() == false) {
%>
		  		<div class='prod_box_big'>
			        <div class='top_prod_box_big'></div>
			        <div class='center_prod_box_big'>
			          <div class='details_big_box'>
			            <div class='product_title_big'>Employee: <%=t.getEmpname()%></div>
			            <div class='specifications'> Start Date: <span class='blue'><%=t.getStartdate()%></span><br>
			              End Date: <span class='blue'><%=t.getEnddate()%></span><br>
			              Comments: <span class='blue'><%=t.getComments()%></span><br>
			              No of Hrs: <span class='blue'><%=t.getNoofhrs()%></span><br>
			            </div>
		 			 <form action='/approvetimesheetpost.jsp' method = 'post'>
			 			  <input type='hidden' name='id' value= '<%=t.getId()%>'>
			 			  <button type = 'submit' value= 'Approve' class='addtocart'>Approve</button>
			 		 </form>
			 		   <div class='bottom_prod_box'></div>
			 		    <hr> 
			 		   
		             </div>
			        </div>
			        <div class="bottom_prod_box_big"></div>
			      </div>
<%
		  	}

	 }	
%>	 

	 <div class='prod_box_big'> <hr><h4 style="background-color: #e9e9e9;padding-left: 13px;padding-top: 8px;"> Approved Timesheets</h4> <hr> </div>
<% 	 
	 for(Timesheet t :tList){
		  	
		  	if(t.isIsapproved()) {
%>
		  		<div class='prod_box_big'>
			        <div class='top_prod_box_big'></div>
			        <div class='center_prod_box_big'>
			          <div class='details_big_box'>
			            <div class='product_title_big'>Employee: <%=t.getEmpname()%></div>
			            <div class='specifications'> Start Date: <span class='blue'><%=t.getStartdate()%></span><br>
			              End Date: <span class='blue'><%=t.getEnddate()%></span><br>
			              Comments: <span class='blue'><%=t.getComments()%></span><br>
			              No of Hrs: <span class='blue'><%=t.getNoofhrs()%></span><br>
			            </div>
			             <div class='bottom_prod_box'></div>
			 		    <hr> 
		             </div>
			        </div>
			         <div class="bottom_prod_box_big"></div>
			      </div>
<%
		  	}

	 }	 
%>

	</section>

<jsp:include page="sidebar.jsp" />
<jsp:include page="footer.jsp" />