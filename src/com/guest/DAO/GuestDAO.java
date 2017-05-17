package com.guest.DAO;

import java.sql.SQLException;
import java.util.List;

import com.guest.dto.User;
import com.ibatis.sqlmap.client.SqlMapClient;

import iba.conf.MySqlMapClient;

public class GuestDAO {
	SqlMapClient smc;

	public GuestDAO() {
		smc = MySqlMapClient.getSqlMapInstance();
	}

	public String insert(User user) {
		try {
			smc.insert("guest.userAdd", user);
			return "success";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "fail";
		}
	}

	public List<User> selectAll() {
		List<User> list = null;
		try {
			list = smc.queryForList("guest.findAll_list");
			System.out.println(list.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public User select(String id) {
		User user = null;
		try {
			user = (User) smc.queryForObject("guest.selectUser", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	public String update(User user) {
		String result = null;
		try {
			int t = smc.update("guest.updateUser", user);
			if (t > 0) {
				return "success";
			} else {
				return "fail_update";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return "fail_sql";
		}
	}

	public String delete(int id) {
		String result = null;
		try {
			smc.delete("guest.deleteRow", id);
			return "delete_Success";
		} catch (SQLException e) {
			e.printStackTrace();
			return "fail_sql";
		}
	}
}
