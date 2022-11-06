<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.wooye.excon.controller.exconController"%>
<%@ page import="com.wooye.excon.impl.ExconDAO" %>
<%@ page import="com.wooye.excon.ExconVO"%>
<%@ page import="com.wooye.user.UserVO"%>
<%@ page import="java.io.Console"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLEncoder" %>

<!DOCTYPE html>
<html>
<head>
<title>우리의 예술 : 우예</title>
<meta charset="EUC-KR">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

<%
	request.setCharacterEncoding("UTF-8");
	String sido = request.getParameter("sido");
%>
<% String[][] arr = new String[100][10];
arr = (String[][])request.getAttribute("exconarr");%>

<style>

h2{
	text-align: center;
	padding: 50px 0 50px 0;
}

table{
	text-align: center;
	font-size: 13px;
}
.theadColor{
	background-color:#495957;
	color: #fff;
}

#sido{
	color: #3e9ab0;
}
</style>
</head>
<body>



<header>
	<jsp:include page="../includes/header.jsp" flush="false" />
</header>

<div class="container">
	<h2>'<span id="sido"><%= sido %></span>' 검색 결과</h2>
	<table class="table table-hover">
		<thead class="theadColor">
			<th></th>
			<th>공연 번호</th>
			<th>이름</th>
			<th>시작일</th>
			<th>종료일</th>
			<th>장소</th>
			<th>장르</th>
			<th>예매하기</th>
		</thead>
	
	<% int i=1; %>
	<% while(arr[i][0] != null) { %>
	<% out.println("<tr>");%>
	<form action="/exconmore3.do">
	<% out.println("<td>");%>
		<input name="user_id" type="hidden" value="${userId}"/>
	<% out.println("</td>");%>
	<% out.println("<td>");%>
		<% out.println(arr[i][0]);%>
		<input name="excon_seq" type="hidden" value="<%=arr[i][0]%>"/>
	<% out.println("</td>");%>
	<% out.println("<td>");%>
		<% out.println(arr[i][1]);%>
		<input name="excon_name" type="hidden" value="<%=arr[i][1]%>"/>
	<% out.println("</td>");%>
	<% out.println("<td>");%>
		<% out.println(arr[i][2]);%>
		<input name="excon_start" type="hidden" value="<%=arr[i][2]%>"/>
	<% out.println("</td>");%>
	<% out.println("<td>");%>
		<% out.println(arr[i][3]);%>
		<input name="excon_end" type="hidden" value="<%=arr[i][3]%>"/>
	<% out.println("</td>");%>
	<% out.println("<td>");%>
		<% out.println(arr[i][4]);%>
		<input name="excon_place" type="hidden" value="<%=arr[i][4]%>"/>
	<% out.println("</td>");%>
	<% out.println("<td>");%>
		<% out.println(arr[i][5]);%>
		<input name="excon_genre" type="hidden" value="<%=arr[i][5]%>"/>
	<% out.println("</td>");%>
	<% out.println("<td>");%>
		<input class="btn btn-secondary btn-sm" type="submit" value="예매" />
	<% out.println("</td>");%>
	</form>
		<% i++;%>
	<% out.println("</tr>");%>
	<% } %>
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
</div>

	<footer>
    	<jsp:include page="../includes/footer.jsp" flush="false" />
    </footer>
</body>
</html>