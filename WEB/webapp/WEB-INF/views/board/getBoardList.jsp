<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.Console"%>
<%@ page import="java.util.List" %>
<%@ page import="com.wooye.board.impl.BoardDAO" %>
<%@ page import="com.wooye.board.BoardVO" %>
<%@ page import="com.wooye.user.UserVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우리의 예술 : 우예</title>

<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" rel="stylesheet">

<style>
.seach{
	margin:20px;
}
.form-select{
	width:100px;
	margin-bottom:10px;
}
.theadColor{
	background-color:#495957;
	color: #fff
}
table th {
	text-align: center;
}
</style>

</head>
<body>
	<div class="boardList container">
		<center>
			<!-- 검색 시작 -->
			<form action="/boardmain.do" method="post"  accept-charset="utf-8">
				<table style="float:right; margin: 20px 0 20px 0;">
					<tr>
						<td align="right">
	<!-- 					<select name="searchCondition"> -->
	<!-- 							<option value="TITLE">제목 -->
	<!-- 							<option value="CONTENT">내용 -->
	<!-- 					</select>  -->
						<div name="searchCondition">
	    					<c:forEach items="${conditionMap}" var="option">
	       	 					<input type="radio" name="value" value="${option.value}">${option.key}
	    					</c:forEach>
	    				</div>
	 					<input name="searchKeyword" type="text" />
						<input type="submit" value="검색" class="btn btn-secondary btn-sm" /></td>
					</tr>
				</table>
			</form>
			
			
			<!-- 검색 종료 -->
			<div class="container">
				<table class="table table-hover">
				<thead class="theadColor">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>조회수</th>
						<th>좋아요</th>
					</tr>
				</thead>
					<c:forEach items="${boardList}" var="board" varStatus="i">
						<tr>
							<td>${board.seq}</td>
							<td align="left"><a href="/getBoard.do?seq=${board.seq}" style="color: black">${board.title}</a></td>
							<td>${boardList_nick[i.index]}</td>
							<td>${board.regDate}</td>
							<td>${board.cnt}</td>
							<td>${board.heart}</td>
						</tr>
					</c:forEach>
				</table>
				<div class="text-center">
					<ul class="pagination justify-content-center">
						<li><a href="#" style="margin-right:5px" class="text-secondary">◀</a></li>				
						<li><a href="#" style="margin-right:5px" class="text-secondary">1</a></li>		
						<li><a href="#" style="margin-right:5px" class="text-secondary">2</a></li>		
						<li><a href="#" style="margin-right:5px" class="text-secondary">3</a></li>		
						<li><a href="#" style="margin-right:5px" class="text-secondary">4</a></li>		
						<li><a href="#" style="margin-right:5px" class="text-secondary">5</a></li>		
						<li><a href="#" style="margin-right:5px" class="text-secondary">▶</a></li>			
					</ul>
				</div>
				<br>
					<c:if test="${userName != null}"><a href="/insertBoard.do" class="btn btn-outline-info float-right">글쓰기</a></c:if>
				<br>
			</div>
		</center>
	</div>
</body>
</html>