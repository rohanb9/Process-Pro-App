package csjpro;

public class User implements java.io.Serializable{
	private int id;
	private String name;
	private String address;
	private String password;
	
	private String email;
	private Gender gender = Gender.MALE;
	
	private UType utype = UType.EMPLOYEE; 

	
	public User(String name, String address, String email, Gender gender, UType utype){
		this.name = name;
		this.address = address;
		this.setEmail(email);
		this.setGender(gender);
		this.utype = utype;
	}
	
	public User(String name, String address, String email,UType utype){
		this.name = name;
		this.address = address;
		this.setEmail(email);
		this.utype = utype;
	}
	
	public User(String name, String password){
		this.name = name;
		this.password = password;
	}
	
	public User() {
		
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public UType getUtype() {
		return utype;
	}
	public void setUtype(UType utype) {
		this.utype = utype;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}
	
}
