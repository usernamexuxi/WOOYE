<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<head>
<title>우리의 예술 : 우예</title>
<style>
	footer{
		margin-top: 10%;
	}
</style>
</head>
<body>
	<!-- header/logo, category -->
	<header>
		<jsp:include page="../includes/header.jsp" flush="false" />
	</header>
	
	<div class="board_main_mid">
	    <jsp:include page="getBoardList.jsp" flush="false" />
    </div>
    
    <!-- footer/ copyright -->
	<footer>
	   	<jsp:include page="../includes/footer.jsp" flush="false" />
	</footer>
</body>
</html>