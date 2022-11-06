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
			<img id="img" src="img/images/Gogh3.jpg" >
			<div id="text">
				<p id="imgTitle" name="excon_name">고흐의 아몬드 나무</p>
				<p>Almond Blossoms is a group of several paintings made in 1888 and 1890 by 
				Vincent van Gogh in Arles and Saint-Rémy, southern France of blossoming 
				almond trees. Flowering trees were special to van Gogh. 
				They represented awakening and hope. He enjoyed them aesthetically 
				and found joy in painting flowering trees.</p>
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
<!-- <tr> -->
<!--     <th>예약자</th> -->
<%--     <td name="user_id">${userId}</td> --%>
<!--    </tr> -->
   
   <tr>
    <th>일련번호</th>
    <td>
    <div name="excon_seq">A1</div>
    </td>
   </tr>
   
  <tr>
    <th>시작 기간</th>
    <td name="start_date">2019-06-25</td>
   </tr>
  <tr>
    <th>종료 기간</th>
    <td name="end_date">2019-12-31</td>
   </tr>
   
   <tr>
    <th>주최/후원</th>
    <td name="place">없음</td>
    </tr>
    
    <tr>
    <th>장소</th>
    <td>국립현대미술관</td>
    </tr>
    
    <tr>
    <th>관람료</th>
    <td>7,000</td>
    </tr>
    
    <tr>
    <th>작가</th>
    <td>총 116명</td>
    </tr>
    
    <tr>
    <th>작품수</th>
    <td>회화, 사진, 조각, 영상 미디어 설치 등 124점</td>
    </tr>
    
    <tr>
    <th>링크</th>
    <td><a href = "#">링크입니다.</a></td>
    </tr>
	</table>
	<c:if test="${userName != null}"><input type="submit" class="btn" value="예약하기" style="margin-top: 50px; color: #fff;"/></c:if>

	<input type="hidden" name="user_id" value="${userId}">
	<input type="hidden" name="excon_seq" value="A1">
	<input type="hidden" name="excon_name" value="고흐의 아몬드 나무">
	<input type="hidden" name="start_date" value="20190625">
	<input type="hidden" name="end_date" value="20191231">
	<input type="hidden" name="place" value="국립현대미술관">
	<input type="hidden" name="genre" value="인상주의">

	</form>

</div>
<div><c:if test="${userName == null}"><a href="/login.do"><span id="login" class="btn" style="margin-top: 100px; color: #fff;">로그인 후 얘약 가능</span></a></c:if></div>
	<footer>    
    	<jsp:include page="../includes/footer.jsp" flush="false" />
    </footer>
</body>
</html>