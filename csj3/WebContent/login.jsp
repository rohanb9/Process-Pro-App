<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>

<jsp:include page="basicswithlogin.jsp" />
<jsp:include page="header.jsp" />

	<section id="content">
  
	<div class='ribbon'></div><div class='login'>
	<h1>Login.</h1>
	<p>Lets login</p>
	<form action='loginpagepost.jsp' method='post'>
		<div class='input'>
	      <div class='blockinput'>
	        <i class='icon-envelope-alt'></i><input type='text' name='user' placeholder='Username'>
	      </div><br>
	      <div class='blockinput'>
	        <i class='icon-unlock'></i><input type='password' placeholder='Password' name='password'>
	      </div><br>
	
	      <div class='blockinput'>
	        <i class='icon-unlock'></i>
			<select name='utype'>
			    <option value='OWNER'>OWNER</option>
			    <option value='EMPLOYEE'>EMPLOYEE</option>
			    <option value='MANAGER'>MANAGER</option>
			    <option value='ONBOARD_PROCESS_DEPT1'>ONBOARD_PROCESS_DEPT1</option>
			    <option value='ONBOARD_PROCESS_DEPT2'>ONBOARD_PROCESS_DEPT2</option>
			    <option value='ONBOARD_PROCESS_DEPT3'>ONBOARD_PROCESS_DEPT3</option>
			    <option value='ONBOARD_PROCESS_DEPT4'>ONBOARD_PROCESS_DEPT4</option>
			  </select>
	      </div>
			
	    </div>
	<button type='submit' value='Login'>Login</button>
  </form></div>


	</section>

<jsp:include page="sidebar.jsp" />
<jsp:include page="footer.jsp" />