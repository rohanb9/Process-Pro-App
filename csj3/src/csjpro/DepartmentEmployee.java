package csjpro;

public class DepartmentEmployee implements java.io.Serializable{
	private int empid;
	private String empName;
	private int depId;
	private String depName;
	
	public DepartmentEmployee(int empid, int depId, String empName, String depName){
		this.empid = empid;
		this.depId = depId;
		this.empName = empName;
		this.depName = depName;
	}
	
	public DepartmentEmployee() {
		
	}
	
	public int getEmpid() {
		return empid;
	}


	public void setEmpid(int empid) {
		this.empid = empid;
	}


	public String getEmpName() {
		return empName;
	}


	public void setEmpName(String empName) {
		this.empName = empName;
	}


	public int getDepId() {
		return depId;
	}


	public void setDepId(int depId) {
		this.depId = depId;
	}


	public String getDepName() {
		return depName;
	}


	public void setDepName(String depName) {
		this.depName = depName;
	}


	

}
