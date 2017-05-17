package com.guest.cont;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.guest.DAO.GuestDAO;
import com.guest.dto.User;

@WebServlet("/guestcont")
public class guestCont extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		GuestDAO dao = new GuestDAO();
		List<User> list = dao.selectAll();
		req.setAttribute("list", list);

		if (req.getParameter("name") != null) {// insert
			User user = getUserBeans(req);
			String result = dao.insert(user);
			System.out.println("insert 결과 : " + result);
			return;

		}
		if (req.getParameter("action") != null) {// 한행 조회 (내용보기를 클릭했을 때)
			User user = dao.select(req.getParameter("action"));
			// req.setAttribute("user", user);
			req.getSession().setAttribute("user", user);
			req.getRequestDispatcher("./guestView/editForm.jsp").forward(req, res);
			return;
		}
		if (req.getParameter("update") != null) {// 수정 버튼을 클릭했다면
			User user = (User) req.getSession().getAttribute("user");
			User user2 = getUserBeans(req);

			user2.setId(user.getId());
			user2.setName(user.getName());

			String result = dao.update(user2);
			System.out.println(result);
			res.setHeader("Refresh", "0; URL=guestcont");// 새로고침
			req.getRequestDispatcher("./guestView/list.jsp").forward(req, res);
			return;
		}
		if (req.getParameter("delete") != null) {// 삭제 버튼을 클릭했다면
			User user = (User) req.getSession().getAttribute("user");
			dao.delete(user.getId());
			System.out.println("삭제 성공");
			res.setHeader("Refresh", "0; URL=guestcont");// 새로고침
			req.getRequestDispatcher("./guestView/list.jsp").forward(req, res);
			return;
		}
		req.getRequestDispatcher("./guestView/list.jsp").forward(req, res);
		// 리스트 출력
	}

	private User getUserBeans(HttpServletRequest req) {
		User user = new User(req.getParameter("name"), req.getParameter("pass"), req.getParameter("email"),
				req.getParameter("tel"), req.getParameter("ta"));
		return user;
	}
}
