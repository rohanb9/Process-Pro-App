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

String user = request.getParameter("userId");
String manager = request.getParameter("managerId");

int userId = Integer.parseInt(user);
int managerId = Integer.parseInt(manager);

System.out.println("MANGER"+manager+"user"+user);

if(userId < 1 || managerId < 1) {
	System.out.println("InValid Id");
	response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/myaccount.jsp?"+"Invalid-User-TRY-AGAIN"));
} else {
	
	mySQLStore.setUserManager(userId, managerId);
	//			store.writeToFile(usersFromDb, "users");
	response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/myaccount.jsp?"+"Manager-assigned-success."));
}
		
%>

<div> 
	Redirecting to :<%=request.getContextPath()%>/myaccount.jsp 
</div>

<jsp:include page="footer.jsp" />