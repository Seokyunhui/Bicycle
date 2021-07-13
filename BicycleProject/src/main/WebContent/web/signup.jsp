<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style.css">
<title>회원가입</title>

<link rel="stylesheet" href="./css/signup.css">

</head>
<script type = "text/javascript">
	function checkMember(){
		var regExpId = /^[a-z|A-Z|]/;
		var regExpName = /^[가-힣]*$/;
		var regExpPasswd = /^[a-z|A-Z|0-9]/;
		var regExpPhone = /^[0-9]/;
		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var form = document.register;

		var id = form.id.value;
		var name = form.name.value;
		var passwd = form.passwd.value;
		var passwdck = form.passwdck.value;
		var phone = form.phonenum.value;
		var email = form.email.value;		

		if (!regExpId.test(id)) {
			alert("아이디는 문자로 시작해 주세요!");
			form.id.select();
			return;
		}
		if (!regExpName.test(name)) {
			alert("이름은 한글만으로 입력해 주세요!");
			return;
		}
		if(passwd!=passwdck){
			alert("비밀번호가 일치 하지않습니다.");
			return;
		}
		if(!regExpPasswd.test(passwd)){
			alert("비밀번호는 숫자와 영문자만 입력해주세요");
			return;
		}
		if(!regExpPhone.test(phone)){
			alert("전화번호는 숫자만 입력해주세요");
			return;
		}
		if(!regExpEmail.test(email)){
			alert("이메일을 잘 못 입력하였습니다.");
			return;
		}
		form.submit();

	}

</script>
<body>
        <!--전체 구역-->  
        <div class="wrap" style="background-image: url('image/backimage.jpg');">
            <!--로그인 폼 구역-->  
            <div class="form-wrap">
                <!--상단 로그인 텍스트-->  
                <div class="register">
                    <div>
                        <span>회원가입</span>        
                    </div>
                </div>
    
                <!--상단 로고 구역-->
                <div class="social-icons">
                    <img src="image/카카오톡로고.png" alt="Kakao">
                    <img src="image/네이버로고.png" alt="Naver">
                    <img src="image/구글로고.png" alt="Google">
                </div>

                <!--회원가입 폼 구역-->
                <form name = "register" id="register" action="signup_process.jsp" class="input-group">
                  <input type="text" name = "id" class="input-field" placeholder="아이디" required>
                    <input type="password" name = "passwd" class="input-field" placeholder="비밀번호" required>
                    <input type="password" name = "passwdck" class="input-field" placeholder="비밀번호 확인" required>
                    <input type="text" name = "name" class="input-field" placeholder="이름" required>
                    <input type="text" name = "phonenum" class="input-field" placeholder="전화번호(숫자만 입력해주세요)" required>
                    <input type="text" name = "email" class="input-field" placeholder="이메일(xxx@xxx.xxx)" required>
                    <div class="submit-1">
                        <input type = "button" onclick = "checkMember()" value = "전송"><span>회원가입</span>
                    </div>
                </form>
                
            </div>
        </div>
        <script>
        
        </script>
   
</body>
