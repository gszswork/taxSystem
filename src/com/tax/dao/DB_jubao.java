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
	
	//添加举报信息
	public void addJub(jubao jub) throws ParseException {
		//把java.unit.Date转成java.sql.Date
		SimpleDateFormat bartDateFormat =new SimpleDateFormat("yyyy-MM-dd");  
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
	    String dateStringToParse=(df.format(jub.getDate()));// new Date()为获取当前系统时间  
        java.util.Date date = bartDateFormat.parse(dateStringToParse);  
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
       
		PreparedStatement pstm = null;
		String sql = "insert into jubao(userID,jubaoID,consID,ansID,text,date) values (?,?,?,?,?,?)";
		try {
			pstm = db.getConPst(sql);
			//设置参数
			pstm.setString(1, jub.getUserID());
			pstm.setInt(2,jub.getJubaoID());
			pstm.setInt(3, jub.getConsID());
			pstm.setInt(4, jub.getAnsID());
			pstm.setString(5, jub.getText());
			pstm.setDate(6, sqlDate);

			
			pstm.executeUpdate();//执行数据库语句
			System.out.println("添加一条数据到举报表");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	
	//获取id里最大的数（本身是int类型）
	public int getMaxID() {
		int maxID=1;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			String sql = "select max(jubaoID) from jubao";
			pstm = db.getConPst(sql);
			//rs保存结果集
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
