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
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display: inline;
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
	<% request.setCharacterEncoding("UTF-8");
	String[] arr = new String[7];
	arr = (String[])request.getAttribute("exconarr2");%> 
		<img id="img" src="img/images/excon.jpg" >
	
		<div id="text">
			<p id="imgTitle" name = "excon_name"><% out.println(arr[2]);%></p>
			<p>《춤추는 낱말》은 2022년 서울시립미술관의 전시 의제인 ‘시(poetry)’를 성찰하며, 전시를 한 편의 시로서, 창작자들의 실천을 공동의 심상(정동)을 자아내는 시어로 바라볼 것을 제안합니다. 
			그리고 그 실천의 언어가 일렁이는 담론의 장이자 표현성의 영역으로서 ‘아시아’를 바라봅니다. 
			따라서 이번 전시는 군중의 노래이자 저항의 언어로서 시의 속성을 아시아에 기반을 두고 혹은 아시아를 둘러싼 논의에 천착해 온 창작자들의 실천에 포개어 봅니다. 
			동시다발적으로 펼쳐진 아시아의 정치, 사회, 문화 운동 및 현상을 관찰하고, 이에 대해 쓰고 말하는 창작자들의 실천을 통해 오늘의 아시아에서 공동의 의식과 감각이 어떻게 구성되고 어떤 모습으로 발현되는지 다각도로 살핍니다.</p>
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
					<tr>
						<th>예약자</th>
						<td name="user_name">${userName}</td>
					</tr>
					<tr>
						<th>일련번호</th>
						<td name="excon_seq"><% out.println(arr[1]);%></td>
					</tr>
					<tr>
						<th>제목</th>
						<td name="excon_name"><% out.println(arr[2]);%></td>
					</tr>
					<tr>
						<th>시작기간</th>
						<td name="start_date"><% out.println(arr[3]);%></td>
					</tr>
					<tr>
						<th>종료기간</th>
						<td name="end_date"><% out.println(arr[4]);%></td>
					</tr>
					<tr>
						<th>장소</th>
						<td name="excon_place"><% out.println(arr[5]);%></td>
					</tr>
					<tr>
						<th>장르</th>
						<td name="excon_genre"><% out.println(arr[6]);%></td>
					</tr>
					<tr>
						<th>주최/후원</th>
						<td>XX</td>
					</tr>
					<tr>
						<th>관람료</th>
						<td>무료</td>
					</tr>
					<tr>
						<th>작가</th>
						<td>총 14명/팀의 작가, 기획자, 연구자, 음악가</td>
					</tr>
					<tr>
						<th>작품</th>
						<td>회화, 사진, 조각, 영상 미디어 설치 등</td>
					</tr>
					<tr>
						<th>링크</th>
						<td><a href = "#">링크입니다.</a></td>
					</tr>
				</table>
			
	<c:if test="${userName != null}"><input type="submit" class="btn" value="예약하기" style="margin-top: 100px; color: #fff;"/></c:if>
	
	<input type="hidden" name="user_id" value="${userId}">
	<input type="hidden" name="excon_seq" value="<%=arr[1]%>">
	<input type="hidden" name="excon_name" value="<%=arr[2]%>">
	<input type="hidden" name="start_date" value="<%=arr[3]%>">
	<input type="hidden" name="end_date" value="<%=arr[4]%>">
	<input type="hidden" name="place" value="<%=arr[5]%>">
	<input type="hidden" name="genre" value="<%=arr[6]%>">
	</form>
	<div><c:if test="${userName == null}"><a href="/login.do"><span id="login" class="btn" style="margin-top: 100px; color: #fff;">로그인 후 예약 가능</span></a></c:if></div>
</div>

	<footer>    
    	<jsp:include page="../includes/footer.jsp" flush="false" />
    </footer>
</body>
</html>