<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/font.css" rel="stylesheet" type="text/css">
<style>

*{
	font-family: 'Cafe24SsurroundAir';
}

#mainCate{
	margin-right:50px;
}

#mainCate ul{  
	display: table;
  	margin-left: auto;
 	margin-right: auto;
}

#mainCate li{
	list-style-type: none;
	float: left;
	margin-left: 50px;
	font-weight:bold;
	font-size: 1.4em;
}

#mainCate a{
  color: black;
}

#mainCate a:hover{
	color:#e6ba2f;
	text-decoration:none;
}

#logo{
	width: 220px;
	height: 70px;
	float: left;
	margin-right: 20px;
}

.header{
    padding: 50px 50px 30px 50px;
    min-width:1250px;
}

.loginForm span{
	padding-right:20px;
	font-size: 1.2em;
	color: #737373;
}

.hi{
	margin-left:85%;
}
#userName{
	color:#e6ba2f;
	font-weight:bold;
}

.color{
	color:#808080;
}

.color a:hover{
	color:#808080;
	text-decoration:none;
}
</style>

<script>
var div2 = document.getElementsByClassName("div2");

function handleClick(event) {
  console.log(event.target);
  // console.log(this);
  // 콘솔창을 보면 둘다 동일한 값이 나온다

  console.log(event.target.classList);

  if (event.target.classList[1] === "clicked") {
    event.target.classList.remove("clicked");
  } else {
    for (var i = 0; i < div2.length; i++) {
      div2[i].classList.remove("clicked");
    }

    event.target.classList.add("clicked");
  }
}

function init() {
  for (var i = 0; i < div2.length; i++) {
    div2[i].addEventListener("click", handleClick);
  }
}

init();

</script>

</head>
<body>
<div class="container header">
	<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
		<a href="/main.do"><img src="img/Logo.jpg" id="logo"/></a>
		<ul id="mainCate" align="center">
			<li><a href="/exconmain.do">전시회/공연</a></li>
			<li><a href="/ottmain.do">OTT</a></li>
			<li><a href="/infomain.do">정보</a></li>
			<li><a href="/favmain.do?id=${userId}">나의 취향</a></li>
			<li><a href="/boardmain.do">커뮤니티</a></li>
		</ul>
		<p class="loginForm" align="right">
			<c:if test="${userId == null}">
				<a href="/login.do"><span id="login" class="color">로그인</span></a>
				<a href="/join.do"><span id="join" class="color">회원가입</span></a>
			</c:if>
			<c:if test="${userId != null}">
				<a href="/logout.do"><span id="logout" class="color">로그아웃</span></a>
				<a href="/mypage.do?id=${userId}"><span id="mypage" class="color">마이페이지</span></a>
			</c:if>
			</p>
		<p>
			<c:if test="${userId != null}">
				<p class="hi"><span id="userName">${userName}</span>님 환영합니다.</p>
			</c:if>
		</p>
	</header>
</div>
</body>
</html>