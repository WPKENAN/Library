package bean;

import java.sql.*;

import javax.swing.JOptionPane;

public class DBConnected {
	public Connection getConnected(String db,String userName,String userPwd )
	{
		String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String dbURL = "jdbc:sqlserver://localhost:1433; DatabaseName="+db;
		Connection dbConn=null;
		try {
			Class.forName(driverName);
			dbConn = DriverManager.getConnection(dbURL, userName, userPwd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
		return dbConn;
	}
	public void DBClose(Connection conn) throws SQLException
	{
		conn.close();
	}
}
