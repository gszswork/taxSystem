package com.tax.dao;
import java.awt.List;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Stack;

import com.tax.comm.DBUtil;
import com.tax.vo.*;
/**
 * @author hxdn
 * 
 */
public class DB_share {
	public DB_share() {}
	
	DBUtil db = new DBUtil();
	
	/**
	 * @param sha
	 * addshare 
	 * @throws ParseException 
	 */
	public void addShare(share sha) throws ParseException {
		//Java.unit.Datejava.sql.Date
				SimpleDateFormat bartDateFormat =new SimpleDateFormat("yyyy-MM-dd");  
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			    String dateStringToParse=(df.format(sha.getDate()));
		        java.util.Date date = bartDateFormat.parse(dateStringToParse);  
		        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		
		PreparedStatement pstm = null;
		String sql = " insert into share (shareID,shareName,seenNum,keptNum,date,text,checked) values(?,?,?,?,?,?,?);";
		try {
			pstm = db.getConPst(sql);

			pstm.setInt(1, sha.getShareID());
			pstm.setString(2, sha.getShareName());
			pstm.setInt(3, sha.getSeenNum());
			pstm.setInt(4, sha.getKeptNum());
			pstm.setDate(5,sqlDate);
			pstm.setString(6, sha.getText());
			pstm.setInt(7, sha.getChecked());
			pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	
	public void delete(int shareID) {

		PreparedStatement pstm = null;
		String sql = "delete from share where shareID= '"+shareID+"'";
		try {
			pstm = db.getConPst(sql);
			pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	

		public int getMaxID() {
			int maxID=1;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			try {
				String sql = "select max(shareID) from share";
				pstm = db.getConPst(sql);

				rs = pstm.executeQuery();
				while(rs.next()) {
					maxID=rs.getInt("max(shareID)");
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally{
				DBUtil.close(pstm,null);
			}
			return maxID;
		}
	
	
	/**
	 * @param cons
	 * update 
	 */
	public void update(share sha) {

		PreparedStatement pstm = null;
		String sql = "update share set text = ? where shareID = ?";
		try {
			pstm = db.getConPst(sql);
			pstm.setString(1,sha.getText());
			pstm.setInt(2, sha.getShareID());
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm,null);
		}
	}
	
	public share get(String shareName) {

		share sha = new share();
		ResultSet rs = null;
		PreparedStatement pstm = null;
		try {
			String sql = "select * from share where shareName = '"+ shareName +"'";
			pstm = db.getConPst(sql);

			rs = pstm.executeQuery();
			while(rs.next()) {
				sha.setShareID(rs.getInt("shareID"));
				sha.setShareName(rs.getString("shareName"));
				sha.setSeenNum(rs.getInt("seenNum"));
				sha.setKeptNum(rs.getInt("keptNum"));
				sha.setDate(rs.getDate("date"));
				sha.setText(rs.getString("text"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(pstm,null);
		}
		return sha;
	}
	public share getByID(int shareID) {

		share sha = new share();
		ResultSet rs = null;
		PreparedStatement pstm = null;
		try {
			String sql = "select * from share where shareID = '"+ shareID+"'";
			pstm = db.getConPst(sql);

			rs = pstm.executeQuery();
			while(rs.next()) {
				sha.setShareID(rs.getInt("shareID"));
				sha.setShareName(rs.getString("shareName"));
				sha.setSeenNum(rs.getInt("seenNum"));
				sha.setKeptNum(rs.getInt("keptNum"));
				sha.setDate(rs.getDate("date"));
				sha.setText(rs.getString("text"));
				sha.setChecked(rs.getInt("checked"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(pstm,null);
		}
		return sha;
	}
	public ArrayList<share> Query() {
		String sql = "select * from share order by seenNum desc";
		int rowCount ;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ArrayList<share> al = new ArrayList<share>();
		
		try {
			pstm = db.getConPst(sql);
			rs = pstm.executeQuery();
			while(rs.next()) {
				share sha = new share();
				sha.setShareID(rs.getInt("shareID"));
				sha.setShareName(rs.getString("shareName"));
				sha.setSeenNum(rs.getInt("seenNum"));
				sha.setKeptNum(rs.getInt("keptNum"));
				sha.setDate(rs.getDate("date"));
				sha.setText(rs.getString("text"));
				sha.setChecked(rs.getInt("checked"));
				al.add(sha);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm, null);
		}
		return al;
	}
}