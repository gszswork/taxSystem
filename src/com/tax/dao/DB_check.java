package com.tax.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.tax.comm.DBUtil;

/**
 * @author hxdn
 *-DB_check完成了审核的函数方法
 */
public class DB_check {
	
	public DB_check() {
	}
	DBUtil db = new DBUtil();
	
	public void checkCons(int consID) {
		//审核通过咨询对象，把咨询对象在数据库中保存的check属性切换为1
		PreparedStatement pstm = null;
		String sql = "update consult set checked = 1 where consID = ?";
		try {
			pstm = db.getConPst(sql);
			//设置参数
			pstm.setInt(1, consID);
			pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	
	public void uncheckCons(int consID) {
		//审核拒绝咨询对象，把咨询对象在数据库中保存的check属性切换为2，表示审核不通过
		PreparedStatement pstm = null;
		String sql = "update consult set checked = 2 where consID = ?";
		try {
			pstm = db.getConPst(sql);
			//设置参数
			pstm.setInt(1, consID);
			pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	
	public void checkAns(int ansID) {
		//审核通过回答对象，把回答对象在数据库中保存的checked属性切换为1，表示审核通过
		PreparedStatement pstm = null;
		String sql = "update answer set checked = 1 where ansID = ?";
		try {
			pstm = db.getConPst(sql);
			//设置参数
			pstm.setInt(1, ansID);
			pstm.executeUpdate();
		}catch(SQLException e) {
			DBUtil.close(pstm, null);
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	
	public void uncheckAns(int ansID) {
		//审核拒绝回答对象，把回答对象在数据库中保存的checked属性切换为2，表示审核不通过
		PreparedStatement pstm = null;
		String sql = "update answer set checked = 2 where ansID = ?";
		try {
			pstm = db.getConPst(sql);
			//设置参数
			pstm.setInt(2, ansID);
			pstm.executeUpdate();
		}catch(SQLException e) {
			DBUtil.close(pstm, null);
		}
	}

	public void checkShare(int shareID) {
		//审核通过分享对象，把分享对象在数据库中保存的checked属性切换为1，表示审核通过
		PreparedStatement pstm = null;
		String sql = "update share set checked = 1 where shareID = ?";
		try {
			pstm = db.getConPst(sql);
			//设置参数
			pstm.setInt(1, shareID);
			pstm.executeUpdate();
		}catch(SQLException e) {
			DBUtil.close(pstm, null);
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	
	public void uncheckShare(int shareID) {
		//审核拒绝分享对象，把分享对象在数据库中保存的checked属性切换为2，表示审核不通过
		PreparedStatement pstm = null;
		String sql = "update share set checked = 2 where shareID = ?";
		try {
			pstm = db.getConPst(sql);
			//设置参数
			pstm.setInt(1, shareID);
			pstm.executeUpdate();
		}catch(SQLException e) {
			DBUtil.close(pstm, null);
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	
	public void checkRead(int readID) {
		//审核通过解读对象，把解读对象在数据库中保存的checked属性切换为1，表示审核通过
		PreparedStatement pstm = null;
		String sql = "update reader set checked = 1 where readID = ?";
		try {
			pstm = db.getConPst(sql);
			//设置参数
			pstm.setInt(1, readID);
			pstm.executeUpdate();
		}catch(SQLException e) {
			DBUtil.close(pstm, null);
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	
	public void uncheckRead(int readID) {
		//审核拒绝解读对象，把解读对象在数据库中保存的checked属性切换为2，表示审核不通过
		PreparedStatement pstm = null;
		String sql = "update reader set checked = 2 where readID = ?";
		try {
			pstm = db.getConPst(sql);
			//设置参数
			pstm.setInt(1, readID);
			pstm.executeUpdate();
		}catch(SQLException e) {
			DBUtil.close(pstm, null);
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	
	
}
