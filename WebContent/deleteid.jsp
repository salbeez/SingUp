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
 	if (accessId == null && success == null) {
		System.out.println(application.getRealPath("/"));
		RequestDispatcher rd = request.getRequestDispatcher("userconfirm.jsp");
		rd.forward(request, response);
	}
	DAO_User dao = new DAO_User();
	boolean flag = dao.delete(accessId);
%>

<body>
	<center>
		<%
			if (flag) {
				session.invalidate();//현제 로그인된 얘를 지우기 위해
		%>
		<table width="280" border="0" cellpadding="5">
			<tr bgcolor="#3399cc">
				<td><b>삭제성공</b></td>
			</tr>
			<tr>
				<td>삭제가 잘되었습니다.<br> 이용해 주셔서 감사합니다. <br> <br> <a
					href="service.jsp">서비스페이지</a>
				</td>
			</tr>
		</table>
		<%
			} else {
		%>
		<table width="280" border="0" cellpadding="5">
			<tr bgcolor="#3399cc">
				<td><b>삭제실패</b></td>
			</tr>
			<tr>
				<td>삭제가 되지않았습니다.<br> 잠시 후 다시 시도해 보시기 바랍니다.<br> <br>
					<a href="javascript:history.go(-1)">이전화면</a>
				</td>
			</tr>
		</table>
		<%
			}
		%>
	</center>
</body>
</html>










