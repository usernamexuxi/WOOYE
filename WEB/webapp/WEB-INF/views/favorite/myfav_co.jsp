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
.section1 {
	height: 100px;
	margin: 20px;
	padding: 0 60px 0 60px;
}

.section2 {
	width: 1000px;
	height: 300px;
	margin: auto;
	padding: 60px;
	border-top: 3px solid #e6ba2f;
	border-bottom: 3px solid #e6ba2f;
}

.section3 {
	height: 300px;
	margin: 50px 100px 50px 100px;
	padding: 60px;
}

#ment1 {
	font-size: 25px;
	margin: 0;
	padding: 0;
}

#ment2 {
	font-size: 25px;
	color: #e6ba2f;
	margin: 0;
	padding: 0;
	margin-left: 50px;
}

#ment3 {
	width: 100px;
	margin: 20px 0 0 200px;
	padding: 0;
	font-size: 20px;
}

#ment4 {
	position: absolute;
	width: 100px;
	margin: 20px 0 0 200px;
	padding: 0;
	font-size: 20px;
}

#ment5 {
	position: absolute;
	width: 100px;
	margin: 20px 0 0 900px;
	padding: 0;
	font-size: 20px;
}

#vertical {
	height: 30vh;
	width: .1vw;
	padding: 0;
	margin-left: 30%;
	margin-right: 30px;
	border-width: 0;
	color: #E2E2E2;
	background-color: #B2B2B2;
}

.artist-part1 {
	position: absolute;
	padding: 0px;
}

.artist-part1 img {
	height: 280px;
	padding: 0;
	margin: 0;
}

.artist-part1 p {
	text-align: center;
	padding: 0;
	margin: 0;
	font-weight: bold;
}

.artist-part2 {
	width: 500px;
	border-left: 2px solid #b2b2b2;
	padding-left: 80px;
	margin-left: 35%;
}

.artist-part2 img {
	height: 250px;
	padding: 0;
}

.artist-part2 p {
	
}

.part-ex {
	width: 450px;
	height: 400px;
	border-left: 3px solid #3e9ab0;
	border-right: 3px solid #3e9ab0;
	float: left;
}

.part-ex img {
	display: block;
	margin: auto;
	padding: 30px;
}

.part-ex p {
	text-align: center;
}

.part-con {
	width: 450px;
	height: 400px;
	margin-left: 60%;
	border-left: 3px solid #3e9ab0;
	border-right: 3px solid #3e9ab0;
}

.part-con img {
	display: block;
	margin: auto;
	padding: 30px;
}

p {
	text-align: center;
	font-weight: bold;
}
</style>

</head>
<body>
	<header>
		<jsp:include page="../includes/header.jsp" flush="false" />
	</header>
		<p>컨텐츠 기반 추천 시스템</p>
		<br>
		<p>${start_list}</p>
		<br><br><br>
		<p><a href="/favmain.do?id=${userId}">나의 취향 메인 페이지로 돌아가기</a><p>
	<footer>
		<jsp:include page="../includes/footer.jsp" flush="false" />
	</footer>
</body>
</html>