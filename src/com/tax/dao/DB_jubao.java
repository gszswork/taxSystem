package com.tax.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.tax.comm.DBUtil;
import com.tax.vo.jubao;

public class DB_jubao {

	public DB_jubao() {}
	DBUtil db = new DBUtil();
	
	public void addJub(jubao jub) throws ParseException {
		//ava.unit.Date java.sql.Date
		SimpleDateFormat bartDateFormat =new SimpleDateFormat("yyyy-MM-dd");  
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	    String dateStringToParse=(df.format(jub.getDate()));
        java.util.Date date = bartDateFormat.parse(dateStringToParse);  
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
       
		PreparedStatement pstm = null;
		String sql = "insert into jubao(userID,jubaoID,consID,ansID,text,date) values (?,?,?,?,?,?)";
		try {
			pstm = db.getConPst(sql);

			pstm.setString(1, jub.getUserID());
			pstm.setInt(2,jub.getJubaoID());
			pstm.setInt(3, jub.getConsID());
			pstm.setInt(4, jub.getAnsID());
			pstm.setString(5, jub.getText());
			pstm.setDate(6, sqlDate);

			
			pstm.executeUpdate();
			System.out.println("Added one Jubao.");
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
			String sql = "select max(jubaoID) from jubao";
			pstm = db.getConPst(sql);

			rs = pstm.executeQuery();
			while(rs.next()) {
				maxID=rs.getInt("max(jubaoID)");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(pstm,null);
		}
		return maxID;
	}
}
