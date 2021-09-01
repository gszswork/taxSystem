package com.tax.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.tax.comm.DBUtil;

/**
 * @author hxdn
 * 
 */
public class DB_check {
	
	public DB_check() {
	}
	DBUtil db = new DBUtil();
	
	public void checkCons(int consID) {
		PreparedStatement pstm = null;
		String sql = "update consult set checked = 1 where consID = ?";
		try {
			pstm = db.getConPst(sql);

			pstm.setInt(1, consID);
			pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	
	public void uncheckCons(int consID) {
		PreparedStatement pstm = null;
		String sql = "update consult set checked = 2 where consID = ?";
		try {
			pstm = db.getConPst(sql);

			pstm.setInt(1, consID);
			pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	
	public void checkAns(int ansID) {

		PreparedStatement pstm = null;
		String sql = "update answer set checked = 1 where ansID = ?";
		try {
			pstm = db.getConPst(sql);

			pstm.setInt(1, ansID);
			pstm.executeUpdate();
		}catch(SQLException e) {
			DBUtil.close(pstm, null);
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	
	public void uncheckAns(int ansID) {
		
		PreparedStatement pstm = null;
		String sql = "update answer set checked = 2 where ansID = ?";
		try {
			pstm = db.getConPst(sql);
			
			pstm.setInt(2, ansID);
			pstm.executeUpdate();
		}catch(SQLException e) {
			DBUtil.close(pstm, null);
		}
	}

	public void checkShare(int shareID) {

		PreparedStatement pstm = null;
		String sql = "update share set checked = 1 where shareID = ?";
		try {
			pstm = db.getConPst(sql);

			pstm.setInt(1, shareID);
			pstm.executeUpdate();
		}catch(SQLException e) {
			DBUtil.close(pstm, null);
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	
	public void uncheckShare(int shareID) {
		
		PreparedStatement pstm = null;
		String sql = "update share set checked = 2 where shareID = ?";
		try {
			pstm = db.getConPst(sql);

			pstm.setInt(1, shareID);
			pstm.executeUpdate();
		}catch(SQLException e) {
			DBUtil.close(pstm, null);
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	
	public void checkRead(int readID) {
		
		PreparedStatement pstm = null;
		String sql = "update reader set checked = 1 where readID = ?";
		try {
			pstm = db.getConPst(sql);

			pstm.setInt(1, readID);
			pstm.executeUpdate();
		}catch(SQLException e) {
			DBUtil.close(pstm, null);
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	
	public void uncheckRead(int readID) {
		
		PreparedStatement pstm = null;
		String sql = "update reader set checked = 2 where readID = ?";
		try {
			pstm = db.getConPst(sql);

			pstm.setInt(1, readID);
			pstm.executeUpdate();
		}catch(SQLException e) {
			DBUtil.close(pstm, null);
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	
	
}
