<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리의 예술 : 우예</title>

<style>

#conplete{
	color:#808080;
	text-align:center;
	font-weight:bold;
	font-size:25px;
	padding-top: 10%;
}

.btn {
  margin-left:50%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:200px;
  height:40px;
  background: linear-gradient(125deg,#3e9ab0,#e6ba2f, #e6ba2f);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn:hover {
  background-position: right;
}

.shadow-dreamy{
	box-shadow:0 1px 2px rgba(0,0,0,0.07),0 2px 4px rgba(0,0,0,0.07),0 4px 8px rgba(0,0,0,0.07),0 8px 16px rgba(0,0,0,0.07),0 16px 32px rgba(0,0,0,0.07),0 32px 64px rgba(0,0,0,0.07);
	height:400px;
	margin-top:50px;
}

</style>

</head>
<body>
<header>
	<jsp:include page="../includes/header.jsp" flush="false" />
</header>
    
	<div class="container shadow-dreamy">
		<div id="conplete">취향 기입 완료</div>
		<form action="/favmain.do?id=${userId}" method="POST" class="gomypage">
			<input type="submit" class="btn" value="나의 취향 확인"  style="margin-top: 50px; color: #fff;"/>
		</form>
	</div>

	<footer>    
    	<jsp:include page="../includes/footer.jsp" flush="false" />
    </footer>
</body>
</html>