<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var emailExp = /^[a-zA-Z0-9]{6,15}@[a-zA-Z]+\.[a-zA-Z]+$/g;
	var f ="";
	f.value = "asddsfg@agkl.com";
	alert(f.value+" : "+emailExp.test(f.value));
	alert(f.value+" : "+regExp.test(f.value));
</script>
<body>
</body>
</html>