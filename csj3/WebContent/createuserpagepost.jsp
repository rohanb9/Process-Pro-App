<!doctype html>
<%@page import="csjpro.Gender"%>
<%@page import="csjpro.User"%>
<%@page import="csjpro.UType"%>
<%@page import="csjpro.MySQLDataStoreUtilities"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Process-Pro</title>
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

String user = request.getParameter("user");
String pwd = request.getParameter("password");
String rpwd = request.getParameter("rpassword");
UType utype = UType.fromString(request.getParameter("utype"));

String address = request.getParameter("address");
String email = request.getParameter("email");
Gender gender = Gender.fromString(request.getParameter("gender"));

if(!pwd.equals(rpwd) ) {
	System.out.println("Password mismatch..");
	response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/myaccount.jsp?"+"Employee-password-mismatch-TRY-AGAIN"));
} else if(user == null || user == "") {
	System.out.println("Username required..");
	response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/myaccount.jsp?"+"Employee-username-required-TRY-AGAIN"));
} else {
	System.out.println("User-creation-success..");
	User userObj = new User(user, pwd);
	userObj.setName(user);
	userObj.setUtype(utype);
	userObj.setPassword(pwd);
	
	userObj.setGender(gender);
	userObj.setEmail(email);
	userObj.setAddress(address);
	
	usersFromDb = mySQLStore.fetchAllUsers();

	if(usersFromDb == null || usersFromDb.isEmpty()) {
		usersFromDb = new HashMap<String, User>();
	} else {
		//prinUsertMap(usersFromDb);
	}
	usersFromDb.put(user, userObj);
	
	mySQLStore.insertUser(userObj);
	//			store.writeToFile(usersFromDb, "users");
	response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/myaccount.jsp?"+"Employee-registered."));
}
		
%>

<div> 
	Redirecting to :<%=request.getContextPath()%>/myaccount.jsp 
</div>

<jsp:include page="footer.jsp" />