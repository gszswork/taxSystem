package com.tax.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.tax.comm.*;
import com.tax.vo.*;

/**
 * @author hxdn
 *
 */
public class DB_read {
	public DB_read() {}
	
	DBUtil db = new DBUtil();
	
	public void addRead(read rea) throws ParseException {
		SimpleDateFormat bartDateFormat =new SimpleDateFormat("yyyy-MM-dd");  
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	    String dateStringToParse=(df.format(rea.getDate()));
        java.util.Date date = bartDateFormat.parse(dateStringToParse);  
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		
		PreparedStatement pstm = null;
		String sql = "insert into reader (readID,readName,seenNum,keptNum,date,text,checked) values (?,?,?,?,?,?,?)";
		try {
			pstm = db.getConPst(sql);

			pstm.setInt(1, rea.getReadID());
			pstm.setString(2, rea.getReadName());
			pstm.setInt(3, rea.getSeenNum());
			pstm.setInt(4, rea.getKeptNum());
			pstm.setDate(5,sqlDate);
			pstm.setString(6, rea.getText());
			pstm.setInt(7, rea.getChecked());
			pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	
	
	/**
	 * @param cons
	 * 
	 */
	public void update(read rea) {
		PreparedStatement pstm = null;
		String sql = "update reader set text = ? where readID = ?";
		try {
			pstm = db.getConPst(sql);
			pstm.setString(1,rea.getText());
			pstm.setInt(2, rea.getReadID());
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm,null);
		}
	}
	
	public read get(String readName) {

		read rea = new read();
		ResultSet rs = null;
		PreparedStatement pstm = null;
		try {
			String sql = "select * from reader where shareName = '"+ readName+"'";
			pstm = db.getConPst(sql);

			rs = pstm.executeQuery();
			while(rs.next()) {
				rea.setReadID(rs.getInt("readID"));
				rea.setReadName(rs.getString("readName"));
				rea.setSeenNum(rs.getInt("seenNum"));
				rea.setKeptNum(rs.getInt("keptNum"));
				rea.setDate(rs.getDate("date"));
				rea.setText(rs.getString("text"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(pstm,null);
		}
		return rea;
	}
	public read getByID(int readID) {

		read rea = new read();
		ResultSet rs = null;
		PreparedStatement pstm = null;
		try {
			String sql = "select * from reader where readID = '"+ readID+"'";
			pstm = db.getConPst(sql);

			rs = pstm.executeQuery();
			while(rs.next()) {
				rea.setReadID(rs.getInt("readID"));
				rea.setReadName(rs.getString("readName"));
				rea.setSeenNum(rs.getInt("seenNum"));
				rea.setKeptNum(rs.getInt("keptNum"));
				rea.setDate(rs.getDate("date"));
				rea.setText(rs.getString("text"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(pstm,null);
		}
		return rea;
	}
	public ArrayList<read> Query() {
		String sql = "select * from reader order by seenNum desc";
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ArrayList<read> al = new ArrayList<read>();
		
		try {
			pstm = db.getConPst(sql);
			rs = pstm.executeQuery();
			while(rs.next()) {
				read rea = new read();
				rea.setReadID(rs.getInt("readID"));
				rea.setReadName(rs.getString("readName"));
				rea.setSeenNum(rs.getInt("seenNum"));
				rea.setKeptNum(rs.getInt("keptNum"));
				rea.setDate(rs.getDate("date"));
				rea.setText(rs.getString("text"));
				al.add(rea);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm, null);
		}
		return al;
	}


	public int getMaxID() {
		// TODO Auto-generated method stub
		int maxID=1;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			String sql = "select max(readID) from reader";
			pstm = db.getConPst(sql);

			rs = pstm.executeQuery();
			while(rs.next()) {
				maxID=rs.getInt("max(readID)");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(pstm,null);
		}
		return maxID;
	}
	
}
