<%@page import="com.SignUp.DAO_User"%>
<%@page import="com.SignUp.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id"); 
String pass = request.getParameter("pass"); 
String name = request.getParameter("name"); 
String jumin = request.getParameter("jumin1")+"-"+request.getParameter("jumin2"); 
String birth = request.getParameter("year"); 
String zip = request.getParameter("zip1")+"-"+request.getParameter("zip2"); 
String addr = request.getParameter("addr"); 
String email = request.getParameter("email"); 
String job = request.getParameter("job"); 
System.out.println(job);
User user = new User(id,pass,name,jumin,birth,zip,addr,email,job);
DAO_User dao = new DAO_User();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가입처리결과</title>
</head>
<body>
	<center>
		<%
		int t=dao.insert(user);
		if(t==1){ 
			session.setAttribute("success", "true");%>
		<table width="330" border="0" cellpadding="5">
			<tr bgcolor="#3399cc">
				<td><b>님 가입을 축하합니다.</b></td>
			</tr>
			<tr>
				<td>입력하신 내용대로 가입이 완료되었습니다.<br> 님께서 요청하신 아이디와 패스워드입니다.
					<p align="center">
						아이디:
						<%=id %><br> 패스워드:
						<%=pass %><br> <br> <a href="userconfirm.jsp">로그인 화면</a>
					</p>
				</td>
			</tr>
		</table>
		<%} else{%>
		<table width="330" border="0" cellpadding="5">
			<tr bgcolor="#3399cc">
				<td><b>가입이 되지않았습니다.<br> 입력내용을 다시 한번 확인해 주세요.
				</b></td>
			</tr>
			<%if(t==-1){ %>
			<tr>
				<td>
					<p align="center">
						입력이 정확한 경우에도 가입이 되지 않는 경우 관리자에게 문의하여 주십시요. <br> <a
							href="javascript:history.back()">이전화면</a>
					</p>
				</td>
			</tr>
			<% }%>
		</table>
		<%} %>
	</center>
</body>
</html>