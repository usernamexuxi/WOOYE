<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>우리의 예술 : 우예</title>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

body{
		min-width: 1250px;
	}
.login-page {
  width: 65%;
  margin: auto;
  padding-top:40px;
}
.form {
  position: relative;
  z-index: 1;
  background: #fff;
  max-width: 600px;
  min-width:360px;
  width:100%;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
#btn {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: rgb(230,186,47);
  width: 70%;
  margin-top:20px;
  border: 0;
  border-radius: 80px;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
#btn:hover, #btn:active,#btn:focus {
  background: rgb(62,154,176);
}
.form .message {
  margin: 15px 0 0;
  color: #000;
  font-size: 12px;
}
.form .message a {
  color: #3e9ab0;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
#loginInfo{
	text-align:center;
	font-size:30px;
	font-weight:bold;
	margin-top:50px;
	
}
</style>
<script>
$('.message a').click(function(){
      $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
   });
</script>
<header>
<jsp:include page="../includes/header.jsp" flush="false" />
</header>
<div id="loginInfo">로그인</div>
<div class="login-page">
  <div class="form">
    <form action="/login.do" method="post">
      <input type="text" id="name" name="id" value="${user.id}" placeholder="아이디"/>
      <input type="password" name="password" name="password" value="${user.password}" placeholder="비밀번호"/>
      <input type="submit" id="btn" value="로그인" />
    </form>
     <p class="message">회원이 아니신가요? <a href="/join.do">회원가입</a></p>
  </div>
</div>
<footer>
	   <jsp:include page="../includes/footer.jsp" flush="false" />
</footer>