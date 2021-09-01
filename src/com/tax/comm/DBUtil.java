package com.tax.comm;
import java.sql.*;
public class DBUtil {
	/*	Database name: tax
	 * 	User: root
	 * 	pws: 1234
	 * 
	 * */
	private static final String DRIVER="com.mysql.cj.jdbc.Driver";
	private static final String URL="jdbc:mysql://localhost:3306/tax?useSSL=false&serverTimezone=GMT%2B8";
	private static final String USER="root";
	private static final String PASS="1234";
	private static Connection con =null;
	static{

		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}


	public static PreparedStatement getConPst(String sql){
		PreparedStatement pst = null;
		try {

			if(con==null){
				con = DriverManager.getConnection(URL, USER, PASS);
			}

			pst = con.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pst;
	}
	


	public static Connection getCon() {

		try {
			if(con==null){
				con = DriverManager.getConnection(URL, USER, PASS);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}


	public static void close(PreparedStatement st1,ResultSet rs1){
		close(con, st1, rs1);
	}


	
	public static void close(Connection con1,PreparedStatement st1,ResultSet rs1){
		try {
			if(rs1!=null){
			rs1.close();
			}
			if(st1!=null){
				st1.close();
			}
			if(con1!=null){
				con1.close();
				con=null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
