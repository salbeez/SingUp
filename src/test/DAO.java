package test;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	Properties pro;

	Context ctx;
	DataSource ds;

	public DAO() {
		try {
			ctx = new InitialContext();
			Context tomCtx = (Context) ctx.lookup("java:comp/env");
			ds = (DataSource) tomCtx.lookup("jdbc/oracle");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void connect() {// DB?ó∞Í≤? Í∞ùÏ≤¥ ?Éù?Ñ±
		try {
			conn = DriverManager.getConnection(pro.getProperty("url"), pro);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// connect

	private void disconnect() {// DB?ûê?õê Î∞òÌôò
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

	public ArrayList<UserInfo> selectAll() {
		ArrayList<UserInfo> users = new ArrayList<>();
		connect();
		String sql = "select empno,ename,hiredate,sal,dname from emp inner join dept using(deptno)";
		System.out.println(sql);

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				UserInfo user = new UserInfo();
				user.setEmpno(rs.getString("empno"));
				user.setEname(rs.getString("ename"));
				user.setHireDate(rs.getString("hiredate"));
				user.setSal(rs.getString("sal"));
				user.setDeptNo(rs.getString("dname"));
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disconnect();
		}

		return users;
	}

	public List<UserInfo> findAll() {
		List<UserInfo> users = new ArrayList<>();
		try {
			conn = ds.getConnection();
			String sql = "select empno, ename, dname, s.GRADE "
					+ "from emp inner join dept using(deptno) , salgrade s "
					+ "where sal BETWEEN s.losal AND s.hisal";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				UserInfo user = new UserInfo();
				user.setEmpno(rs.getString("empno"));
				user.setEname(rs.getString("ename"));
				user.setDeptNo(rs.getString("dname"));
				user.setSal(rs.getString("GRADE"));
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return users;
	}
}
