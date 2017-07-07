<%@page import="csjpro.MySQLDataStoreUtilities"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>

<jsp:include page="basicswithlogin.jsp" />
<jsp:include page="header.jsp" />

  <section id="content">
	<h1>Fill Timesheet</h1>
	    		  <div class='center_content'>
    			      <div class='prod_box_big'>
    			        <div class='top_prod_box_big'></div>
    			        <div class='center_prod_box_big'>
    			          <div class='contact_form'>
    						<form action='/filltimesheetpost.jsp' method='post'>
    			
    			            <div class='form_row'>
    			              <label class='contact'><strong>Start Date:</strong></label>
    			              <input type='text' name='startdate' class='contact_input' />
    			            </div>
    			            <div class='form_row'>
    			              <label class='contact'><strong>End Date:</strong></label>
    			              <input type='text' name='enddate' class='contact_input' />
    			            </div>
    			            <div class='form_row'>
    			              <label class='contact'><strong>No Of Hours:</strong></label>
    			              <input type='text' name='noofhrs' class='contact_input' />
    			            </div>
    			            <div class='form_row'>
    			              <label class='contact'><strong>Comments:</strong></label>
    			              <input type='text' name='comments' class='contact_input' />
    			            </div>

    			             <button type='submit' value='Submit' style='padding: 8px; background: burlywood;'>Submit</button> 
    						</form>
    			          </div>
    			        </div>
    			        <div class='bottom_prod_box_big'></div>
    			      </div>
    			    </div>
  </section>

<jsp:include page="sidebar.jsp" />
<jsp:include page="footer.jsp" />