<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
* {
  margin: 0;
  box-sizing: border-box;
}
img, label {display:inline-block;}
label {width:130px}
html {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Open Sans",
    "Helvetica Neue", sans-serif;
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
  content: "GloryKO©";
  display: block;
  margin-top: 50px;
  color: #fff;
  font-size: 12px;
  font-weight: 600;
}

.modal {
  position: relative;
  flex-grow: 0;
  flex-shrink: 0;
  padding: 40px 36px 36px;
  border-radius: 12px;
  background-color: #fff;
  transition: box-shadow 250ms ease-in, transform 250ms ease-in;
}

.modal:hover {
  transform: translateY(-1px);
  box-shadow: 0 5px 10px 0 rgba(0, 0, 0, 0.3);
}

h1 {
  margin-bottom: 20px;
  font-size: 30px;
  line-height: 1.35;
  font-weight: 600;
  letter-spacing: -0.025em;
  color: #474747;
}

h2 {
  margin-bottom: 20px;
  font-size: 24px;
  line-height: 1.35;
  font-weight: 600;
  letter-spacing: -0.025em;
  color: #474747;
}

p {
  margin-bottom: 28px;
  font-size: 14px;
  line-height: 1.5;
  color: #666;
  letter-spacing: 0.01em;
}

button {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  min-width: 320px;
  height: 65px;
  border-radius: 6px;
  color: #fff;
  font-size: 18px;
  font-weight: 500;
  letter-spacing: 0.01em;
  text-decoration: none;
  background: linear-gradient(90deg, #ff8806 0%, #fb07f3 100%);
}
</style>
</head>

<body>
	<div style = 'text-align:center; padding-top:100px'>
	    <div class="modal">
	    <form method = "post" action="loginOK">
	        <h1>영광,재호's 한마지로 게시판 로그인</h1>
	        <h2>
	            &nbsp;&nbsp;&nbsp;User ID: <input type='text' name='userid'/> <br/>
	            Password: <input type='password' name='password'/> <br/>
	        </h2>
	        <p>
	        <a href="signuppage">자네가 회원이 아닌건 말이 되고...?</a>
	        </p>
	        <button type="submit">login</button>
	    </form>
	        
	    </div>
    </div>
</body>
</html>