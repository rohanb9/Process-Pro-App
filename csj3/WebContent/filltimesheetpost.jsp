<!doctype html>
<%@page import="csjpro.Timesheet"%>
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


String startdate = request.getParameter("startdate");
String enddate = request.getParameter("enddate");
String noofhrsstr = request.getParameter("noofhrs");
String comments = request.getParameter("comments");
String useridstr = (String) session.getAttribute("userid");

//System.out.println(" === ======== ======= " + useridstr);
int userId = Integer.parseInt(useridstr);

Integer noofhrs = 0;
if(noofhrsstr != null || noofhrsstr != "") {
	noofhrs = Integer.parseInt(noofhrsstr);
}

Timesheet timesheet = new Timesheet(startdate, enddate, comments, noofhrs);
timesheet.setEmpid(userId);
timesheet.setIsapproved(false);

mySQLStore.insertTimesheet(timesheet);

response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/myaccount.jsp"));
		
%>

<div> 
	Redirecting to :<%=request.getContextPath()%>/myaccount.jsp 
</div>

<jsp:include page="footer.jsp" />