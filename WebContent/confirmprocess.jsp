<%@page import="com.SignUp.DAO_User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 처리</title>
</head>
<script type="text/javascript">
	function goModifyPage() {
		location.href = "modifyuser.jsp";
	}

	function goDeletePage() {
		if (confirm("정말 삭제하시겠습니까??") == true) { //확인
			location.href = "deleteid.jsp";
		} else { //취소
			return false;
		}
	}
</script>
<body>
	<center>
		<%
			DAO_User dao = new DAO_User();
			int t = dao.loginCheck(request.getParameter("id"), request.getParameter("pass"));
			if (t == 1) {
				session.setAttribute("userID", request.getParameter("id"));
				session.setAttribute("success", "true");
		%>
		<table width="280" border="0" cellpadding="5">
			<tr bgcolor="#3399cc">
				<td><b>로그인 성공</b></td>
			</tr>
			<tr>
				<td>입력하신 아이디와 패스워드를<br> 확인했습니다. <br> <br> <input
					type="button" value="회원정보수정" onclick="goModifyPage()"> <input
					type="button" value="회원탈퇴" onclick="return goDeletePage()"> <br>
					<br> <a href="service.jsp">서비스화면</a>
				</td>
			</tr>
		</table>
		<%
			} else if (t == 0) {
		%>
		<table width="280" border="0" cellpadding="5">
			<tr bgcolor="#3399cc">
				<td><b>로그인 실패</b></td>
			</tr>
			<tr>
				<td>패스워드가 틀립니다.<br> 패스워드를 다시한번 확인해 주시기 바랍니다.<br> <br>
					<a href="userconfirm.jsp">로그인화면</a>
				</td>
			</tr>
		</table>
		<%
			} else {
		%>
		<table width="280" border="0" cellpadding="5">
			<tr bgcolor="#3399cc">
				<td><b>로그인 실패</b></td>
			</tr>
			<tr>
				<td>다시 아이디를 확인하세요.<br> 만약 가입하지 않으신 경우 신규가입을 하시기 바랍니다.<br>
					<br> <a href="userinput.jsp">신규가입</a>
				</td>
			</tr>
		</table>
		<%
			}
		%>
	</center>
</body>
</html>








