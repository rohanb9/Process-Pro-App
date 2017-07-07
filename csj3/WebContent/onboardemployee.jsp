<%@page import="csjpro.DepartmentEmployee"%>
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
 		
 		HashMap<String, User> allEmployees = mySQLStore.fetchAllUserAndNotOnboarded(UType.EMPLOYEE.toString());
 		
 		HashMap<Integer, User> allEmp = mySQLStore.fetchAllUsersWithId();
 		HashMap<Integer, ArrayList<DepartmentEmployee>> map = mySQLStore.fetchAllDepartmentEmployee(UType.EMPLOYEE.toString(), true);
 		String dep_val = "";
 		
 	    
 	    String contentStr = "<hr><h1 style=\"background-color: #e9e9e9;padding-left: 20px;padding-top: 8px;\"> Start Onboarding Process</h1> <hr>";
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
 	    						"<form action=\"/onboardemployeePost.jsp\" method=\"post\">"+
 	    			
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
 	    	%>	 

 	  	 <div class='prod_box_big'> <hr><h4 style="background-color: #e9e9e9;padding-left: 13px;padding-top: 8px;">  Onboard Employee Process Details</h4> <hr> </div>
 	  <%
 	    	
 	    	 for(Entry<Integer, ArrayList<DepartmentEmployee>> m :map.entrySet()){
 	    		ArrayList<DepartmentEmployee> list = m.getValue();
 	    		User emp = allEmp.get(m.getKey());
 	    		int i = 1;
 	    		dep_val= "";
 	    		for(DepartmentEmployee t : list){
 	    			dep_val = dep_val +   "  " + t.getDepName() + "        ";
 	    			i++;
 	    		}
 			  	System.out.println(emp.getName() + "  ==  " + dep_val +"  -- "+ list.size()*25);
 	%>
 			  		<div class='prod_box_big'>
 				        <div class='top_prod_box_big'></div>
 				        <div class='center_prod_box_big'>
 				          <div class='details_big_box'>
 				            <div class='product_title_big'>Employee: <%=emp.getName()%></div>
 				            <div class='specifications'> Process Completed: <span class='blue'><%=list.size()*25%>%</span><br>
 				              Departments Done with Processing : <span class='blue'><%=dep_val%></span><br>
 				            </div>
 				 		   <div class='bottom_prod_box'></div>
 				 		    <hr> 
 				 		   
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