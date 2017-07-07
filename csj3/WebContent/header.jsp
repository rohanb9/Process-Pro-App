<%@page import="csjpro.UType"%>
<%@page import="java.util.HashMap"%>

<%
		HttpSession reqsession = request.getSession();
		int cartcount = 0;
		
		if(session != null){

			String uname = (String)session.getAttribute("username");
		
			if(uname != null) {
				String usertype= (String)session.getAttribute("usertype");
				%>
				<header>
			    	<h1><a href='/'>Manage<span>PRO</span></a></h1>
			        <h2>find everything with best price</h2>
		   		 </header>
		    	<nav>
		    	<ul>
		        	<li class='start selected'><a href='/'>Home</a></li>
						<%if(usertype.equals((UType.OWNER).toString())) { %>
							<li class='start selected'><a href='/myaccount.jsp'>My Account</a></li>
		           			<li><a href='/createuser.jsp'  style='padding-left: 63px;border: 0px;'><u>Registration</u></a></li>
		           			<li><a href='/assignManager.jsp'  style='padding-left: 63px;border: 0px;'><u>Assign Manager</u></a></li>
		           			<li><a href='/onboardemployee.jsp'  style='padding-left: 63px;border: 0px;'><u>Onboard Employee</u></a></li>
		           			
						<%} else if(usertype.equals((UType.MANAGER).toString())) {%>
							<li class='start selected'><a href='/myaccount.jsp'>My Account</a></li>
							<li><a href='/approvetimesheet.jsp'  style='padding-left: 63px;border: 0px;'><u>Approve Timesheet</u></a></li>
							<li><a href='/assignTraining.jsp'  style='padding-left: 63px;border: 0px;'><u>Assign Training</u></a></li>
							
						<%} else if(usertype.equals((UType.EMPLOYEE).toString())) {%>
							 <li class='start selected'><a href='/myaccount.jsp'>My Account</a></li>
							 <li><a href='/filltimesheet.jsp'  style='padding-left: 63px;border: 0px;'><u>Fill Timesheet</u></a></li>
							 
						<%} else if(usertype.equals((UType.ONBOARD_PROCESS_DEPT1).toString()) ||
								usertype.equals((UType.ONBOARD_PROCESS_DEPT2).toString()) || 
								usertype.equals((UType.ONBOARD_PROCESS_DEPT3).toString()) ||
								usertype.equals((UType.ONBOARD_PROCESS_DEPT4).toString())) {%>
							 
							 <li class='start selected'><a href='/myaccount.jsp'>My Account</a></li>
							 <li><a href='/onboardprocess.jsp'  style='padding-left: 63px;border: 0px;'><u>Onboarding Process</u></a></li>
						<%} %>

		            <li class=''><a href='/logout.jsp' style='border: 0px;'><u>Logout</u></a></li>
		            <li><a href='/myaccount.jsp'  style='padding-left: 20px;border: 0px; color: black;'>Welcome <%=uname%></a></li>
		
		        </ul>
		    </nav>
		<div id='body'>
			
<%				
					
		} else {
%>

		 <header>
	    	<h1><a href='/'>Process<span>PRO</span></a></h1>
	        <h2>Manage with single click</h2>
	    </header>
	    <nav>
	    	<ul>
				        	<li class='start selected'><a href='/'>Home</a></li>
	        </ul>
	    </nav>
	<div id='body'>

<%				
					
		}
	} else {
		%>

		 	 <header>
	    	<h1><a href='/'>Process<span>PRO</span></a></h1>
	        <h2>Manage with single click</h2>
	    </header>
	    <nav>
	    	<ul>
				        	<li class='start selected'><a href='/'>Home</a></li>
	        </ul>
	    </nav>
	<div id='body'>

	<%				
						
			}
%>