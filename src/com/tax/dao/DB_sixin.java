package com.tax.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.tax.comm.DBUtil;
import com.tax.vo.answer;
import com.tax.vo.share;
import com.tax.vo.sixin;

public class DB_sixin {
    public DB_sixin() {}
    DBUtil db = new DBUtil();
	

    public void addSixin(sixin six) throws ParseException {
		//把java.unit.Date转成java.sql.Date
				SimpleDateFormat bartDateFormat =new SimpleDateFormat("yyyy-MM-dd");  
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			    String dateStringToParse=(df.format(six.getDate()));
		        java.util.Date date = bartDateFormat.parse(dateStringToParse);  
		        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		
		PreparedStatement pstm = null;
		String sql = " insert into sixin (userID,sixinID,text,receiveID,date) values(?,?,?,?,?);";
		try {
			pstm = db.getConPst(sql);

			pstm.setString(1, six.getUserID());
			pstm.setInt(2, six.getSixinID());
			pstm.setString(3, six.getText());
			pstm.setString(4, six.getReceiveID());
			pstm.setDate(5,sqlDate);

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
				String sql = "select max(sixinID) from sixin";
				pstm = db.getConPst(sql);
				rs = pstm.executeQuery();
				while(rs.next()) {
					maxID=rs.getInt("max(sixinID)");
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally{
				DBUtil.close(pstm,null);
			}
			return maxID;
		}
			

		public ArrayList<sixin> getSixinbyID(String userID){

			ArrayList<sixin> arr = new ArrayList<sixin>();
			PreparedStatement pstm = null;
			ResultSet rs = null;
			try {
				String sql = "select * from sixin where userID=?";
				pstm = db.getConPst(sql);
				pstm.setString(1, userID);
				rs = pstm.executeQuery();
				while(rs.next()) {
					sixin six=new sixin();
					six.setUserID(rs.getString("userID"));
					six.setSixinID(rs.getInt("sixinID"));
					six.setText(rs.getString("text"));
					six.setReceiveID(rs.getString("receiveID"));
					six.setDate(rs.getDate("date"));

						arr.add(six);
					
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
