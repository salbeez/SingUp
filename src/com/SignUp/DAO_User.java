package com.SignUp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;

public class DAO_User extends HttpServlet {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	Properties pro;

	Context ctx;
	DataSource ds;

	public DAO_User() {
		try {
			ctx = new InitialContext();
			Context tomCtx = (Context) ctx.lookup("java:comp/env");
			ds = (DataSource) tomCtx.lookup("jdbc/oracle");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void connect() {
		try {
			conn = DriverManager.getConnection(pro.getProperty("url"), pro);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// connect

	private void disconnect() {
		try {
			if (rs != null)
				rs.close();
			// if(stmt!=null)stmt.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// disconnect

	public boolean db_idCheck(String id) {
		try {
			conn = ds.getConnection();
			String sql = "select id from userinfo where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs != null && rs.next()) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public int insert(User user) {
		try {
			conn = ds.getConnection();
			String sql = "INSERT INTO userinfo VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			System.out.println(user.getId()+"  "+user.getPass()+user.getName()+user.getJumin()+user.getBirth()+user.getZip()+user.getAddr()+user.getEmail()+user.getJob());
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPass());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getJumin());
			pstmt.setString(5, user.getBirth());
			pstmt.setString(6, user.getZip());
			pstmt.setString(7, user.getAddr());
			pstmt.setString(8, user.getEmail());
			pstmt.setString(9, user.getJob());
			int t = pstmt.executeUpdate();
			if(t != 0){
				return 1;
			}else{
				return 0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}
}
