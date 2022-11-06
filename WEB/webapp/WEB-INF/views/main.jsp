<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>우리의 예술 : 우예</title>
<style>
	body{
		font-family:sans-serif;
		min-width: 1250px;
	}
	
</style>
</head>
<body>
	<!-- header/logo, category -->
	<header>
		<jsp:include page="includes/header.jsp" flush="false" />
	</header>
	
	<!-- main screen/ banner, contents -->
	<section class="container">
	   <jsp:include page="includes/main_banner.jsp" flush="false" />
	    <jsp:include page="includes/main_recom.jsp" flush="false" />
	</section>
    
    <!-- footer/ copyright -->
	<footer>
	   	<jsp:include page="includes/footer.jsp" flush="false" />
	</footer>
</body>
</html>