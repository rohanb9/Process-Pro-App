<%@page import="csjpro.User"%>
<%@page import="csjpro.MySQLDataStoreUtilities"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>

<jsp:include page="basicswithstyles1.jsp" />
<jsp:include page="header.jsp" />

	<section id="content">
<%     
	String username = "";

 	MySQLDataStoreUtilities mySQLStore = new MySQLDataStoreUtilities();

	username = (String) session.getAttribute("username");
	
	HashMap<String, User> usersDb = mySQLStore.fetchAllUsers();
	User userFromDb = usersDb.get(username);

	String address = "Not specified";
	String utype = "";
	String gender = "";
	String email = "";
	
	if(userFromDb != null && userFromDb.getAddress() != null) {
		address = userFromDb.getAddress();
	}
	if(userFromDb != null && userFromDb.getUtype() != null) {
		utype = userFromDb.getUtype().toString();
	}
	if(userFromDb != null && userFromDb.getGender() != null) {
		gender = userFromDb.getGender().toString();
	}
	if(userFromDb != null && userFromDb.getEmail() != null) {
		email = userFromDb.getEmail();
	}
 
%>
	<div class='prod_box_big'>
        <div class='top_prod_box_big'></div>
        <div class='center_prod_box_big'>
          <div> <hr><h4 style='background-color: #e9e9e9;padding-left: 20px;padding-top: 8px;'> My Details</h4> <hr></div>
          <div class='details_big_box'>
            <div class='product_title_big'>Name: <%=username%> </div>
            <div class='prod_price'>Address : <span class='price'><%=address%></span></div>
            <div class='prod_price'>Gender : <span class='price'><%=gender%></span></div>
            <div class='prod_price'>email : <span class='price'><%=email%></span></div>
            <div class='prod_price'>Type : <span class='price'><%=utype%></span></div>
         </div>
   		</div>     
 	</div>
 	</section>	
<jsp:include page="sidebar.jsp" />
<jsp:include page="footer.jsp" />