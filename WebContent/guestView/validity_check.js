function valide() {
	var name = document.ffm.name.value.trim();
	var email = document.ffm.email.value.trim();
	var tel = document.ffm.tel.value.trim();
	var pass = document.ffm.pass.value.trim();
	var ta = document.ffm.ta.value.trim();

	var emailExp = /^[a-zA-Z0-9]{6,15}@[a-zA-Z]+\.[a-zA-Z]+$/g;
	if (name.length <= 0) {
		alert("작성자를 작성해주십쇼");
		return false;
	}
	if (email.length <= 0) {
		alert("이메일을 작성해주십쇼");
		return false;
	} else {
		if (!emailExp.test(email)) { //이메일 패턴에 해당하지 않았다면
			alert("이메일 형식에 맞게 작성해 주세요 . 형식(6~15자리@a-zA-Z.com )");
			return false;
		}
	}
	if (pass.length <= 0) {
		alert("비밀번호를 작성해 주시오");
		return false;
	}
	alert("유효성검사 성공");
	return true;
}

