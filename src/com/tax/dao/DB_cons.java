package com.tax.dao;
import java.sql.*;
import java.util.ArrayList;

import com.tax.comm.DBUtil;
import com.tax.vo.*;
public class DB_cons {
public DB_cons() {}
	
	DBUtil db = new DBUtil();
	public void addCons(consult cons) {
		PreparedStatement pstm = null;
		String sql = "insert into consult(consID,consName,consDetil,seenNum,ansNum,keptNum,xuanNum,checked,date,userID) values (?,?,?,?,?,?,?,?,?,?)";
		try {
			pstm = db.getConPst(sql);
			//设置参数
			pstm.setInt(1, cons.getConsID());
			pstm.setString(2, cons.getConsName());
			pstm.setString(3, cons.getConsDetail());
			pstm.setInt(4, cons.getSeenNum());
			pstm.setInt(5, cons.getAnsNum());
			pstm.setInt(6, cons.getKeptNum());
			pstm.setInt(7, cons.getXuanNum());
			pstm.setInt(8, cons.getCheck());
			pstm.setDate(9, (Date) cons.getDate());
			pstm.setString(10, cons.getUserID());
			pstm.executeUpdate();
			System.out.println("添加一条数据到consult");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	public void delete(int consID) {
		PreparedStatement pstm = null;
		String sql = "delete from consult where consID= '"+consID+"'";
		try {
			pstm = db.getConPst(sql);
			pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	public int getConsID() {
		//获取下个ID应该设置为多少
		int ID = 0;
		String sql = "select max(consID) from consult";
		PreparedStatement pstm = null;
		try {
			pstm = db.getConPst(sql);
			ResultSet rs = pstm.executeQuery();
			while(rs.next()) {
				ID = rs.getInt("max(consID)");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close(pstm, null);
		}
		return ID+1;
	}
	public void update(consult cons) {
		//用以用户(提问者本身)修改咨询问题和内容
		PreparedStatement pstm = null;
		String sql = "update consult set consDetil = ? where consID = ?";
		try {
			pstm = db.getConPst(sql);
			pstm.setString(1,cons.getConsDetail());
			pstm.setInt(2, cons.getConsID());
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm,null);
		}
	}
	
	
	public consult get(String consName) {
		//根据问题名称找到问题，用于引擎搜索
		consult cons = new consult();
		ResultSet rs = null;
		PreparedStatement pstm = null;
		try {
			String sql = "select * from consult where consName = '"+ consName+ "'";
			pstm = db.getConPst(sql);
			//rs保存结果集
			rs = pstm.executeQuery();
			while(rs.next()) {
				cons.setConsID(rs.getInt("consID"));
				cons.setConsName(rs.getString("consName"));
				cons.setConsDetail(rs.getString("consDetil"));
				cons.setSeenNum(rs.getInt("seenNum"));
				cons.setAnsNum(rs.getInt("ansNum"));
				cons.setKeptNum(rs.getInt("keptNum"));
				cons.setXuanNum(rs.getInt("keptNum"));
				cons.setDate(rs.getDate("date"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(pstm,null);
		}
		return cons;
	}
	
	
	public consult getByID(int consID) {
		//根据咨询问题ID找到问题。用于根据user查找consult
		consult cons = new consult();
		ResultSet rs = null;
		PreparedStatement pstm = null;
		try {
			String sql = "select * from consult where consID = '"+ consID + "'";
			pstm = db.getConPst(sql);
			//rs保存结果集
			rs = pstm.executeQuery();
			while(rs.next()) {
				cons.setConsID(rs.getInt("consID"));
				cons.setConsName(rs.getString("consName"));
				cons.setConsDetail(rs.getString("consDetil"));
				cons.setSeenNum(rs.getInt("seenNum"));
				cons.setAnsNum(rs.getInt("ansNum"));
				cons.setKeptNum(rs.getInt("keptNum"));
				cons.setXuanNum(rs.getInt("keptNum"));
				cons.setDate(rs.getDate("date"));
				cons.setUserID(rs.getString("userID"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(pstm,null);
		}
		return cons;
	}
	
	
	public ArrayList<consult> getToList(ArrayList<Integer> consIDArr){
		int len = consIDArr.size();
		ArrayList<consult> arr = new ArrayList<consult>();
		for(int i=0; i<len; i++) {
			arr.add(getByID(consIDArr.get(i)));
		}
		return arr;
	}
	
	
	public ArrayList<consult> listCons(){
		//在其他的DB类中这个方法被称为Query()
		//用来查询当前数据库中存在的所有的咨询，并且按照访问量排序
		ArrayList<consult> arrCons = new ArrayList<consult>();
		PreparedStatement pstm = null;
		DB_category dca = new DB_category();
		try {
			String sql = "select * from consult order by seenNum desc";
			pstm = db.getConPst(sql);
			ResultSet res = pstm.executeQuery();
			while(res.next()) {
				consult cons = new consult();
				cons.setConsID(res.getInt("consID"));
				cons.setConsName(res.getString("consName"));
				cons.setConsDetail(res.getString("consDetil"));
				cons.setSeenNum(res.getInt("seenNum"));
				cons.setAnsNum(res.getInt("ansNum"));
				cons.setKeptNum(res.getInt("keptNum"));
				cons.setXuanNum(res.getInt("xuanNum"));
				cons.setCheck(res.getInt("checked"));
				cons.setDate(res.getDate("date"));
				cons.setUserID(res.getString("userID"));
//				cons.setCategory(dca.getCate(cons.getConsID()));
				arrCons.add(cons);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(pstm,null);
		}
		dca.listCateInArr(arrCons);
		return arrCons;
	}
	
	
	public ArrayList<answer> getAnsList(int consID){
		//通过consID来查找咨询条目下有哪些回答
		ArrayList<Integer> arr = new ArrayList<Integer>();
		PreparedStatement pstm = null;
		DB_ans da = new DB_ans();
		try {
			String sql = "select ansID from cons_ans where consID = '"+consID+"'";
			pstm = db.getConPst(sql);
			ResultSet rs = pstm.executeQuery();
			while(rs.next()) {
				arr.add(rs.getInt("ansID"));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm, null);
		}
		int len = arr.size();
		ArrayList<answer> res = new ArrayList<answer>();
		for (int i=0; i<len; i++) {
			if(da.getChecked(arr.get(i))==1)
				res.add(da.getByID(arr.get(i)));
		}
		return res;
	}
	
	public ArrayList<consult> listConsByDate(){
		ArrayList<consult> arrCons_1 = new ArrayList<consult>();
		PreparedStatement pstm_1 = null;
		
		DB_category dca_1 = new DB_category();
		try {
			String sql = "select * from consult order by date desc";
			pstm_1 = db.getConPst(sql);
			ResultSet res = pstm_1.executeQuery();
			while(res.next()) {
				consult cons_1 = new consult();
				cons_1.setConsID(res.getInt("consID"));
				cons_1.setConsName(res.getString("consName"));
				cons_1.setConsDetail(res.getString("consDetil"));
				cons_1.setSeenNum(res.getInt("seenNum"));
				cons_1.setAnsNum(res.getInt("ansNum"));
				cons_1.setKeptNum(res.getInt("keptNum"));
				cons_1.setDate(res.getDate("date"));
				cons_1.setXuanNum(res.getInt("xuanNum"));
//				cons.setCategory(dca.getCate(cons.getConsID()));
				arrCons_1.add(cons_1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(pstm_1,null);
		}
		dca_1.listCateInArr(arrCons_1);
		return arrCons_1;
	}
	
	public ArrayList<consult> listConsByXuan(){
		ArrayList<consult> arrCons_3 = new ArrayList<consult>();
		PreparedStatement pstm_3 = null;
		
		DB_category dca_3 = new DB_category();
		try {
			String sql = "select * from consult order by xuanNum desc";
			pstm_3 = db.getConPst(sql);
			ResultSet res = pstm_3.executeQuery();
			while(res.next()) {
				consult cons_3 = new consult();
				cons_3.setConsID(res.getInt("consID"));
				cons_3.setConsName(res.getString("consName"));
				cons_3.setConsDetail(res.getString("consDetil"));
				cons_3.setSeenNum(res.getInt("seenNum"));
				cons_3.setAnsNum(res.getInt("ansNum"));
				cons_3.setKeptNum(res.getInt("keptNum"));
				cons_3.setDate(res.getDate("date"));
				cons_3.setXuanNum(res.getInt("xuanNum"));
//				cons.setCategory(dca.getCate(cons.getConsID()));
				arrCons_3.add(cons_3);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(pstm_3,null);
		}
		dca_3.listCateInArr(arrCons_3);
		return arrCons_3;
	}
	public ArrayList<consult> listConsByDateByID(String userID){
		ArrayList<consult> arrCo = new ArrayList<consult>();
		PreparedStatement pstm_1 = null;
		
		DB_category dca_1 = new DB_category();
		try {
			String sql = "select * from consult where userID = ? order by date desc";
			pstm_1 = db.getConPst(sql);
			pstm_1.setString(1, userID);
			ResultSet res = pstm_1.executeQuery();
			while(res.next()) {
				consult cons_1 = new consult();
				cons_1.setConsID(res.getInt("consID"));
				cons_1.setConsName(res.getString("consName"));
				cons_1.setConsDetail(res.getString("consDetil"));
				cons_1.setSeenNum(res.getInt("seenNum"));
				cons_1.setAnsNum(res.getInt("ansNum"));
				cons_1.setKeptNum(res.getInt("keptNum"));
				cons_1.setDate(res.getDate("date"));
				cons_1.setXuanNum(res.getInt("xuanNum"));
//				cons.setCategory(dca.getCate(cons.getConsID()));
				arrCo.add(cons_1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(pstm_1,null);
		}
		dca_1.listCateInArr(arrCo);
		return arrCo;
	}
}

