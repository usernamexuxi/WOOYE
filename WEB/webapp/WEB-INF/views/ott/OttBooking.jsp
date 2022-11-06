<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.wooye.ott.impl.OttDAO"%>
<%@ page import="com.wooye.ott.OttVO"%>
<%@ page import="com.wooye.user.UserVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우예 : 우리의 예술</title>
<style>
#img{
	float: left;
	max-width: 550px;
	height: 400px;
	margin-right: 30px;
	display: block;
}
#imgTitle{
	color: #3e9ab0;
	font-weight:bold;
	font-size:1.5em;
	text-align:center;
}
.btn {
  width:200px;
  height:40px;
  margin-left:50%;
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
.ottInfo{
	margin: 20px 0 20px 0;
	height: 450px;
}
.partB{
	margin: 50px 0 20px 0;
}
.btn:hover {
  background-position: right;
}
.clear {
	clear: both;
}
.table{
	margin-top:30px;
}
.table td{
	padding-left: 10px;
}
.table th{
	width:250px;
	text-align:center;
	color: #fff;
	font-weight:bold;
}
.heart{
	width: 70px;
	margin-left:50%;
	float:left;
}
</style>
</head>
<body>
<header>
	<jsp:include page="../includes/header.jsp" flush="false" />
</header>
<div class="container">
	<div class="ottInfo">
		<img id="img" src="${ott.img}">
		<div id="text">
			<p id="imgTitle" name="title" value="${ott.title}">${ott.title}</p>
			<p name="content" value="${ott.content}">${ott.content}</p>
		</div>
	</div>
</div>

<div class="container clear">

	<form action="/ottcompl.do" method="POST" class="exconcompl">
	<table class="table table-bordered">
	<colgroup>
		<col style="background-color:#495957">
		<col />
	</colgroup>
	
  	<tr>
    <th>예약자</th>
    <td><input type="hidden" name="id" value="${userId}"/>${userId} </td>
   </tr>
   
   <tr>
    <th>OTT 번호</th>
    <td><input type="hidden" name="ott_num" value="${ott.ott_num}"/>${ott.ott_num}</td>
   </tr>
   
    <tr>
    <th>제목</th>
    <td><input type="hidden" name="title" value="${ott.title}">${ott.title}</td>
    </tr>
   
  	<tr>
    <th>기간</th>
    <td><input type="hidden" name="period" value="${ott.period}">${ott.period}</td>
   </tr>
   
   <tr>
   <th style="vertical-align: middle;">작품 내용</th>
   <td><input type="hidden" name="content" value="${ott.content}">${ott.content}</td>
   </tr>
   
    <tr>
    <th>장소</th>
    <td><input type="hidden" name="place" value="${ott.place}">${ott.place}</td>
    </tr>
    
    <tr>
    <th>관람료</th>
    <td><input type="hidden" name="price" value="${ott.price}">${ott.price}</td>
    </tr>
   
    <tr>
    <th>주최/후원</th>
    <td><input type="hidden" name="support" value="${ott.support}">${ott.support}</td>
    </tr>
    
    <tr>
    <th>작가</th>
    <td><input type="hidden" name="artist" value="${ott.artist}">${ott.artist}</td>
    </tr>
    
    <tr>
    <th>좋아요</th>
    <td><input type="hidden" name="heart" value="${ott.heart}">${ott.heart}</td>
    </tr>
</table>
    
    <c:if test="${userName != null}"><a href="/likeott.do?id=${userId}&ott_num=${ott.ott_num}"><img src="../../img/heart.jpg" class="heart"></a></c:if>
    <c:if test="${userId != null}"><input type="submit" class="btn" value="예약하기" style="margin-left:80%; color: #fff;"/></c:if>
    </form>
    
</div>
<div><c:if test="${userName == null}"><a href="/login.do"><span id="login" class="btn" style="margin-top: 100px; color: #fff;">로그인 후 구매 가능</span></a></c:if></div>
	<footer>    
    	<jsp:include page="../includes/footer.jsp" flush="false" />
    </footer>
</body>
</html>