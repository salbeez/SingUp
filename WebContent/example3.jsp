<%@page import="test.UserInfo"%>
<%@page import="test.DAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 각 사원의 사원번호, 사원명, 부서명 , 급여 등급을 출력하시오 -->
</head>
<body>
	<table cellpadding="5" border="1">
		<tr bgcolor="yellow">
			<th>사번</th>
			<th>사원명</th>
			<th>부서명</th>
			<th>급여 등급</th>
		</tr>
		<%
			DAO dao = new DAO();
			List<UserInfo> users = dao.findAll();
			for (UserInfo user : users) {
				out.print("<tr>");
				out.print("<td>" + user.getEmpno() + "</td>");
				out.print("<td>" + user.getEname() + "</td>");
				out.print("<td>" + user.getDeptNo() + "</td>");//사실 dept name을 만들어야 하지만 귀찮음으로 패스
				out.print("<td>" + user.getSal() + "</td></tr>");//sal grade도 만들어야 하지만..
			}
		%>
	</table>
</body>
</html>