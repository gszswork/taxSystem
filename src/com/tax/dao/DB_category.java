package com.tax.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.tax.comm.DBUtil;
import com.tax.vo.consult;

public class DB_category {
	public DB_category() {}
	DBUtil db = new DBUtil();
	
	public void addUserCate(String userID,String cate) {
		//添加用户特长分类子方法
		PreparedStatement pstm = null;
		String sql = "insert into user_cate(userID,cateName) values(?,?)";
		try {
			pstm = db.getConPst(sql);
			pstm.setString(1,userID);
			pstm.setString(2,cate);
			pstm.executeUpdate();//执行数据库语句,后面是update不是query！
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(pstm, null);
		}
	}
	
	public void deleteUserCate(String userID) {
		//删除某用户的分类信息，用于给addUserCate铺垫
		PreparedStatement pstm = null;
		String sql = "delete from user_cate where userID=?";
		try {
			pstm = db.getConPst(sql);
			pstm.setString(1,userID);
			pstm.executeUpdate();//执行数据库语句
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(pstm, null);
		}
	}
	
	
	public void addCate(int consID,String cateName) {
		//为咨询添加一个新的类别
		PreparedStatement pstm1 = null;
		ResultSet rs = null;
		PreparedStatement pstm2 = null;
		String getIDSql = "select max(cateID) from category";
		String sql = "insert into category (cateID,consID,cateName) values (?,?,?)";
		try {
			pstm1 = db.getConPst(getIDSql);
			rs = pstm1.executeQuery();
			int ID = rs.getInt("cateID")+1;		//获取当前最大数值然后+1作为下一个分类表的ID
			pstm2 = db.getConPst(sql);
			pstm2.setInt(1, ID);			
			//设置category的ID
			pstm2.setInt(2,consID);
			//设置consult的ID
			pstm2.setString(3, cateName);
			//设置category的名称（具体分类）
			pstm2.executeUpdate();				//提交			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm1, null);
			DBUtil.close(pstm2, null);
		}
	}
	public void listCateInArr(ArrayList<consult> arr) {
		int len = arr.size();
		for(int i=0; i<len; i++) {
			consult cons = arr.get(i);
			cons.setCategory(getCate(cons.getConsID()));
		}
	}
	public ArrayList<String> getCate(int consID){
		//通过咨询条目的ID来查找其所有的分类名称
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ArrayList<String> arr = new ArrayList<String>();   //存储结果的ArrayList链表
		try {
			String sql = "select * from category where consID = '"+consID +"'";
			pstm = db.getConPst(sql);
			rs = pstm.executeQuery();
			while(rs.next()) {
				arr.add(rs.getString("cateName"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm,null);
		}
		return arr;
	}
	public void addConsByCate(ArrayList<consult> arr,String cateName) {
		//这个方法向传参的ArrayList中添加一串cons对象，其中cons的分类名字是cateName
		//实现方法是首先查询所有cateName的category表中元组，然后根据每个元组中的consID
		//来从consult表中访问获取consult对象
		PreparedStatement pstm = null;
		ResultSet rs = null;
		DB_cons dcon = new DB_cons();
		ArrayList<Integer> consIDArr = new ArrayList<Integer>();
		try {
			String sql = "select consID from category where cateName = '"+cateName+"'";
			pstm = db.getConPst(sql);
			rs = pstm.executeQuery();
			System.out.println("diyici");
			while (rs.next()) {
				int consID = rs.getInt("consID");
				consIDArr.add(consID);
			}
			while(rs.next()) {
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm,null);
		}
		arr.addAll(dcon.getToList(consIDArr));
		int len = arr.size();
		for(int i=0; i<len; i++) {
			arr.get(i).setCategory(getCate(arr.get(i).getConsID()));
		}
	}
}
