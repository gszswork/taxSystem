package com.tax.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.tax.comm.DBUtil;
import com.tax.vo.answer;
import com.tax.vo.share;

public class DB_answer {
    public DB_answer() {}
    
    DBUtil db = new DBUtil();
    

	public void addAns(answer ans) throws ParseException {
		SimpleDateFormat bartDateFormat =new SimpleDateFormat("yyyy-MM-dd");  
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	    String dateStringToParse=(df.format(ans.getDate()));
        java.util.Date date = bartDateFormat.parse(dateStringToParse);  
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
       
		PreparedStatement pstm = null;
		String sql = "insert into answer(userID,ansID,txt,date,goodNum,keptNum,checked) values (?,?,?,?,?,?,?)";
		try {
			pstm = db.getConPst(sql);

			pstm.setString(1, ans.getUserID());
			pstm.setInt(2, ans.getAnsID());
			pstm.setString(3, ans.getTxt());
			pstm.setDate(4, sqlDate);
			pstm.setInt(5, ans.getGood());
			pstm.setInt(6, ans.getKeep());
			pstm.setInt(7, ans.getCheck());
			
			pstm.executeUpdate();
			System.out.println("Sucessfully Added One Answer");
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
			String sql = "select max(ansID) from answer";
			pstm = db.getConPst(sql);

			rs = pstm.executeQuery();
			while(rs.next()) {
				maxID=rs.getInt("max(ansID)");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(pstm,null);
		}
		return maxID;
	}


	public ArrayList<answer> getAnsByID(String userID){
		ArrayList<answer> arr = new ArrayList<answer>();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			String sql = "select * from answer where userID=?";
			pstm = db.getConPst(sql);
			pstm.setString(1, userID);
			rs = pstm.executeQuery();
			while(rs.next()) {
				answer ans = new answer();
				ans.setAnsID(rs.getInt("ansID"));
				ans.setDate(rs.getDate("date"));
				ans.setUserID(rs.getString("userID"));
				ans.setGood(rs.getInt("goodNum"));
				ans.setKeep(rs.getInt("keptNum"));
				ans.setTxt(rs.getString("txt"));
					arr.add(ans);
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
