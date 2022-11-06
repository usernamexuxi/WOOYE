<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.wooye.info.controller.infoController"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리의 예술 : 우예</title>
<link href="${pageContext.request.contextPath}/resources/css/base.css" rel="stylesheet" type="text/css">
<style>
.section{
    height:400px;
    margin:20px 20px 80px 20px;
    padding:0 60px 0 60px;
    border-left: 1px solid green;
}
.imgs {
    margin: 20px;
    padding-top:30px;
    height: 300px;
    float: left;
}
.name{
    margin:0;
    font-size: 20px;
    font-weight:bold;
}
.imgInfo{
    margin: 30px;
    padding: 100px 40px 0 100px;
}
.btn{
    width:200px;
    padding: 5px;
    margin-left:80%;
    background: #3e9ab0;
    color:white;
    border:none;
}

.contents, .contents2{
    border:1px solid black;
    border-radius:10px;
    width:calc(70%);
    height: 500px;
    overflow: auto;
    margin:auto;
    padding:10px;
}

section{
    text-align:center;
    line-height:30px; 
}
.exconsearch{
    text-align:center;
}

#searchArti{
	color: #3e9ab0;
}

</style>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    //String artist_title = request.getAttribute("artist_title");
    //String artist_contents = request.getAttribute("artist_contents");
%>

<header>
    <jsp:include page="../includes/header.jsp" flush="false" />
</header>
    <section>
        <% out.println("<br>"); %>
        <h2>'<span id="searchArti">${artist_title}</span>' 검색 결과</h2>
        <% out.println("<br>"); %>
        
        <div class="contents">
        <div class="contents_div">
        
        <c:choose>
	        <c:when test="${fn:length(artist_contents) gt 1500}">
	        <c:out value="${fn:substring(artist_contents, 0, 1499)}">...
	        </c:out></c:when>
	        <c:otherwise>
	        <c:out value="${artist_contents}">
	        </c:out>
	        </c:otherwise>
		</c:choose>

        </div>
        <% out.println("<br>"); %>
        
        
        <div class="contents2_div">
	    <c:set var = "length" value = "${fn:length(artist_contents)}"/>
	    <c:set var = "string" value = "${fn:substring(artist_contents, length -1500, length)}" />

      	<p>${string}</p>
        </div>
        <% out.println("<br>"); %>
        </div>

    <div class="serch">
    
    <% out.println("<br>"); %>
    
    <a href="/infomain.do">
    이전 페이지로 돌아가기
    </a>
    </div>
    </section>
    <footer>
        <jsp:include page="../includes/footer.jsp" flush="false" />
    </footer>
</body>
</html>