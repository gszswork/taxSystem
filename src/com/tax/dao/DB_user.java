package com.tax.dao;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import com.tax.comm.DBUtil;
import com.tax.vo.*;
public class DB_user {
	public DB_user() {}
	
	DBUtil db = new DBUtil();
	
	
	/**
	 * @param addUser is used to add a new user in the system
	 */
	public void addUser(user use) {
		
		PreparedStatement pstm = null;
		String sql = "insert into user(userID,psword,phone,email) values (?,?,?,?)";
		try {
			pstm = db.getConPst(sql);

			pstm.setString(1, use.getUserID());
			pstm.setString(2, use.getPsw());
			pstm.setString(3, use.getPhone());
			pstm.setString(4, use.getEmail());
			pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	
	public void update(user use) {
		//user update its password,phone or email address
		PreparedStatement pstm = null;
		String sql = "update user set psword = ?,phone = ?,email = ? where userID = ?";
		try {
			pstm = db.getConPst(sql);

			pstm.setString(4, use.getUserID());
			pstm.setString(1, use.getPsw());
			pstm.setString(2, use.getPhone());
			pstm.setString(3, use.getEmail());
			
			pstm.executeQuery();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm, null);
		}
	}
		
	public user get(String userID) {
		user use = new user();
		ResultSet rs = null;
		PreparedStatement pstm = null;
		try {
			String sql = "select * from user where userID = '"+ userID + "'";
			pstm = db.getConPst(sql);

			rs = pstm.executeQuery();
			while(rs.next()) {
				use.setUserID(rs.getString("userID"));
				use.setPsw(rs.getString("psword"));
				use.setPhone(rs.getString("phone"));
				use.setEmail(rs.getString("email"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(pstm,null);
		}
		return use;
	}
	
	/**
	 * @return boolean 
	 */
	public boolean loginVerify(String userID,String psw) {
		user use = new user();
		boolean isValid = false;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			String sql = "select * from user where userID = ? and psword = ?";
			pstm = db.getConPst(sql);
			pstm.setString(1, userID);
			pstm.setString(2, psw);
			rs = pstm.executeQuery();
			if(rs.next()) {
				isValid = true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
					rs.close();
				if(pstm != null)
					pstm.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return isValid;
	}
	
	public ArrayList<user> getUser(){

		ArrayList<user> arr = new ArrayList<user>();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			String sql = "select * from user";
			pstm = db.getConPst(sql);
			rs = pstm.executeQuery();
			while(rs.next()) {
				user use=new user();
				use.setUserID(rs.getString("userID"));
				use.setUserName(rs.getString("userName"));
				use.setPsw(rs.getString("psword"));
				use.setPhone(rs.getString("unitName"));
				use.setEmail(rs.getString("phone"));
				use.setUnitName(rs.getString("email"));
				
				arr.add(use);
				
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstm, null);
		}
		return arr;
	}
	
	
}
