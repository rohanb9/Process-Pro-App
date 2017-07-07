<!doctype html>
<%@page import="csjpro.UType"%>
<%@page import="csjpro.User"%>
<%@page import="csjpro.MySQLDataStoreUtilities"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="styles.css" type="text/css" />
<link rel="stylesheet" href="styles1.css" type="text/css" />
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<!--
spigot, a free CSS web template by ZyPOP (zypopwebtemplates.com/)

Download: http://zypopwebtemplates.com/

License: Creative Commons Attribution
//-->
</head>
<body>


<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>


<jsp:include page="header.jsp" />

<div> 
	Process Request:
</div>
<% 
		MySQLDataStoreUtilities mySQLStore = new MySQLDataStoreUtilities();  
		HashMap<String, User> usersFromDb = new HashMap<String, User>();
		
		HashMap<String, User> usersDb = mySQLStore.fetchAllUsers();
		String user = request.getParameter("user");
		String pwd = request.getParameter("password");

		UType utype = UType.fromString(request.getParameter("utype"));
		
		User userFromDb = usersDb.get(user);
		
		//System.out.println("---((usersDb.get(user)).getPassword())" + ((usersDb.get(user)).getPassword()));
		if(!usersDb.containsKey(user)) {
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/login.jsp?User-not-found-REGISTER-FIRST."));
		} else if(!(userFromDb.getPassword()).equals(pwd)) {
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/login.jsp?Incorrect-password-TRY-AGAIN."));
		} else if(userFromDb.getUtype() != utype) {
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/login.jsp?Incorrect-user-type-TRY-AGAIN."));
		} else {
			session.setAttribute("username", user);
			session.setAttribute("userid", Integer.toString(userFromDb.getId()));
			session.setAttribute("usertype", utype.toString());
			//System.out.println(" === ======== ======= " + userFromDb.getId());
			// Configure: setting session to expiry in 30 mins
			session.setMaxInactiveInterval(30*60);
			Cookie userName = new Cookie("user", user);
			userName.setMaxAge(30*60);
			response.addCookie(userName);
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/myaccount.jsp"));
			System.out.println("-----------------------------success");
		}
	
		
%>

<div> 
</div>

<jsp:include page="footer.jsp" />