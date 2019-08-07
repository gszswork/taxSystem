package com.tax.comm;
import java.sql.*;
public class DBUtil {
	
	private static final String DRIVER="com.mysql.cj.jdbc.Driver";
	private static final String URL="jdbc:mysql://localhost:3306/tax?useSSL=false&serverTimezone=GMT%2B8";
	private static final String USER="root";
	private static final String PASS="1234";
	private static Connection con =null;
	static{
		//1.�������ݿ�����
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	/**
	 * ����preparedStatementԤ�������
	 * 
	 * @param sql ִ��sql���
	 * @return  ����preparedStatement����
	 */
	public static PreparedStatement getConPst(String sql){
		PreparedStatement pst = null;
		try {
			//2.�������ݿ�
			if(con==null){
				con = DriverManager.getConnection(URL, USER, PASS);
			}
			//3.��ȡPreparedStatement����
			pst = con.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pst;
	}
	
	/**
	 * �������connection����
	 * 
	 * @return
	 */
	public static Connection getCon() {
		//2.������Ӷ���
		try {
			if(con==null){
				con = DriverManager.getConnection(URL, USER, PASS);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	/**
	 * �ر����ݿ�����
	 * @param st1
	 * @param rs1
	 */
	public static void close(PreparedStatement st1,ResultSet rs1){
		close(con, st1, rs1);
	}
	/**
	 * �ر����ݿ�����
	 * @param con1 ���Ӷ���
	 * @param st1 PreparedStatement ����
	 * @param rs1 ��ѯ�������
	 */
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
	
    /*//JDBC�������Լ����ݿ� url
	static final String JDBC_DRIVER="com.mysql.jdbc.Driver";
	static final String DB_URL="jdbc:mysql://localhost:3306/humanresources";
	// ���ݿ���û��������룬��Ҫ�����Լ�������
    static final String USER = "root";
    static final String PASS = "mysql";
    
    public static void main(String[] args){
    	Connection conn=null;
    	Statement stmt=null;
    	try{
    		//ע��JDBC����
    		Class.forName("com.mysql.jdbc.Driver");
    		//�������ݿ�
    		conn=DriverManager.getConnection(DB_URL,USER,PASS);
    		
    		//ִ�в�ѯ
    		//ʵ����Statement��
    		stmt=conn.createStatement();
    		String sql;
    		sql="SELECT staff_id,staff_name FROM staff";
    		ResultSet rs=stmt.executeQuery(sql);
    		//չ����������ݿ�
    		while(rs.next()){
    			//ͨ���ֶ�����
    			String staff_id=rs.getString("staff_id");
    			String staff_name=rs.getString("staff_name");
    			//�������
    			System.out.print("staff_id:"+staff_id);
    			System.out.println("staff_name:"+staff_name);
    			
    		}
    		//��ɺ�ر�
    		rs.close();
    		stmt.close();
    		conn.close();
    	}catch(SQLException se){
    		//����JDBC����
    		se.printStackTrace();
    	}catch(Exception e){
    		//����Class.foeName����
    		e.printStackTrace();
    	}finally{
    		//�ر���Դ
    		try{
    			if(stmt!=null)stmt.close();
    		}catch(SQLException se2){
    			//donothing
    		}
    		try{
    			if(conn!=null)conn.close();
    		}catch(SQLException se){
    			se.printStackTrace();
    		}
    	}

    }*/
}
