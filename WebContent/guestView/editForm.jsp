<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
	var choice;
	function passCheck(updel) {
		choice = updel;
		window.open('guestView/passCheck.jsp', 'PassWord 체크', "width=150,height=50,location=no,resizable=no,status=no");
	}
	function exeUpDel() {
		if (choice == 'up') {

			document.ffm2.submit();
		} else if (choice == 'del') {
			location.href = "../guestcont?delete=z";
		}
	}
</script>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/guestView/table.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h3>
			<b>수정폼</b>
		</h3>
		[<a href="guestcont">게시물 목록으로</a>]
		<form action="guestcont" name="ffm2" method="post">
			<input type="hidden" name="del" value="edit">
			<table cellpadding="5" border="1">
				<tr class="field">
					<td class="filed">작성자</td>
					<td><input type="text" name="name" disabled="disabled"></td>
				</tr>
				<tr>
					<td class="filed">email</td>
					<td><input type="text" name="email" value="${user.email }"></td>
				</tr>
				<tr>
					<td class="filed">전화번호</td>
					<td><input type="text" name="tel" value="${user.tel }"></td>
				</tr>
				<tr>
					<td class="filed">비밀번호</td>
					<td><input type="password" name="pass" value="${user.pass }"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="4" cols="50" name="ta">${user.contents }
				</textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="수정" name="update"
						onclick="passCheck('up')"> <input type="reset" value="취소">
						<input type="button" value="삭제" name="delete"
						onclick="passCheck('del')"></td>
				</tr>
			</table>
		</form>
		${pageContext.request.contextPath}
	</center>
</body>
</html>