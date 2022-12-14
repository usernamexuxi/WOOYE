<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<head>
<title>우리의 예술 : 우예</title>
<style>
#conplete{
	color:#808080;
	text-align:center;
	font-weight:bold;
	font-size:25px;
	padding-bottom:50px;
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
  color: #fff;
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
	<!-- header/logo, category -->
	<header>
		<jsp:include page="../includes/header.jsp" flush="false" />
	</header>
	
	<div class="container shadow-dreamy">
		<p id="conplete">신고 완료</p>
	    <a href="/getBoard.do?seq=${board.seq}" class="btn" style="color: #fff;">게시글로 돌아가기</a>
    </div>
    
    <!-- footer/ copyright -->
	<footer>
	   	<jsp:include page="../includes/footer.jsp" flush="false" />
	</footer>
</body>
</html>