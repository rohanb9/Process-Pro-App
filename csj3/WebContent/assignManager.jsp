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
 		
 		HashMap<String, User> allEmployees = mySQLStore.fetchAllUserByType(UType.EMPLOYEE.toString());
 		HashMap<String, User> allManagers = mySQLStore.fetchAllUserByType(UType.MANAGER.toString());
 	    
 	    
 	    String contentStr = "<hr><h1 style=\"background-color: #e9e9e9;padding-left: 20px;padding-top: 8px;\"> Assing Manager To Employee</h1> <hr>";
 	    if(allEmployees == null || allEmployees.isEmpty() || allManagers == null || allManagers.isEmpty()) {
 	    	System.out.println("NO Employees/ Manager found");
 	    } else {
 	    	String empSelection = "", managerSelection  = "";
 	    	if(allEmployees == null || allEmployees.isEmpty() || allManagers == null || allManagers.isEmpty()) {
 	        	System.out.println("NO Employees/ Manager");
 	        } else {
 	    		for(Entry<String, User> m :allEmployees.entrySet()){
 	    			User c = m.getValue();
 	    		  	empSelection = 	empSelection +" <option value=\""+c.getId()+"\">"+c.getName()+"</option>";
 	    		}	
 	    		
 	    		for(Entry<String, User> m :allManagers.entrySet()){
 	    			User c = m.getValue();
 	    			managerSelection = 	managerSelection +" <option value=\""+c.getId()+"\">"+c.getName()+"</option>";
 	    		}	
 	        }
 		
 	    	
 	    	contentStr = contentStr + 	
 	    			"<div class=\"center_content\">"+
 	    			"      <div class=\"prod_box_big\">"+
 	    			"        <div class=\"top_prod_box_big\"></div>"+
 	    			"        <div class=\"center_prod_box_big\">"+
 	    			"          <div class=\"contact_form\">"+
 	    						"<form action=\"/assignManagerPost.jsp\" method=\"post\">"+
 	    			
 	    			"            <div class=\"form_row\">"+
 					"              <label class=\"contact\"><strong>Employee Name:</strong></label>"+
 										"<select name=\"userId\">"+ 
 												empSelection +
 									"  </select>"+
 					"            </div>"
 					+ " <br><hr>"+
 					
					"            <div class=\"form_row\">"+
					"              <label class=\"contact\"><strong>Manager Name:</strong></label>"+
								"<select name=\"managerId\">"+ 
										managerSelection +
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
 	    	
 	
 	    	
 	    }			
 	   out.println(contentStr);
  }
%>
	
					   

	</section>

<jsp:include page="sidebar.jsp" />
<jsp:include page="footer.jsp" />