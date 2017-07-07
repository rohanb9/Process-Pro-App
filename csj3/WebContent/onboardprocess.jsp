<%@page import="csjpro.UType"%>
<%@page import="csjpro.User"%>
<%@page import="csjpro.MySQLDataStoreUtilities"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>

<jsp:include page="basicswithstyles1.jsp" />
<jsp:include page="header.jsp" />

	<section id="content">
<%  {  

 		MySQLDataStoreUtilities mySQLStore = new MySQLDataStoreUtilities();
 		
 		UType utype = UType.fromString((String) session.getAttribute("usertype"));
 		int depId = 1;

 		switch(utype) {
 		     case ONBOARD_PROCESS_DEPT1: depId = 1;
 		     							break;
 		     case ONBOARD_PROCESS_DEPT2: depId = 2;
 										break;
 		     case ONBOARD_PROCESS_DEPT3: depId = 3;
 										break;
 		     case ONBOARD_PROCESS_DEPT4: depId = 4;
 										break;
 		}
 		HashMap<String, User> allEmployees = mySQLStore.fetchAllUserByTypeAndOnboard(UType.EMPLOYEE.toString(), true, depId);
 	    
 	    String contentStr = "<hr><h1 style=\"background-color: #e9e9e9;padding-left: 20px;padding-top: 8px;\"> Notify Onboard Process Completion</h1> <hr>";
 	    	String empSelection = "";
 	    	if(allEmployees == null || allEmployees.isEmpty()) {
 	        	System.out.println("NO Employees/ Manager");
 	        } else {
 	    		for(Entry<String, User> m :allEmployees.entrySet()){
 	    			User c = m.getValue();
 	    		  	empSelection = 	empSelection +" <option value=\""+c.getId()+"\">"+c.getName()+"</option>";
 	    		}	
 	        }
 		
 	    	
 	    	contentStr = contentStr + 	
 	    			"<div class=\"center_content\">"+
 	    			"      <div class=\"prod_box_big\">"+
 	    			"        <div class=\"top_prod_box_big\"></div>"+
 	    			"        <div class=\"center_prod_box_big\">"+
 	    			"          <div class=\"contact_form\">"+
 	    						"<form action=\"/onboardprocessPost.jsp\" method=\"post\">"+
 	    			
 	    			"            <div class=\"form_row\">"+
 					"              <label class=\"contact\"><strong>Employee Name:</strong></label>"+
 										"<select name=\"empId\">"+ 
 												empSelection +
 									"  </select>"+
 					"            </div>" 
 					+ " <br><hr>"+
 					
 	    			
 	    			"             <button type=\"submit\" value=\"Submit\" style=\"margin-left: 275px; padding: 8px; background: burlywood;\" class=\"contact\">Submit</button> "+
 	    						"</form>"+
 	    			"          </div>"+
 	    			"        </div>"+
 	    			"        <div class=\"bottom_prod_box_big\"></div>"+
 	    			"      </div>"+
 	    			"    </div>";
 	    	
 	
 	    	out.println(contentStr);
}			
 	   
%>
	
					   

	</section>

<jsp:include page="sidebar.jsp" />
<jsp:include page="footer.jsp" />