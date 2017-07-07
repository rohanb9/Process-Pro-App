<%@page import="csjpro.Training"%>
<%@page import="java.util.ArrayList"%>
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
 		
 		String useridstr = (String) session.getAttribute("userid");
 		int sessionuserId = Integer.parseInt(useridstr);

 		
 		HashMap<String, User> allEmployees = mySQLStore.fetchAllUserByManager(sessionuserId);
 		HashMap<String, Training> allTraings = mySQLStore.fetchAllTraings();
 		ArrayList<Training> assignedTrainings = mySQLStore.fetchAllTrainingByManager(sessionuserId);
 		
 	    
 	    String contentStr = "<hr><h1 style=\"background-color: #e9e9e9;padding-left: 20px;padding-top: 8px;\"> Assing Training To Employee</h1> <hr>";
 	    	String trainingSelection = "", empSelection  = "";
 	    	if(allEmployees == null || allEmployees.isEmpty() || allTraings == null || allTraings.isEmpty()) {
 	        	System.out.println("NO Employees/ Manager");
 	        } else {
 	    		for(Entry<String, User> m :allEmployees.entrySet()){
 	    			User c = m.getValue();
 	    		  	empSelection = 	empSelection +" <option value=\""+c.getId()+"\">"+c.getName()+"</option>";
 	    		}	
 	    		
 	    		for(Entry<String, Training> m :allTraings.entrySet()){
 	    			Training c = m.getValue();
 	    			trainingSelection = 	trainingSelection +" <option value=\""+c.getId()+"\">"+c.getTitle()+"</option>";
 	    		}	
 	        }
 		
 	    	
 	    	contentStr = contentStr + 	
 	    			"<div class=\"center_content\">"+
 	    			"      <div class=\"prod_box_big\">"+
 	    			"        <div class=\"top_prod_box_big\"></div>"+
 	    			"        <div class=\"center_prod_box_big\">"+
 	    			"          <div class=\"contact_form\">"+
 	    						"<form action=\"/assignTrainingPost.jsp\" method=\"post\">"+
 	    			
 	    			"            <div class=\"form_row\">"+
 					"              <label class=\"contact\"><strong>Employee Name:</strong></label>"+
 										"<select name=\"empId\">"+ 
 												empSelection +
 									"  </select>"+
 					"            </div>"
 					+ " <br><hr>"+
 					
					"            <div class=\"form_row\">"+
					"              <label class=\"contact\"><strong>Training Name:</strong></label>"+
								"<select name=\"trainingId\">"+ 
										trainingSelection +
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
 		   %>
 	    			<div><hr><h1 style=\"background-color: #e9e9e9;padding-left: 20px;padding-top: 8px;\"> Assinged Trainings</h1> <hr></div>			 
 		<% 
 		  for( Training t :assignedTrainings){
		  	
%>
		  		<div class='prod_box_big'>
			        <div class='top_prod_box_big'></div>
			        <div class='center_prod_box_big'>
			          <div class='details_big_box'>
			            <div class='product_title_big'>Employee: <%=t.getEmpname()%></div>
			            <div class='specifications'> Training Name: <span class='blue'><%=t.getTitle()%></span><br>
			              Cost: <span class='blue'><%=t.getCost()%></span><br>
			              No of Hrs: <span class='blue'><%=t.getNoofhrs()%></span><br>
			            </div>
			 		   <div class='bottom_prod_box'></div>
		             </div>
			        </div>
			        <div class="bottom_prod_box_big"></div>
			      </div>
<%
	 }	
  }
%>
	
					   

	</section>

<jsp:include page="sidebar.jsp" />
<jsp:include page="footer.jsp" />