<%@ page import="java.io.Console"%>
<%@ page import="java.util.List"%>
<%@ page import="com.wooye.excon.impl.ExconDAO"%>
<%@ page import="com.wooye.excon.ExconVO"%>
<%@ page import="com.wooye.user.UserVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리의 예술 : 우예</title>

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
.exconInfo{
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
</style>
</head>
<body>
<header>
	<jsp:include page="../includes/header.jsp" flush="false" />
</header>

<div class="container">
	<div class="exconInfo">
		<img id="img" src="img/images/Dali3.jpg" >	
		<div id="text" class="exconInfo">
			<p id="imgTitle" name = "excon_name">달리 특별 전시회</p>
			<p>스페인의 초현실주의 거장 ‘살바도르 달리(Salvador Dali)’의 국내 최초 대규모 회고전이다.
			스페인 피게레스에 위치한 달리 극장 미술관을 중심으로 레이나 소피아 국립미술관, 미국 플로리다의 살바도르 달리 미술관의 소장품으로 구성된다.</p>
		</div>
	</div>
</div>

<div class="container clear">

	<form action="/exconcompl.do" method="POST" class="exconseat">
	<table class="table table-bordered">
	<colgroup>
		<col style="background-color:#495957">
		<col />
	</colgroup>
<!-- 	<tr> -->
<!--     <th>예약자</th> -->
<%--     <td name="user_id">${userId}</td> --%>
<!--    </tr> -->
   
   <tr>
    <th>일련번호</th>
    <td>
    <div  name="excon_seq">B1</div>
    </td>
   </tr>
   
  <tr>
    <th>시작 기간</th>
    <td name="start_date">2021-11-27</td>
   </tr>
  <tr>
    <th>종료 기간</th>
    <td name="end_date">2022-03-20</td>
   </tr>
   
   <tr>
    <th>주최/후원</th>
    <td name="place">XX</td>
    </tr>
    
    <tr>
    <th>장소</th>
    <td>DDP배움터 디자인전시관</td>
    </tr>
    
    <tr>
    <th>관람료</th>
    <td>10,000원</td>
    </tr>
    
    <tr>
    <th>작가</th>
    <td>살바도르 달리</td>
    </tr>
    
    <tr>
    <th>작품수</th>
    <td>회화 XX점</td>
    </tr>
    
    <tr>
    <th>링크</th>
    <td><a href = "#">링크입니다.</a></td>
    </tr>
	</table>
	
	<c:if test="${userName != null}"><input type="submit" class="btn" value="예약하기" style="margin-top: 100px; color: #fff;"/></c:if>
	
	<input type="hidden" name="user_id" value="${userId}">
	<input type="hidden" name="excon_seq" value="B1">
	<input type="hidden" name="excon_name" value="달리 특별 전시회">
	<input type="hidden" name="start_date" value="20211127">
	<input type="hidden" name="end_date" value="20220320">
	<input type="hidden" name="place" value="DDP배움터 디자인전시관">
	<input type="hidden" name="genre" value="초현실주의">
	</form>

</div>
<div><c:if test="${userName == null}"><a href="/login.do"><span id="login" class="btn" style="margin-top: 100px; color: #fff;">로그인 후 예약 가능</span></a></c:if></div>
	<footer>    
    	<jsp:include page="../includes/footer.jsp" flush="false" />
    </footer>
</body>
</html>