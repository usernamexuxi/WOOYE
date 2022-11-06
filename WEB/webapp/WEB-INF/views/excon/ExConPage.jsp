<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<title>우리의 예술 : 우예</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/forTab.css" rel="stylesheet" type="text/css">

<style>
	
ul{
	list-style:none;
}
.img-box > a img {
    display: block;
    width: 100%;
}

.serch{
	padding:30px;
	margin: 20px;
}

#sido-input{
	box-sizing: border-box;
	width: 250px;
	height: 35px;
	border: 4px 1.3px #a3a3a3;
	background: none;
	color: #111;
	font-size: 16px;
	font-weight: bold;
}

#sido-btn{
	box-sizing: border-box;
	width: 50px;
	height: 35px;
	border: 4px solid #a3a3a3;
	background: #a3a3a3;
	color: #fff;
	font-size: 16px;
	font-weight: bold;
	margin-left: 10px;
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
    <div class="serch">
    <!-- <form action="/exconsearch.do" method="GET" class="exconsearch">
    	<input type = "text" id="sido-input" name="sido"d>
    	<input type = "submit" id="sido-btn" value="검색">
    </form> -->
    <form action="/exconsearch.do" method="GET" class="exconsearch">
	    <div class="input-group mb-3">
		  	<input type="text" name="sido" class="form-control" name="sido" placeholder="키워드를 입력하세요" aria-describedby="button-addon2">
		  	<input class="btn btn-outline-secondary" type="submit" id="sido-btn button-addon2" value="검색"></button>
		</div>
	</form>
    </div>
    
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
		            <div class="img-box"><a href="/exconmore.do"><img src="img/images/Gogh3.jpg"></a></div>
		            <div class="product-name">고흐 특별 전시회</div>
		            <div class="product-price1">7,000</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/exconmore.do"><img src="img/images/Gogh3.jpg"></a></div>
		            <div class="product-name">고흐 특별 전시회</div>
		            <div class="product-price1">7,000</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/exconmore.do"><img src="img/images/Gogh3.jpg"></a></div>
		            <div class="product-name">고흐 특별 전시회</div>
		            <div class="product-price1">7,000</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/exconmore.do"><img src="img/images/Gogh3.jpg"></a></div>
		            <div class="product-name">고흐 특별 전시회</div>
		            <div class="product-price1">7,000</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/exconmore.do"><img src="img/images/Gogh3.jpg"></a></div>
		            <div class="product-name">고흐 특별 전시회</div>
		            <div class="product-price1">7,000</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/exconmore.do"><img src="img/images/Gogh3.jpg"></a></div>
		            <div class="product-name">고흐 특별 전시회</div>
		            <div class="product-price1">7,000</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/exconmore.do"><img src="img/images/Gogh3.jpg"></a></div>
		            <div class="product-name">고흐 특별 전시회</div>
		            <div class="product-price1">7,000</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/exconmore.do"><img src="img/images/Gogh3.jpg"></a></div>
		            <div class="product-name">고흐 특별 전시회</div>
		            <div class="product-price1">7,000</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/exconmore.do"><img src="img/images/Gogh3.jpg"></a></div>
		            <div class="product-name">고흐 특별 전시회</div>
		            <div class="product-price1">7,000</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/exconmore.do"><img src="img/images/Gogh3.jpg"></a></div>
		            <div class="product-name">고흐 특별 전시회</div>
		            <div class="product-price1">7,000</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/exconmore.do"><img src="img/images/Gogh3.jpg"></a></div>
		            <div class="product-name">고흐 특별 전시회</div>
		            <div class="product-price1">7,000</div>
		        </li>
		         <li class="cell">
		            <div class="img-box"><a href="/exconmore.do"><img src="img/images/Gogh3.jpg"></a></div>
		            <div class="product-name">고흐 특별 전시회</div>
		            <div class="product-price1">7,000</div>
		        </li>
		    </ul>
		</div>
	</div>
	
	<div class="tab_content" id="programming_content">
	        <div class="list con">
		    <ul class="row">
		        <li class="cell">
		            <div class="img-box"><a href="/exconmore2.do"><img src="img/images/Dali3.jpg"></a></div>
		            <div class="product-name">달리 특별 전시회</div>
		            <div class="product-price1">10,000</div>
		        </li>
		         <li class="cell">
		            <div class="img-box"><a href="/exconmore2.do"><img src="img/images/Dali3.jpg"></a></div>
		            <div class="product-name">달리 특별 전시회</div>
		            <div class="product-price1">10,000</div>
		        </li>
		         <li class="cell">
		            <div class="img-box"><a href="/exconmore2.do"><img src="img/images/Dali3.jpg"></a></div>
		            <div class="product-name">달리 특별 전시회</div>
		            <div class="product-price1">10,000</div>
		        </li>
		         <li class="cell">
		            <div class="img-box"><a href="/exconmore2.do"><img src="img/images/Dali3.jpg"></a></div>
		            <div class="product-name">달리 특별 전시회</div>
		            <div class="product-price1">10,000</div>
		        </li>
		         <li class="cell">
		            <div class="img-box"><a href="/exconmore2.do"><img src="img/images/Dali3.jpg"></a></div>
		            <div class="product-name">달리 특별 전시회</div>
		            <div class="product-price1">10,000</div>
		        </li>
		         <li class="cell">
		            <div class="img-box"><a href="/exconmore2.do"><img src="img/images/Dali3.jpg"></a></div>
		            <div class="product-name">달리 특별 전시회</div>
		            <div class="product-price1">10,000</div>
		        </li>
		         <li class="cell">
		            <div class="img-box"><a href="/exconmore2.do"><img src="img/images/Dali3.jpg"></a></div>
		            <div class="product-name">달리 특별 전시회</div>
		            <div class="product-price1">10,000</div>
		        </li>
		         <li class="cell">
		            <div class="img-box"><a href="/exconmore2.do"><img src="img/images/Dali3.jpg"></a></div>
		            <div class="product-name">달리 특별 전시회</div>
		            <div class="product-price1">10,000</div>
		        </li>
		         <li class="cell">
		            <div class="img-box"><a href="/exconmore2.do"><img src="img/images/Dali3.jpg"></a></div>
		            <div class="product-name">달리 특별 전시회</div>
		            <div class="product-price1">10,000</div>
		        </li>
		         <li class="cell">
		            <div class="img-box"><a href="/exconmore2.do"><img src="img/images/Dali3.jpg"></a></div>
		            <div class="product-name">달리 특별 전시회</div>
		            <div class="product-price1">8,000</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/exconmore2.do"><img src="img/images/Dali3.jpg"></a></div>
		            <div class="product-name">달리 특별 전시회</div>
		            <div class="product-price1">10,000</div>
		        </li>
		        <li class="cell">
		            <div class="img-box"><a href="/exconmore2.do"><img src="img/images/Dali3.jpg"></a></div>
		            <div class="product-name">달리 특별 전시회</div>
		            <div class="product-price1">10,000</div>
		        </li>
		    </ul>
		</div>
	</div>
</div>
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
</div>
 </section>
    <footer>
    	<jsp:include page="../includes/footer.jsp" flush="false" />
    </footer>
</body>
</html>