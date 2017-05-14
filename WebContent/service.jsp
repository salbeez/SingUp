<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Session인증자 페이지</title>
<style type="text/css">
<!--
.normal {
	font-family: "굴림", "돋움";
	font-size: x-small;
	font-style: normal;
	font-weight: normal;
	text-decoration: none
}

.normalbold {
	font-family: "굴림", "돋움";
	font-size: x-small;
	font-style: normal;
	font-weight: bold;
	text-decoration: none
}
-->
</style>
</head>
<%
	//세션 로그인 체크
	String accessId = (String) session.getAttribute("userID");
	String success = (String) session.getAttribute("success");
	System.out.println(accessId + " " + success);
	if (accessId == null && success == null) {
		System.out.println(application.getRealPath("/"));
		RequestDispatcher rd = request.getRequestDispatcher("userconfirm.jsp");
		rd.forward(request, response);

	}
	//만약 로그인을 거치지 않고 직접 주소로 들어왔다면 T1.jsp로 강제 이동
	//D:\git\SignUP\img\망했다2.jpg
	//D:\git\SignUP\WebContent\밥상엎기.jpg
%>
<body>
	<center>
		<p>
			<img src="img/망했다2.jpg" width="400" height="300">
				<img src="img/밥상엎기.jpg" width="400" height="300">
		</p>
		<p class="normalbold">이 페이지는 사용자 인증을 받아야 볼 수 있죠!</p>
		<p class="normal">감사합니다....</p>
		<p class="normal">
			<a href="logOut.jsp">로그아웃</a>
		</p>
	</center>
</body>
</html>










