package csjpro;

import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class StartupAppListner
               implements ServletContextListener{

	MySQLDataStoreUtilities c = new MySQLDataStoreUtilities();
	
	@Override
	public void contextInitialized(ServletContextEvent arg) {
		c.connectToMySQL();	
		
		System.out.println("+================================server started");
	}
	
	
	@Override
	public void contextDestroyed(ServletContextEvent arg) {
		
		Connection conn = c.getConnection();
		Statement st = c.getStatement();
		
		try {
			st.close();
		
			conn.close();
			
		} catch (Exception e) {
			System.out.println("=========ERROR CLOSING SQL CONNECTION=========");
		}
		
		System.out.println("==================================Server destroyed");
	}

  
}