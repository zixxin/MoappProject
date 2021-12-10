<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url("https://fonts.googleapis.com/css?family=Nunito+Sans:400,600,700&display=swap");

* {
  margin: 0;
  box-sizing: border-box;
}

html {
  font-family: "Nunito Sans", sans-serif;
  font-size: 16px;
  line-height: 1.5;
  color: #1f2d3d;
}

body {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100vh;
  margin: 0 auto;
  background-color: #1f2d3d;
}

body::after {
  /* content: "kimbug©"; */
  display: block;
  margin-top: 50px;
  color: #fff;
  font-size: 12px;
  font-weight: 600;
}

body > h1 {
  margin-bottom: 32px;
  font-size: 20px;
  line-height: 28px;
  color: #fff;
}

body > h1 span {
  display: block;
  font-size: 14px;
  font-weight: 400;
  line-height: 20px;
  opacity: 0.5;
}

body > h1 a {
  color: #fff;
  text-decoration: none;
}

body > h1,
.receipt {
  width: 100%;
  max-width: 320px;
}

.receipt {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 48px 32px 32px;
  border-radius: 12px;
  background-color: #fff;
  /* background-image: url("https://admissions.handong.edu/site/handong-adm/res/img/sub_kuyper01.png"); */
  background-repeat: no-repeat;
  background-size: 40px auto;
  background-position: 91% 28px;
}

.receipt > span {
  order: 1;
  display: block;
  width: 100%;
  margin-bottom: 20px;
  font-size: 14px;
  line-height: 20px;
  font-weight: 600;
  color: #80868e;
}

.receipt h2 {
  order: 2;
  margin-bottom: 24px;
  font-size: 18px;
  font-weight: 600;
  line-height: 24px;
  color: #333e47;
}

.receipt .barcode {
  order: 3;
  width: 120px;
  margin-bottom: 32px;
}

.receipt img {
  width: 100%;
  height: auto;
}

.receipt > div {
  order: 4;
}

.receipt dl {
  width: 100%;
}

.receipt dl div,
.receipt dl:last-child {
  display: flex;
  justify-content: space-between;
  margin-bottom: 4px;
  font-size: 14px;
  opacity: 0.8;
}

.receipt dl:last-child {
  margin-bottom: 16px;
}

.receipt > div {
  display: flex;
  flex-direction: column-reverse;
  width: 100%;
}
button {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 65px;
  border-radius: 6px;
  color: #fff;
  font-size: 18px;
  font-weight: 500;
  letter-spacing: 0.01em;
  text-decoration: none;
  background: #1f2d3d;
}
</style>
</head>
<body>
 TESTING PAGE
 <h1>회원 가입 페이지 <span>정보는 제 DB에 저장됩니다.</span></h1>
 
 <div class="receipt">
	
	
	<form action="signupOK" name="signupForm" method="post">
	<h2>회원 정보 입력</h2>
	<strong class = "barcode"><img src="../img/makeID.png"></strong>
	<span aria-label="Issued on DATE">${serverTime}</span>
		<div>
			<dl>
				<dt>&nbsp;&nbsp;닉네임&nbsp;&nbsp;<input type="text" required name="username"/></dt>
				<dd></dd>
			</dl>
		</div>
		<div>
			<dl>
				<dt>&nbsp;&nbsp;아이디&nbsp;&nbsp;<input type="text" required name="userid"/></dt>
				<dd></dd>
			</dl>
		</div>
		<div>
			<dl>
				<dt>비밀번호<input type="text" required name="password"/></dt>
				<dd></dd>
			</dl>
		</div>
		<div>
			<dl>
				<dt>메일주소<input type="email" required name="email" minlength="3"/></dt>
				<dd></dd>
			</dl>
		</div>
		<!-- <tr><td>비밀번호 재입력</td><td><input type="text" name="repassword"/></td></tr> -->
		<div>
			<dl>
				<dt>
					<button type="button" onclick="location.href='login'">돌아가기</button>
				</dt>
				<dd>
					<button type="submit">가입하기</button>
				</dd>
			</dl>
		</div>
		
	</form>
</div>
</body>
</html>