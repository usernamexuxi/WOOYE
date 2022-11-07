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
.conplete {
	color: #808080;
	text-align: center;
	font-weight: bold;
	font-size: 15px;
	padding-bottom: 50px;
	padding-top: 10%;
}

.shadow-dreamy {
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.07), 0 2px 4px rgba(0, 0, 0, 0.07),
		0 4px 8px rgba(0, 0, 0, 0.07), 0 8px 16px rgba(0, 0, 0, 0.07), 0 16px
		32px rgba(0, 0, 0, 0.07), 0 32px 64px rgba(0, 0, 0, 0.07);
	height: 400px;
	margin-top: 50px;
}

.btn {
	text-align: center;
	margin-left: 50%;
	margin-top: 20px;
	transform: translateX(-50%);
	width: 200px;
	height: 40px;
	background: linear-gradient(125deg, #3e9ab0, #e6ba2f, #e6ba2f);
	background-position: left;
	background-size: 200%;
	color: #fff;
	font-weight: bold;
	border: none;
	cursor: pointer;
	transition: 0.4s;
	display: inline;
}

.btn:hover {
	background-position: right;
}
/* table */
.theadColor {
	background-color: #495957;
	color: #fff
}

.table {
	margin: 30px 0 70px 0;
}

.table th {
	text-align: center;
}

.table td {
	text-align: center;
}

.tblRecom td {
	width: 300px;
}

.tdA {
	color: #3e9ab0;
	text-align: center;
	font-size: 20px;
}

.tdA a:hover {
	color: #3e9ab0;
	text-decoration: none;
}

.tdB {
	color: #e6ba2f;
	text-align: center;
	font-size: 18px;
}

.tdB a:hover {
	color: #e6ba2f;
	text-decoration: none;
}
/* ment */
.ment1 {
	font-weight: bold;
	font-size: 20px;
	text-align: center;
	margin-top: 20px;
}

.spanColor {
	color: #3e9ab0;
}

.part_name {
	text-align: left;
	font-weight: bold;
	font-size: 25px;
	padding-bottom: 25px;
	padding-top: 25px;
}

.recomList {
	margin-top: 10%;
	text-align: center;
	font-weight: bold;
	font-size: 25px;
	padding-bottom: 25px;
	padding-top: 25px;
}
</style>


</head>
<body>
	<header>
		<jsp:include page="../includes/header.jsp" flush="false" />
	</header>
	
	<div class="container">
		<div class="shadow-dreamy">
			<table class="table table-bordered">
				<thead class="theadColor">
					<tr>
						<th><p class="ment1">협업 기반 추천 시스템 : 잠재 요인 협업 필터링</p></th>
					</tr>
				</thead>
				<tr>
					<th>${re_ma_title}</th>
				</tr>
			</table>
		</div>
		<p class="conplete">
			<a href="/favmain.do?id=${userId}">나의 취향 메인 페이지로 돌아가기</a>
		<p>
	</div>

	<footer>
		<jsp:include page="../includes/footer.jsp" flush="false" />
	</footer>
</body>
</html>