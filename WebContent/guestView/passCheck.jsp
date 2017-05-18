<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	function check() {
		var pass = document.ffm.passCheck.value;
		var dbPass = '${user.pass}';
		if(pass==dbPass){
			opener.exeUpDel();
			self.close();
		}else{
			alert("권한이 없습니다");
		}
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="ffm">
		<input type="text" name="passCheck" size="5"> <input
			type="button" name="checkBt" size="5" value="확인" onclick="check()">
	</form>
</body>
</html>