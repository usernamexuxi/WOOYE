<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리의 예술 : 우예</title>

<style>

.mainTitle{
	height:500px;
	margin:20px;
	padding:0 60px 0 60px;
}

hr{
	width:80%;
}

#booking{
	text-align:center;
	font-weight:bold;
	font-size:25px;
	margin-top:200px;
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

</style>
</head>
<body>
<header>
	<jsp:include page="../includes/header.jsp" flush="false" />
</header>

<section class="mainTitle">
	<h2>예약 완료</h2>
    

	<hr>
	
	<div id="booking">예약이 완료되었습니다. (중복 예약 불가능)</div>
	<form action="/mypage.do?id=${userId}" method="POST" class="gomypage">
	<input type="submit" class="btn" value="마이페이지 확인" style="margin-top: 50px"/>
	</form>
</section>

<hr>
	<footer>    
    	<jsp:include page="../includes/footer.jsp" flush="false" />
    </footer>
</body>
</html>