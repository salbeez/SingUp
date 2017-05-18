<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/guestView/table.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="validity_check.js">
</script>
<body>
	<center>
		<h3>
			<b>입력폼</b>
		</h3>
		[<a href="../guestcont">게시물 목록으로</a>]
		<form action="../guestcont" name="ffm" method="post">
			<table cellpadding="5" border="1">
				<tr>
					<td class="filed">작성자</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td  class="filed">email</td>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td  class="filed">전화번호</td>
					<td><input type="text" name="tel"></td>
				</tr>
				<tr>
					<td  class="filed">비밀번호</td>
					<td><input type="password" name="pass"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="4" cols="50" name="ta">
				</textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="입력"
						onclick="return valide()"> <input type="reset" value="취소"></td>
				</tr>
			</table>
			루트 경로 찾기 : ${pageContext.request.contextPath}
		</form>
	</center>
</body>
</html>