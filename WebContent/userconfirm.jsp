
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인폼</title>

</head>
<body>
	<center>
		<form name="frm" method="post" action="confirmprocess.jsp">

			<table width=320 border="0" cellpadding="5">
				<tr bgcolor="#3399cc">
					<td height="40"><b><font color="#ffffff" size="3">Log-In</font>
					</b></td>
				</tr>
				<tr>
					<td><a href="userinput.jsp">회원 가입</a>
						<p>사용자 아이디와 패스워드를 입력하세요.</p>
						<p>
							아이디 : <input type="text" name="id">
						</p>
						<p>
							패스워드 : <input type="password" name="pass">
						</p>
						<p>
							<input type="submit" name="confirm" value="로그인"> <input
								type="reset" value="취소">
						</p></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>