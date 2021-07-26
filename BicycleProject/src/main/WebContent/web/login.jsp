<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-16">
<link rel="stylesheet" href="./css/login.css">
<title>로그인</title>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src= "./js/apiLogin.js"></script>

</head>
<body>
	<!--전체 구역-->
	<div class="wrap" style="background-image: url('image/backimage.jpg');">
		<!--로그인 폼 구역-->
		<div class="form-wrap">
			<!--상단 로그인 텍스트-->
			<div class="login">
				<div>
					<span>로그인</span>
				</div>
			</div>

			<!--상단 로고 구역-->
			<div class="social-icons">
				<img src="./image/Loginpage image/카카오톡 로그인폼.png" style = width:80%; alt="Kakao" onclick ="kakaoLogin();"> 
			
			</div>

			<!--로그인-->

			<form id="login" action="login_process.jsp" class="input-group"
				method="post">

				<input name="userID" type="text" class="input-field"
					placeholder="아이디" required> <input name="userPW"
					type="password" class="input-field" placeholder="비밀번호" required>

				<div class="submit-1">
					<button class="submit">
						<span>로그인</span>
					</button>
				</div>
			</form>

		</div>
	</div>
	
</body>
</html>