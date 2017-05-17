<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h3>
			<b>방명록: 리스트</b>
			<hr>
			<a href="./guestView/inputForm.jsp">방명록 쓰기</a>
		</h3>
		<form method="post">
			<table cellpadding="5" border="1">
				<tr bgcolor="#00CCCC">
					<th>번호</th>
					<th>작성자</th>
					<th>전화번호</th>
					<th>작성일</th>
					<th>내용</th>
				</tr>
				<c:forEach var="row" items="${list}">
					<tr>
						<td>${row.id}</td>
						<td>${row.name}</td>
						<td>${row.tel}</td>
						<td>row.gdate</td>
						<td><a href="guestcont?action=${row.id }">${row.contents}</a></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</center>
</body>
</html>