package csjpro;

public class Training implements java.io.Serializable{
	private int id;
	private String title;
	private int cost;
	private int noofhrs;
	
	private int empid;
	private String empname;

	
	public Training(String title, int cost, int noofhrs){
		this.setTitle(title);
		this.setCost(cost);
		this.noofhrs = noofhrs;
	}
	
	
	public Training() {
		
	}
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getEmpid() {
		return empid;
	}


	public void setEmpid(int empid) {
		this.empid = empid;
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


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public int getCost() {
		return cost;
	}


	public void setCost(int cost) {
		this.cost = cost;
	}

}
