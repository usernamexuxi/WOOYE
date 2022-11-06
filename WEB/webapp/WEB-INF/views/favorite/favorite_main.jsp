<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.wooye.user.UserVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리의 예술 : 우예</title>
<link href="${pageContext.request.contextPath}/resources/css/base.css"
	rel="stylesheet" type="text/css">

<style>
.conplete{
	color:#808080;
	text-align:center;
	font-weight:bold;
	font-size:25px;
	padding-bottom:50px;
	padding-top: 10%;
}
.shadow-dreamy{
	box-shadow:0 1px 2px rgba(0,0,0,0.07),0 2px 4px rgba(0,0,0,0.07),0 4px 8px rgba(0,0,0,0.07),0 8px 16px rgba(0,0,0,0.07),0 16px 32px rgba(0,0,0,0.07),0 32px 64px rgba(0,0,0,0.07);
	height:400px;
	margin-top:50px;
}
.btn {
  text-align: center;
  margin-left: 50%;
  margin-top: 20px;
  transform: translateX(-50%);
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
  display: inline;
}
.btn:hover {
  background-position: right;
}
/* table */
.theadColor{
	background-color:#495957;
	color: #fff
}
.table{
	margin: 30px 0 70px 0;
}
.table th {
	text-align: center;
}
.table td {
	text-align: center;
}
.tblRecom td{
	width: 300px;
}
.tdA{
	color:#3e9ab0;
	text-align:center;
	font-size:20px;
}
.tdA a:hover{
	color:#3e9ab0;
	text-decoration:none;
}
.tdB{
	color:#e6ba2f;
	text-align:center;
	font-size:18px;
}
.tdB a:hover{
	color:#e6ba2f;
	text-decoration:none;
}
/* ment */
.ment1{
	font-weight:bold;
	font-size:30px;
	text-align:center;
	margin-bottom:50px;
}
.spanColor{
	color:#3e9ab0;
}
.part_name{
	text-align:left;
	font-weight:bold;
	font-size:25px;
	padding-bottom:25px;
	padding-top:25px;
}
.recomList{
	margin-top:10%;
	text-align:center;
	font-weight:bold;
	font-size:25px;
	padding-bottom:25px;
	padding-top:25px;
}
</style>

</head>
<body>
	<header>
		<jsp:include page="../includes/header.jsp" flush="false" />
	</header>
	
	<!-- 로그인 전 -->
	<c:if test="${userName == null}">
		<div class="container shadow-dreamy">
			<p class="conplete">로그인이 필요한 서비스 입니다.</p>
			<a href="/login.do"  class="btn" style="float:left; color: #fff; margin-left:40%;">로그인</a>
			<a href="/join.do"  class="btn" style="color: #fff; margin-left:30px;">회원가입</a>
		</div>
	</c:if>
	
	<!-- 로그인 후 -->
	
	<c:if test="${userName != null}">
	<div class="container">
			<p class="ment1"><span class="spanColor">${userName}</span>님을 위한 예술 플레이리스트</p>
			
			<p class="part_name">${userName}님이 선택한 취향</p>			
			
			<table class="table table-bordered">
			<thead class="theadColor">
				<tr>
					<th>시대</th>
				</tr>
			</thead>
				<c:forEach items="${eraList}" var="era" varStatus="i">
					<tr>
						<td>${era.title}</td>
					</tr>
				</c:forEach>
			</table>
			
			<table class="table table-bordered">
			<thead class="theadColor">
				<tr>
					<th>화가</th>
				</tr>
			</thead>
				<c:forEach items="${artistList}" var="artist" varStatus="i">
					<tr>
						<td>${artist.title}</td>
					</tr>
				</c:forEach>
			</table>
			
			<table class="table table-bordered">
			<thead class="theadColor">
				<tr>
					<th>음악가</th>
				</tr>
			</thead>
				<c:forEach items="${musicianList}" var="musician" varStatus="i">
					<tr>
						<td>${musician.title}</td>
					</tr>
				</c:forEach>
			</table>
			
			<table class="table table-bordered">
			<thead class="theadColor">
				<tr>
					<th>명화</th>
				</tr>
			</thead>
			<c:forEach items="${artList}" var="art" varStatus="i">
				<tr>
					<td>${art.title}</td>
				</tr>
			</c:forEach>
			</table>
			
			<table class="table table-bordered">
			<thead class="theadColor">
				<tr>
					<th>클래식</th>
				</tr>
			</thead>
			<c:forEach items="${classicList}" var="classic" varStatus="i">
				<tr>
					<td>${classic.title}</td>
				</tr>
			</c:forEach>
			</table>
			
		<a href="/newmyfav.do?id=${userId}" class="btn btn-secondary mb-3">취향 재설정</a>

		<div class="shadow-dreamy">
			<p class="recomList">추천 리스트</p>
			<table class="table table-striped tblRecom">
				<tr>
					<td><a href="/myfav_cn.do?id=${userId}" class="tdA">명화 추천</a></td>
				</tr>
				<tr>
					<td><a href="/myfav_cp.do" class="tdA">타회원의 명화 추천 플레이리스트</a></td>
				</tr>
				<tr>
					<td><a href="/myfav_co.do?id=${userId}" class="tdA">클래식 추천</a></td>
				</tr>
			</table>
		</div>
</div>
	</c:if>
	<footer>
		<jsp:include page="../includes/footer.jsp" flush="false" />
	</footer>
</body>
</html>