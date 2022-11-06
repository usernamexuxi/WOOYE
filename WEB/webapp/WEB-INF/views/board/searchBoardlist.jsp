<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.Console"%>
<%@ page import="java.util.List" %>
<%@ page import="com.wooye.board.impl.BoardDAO" %>
<%@ page import="com.wooye.board.BoardVO" %>
<%@ page import="com.wooye.user.UserVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>우리의 예술 : 우예</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" rel="stylesheet">

<style>
.seach{
	margin:20px;
}
.theadColor{
	background-color:#495957;
	color: #fff
}
</style>
</head>
<body>
	<!-- header/logo, category -->
	<header>
		<jsp:include page="../includes/header.jsp" flush="false" />
	</header>
	
	<div class="boardList container">
	  <center>
			<!-- 검색 시작 -->
			<form action="/boardmain.do" method="post" >
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
		<table class="table table-hover">
			<thead class="theadColor">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
			</thead>
			<c:forEach items="${searchBoardList}" var="board" varStatus="i">
				<tr>
					<td>${board.seq}</td>
					<td align="left"><a href="/getBoard.do?seq=${board.seq}">
							${board.title}</a></td>
					<td>${boardList_nick[i.index]}</td>
					<td>${board.regDate}</td>
					<td>${board.cnt}</td>
				</tr>
			</c:forEach>
		</table>
		<br>
					<c:if test="${userName != null}"><a href="/insertBoard.do" class="btn btn-outline-info float-right">글쓰기</a></c:if>
	</center>
    </div>
    
    <!-- footer/ copyright -->
	<footer>
	   	<jsp:include page="../includes/footer.jsp" flush="false" />
	</footer>
</body>
</html>