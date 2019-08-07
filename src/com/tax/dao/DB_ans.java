package com.tax.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.tax.comm.DBUtil;
import com.tax.vo.answer;
import com.tax.vo.consult;

public class DB_ans {
	public DB_ans() {}
	DBUtil db = new DBUtil();
	
	public answer getByID(int ansID) {
		//通过回答的ID号来返回一个回答
		answer ans = new answer();
		ResultSet rs = null;
		PreparedStatement pstm = null;
		try {
			String sql = "select * from answer where ansID = '"+ ansID + "'";
			pstm = db.getConPst(sql);
			//rs保存结果集
			rs = pstm.executeQuery();
			while(rs.next()) {
				ans.setAnsID(rs.getInt("ansID"));
				ans.setDate(rs.getDate("date"));
				ans.setGood(rs.getInt("goodNum"));
				ans.setKeep(rs.getInt("keptNum"));
				ans.setTxt(rs.getString("txt"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(pstm,null);
		}
		return ans;
	}
	
	public ArrayList<answer> getAns(){
		//输出所有的回答结果
		ArrayList<answer> arr = new ArrayList<answer>();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			String sql = "select * from answer";
			pstm = db.getConPst(sql);
			rs = pstm.executeQuery();
			while(rs.next()) {
				answer ans = new answer();
				ans.setAnsID(rs.getInt("ansID"));
				ans.setDate(rs.getDate("date"));
				ans.setUserID(rs.getString("userID"));
				ans.setGood(rs.getInt("goodNum"));
				ans.setKeep(rs.getInt("keptNum"));
				ans.setTxt(rs.getString("txt"));
				if(rs.getInt("checked")==1) {
					arr.add(ans);
				}
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstm, null);
		}
		return arr;
	}
	public int getChecked(int ansID) {
		//查询一个answer是否已经经过审核
		int checked = 0;
		ResultSet rs = null;
		PreparedStatement pstm = null;
		try {
			String sql = "select checked from answer where ansID = '"+ ansID + "'";
			pstm = db.getConPst(sql);
			//rs保存结果集
			rs = pstm.executeQuery();
			while(rs.next()) {
				checked = rs.getInt("checked");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(pstm,null);
		}
		return checked;
	}
	public int getConsultID(int ansID) {
		//通过回答找到问题
		PreparedStatement pstm = null;
		String sql = "select consID from cons_ans where ansID = '"+ansID+"'";
		int ID = 0;
		try {
			pstm = db.getConPst(sql);
			ResultSet rs = pstm.executeQuery();
			while(rs.next()) {
				ID = rs.getInt("consID");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			db.close(pstm, null);
		}
		return ID;
	}
	
}
