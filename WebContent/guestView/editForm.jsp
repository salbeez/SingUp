<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h3>
			<b>수정폼</b>
		</h3>
		[<a href="guestcont">게시물 목록으로</a>]
		<form action="guestcont" name="ffm2"
			method="post">
			<table cellpadding="5" border="1">
				<tr>
					<td bgcolor="#00CCCC">작성자</td>
					<td><input type="text" name="name" disabled="disabled"></td>
				</tr>
				<tr>
					<td bgcolor="#00CCCC">email</td>
					<td><input type="text" name="email" value="${user.email }"></td>
				</tr>
				<tr>
					<td bgcolor="#00CCCC">전화번호</td>
					<td><input type="text" name="tel" value="${user.tel }"></td>
				</tr>
				<tr>
					<td bgcolor="#00CCCC">비밀번호</td>
					<td><input type="text" name="pass" value="${user.pass }"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="4" cols="50" name="ta">${user.contents }
				</textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="수정" name="update" >
						<input type="reset" value="취소"> <input type="submit"
						value="삭제" name="delete"></td>
				</tr>
			</table>
			</from>
	</center>
</body>
</html>