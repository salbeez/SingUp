<%@page import="com.SignUp.User"%>
<%@page import="com.SignUp.DAO_User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	String accessId = (String) session.getAttribute("userID");
	String success = (String) session.getAttribute("success");
	System.out.println(accessId + " " + success);
	if (accessId == null && success == null) {
		System.out.println(application.getRealPath("/"));
		RequestDispatcher rd = request.getRequestDispatcher("userconfirm.jsp");
		rd.forward(request, response);
		
	}
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id").trim();
	String pass = request.getParameter("pass").trim();
	String name = request.getParameter("name").trim();
	String jumin = (request.getParameter("jumin1") + "-" + request.getParameter("jumin2")).trim();
	String birth = request.getParameter("year").trim();
	String zip = (request.getParameter("zip1") + "-" + request.getParameter("zip2")).trim();
	String addr = request.getParameter("addr").trim();
	String email = request.getParameter("email").trim();
	String job = request.getParameter("job").trim();
	System.out.println(job);
	User user = new User(id, pass, name, jumin, birth, zip, addr, email, job);
	DAO_User dao = new DAO_User();

	int t = dao.update(user, (String) session.getAttribute("userID"));
%>

<body>
	<center>
		<%
			System.out.println(id);
			if (dao.db_idCheck(id)) {
				t = 1;
				out.print("수정하려는 id존재 x");
			} else {
				out.print("수정하려는 id존재 o");
				t = 0;//일단 수정하려는 ID가가 DB에 이미 존재한다면
			}
			if (t == 1) {
		%>
		<table width="280" border="0" cellpadding="5">
			<tr bgcolor="#3399cc">
				<td><b>수정성공</b></td>
			</tr>
			<tr>
				<td>수정이 잘되었습니다<br> <br> <a href="service.jsp">서비스페이지</a>
				</td>
			</tr>
		</table>
		<%
			} else if (t == 0) {
		%>
		<table width="280" border="0" cellpadding="5">
			<tr bgcolor="#3399cc">
				<td><b>수정실패</b></td>
			</tr>
			<tr>
				<td>정보수정이 되지않았습니다.<br> 입력내용을 다시확인하시고 다시수정하시기 바랍니다.<br>
					<br> <a href="javascript:history.go(-1)">이전화면</a>
				</td>
			</tr>
		</table>
		<%
			} else {
		%>
		<table width="280" border="0" cellpadding="5">
			<tr bgcolor="#3399cc">
				<td><b>수정실패</b></td>
			</tr>
			<tr>
				<td>정보수정이 되지않았습니다.<br> 입력내용을 다시확인하시고 다시수정하시기 바랍니다.<br>
					입력이 정확한 경우에도 수정이 되지 않는 경우 관리자에게 문의하여 주십시요. <br> <br> <a
					href="javascript:history.back(0)">이전화면</a>
				</td>
			</tr>
		</table>
		<%
			}
		%>
	</center>
</body>
</html>







