<%@ page import="com.wooye.board.impl.BoardDAO" %>
<%@ page import="com.wooye.board.BoardVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>우리의 예술 : 우예</title>
<style>
	img{
		width:40px;
		padding:5px;
	}
	.comment_input{
		height:50px;
		width:800px;
	}
	.content{
		width:900px; 
		height:300px;
	}
	.contentEach{
		padding:10px;
		margin-left: 20px 10px 25px 10px;
	}
	.boardCon{
		padding:30px;
		margin-bottom: 10px;
	}
	.cntArea{
		padding:5px;
		margin-left:10px;
	}
	.cnt{
		padding: 10px 0 10px 0
	}
	.marginTOP{
		margin-top: 50px;
	}
	.tdA{
		text-align:center;
		color: #fff;
		font-weight:bold;
	}
	.heart{
         width: 70px;
    }
</style>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/startBootStyles.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/js/startBootScripts.js" rel="stylesheet">
</head>
<%Date now = new Date();%>
                <%
                SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
                String today = sf.format(now);%>
                <br>
                <%sf = new SimpleDateFormat("yyyy-MM-dd");
                today = sf.format(now);%>
<body>
	<header>
		<jsp:include page="../includes/header.jsp" flush="false" />
	</header>
	
	<center>
		<div class="container">
			<form action="/updateBoard.do" method="post">
				<input name="seq" type="hidden" value="${board.seq}" />
				<table class="table table-bordered marginTOP">
					<colgroup>
						<col style="background-color:#495957">
						<col />
					</colgroup>
					<tr>
						<td class="tdA">제목</td>
						<c:if test="${userId == board.writer}"><td><input name="title" type="text" value="${board.title}" /></td></c:if>
							<c:if test="${userId != board.writer}"><td>${board.title}</td></c:if>
					</tr>
					<tr>
						<td class="tdA">작성자</td>
						<td>${name}</td>
					</tr>
					<tr>
						<td class="tdA" style="vertical-align: middle;">내용</td>
						<c:if test="${userId == board.writer}">
						<td><textarea class="content" name="content">${board.content}</textarea></td></c:if>
						<c:if test="${userId != board.writer}"><td class="content">${board.content}</td></c:if>
					</tr>
					<tr>
						<td class="tdA">등록일</td>
						<td>${board.regDate}</td>
					</tr>
					<tr>
						<td class="tdA">조회수</td>
						<td>${board.cnt}</td>
					</tr>
					<tr>
						<td class="tdA">좋아요</td>
						<td>${board.heart}</td>
					</tr>
					<tr>
						<c:if test="${userId == board.writer}"><td colspan="2" align="center"><input type="submit" value="글 수정" class="btn btn-outline-info" /></td></c:if>
					</tr>
				</table>
			</form>
		</div>
		<div>
			<c:if test="${userName != null}"><a href="/likeboard.do?id=${userId}&seq=${board.seq}"><img src="../../img/heart.jpg" class="heart"></a></c:if>
		</div>
		<div class="boardCon">
			<c:if test="${userName != null}"><a href="/insertBoard.do">글등록</a>&nbsp;&nbsp;&nbsp;</c:if>
			<c:if test="${userId == board.writer || userId == 'wooye'}"><a href="/deleteBoard.do?seq=${board.seq}">글삭제</a>&nbsp;&nbsp;&nbsp;</c:if>
			<c:if test="${userName != null}"><a href="/board_clean.do?seq=${board.seq}&id=${userId}&writer=${board.writer}&title=${board.title}">게시글 신고</a>&nbsp;&nbsp;&nbsp;</c:if>
			<a href="/boardmain.do">글목록</a>
		</div>
	</center>
	
	<!-- 작성된 댓글 -->
	<section class="mb-5 container marginTOP">
        <div class="card bg-light">
        	<div class="card-body">
			 <!-- 익명 댓글 : 가능하면 추후 작성자 칸 닉네임 넣을 예정 -->
					<div class="d-flex mb-4">
							<!-- <tr>
								<th>번호</th>
								<th>작성자</th>
								<th>댓글내용</th>
								<th>등록일</th>
							</tr> -->
						<div class="d-flex mb-4">
							<div class="flex-shrink-0">
							<c:forEach items="${commentList}" var="comment" varStatus="i">
										<form action="/boardcmt_update.do" method="post" class="contentEach">
										<input name="cnum" type="hidden" value="${comment.comment_num}"/>
										${(i.index)+1}
										<img class="rounded-circle" src="img/images/human.jpg" /> 익명 &nbsp; ${comment.comment_date}
	                                        <div class="cntArea">
											<!-- <td>${comment.id}</td> -->
											<c:if test="${userId != comment.id}">${comment.comment_content}</c:if>
											<c:if test="${userId == comment.id}">
											<textarea style="width:700px; height:30px;" name="comment_content">${comment.comment_content}</textarea></c:if>
											</div>
											<div class="cntArea">
												<c:if test="${userId == comment.id}"><input class="btn btn-secondary btn-sm" type="submit" value="댓글 수정" /></c:if>
												<c:if test="${userId == comment.id || userId == 'wooye'}"><a href="/boardcmt_delete.do?comment_num=${comment.comment_num}" class="btn btn-secondary btn-sm">댓글삭제</a>&nbsp;&nbsp;&nbsp;</c:if></td>
												<c:if test="${userName != null}"><a href="/boardcmt_clean.do?bnum=${board.seq}&id=${userId}&cnum=${comment.comment_num}&writer=${comment.id}&content=${comment.comment_content}">댓글 신고</a>&nbsp;&nbsp;&nbsp;</c:if>
											</div>
									</form>
										</c:forEach>
							</div>
						</div>
					</div>	
					
									
				<!-- 댓글 작성창 -->				
				<form action="/boardcmt_input.do" method="post">
				<c:if test="${userName != null}">
					<input name="id" type="hidden" value="${userId}"/>작성자 : ${userName} (익명으로 표시됩니다.)
					<input name="board_num" type="hidden" value="${board.seq}"/>
					<textarea class="form-control" rows="3" style="margin:15px 0 15px 0" name="comment_content" rows="7" placeholder="댓글 내용을 입력해주세요" required></textarea>
					<input name="comment_date" type="hidden" value="<%=today%>" />
					<input class="comment_submit btn btn-secondary btn-sm"  style="float: right;" type="submit" value="댓글 달기" />
				</c:if>
				</form>
				</div>
			</div>
	</section>
	
	
	
	<footer>
	   	<jsp:include page="../includes/footer.jsp" flush="false" />
	</footer>
</body>
</html>
