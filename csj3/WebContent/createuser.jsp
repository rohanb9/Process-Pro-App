<%@page import="csjpro.MySQLDataStoreUtilities"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>

<jsp:include page="basicswithlogin.jsp" />
<jsp:include page="header.jsp" />

  <section id="content">
	<h1>Create New Customer</h1>
	  	<p>Lets register..</p>
		<form action='createuserpagepost.jsp' method='post'>
	    		<div class='input'>
			      <div class='blockinput'>
			        <i class='icon-envelope-alt'></i><input type='text' name='user' placeholder='Username'>
			      </div>
			      <div class='blockinput'>
			        <i class='icon-unlock'></i><input type='password' placeholder='Password' name='password'>
			      </div>
			
			      <div class='blockinput'>
			        <i class='icon-unlock'></i><input type='password' placeholder='Reenter Password' name='rpassword'>
			      </div><br>
			      
			      <div class='blockinput'>
			        <i class='icon-unlock'></i><input type='text' placeholder='Address' name='address'>
			      </div>
			      <div class='blockinput'>
			        <i class='icon-unlock'></i><input type='text' placeholder='Email' name='email'>
			      </div>
			      
			      <div class='blockinput'>
			        <i class='icon-unlock'></i>
					<select name='gender'>
					    <option value='MALE'>MALE</option>
					    <option value='FEMALE'>FEMALE</option>
					  </select>
			      </div>
			    </div>
			
			      <div class='blockinput'>
			        <i class='icon-unlock'></i>
					<select name='utype'>
					    <option value='EMPLOYEE'>EMPLOYEE</option>
					    <option value='MANAGER'>MANAGER</option>
					    <option value='OWNER'>OWNER</option>
					    <option value='ONBOARD_PROCESS_DEPT1'>ONBOARD_PROCESS_DEPT1</option>
					    <option value='ONBOARD_PROCESS_DEPT2'>ONBOARD_PROCESS_DEPT2</option>
					    <option value='ONBOARD_PROCESS_DEPT3'>ONBOARD_PROCESS_DEPT3</option>
					    <option value='ONBOARD_PROCESS_DEPT4'>ONBOARD_PROCESS_DEPT4</option>
					  </select>
			      </div>
			<button type='submit' value='Create'>Create</button>
		  </form>
  </section>

<jsp:include page="sidebar.jsp" />
<jsp:include page="footer.jsp" />