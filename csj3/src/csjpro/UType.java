package csjpro;

public enum UType
{
	OWNER("OWNER"),
	EMPLOYEE("EMPLOYEE"),	
	MANAGER("MANAGER"),
	ONBOARD_PROCESS_DEPT1("ONBOARD_PROCESS_DEPT1"),
	ONBOARD_PROCESS_DEPT2("ONBOARD_PROCESS_DEPT2"),
	ONBOARD_PROCESS_DEPT3("ONBOARD_PROCESS_DEPT3"),
	ONBOARD_PROCESS_DEPT4("ONBOARD_PROCESS_DEPT4");
    
    private String text = null;
	
	private UType (String text) {
		this.text = text;
	}
	
	public String toString() {
		return this.text;
	}
	
	public static UType fromString(String text) {
	    if (text != null) {
	      for (UType b : UType.values()) {
	        if (text.equalsIgnoreCase(b.text)) {
	          return b;
	        }
	      }
	    }
	    return null;
	  }
}
