package csjpro;

public class Timesheet implements java.io.Serializable{
	private int id;
	private String startdate;
	private String enddate;
	private String comments;
	private int empid;
	private String empname;
	private boolean isapproved = false;
	private int noofhrs;

	
	public Timesheet(String startdate, String enddate, String comments, int noofhrs){
		this.startdate = startdate;
		this.enddate = enddate;
		this.comments = comments;
		this.noofhrs = noofhrs;
	}
	
	public Timesheet(String startdate, String enddate, String comments, int noofhrs, boolean isapproved, String empname){
		this.startdate = startdate;
		this.enddate = enddate;
		this.comments = comments;
		this.noofhrs = noofhrs;
		this.isapproved = isapproved;
		this.empname = empname;
	}
	
	public Timesheet() {
		
	}
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getStartdate() {
		return startdate;
	}


	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}


	public String getEnddate() {
		return enddate;
	}


	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}


	public String getComments() {
		return comments;
	}


	public void setComments(String comments) {
		this.comments = comments;
	}


	public int getEmpid() {
		return empid;
	}


	public void setEmpid(int empid) {
		this.empid = empid;
	}


	public boolean isIsapproved() {
		return isapproved;
	}


	public void setIsapproved(boolean isapproved) {
		this.isapproved = isapproved;
	}


	public int getNoofhrs() {
		return noofhrs;
	}


	public void setNoofhrs(int noofhrs) {
		this.noofhrs = noofhrs;
	}

	public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}


	
}
