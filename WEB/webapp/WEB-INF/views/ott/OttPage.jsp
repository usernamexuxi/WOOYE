<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.Console"%>
<%@ page import="java.util.List" %>
<%@ page import="com.wooye.ott.impl.OttDAO" %>
<%@ page import="com.wooye.ott.OttVO" %>
<%@ page import="com.wooye.user.UserVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리의 예술 : 우예</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/forTab.css" rel="stylesheet" type="text/css">

<style>
.img-box{
	width:150px;
    height: 230px;
    
}
.img-box > a img {
    display: block;
    width: 100%;
    max-width:150px;
    max-height: 200px;
    margin-bottom:10px;
}
ul{
	list-style:none;
}
.cell{
	width:300px;
    padding: 15px;
}
.text-center{
	padding-top:30px;
}

.product-price1 {
    text-align: center;
    font-weight: bold;
    font-size: 1.5rem;
}
</style>
</head>



<body>
<header>
	<jsp:include page="../includes/header.jsp" flush="false" />
</header>
    <section class="container">
    
    <!-- 메인 -->
<div class="tabs">
			    <input id="all" type="radio" name="tab_item" checked>
			    <label class="tab_item" for="all">인기순</label>
			    <input id="programming" type="radio" name="tab_item">
			    <label class="tab_item" for="programming">최신순</label>
	<div class="tab_content" id="all_content">
		<div class="list con">
		
		    <ul class="row">
		        <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=A1"><img src="img/images/poster7.png"></a></div>
		            <div class="product-name">&lt;오롯 그릇&gt;</div>
		            <div class="product-price1">2,000</div>
		        </li>
		       <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=A2"><img src="img/images/concert1.jpg"></a></div>
		            <div class="product-name">&lt;세상의 모든 녹턴&gt;</div>
		            <div class="product-price1">2,500</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=A3"><img src="img/images/concert2.jpg"></a></div>
		            <div class="product-name">&lt;플로렌스의 향기&gt;</div>
		            <div class="product-price1">1,500</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=B1"><img src="img/images/concert3.jpg"></a></div>
		            <div class="product-name">&lt;HIC ET NUC&gt;</div>
		            <div class="product-price1">1,500</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=B2"><img src="img/images/concert4.jpg"></a></div>
		            <div class="product-name">&lt;K-Drama 클래식과 만나다&gt;</div>
		            <div class="product-price1">2,000</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=B3"><img src="img/images/concert5.jpg"></a></div>
		            <div class="product-name">&lt;HOLLLY WOOD in Classic&gt;</div>
		            <div class="product-price1">2,000</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=C1"><img src="img/images/concert6.jpg"></a></div>
		            <div class="product-name">&lt;클래식 오딧세이&gt;</div>
		            <div class="product-price1">2,000</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=C2"><img src="img/images/concert7.jpg"></a></div>
		            <div class="product-name">&lt;VIVA&gt;</div>
		            <div class="product-price1">2,500</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=C3"><img src="img/images/concert8.jpg"></a></div>
		            <div class="product-name">&lt;오행시 콘서트&gt;</div>
		            <div class="product-price1">1,500</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=D1"><img src="img/images/concert9.jpg"></a></div>
		            <div class="product-name">&lt;모차르트의 마법 바이올린&gt;</div>
		            <div class="product-price1">2,000</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=D2"><img src="img/images/concert10.jpg"></a></div>
		            <div class="product-name">&lt;차이코프스키&gt;</div>
		            <div class="product-price1">3,000</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=D3"><img src="img/images/exhibition1.jpg"></a></div>
		            <div class="product-name">&lt;소금 꽃이 핀다&gt;</div>
		            <div class="product-price1">2,500</div>
		        </li>
		    </ul>
		</div>
	</div>
	<div class="tab_content" id="programming_content">
	        <div class="list con">
		    <ul class="row">
		        <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=E1"><img src="img/images/poster5.jpg"></a></div>
		            <div class="product-name">미소 한 아름</div>
		            <div class="product-price1">3,000</div>
		        </li>
		         <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=E1"><img src="img/images/poster5.jpg"></a></div>
		            <div class="product-name">미소 한 아름</div>
		            <div class="product-price1">3,000</div>
		        </li>
		         <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=E1"><img src="img/images/poster5.jpg"></a></div>
		            <div class="product-name">미소 한 아름</div>
		            <div class="product-price1">3,000</div>
		        </li>
		         <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=E1"><img src="img/images/poster5.jpg"></a></div>
		            <div class="product-name">미소 한 아름</div>
		            <div class="product-price1">3,000</div>
		        </li>
		         <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=E1"><img src="img/images/poster5.jpg"></a></div>
		            <div class="product-name">미소 한 아름</div>
		            <div class="product-price1">3,000</div>
		        </li>
		         <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=E1"><img src="img/images/poster5.jpg"></a></div>
		            <div class="product-name">미소 한 아름</div>
		            <div class="product-price1">3,000</div>
		        </li>
		         <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=E1"><img src="img/images/poster5.jpg"></a></div>
		            <div class="product-name">미소 한 아름</div>
		            <div class="product-price1">3,000</div>
		        </li>
		         <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=E1"><img src="img/images/poster5.jpg"></a></div>
		            <div class="product-name">미소 한 아름</div>
		            <div class="product-price1">3,000</div>
		        </li>
		         <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=E1"><img src="img/images/poster5.jpg"></a></div>
		            <div class="product-name">미소 한 아름</div>
		            <div class="product-price1">3,000</div>
		        </li>
		         <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=E1"><img src="img/images/poster5.jpg"></a></div>
		            <div class="product-name">미소 한 아름</div>
		            <div class="product-price1">3,000</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=E1"><img src="img/images/poster5.jpg"></a></div>
		            <div class="product-name">미소 한 아름</div>
		            <div class="product-price1">3,000</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/ottbooking.do?ott_num=E1"><img src="img/images/poster5.jpg"></a></div>
		            <div class="product-name">미소 한 아름</div>
		            <div class="product-price1">3,000</div>
		        </li>
		    </ul>
		</div>
	</div>
</div>
    </section>
    
    <footer>
    	<jsp:include page="../includes/footer.jsp" flush="false" />
    </footer>
</body>
</html>