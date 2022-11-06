<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.wooye.board.impl.BoardDAO"%>
<%@ page import="com.wooye.board.BoardVO"%>
<%@ page import="java.io.Console"%>
<%@ page import="java.util.List"%>
<%@ page import="com.wooye.excon.impl.ExconDAO"%>
<%@ page import="com.wooye.excon.ExconVO"%>
<%@ page import="com.wooye.user.UserVO"%>
<%@ page import="com.wooye.user.impl.UserDAO"%>
<%@ page import="com.wooye.ott.CoinVO"%>

<!DOCTYPE html>
<head>
<title>우리의 예술 : 우예</title>
<style>
.contaA {
	margin: 50px 0 150px 0;
}

.contaB {
	margin: 150px 0 150px 0;
}

.part_name {
	font-weight: bold;
	font-size: 20px;
	margin-bottom: 30px;
}

.theadColor {
	background-color: #495957;
	color: #fff
}

.btn {
	margin: 20px 0 20px;
	0;
}

.btn-sm {
	margin-left: 5px;
}

table th {
	text-align: center;
}

.quit {
	float: right;
	color: red;
}

#userName {
	color: #3e9ab0;
	font-weight: bold;
}
</style>
</head>
<body>
	<!-- header/logo, category -->
	<header>
		<jsp:include page="../includes/header.jsp" flush="false" />
	</header>
	<!-- db 연결시 폼태그 쓰기 <form action="#" method="post"> -->
	<!-- main screen/ banner, contents -->

	<c:if test='${userId == "wooye"}'>
		<div class="container contaA">
			<p class="part_name">회원 관리</p>
			<table class="table table-hover">
				<thead class="theadColor">
					<tr>
						<th>회원 아이디</th>
						<th>회원 비밀번호</th>
						<th>회원 이름</th>
						<th>회원 닉네임</th>
						<th>강제탈퇴</th>
					</tr>
				</thead>
				<c:forEach items="${userList}" var="member" varStatus="i">
					<tr>
						<td>${member.id}</td>
						<td>${member.password}</td>
						<td>${member.name}</td>
						<td>${member.nickname}</a></td>
						<td><a href="/byemypage.do?id=${member.id}">추방</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="container contaB">
			<p class="part_name">게시글 신고 관리</p>
			<table class="table table-hover">
				<thead class="theadColor">
					<tr>
						<th>신고자</th>
						<th>게시글 번호</th>
						<th>게시글 작성자</th>
						<th>게시글 제목</th>
						<th>게시글 신고 삭제</th>
						<th></th>
					</tr>
				</thead>
				<c:forEach items="${board}" var="cleanb" varStatus="i">
					<tr>
						<td>${cleanb.id}</td>
						<td align="left">${cleanb.board_num}</td>
						<td align="left">${cleanb.board_writer}</td>
						<td align="left">${cleanb.board_title}</td>
						<td align="left"><a href="/myboardcut.do?seq=${cleanb.seq}">삭제</a></td>
						<td align="left"><a
							href="/getBoard.do?seq=${cleanb.board_num}">이 게시글로 이동</a></td>
					</tr>
				</c:forEach>
			</table>

			<div class="container contaB">
				<p class="part_name">게시글 댓글 신고 관리</p>
				<table class="table table-hover">
					<thead class="theadColor">
						<tr>
							<th>신고자</th>
							<th>게시글 번호</th>
							<th>댓글 번호</th>
							<th>댓글 작성자</th>
							<th>댓글 내용</th>
							<th>댓글 신고 삭제</th>
							<th></th>
						</tr>
					</thead>
					<c:forEach items="${comment}" var="cleanb" varStatus="i">
						<tr>
							<td>${cleanb.id}</td>
							<td align="left">${cleanb.board_num}</td>
							<td>${cleanb.comment_num}</td>
							<td>${cleanb.comment_writer}</td>
							<td align="left">${cleanb.comment_content}</td>
							<td align="left"><a
								href="/mycommentcut.do?seq=${cleanb.seq}">삭제</a></td>
							<td align="left"><a
								href="/getBoard.do?seq=${cleanb.board_num}">이 댓글(게시글)로 이동</a>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</c:if>

	<c:if test='${userId != "wooye"}'>
		<div class="container contaA">
			<p class="part_name">내 정보</p>
			<form action="/mypagemodify.do" method="post">
				<table class="table table-striped">
					<tr>
						<td>아이디</td>
						<td><input name="id" type="hidden" value="${userId}" />${userId}</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input name="password" type="text" value="${userPass}" /></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input name="name" type="text" value="${userRealName}" /></td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td><input name="nickname" type="text" value="${userName}" /></td>
					</tr>
				</table>
				<input type="submit" value="내 정보 수정" class="btn btn-outline-info float-right" />
			</form>
		</div>

		<div class="container contaB">
			<p class="part_name">코인 및 OTT 구매내역</p>
			<table class="table table-hover">
				<tr>
					<td><span id="userName">${userId}</span>님의 보유 코인 <span id="userName">[${coin_get}원]</span></td>
				</tr>
				<tr>
					<form action="/mycoinbuy.do" method="post">
						<input name="id" type="hidden" value="${userId}" /> 
						<input name="coin" type="text" value="${buycoin}" /> 
						<input type="submit" value="충전" class="btn btn-secondary btn-sm" />
					</form>
				</tr>
			</table>
			<br>
			<br>
			<h6>구매한 OTT 내역</h6>
			<table class="table table-hover">
				<thead class="theadColor">
					<tr>
						<th>OTT 번호</th>
						<th>OTT 제목</th>
						<th>OTT 기간</th>
						<th>내용</th>
						<th>작가</th>
						<th>가격</th>
						<th></th>
					</tr>
				</thead>
				<c:forEach items="${myottlist}" var="ott" varStatus="i">
					<tr>
						<td>${ott.ott_num}</td>
						<td>${ott.title}</td>
						<td>${ott.period}</td>
						<td>${ott.content}</td>
						<td>${ott.artist}</td>
						<td>${ott.price}</td>
						<td><a
							href="/myottlooking.do?num=${ott.ott_num}&title=${ott.title}">시청하기</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="container contaB">
			<p class="part_name">전시회/공연 예약 내역</p>
			<table class="table table-hover">
				<thead class="theadColor">
					<tr>
						<th></th>
						<th>전시회 번호</th>
						<th>전시회 제목</th>
						<th>시작일</th>
						<th>종료일</th>
						<th>장소</th>
						<th>장르</th>
						<th>예약 취소</th>
					</tr>
				</thead>
				<c:forEach items="${myexconlist}" var="excon" varStatus="i">
					<tr>
						<td>${excon.seq}</td>
						<td>${excon.excon_seq}</td>
						<td>${excon.excon_name}</a></td>
						<td>${excon.start_date}</td>
						<td>${excon.end_date}</td>
						<td>${excon.place}</td>
						<td>${excon.genre}</td>
						<td><a href="/excondelete.do?seq=${excon.seq}">예약 취소</a></td>
					</tr>
				</c:forEach>

			</table>
		</div>


		<div class="container contaB">
			<p class="part_name">커뮤니티 게시글 관리</p>
			<table class="table table-hover">
				<thead class="theadColor">
					<tr>
						<th>게시글 번호</th>
						<th>게시글 제목</th>
						<th>게시글 등록일</th>
						<th>게시글 조회수</th>
						<th>게시글 삭제</th>
					</tr>
				</thead>
				<c:forEach items="${myboardlist}" var="board" varStatus="i">
					<tr>
						<td>${board.seq}</td>
						<td><a href="/getBoard.do?seq=${board.seq}">${board.title}</a></td>
						<td>${board.regDate}</td>
						<td>${board.cnt}</td>
						<td><a href="/myboard.do?seq=${board.seq}">게시글 삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="container contaB">
			<p class="part_name">커뮤니티 댓글 관리</p>
			<table class="table table-hover">
				<thead class="theadColor">
					<tr>
						<th>댓글 번호</th>
						<th>댓글 내용</th>
						<th>댓글 등록일</th>
						<th></th>
					</tr>
				</thead>
				<c:forEach items="${mycommentlist}" var="comment" varStatus="i">
					<tr>
						<td>${comment.comment_num}</td>
						<td><a href="/getBoard.do?seq=${comment.comment_num}">${comment.comment_content}</a></td>
						<td>${comment.comment_date}</td>
						<td><a href="/mycomment.do?seq=${comment.comment_num}">댓글
								삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="part container">
			<a href="/byewooye.do?id=${userId}" class="quit">계정 탈퇴하기</a>
		</div>
	</c:if>

	<!-- footer/ copyright -->
	<footer>
		<jsp:include page="../includes/footer.jsp" flush="false" />
	</footer>
</body>
</html>