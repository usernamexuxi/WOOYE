<%@ page import="java.io.Console"%>
<%@ page import="java.util.List"%>
<%@ page import="com.wooye.board.impl.BoardDAO"%>
<%@ page import="com.wooye.board.BoardVO"%>
<%@ page import="com.wooye.user.UserVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>우리의 예술 : 우예</title>
<style>
    footer{
        margin-top: 10%;
    }
</style>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" rel="stylesheet">
</head>
<body>
    <header>
        <jsp:include page="../includes/header.jsp" flush="false" />
    </header>

    <center>
                <%Date now = new Date();%>
                <%
                SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
                String today = sf.format(now);%>
                <br>
                <%sf = new SimpleDateFormat("yyyy-MM-dd");
                today = sf.format(now);%>
        <hr>
        <div class="container">
            <form action="/insertBoard.do" method="post">
                <input name="writer" type="hidden" value="${userId}"/>작성자: ${userName}
                <br>                
                <input name="regDate" type="hidden" value="<%=today%>"/>작성일자: <%=today %>
                <input type="text" name="title" class="form-control mt-4 mb-2" placeholder="제목을 입력해주세요." required >
                <div class="form-group">
                <textarea class="form-control" rows="10" name="content" placeholder="내용을 입력해주세요" required></textarea>
                </div>

                <input class="btn btn-secondary mb-3" type="submit" value=" 새글 등록 " />
            </form>
            <hr>
            <a href="/boardmain.do">글 목록 가기</a>
        </div>
    </center>

    <footer>
           <jsp:include page="../includes/footer.jsp" flush="false" />
    </footer>
</body>
</html>