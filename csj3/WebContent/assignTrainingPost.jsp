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

String user = request.getParameter("empId");
String training = request.getParameter("trainingId");

int userId = Integer.parseInt(user);
int trainingId = Integer.parseInt(training);

// System.out.println("MANGER"+manager+"user"+user);

if(userId < 1 || trainingId < 1) {
	System.out.println("InValid Id");
	response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/assignTraining.jsp?"+"Invalid-User/Training-TRY-AGAIN"));
} else {
	
	mySQLStore.insertEmployeeTraining(userId, trainingId);
	//			store.writeToFile(usersFromDb, "users");
	response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/assignTraining.jsp?"+"Training-assigned-success."));
}
		
%>

<div> 
	Redirecting to :<%=request.getContextPath()%>/myaccount.jsp 
</div>

<jsp:include page="footer.jsp" />