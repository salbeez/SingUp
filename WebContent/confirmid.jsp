<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%-- confirmid.jsp --%>
<body>
	<center>
		<table width="280" border="0" cellpadding="5">
			<tr bgcolor="#3399cc">
				<td><b>사용불가능</b></td>
			</tr>
			<tr>
				<td>이미 사용중인 아이디입니다.<br> 다른 아이디를 선택하십시요!!
				</td>
			</tr>
		</table>
		<input type="button" value="닫기" onclick="window.close()">
		<table width="280" border="0" cellpadding="5">
			<tr bgcolor="#3399cc">
				<td><b>사용가능</b></td>
			</tr>
			<tr>
				<td>사용가능한 아이디입니다^^*</td>
			</tr>
		</table>
		<a href="javascript:self.close()">창닫기</a>
	</center>
</body>
</html>
