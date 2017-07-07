package csjpro;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class MySQLDataStoreUtilities {

	public static  Statement stmt;
	public static  Connection conn ;
	
	public void connectToMySQL(){
    	
        final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
        final String DB_URL="jdbc:mysql://localhost:3306/sqm_project";
        final String USER = "root";
        final String PASS = "rohanborde";
       
	    try {
			Class.forName("com.mysql.jdbc.Driver");
		
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
	
			stmt = conn.createStatement();
	    } catch (Exception e) {
	    	e.printStackTrace();
			System.out.println("*************ERROR in connecting mySQL DB *******************");
			
		}
	   
    }
	
	public static HashMap<String, User> fetchAllUsers()
	{
		HashMap<String, User> usersFromDB=new HashMap<String, User>();
		
		try{
			conn = getConnection();
			String q ="select * from users";
			PreparedStatement pst = conn.prepareStatement(q);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				User user= new User(rs.getString("name"), rs.getString("address"),rs.getString("email") ,Gender.fromString(rs.getString("gender")), UType.fromString(rs.getString("utype"))); 
				user.setId(rs.getInt("id"));
				user.setPassword(rs.getString("password"));
				
				usersFromDB.put(rs.getString("name"), user);
			}	
			
			pst.close();
				
		}catch(Exception e){
			System.out.println("*************ERROR in fetch all users *******************");
		}
		return usersFromDB;
	}
	
	public static HashMap<Integer, User> fetchAllUsersWithId()
	{
		HashMap<Integer, User> usersFromDB=new HashMap<Integer, User>();
		
		try{
			conn = getConnection();
			String q ="select * from users";
			PreparedStatement pst = conn.prepareStatement(q);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				User user= new User(rs.getString("name"), rs.getString("address"),rs.getString("email") ,Gender.fromString(rs.getString("gender")), UType.fromString(rs.getString("utype"))); 
				user.setId(rs.getInt("id"));
				user.setPassword(rs.getString("password"));
				
				usersFromDB.put(rs.getInt("id"), user);
			}	
			
			pst.close();
				
		}catch(Exception e){
			System.out.println("*************ERROR in fetch all users *******************");
		}
		return usersFromDB;
	}
	
	public static HashMap<String, Training> fetchAllTraings()
	{
		HashMap<String, Training> trainings = new HashMap<String, Training>();
		
		try{
			conn = getConnection();
			String q ="select * from training";
			PreparedStatement pst = conn.prepareStatement(q);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				Training t= new Training(rs.getString("title"), rs.getInt("cost"), rs.getInt("noofhrs")); 
				t.setId(rs.getInt("id"));
				trainings.put(rs.getString("title"), t);
			}	
			
			pst.close();
				
		}catch(Exception e){
			System.out.println("*************ERROR in fetch all users *******************");
		}
		return trainings;
	}
	
	public static ArrayList<Training> fetchAllTrainingByManager(int managerId)
	{
		ArrayList<Training> list = new ArrayList<Training>();
		
		try{
			conn = getConnection();
			String q ="SELECT t.id as t_id, t.title as t_title, t.cost as t_cost, t.noofhrs as t_noofhrs, te.empid as te_empid, u.name as u_empname FROM training t"
					+ " INNER JOIN training_emp te ON t.id = te.trainingid "
					+ " INNER JOIN users u ON te.empid = u.id "
					+ " WHERE u.managerId = ?";
			
			PreparedStatement pst = conn.prepareStatement(q);
			pst.setInt(1, managerId);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				
				Training t= new Training(rs.getString("t_title"), rs.getInt("t_cost"), rs.getInt("t_noofhrs")); 
				t.setId(rs.getInt("t_id"));
				t.setEmpid(rs.getInt("te_empid"));
				t.setEmpname(rs.getString("u_empname"));
				
				list.add(t);
			}	
			
			pst.close();
				
		}catch(Exception e){
			System.out.println("*************ERROR in fetch Trainings By Manager *******************");
		}
		return list;
	}
	
	
	public static HashMap<String, User> fetchAllUserByType(String type)
	{
		HashMap<String, User> usersFromDB=new HashMap<String, User>();
		
		try{
			conn = getConnection();
			String q ="select * from users where utype = ?";
			
			PreparedStatement pst = conn.prepareStatement(q);
			pst.setString(1, type);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				User user= new User(rs.getString("name"), rs.getString("address"),rs.getString("email") ,Gender.fromString(rs.getString("gender")), UType.fromString(rs.getString("utype"))); 
				user.setId(rs.getInt("id"));
				
				usersFromDB.put(rs.getString("name"), user);
			}	
			
			pst.close();
				
		}catch(Exception e){
			System.out.println("*************ERROR in fetch all users *******************");
		}
		return usersFromDB;
	}
	
	public static HashMap<String, User> fetchAllUserAndNotOnboarded(String type)
	{
		HashMap<String, User> usersFromDB=new HashMap<String, User>();
		
		try{
			conn = getConnection();
			String q ="select * from users where utype = ? AND isNewEmp = false ";
			
			PreparedStatement pst = conn.prepareStatement(q);
			pst.setString(1, type);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				User user= new User(rs.getString("name"), rs.getString("address"),rs.getString("email") ,Gender.fromString(rs.getString("gender")), UType.fromString(rs.getString("utype"))); 
				user.setId(rs.getInt("id"));
				
				usersFromDB.put(rs.getString("name"), user);
			}	
			
			pst.close();
				
		}catch(Exception e){
			System.out.println("*************ERROR in fetch all users *******************");
		}
		return usersFromDB;
	}
	
	public static HashMap<String, User> fetchAllUserByTypeAndOnboard(String type, boolean isNewEmp, int depId)
	{
		HashMap<String, User> usersFromDB=new HashMap<String, User>();
		
		try{
			conn = getConnection();
			String q ="select * from users where utype = ? AND isNewEmp = ? AND id NOT IN (SELECT empid from dep_emp WHERE empid = id AND depid = ?)";
			
			PreparedStatement pst = conn.prepareStatement(q);
			pst.setString(1, type);
			pst.setBoolean(2, isNewEmp);
			pst.setInt(3, depId);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				User user= new User(rs.getString("name"), rs.getString("address"),rs.getString("email") ,Gender.fromString(rs.getString("gender")), UType.fromString(rs.getString("utype"))); 
				user.setId(rs.getInt("id"));
				
				usersFromDB.put(rs.getString("name"), user);
			}	
			
			pst.close();
				
		}catch(Exception e){
			System.out.println("*************ERROR in fetch all users *******************");
		}
		return usersFromDB;
	}
	
	public static HashMap<Integer, ArrayList<DepartmentEmployee>> fetchAllDepartmentEmployee(String type, boolean isNewEmp)
	{
		HashMap<Integer, ArrayList<DepartmentEmployee>> empDepMap=new HashMap<Integer, ArrayList<DepartmentEmployee>>();
		ArrayList<DepartmentEmployee> depemplist = new ArrayList<DepartmentEmployee>();
		try{
			conn = getConnection();
			String q ="select u.id as u_id, u.name as u_name, d.id as d_id, d.title as d_title FROM dep_emp de INNER JOIN users u ON de.empid = u.id "
					+ " INNER JOIN department d ON d.id = de.depid "
					+ " where utype = ? AND isNewEmp = ? ";
			
			PreparedStatement pst = conn.prepareStatement(q);
			pst.setString(1, type);
			pst.setBoolean(2, isNewEmp);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				DepartmentEmployee dept= new DepartmentEmployee(rs.getInt("u_id"), rs.getInt("d_id"), rs.getString("u_name"), rs.getString("d_title")); 
				if(!empDepMap.containsKey(rs.getInt("u_id"))) {
					depemplist = new ArrayList<DepartmentEmployee>();
				} else {
					depemplist = empDepMap.get(rs.getInt("u_id"));
				}
				depemplist.add(dept);
				
				empDepMap.put(rs.getInt("u_id"), depemplist);
			}	
			
			pst.close();
				
		}catch(Exception e){
			System.out.println("*************ERROR in fetch all users *******************"+ e.getMessage());
		}
		return empDepMap;
	}
	
	public static HashMap<String, User> fetchAllUserByManager(int managerId)
	{
		HashMap<String, User> usersFromDB=new HashMap<String, User>();
		
		try{
			conn = getConnection();
			String q =" Select * from users where managerId = ? ";
			
			PreparedStatement pst = conn.prepareStatement(q);
			pst.setInt(1, managerId);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				User user= new User(rs.getString("name"), rs.getString("address"), rs.getString("email") ,Gender.fromString(rs.getString("gender")), UType.fromString(rs.getString("utype"))); 
				user.setId(rs.getInt("id"));
				
				usersFromDB.put(rs.getString("name"), user);
			}	
			
			pst.close();
				
		}catch(Exception e){
			System.out.println("*************ERROR in fetch all users By Manager *******************");
		}
		return usersFromDB;
	}
	
	public static void insertEmployeeTraining(int empId, int trainingId){
		try{
			
			Connection conn = getConnection();
			String insertIntoCustomerRegisterQuery = "INSERT INTO training_emp( empId, trainingId) "
			+ "VALUES (?,?);";
			PreparedStatement pst = conn.prepareStatement(insertIntoCustomerRegisterQuery);
			
			pst.setInt(1,empId);
			pst.setInt(2,trainingId);
			pst.execute();
		
			pst.close();
			
		} catch(Exception e){
			System.out.println("*************ERROR in insert Employee Training *******************" + e.getMessage());
		}
	}
	
	public static void insertOnboardProcessCompletionForDepartment(int empId, int depId){
		try{
			
			Connection conn = getConnection();
			String insertIntoCustomerRegisterQuery = "INSERT INTO dep_emp( empid, depid) "
			+ "VALUES (?,?);";
			PreparedStatement pst = conn.prepareStatement(insertIntoCustomerRegisterQuery);
			
			pst.setInt(1,empId);
			pst.setInt(2,depId);
			pst.execute();
		
			pst.close();
			
		} catch(Exception e){
			System.out.println("*************ERROR in insert Employee Training *******************" + e.getMessage());
		}
	}
	
	public static void insertUser(User u){
		try{
			
			Connection conn = getConnection();
			String insertIntoCustomerRegisterQuery = "INSERT INTO users(name,password,utype,gender,email,address) "
			+ "VALUES (?,?,?,?,?,?);";
			PreparedStatement pst = conn.prepareStatement(insertIntoCustomerRegisterQuery);
			System.out.println(u.getName()+"  "+ u.getPassword()+"    "+ u.getUtype().toString() + "  "+ u.getGender().toString());
			System.out.println(u.getEmail()+"  "+ u.getAddress());
			pst.setString(1,u.getName());
			pst.setString(2,u.getPassword());
			pst.setString(3,u.getUtype().toString());
			pst.setString(4,u.getGender().toString());
			pst.setString(5,u.getEmail());
			pst.setString(6,u.getAddress());
			pst.execute();
		
			pst.close();
			
		} catch(Exception e){
			System.out.println("*************ERROR in insert user *******************" + e.getMessage());
		}
	}
	public static void setUserManager(int userId, int managerId)
	{
		System.out.println("*************Update *******************");
		try{
			Connection conn = getConnection();
			String insertIntoCustomerRegisterQuery = "UPDATE users SET managerId = ? WHERE id = ?  ";
			PreparedStatement pst = conn.prepareStatement(insertIntoCustomerRegisterQuery);
			pst.setString(1, Integer.toString(managerId));
			pst.setString(2, Integer.toString(userId));
			
			pst.executeUpdate();
			pst.close();
			
		}catch(Exception e){
			System.out.println("*************ERROR in update user *******************");
		}
	}
	
	public static void insertTimesheet(Timesheet t){
		try{
			
			Connection conn = getConnection();
			String insertIntoCustomerRegisterQuery = "INSERT INTO timesheet(startdate,enddate,comments,empid,isapproved,noofhrs) "
			+ "VALUES (?,?,?,?,?,?);";
			PreparedStatement pst = conn.prepareStatement(insertIntoCustomerRegisterQuery);
			System.out.println(t.getStartdate()+"  "+ t.getEnddate() +"    "+ t.getComments() + "  "+ t.getEmpid());
			System.out.println(t.isIsapproved()+"  "+ t.getNoofhrs());
			pst.setString(1, t.getStartdate());
			pst.setString(2, t.getEnddate());
			pst.setString(3, t.getComments());
			pst.setInt(4, t.getEmpid());
			pst.setBoolean(5, t.isIsapproved());
			pst.setInt(6, t.getNoofhrs());
			pst.execute();
		
			pst.close();
			
		} catch(Exception e){
			System.out.println("*************ERROR in insert user *******************" + e.getMessage());
		}
	}
	
	public static ArrayList<Timesheet> fetchAllTimesheetsByManager(int managerId)
	{
		ArrayList<Timesheet> list = new ArrayList<Timesheet>();
		
		try{
			conn = getConnection();
			String q ="SELECT * FROM timesheet t INNER JOIN users u ON t.empId = u.id WHERE u.managerId = ?";
			
			PreparedStatement pst = conn.prepareStatement(q);
			pst.setInt(1, managerId);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				
				Timesheet t= new Timesheet(rs.getString("startdate"), rs.getString("enddate"),rs.getString("comments"), 
						rs.getInt("noofhrs"), rs.getBoolean("isapproved"), rs.getString("name")); 
				t.setId(rs.getInt("id"));
				list.add(t);
			}	
			
			pst.close();
				
		}catch(Exception e){
			System.out.println("*************ERROR in fetch timesheet *******************");
		}
		return list;
	}
	
	public static void approveTimesheet(int id, boolean isapproved )
	{
		System.out.println("*************Update *******************");
		try{
			Connection conn = getConnection();
			String insertIntoCustomerRegisterQuery = "UPDATE timesheet SET isapproved = ? WHERE id = ?  ";
			PreparedStatement pst = conn.prepareStatement(insertIntoCustomerRegisterQuery);
			
			pst.setBoolean(1, isapproved);
			pst.setInt(2, id);
			
			pst.executeUpdate();
			pst.close();
			
		}catch(Exception e){
			System.out.println("*************ERROR in update Timesheet *******************");
		}
	}
	
	public static void updateOnboardingProcess(int id, boolean isNewEmployee )
	{
		System.out.println("*************Update *******************");
		try{
			Connection conn = getConnection();
			String insertIntoCustomerRegisterQuery = "UPDATE users SET isNewEmp = ? WHERE id = ?  ";
			PreparedStatement pst = conn.prepareStatement(insertIntoCustomerRegisterQuery);
			
			pst.setBoolean(1, isNewEmployee);
			pst.setInt(2, id);
			
			pst.executeUpdate();
			pst.close();
			
		}catch(Exception e){
			System.out.println("*************ERROR in update Timesheet *******************");
		}
	}
	
    public static Statement getStatement() {
    	return stmt;
    }
    
    public static Connection getConnection() {
    	return conn;
    }

}
