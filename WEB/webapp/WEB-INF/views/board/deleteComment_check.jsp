<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.wooye.board.impl.BoardDAO" %>
<%@ page import="com.wooye.board.BoardVO" %>

<!DOCTYPE html>
<head>
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
<title>�츮�� ���� : �쿹</title>
</head>
<body>
	<!-- header/logo, category -->
	<header>
		<jsp:include page="../includes/header.jsp" flush="false" />
	</header>
	
	<div class="container shadow-dreamy">
		<p id="conplete">��� ���� �Ϸ�</p>
		<a href="/getBoard.do?seq=${board.seq}" class="btn" style="float:left; color: #fff; margin-left:40%;">�Խñ� ���ư���</a>
	    <a href="/boardmain.do" class="btn" style="color: #fff; margin-left:30px;">�� ��� ����</a>
    </div>
    
    <!-- footer/ copyright -->
	<footer>
	   	<jsp:include page="../includes/footer.jsp" flush="false" />
	</footer>
</body>
</html>