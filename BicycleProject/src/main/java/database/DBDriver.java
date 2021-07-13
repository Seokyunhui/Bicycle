package database;

import java.sql.*;

public class DBDriver {
	private Connection conn;

	public Connection connDB() {	
		conn = null;
		try {
			String jdbcDiver= "jdbc:mysql://localhost:3306/bicycledb";
			String dbUser = "bicycleDBAdmin";
			String dbpw = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection(jdbcDiver, dbUser, dbpw);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	public void closeAll(PreparedStatement pstmt, Connection con) 
			throws SQLException {
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}
	
	//closeAll method 2
	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) 
			throws SQLException {
		if (rs != null)
			rs.close();
		//재사용
		this.closeAll(pstmt, con);
	}
}
