package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConn {

	private static Connection conn = null;
	
	String driver = "com.mysql.jdbc.Driver";
	//String url = "jdbc:mysql://localhost:3306/greenstudy";
	String url = "jdbc:mysql://49.142.157.252:3306/greenstudy";
	String user = "root";
	//String password = "root";
	String password = "cjgreen";
	
	@SuppressWarnings("unused")
	private static GetConn instance = new GetConn();
	
	private GetConn() {
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버가 없습니다. : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("DB연동 실패~~ : " + e.getMessage());
		}
	}
	
	public static Connection getConn() {
		return conn;
	}
	
}
