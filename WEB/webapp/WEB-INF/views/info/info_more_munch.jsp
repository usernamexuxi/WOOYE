<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리의 예술 : 우예</title>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
body{
		font-family:sans-serif;
		min-width: 1250px;
	}
.intro{
	height:500px;
	margin:20px;
}
.title{
	font-weight: bold;
	font-size: 24px;
	font-style:italic;
}
.imgs {
	margin: 20px;
	height: 400px;
}
.img_name{
	float: left;
	padding-right: 50px;
}
#name{
	font-size:15px;
	font-weight:bold;
	text-align:center;
}

.majorWorks{
	 list-style: none;
	 display:flex;
}

.majorWorks li{
	padding-right:50px;
}

.topMar{
	margin-top: 10%;
}
.masterpiece{
	height: 200px;
	width: auto;
	padding-bottom: 10px;
}
</style>
</head>
<body>
<header>
	<jsp:include page="../includes/header.jsp" flush="false" />
</header>

    <section class="container">
    	<div class="intro">
    		<div class="img_name">
    			<img src="img/images/munch.jpg" class="imgs">
    			<p id="name">에드바르트 뭉크 (Edvard Munch) <br> 1863년 12월 12일 - 1944년 1월 23일 </p>
    		</div>
    		<p id="info">
    		노르웨이의 표현주의 화가 겸 판화 작가. 노르웨이에선 위인 대접을 받는 인물로, 
    		그의 초상이 1,000 노르웨이 크로네 지폐에 들어가 있다. <br><br>
    		
    		어릴 적 어머니와 누이의 죽음, 그리고 연속된 사랑의 실패를 겪은 뭉크는 인간의 삶과 죽음의 문제, 
    		그리고 존재의 근원에 존재하는 고독, 질투, 불안 등을 인물화로 표현하는 성향을 갖게 되었다. 
    		또한 본인의 몸이 태어날 때부터 약해서 이런 방면으로 많이 생각했기 때문이라고 알려져 있다. 
    		그래서인지 그의 그림은 전반적으로 우울하거나 신경증적인, 불안의 느낌이 나는 우중충한 작품이 많다. 
    		그는 당대 유행하던 풍경화를 위시한 자연주의의 경향에서 벗어나 이후 융성하게 되는 표현주의 양식을 
    		주로 채택하였다. 다만 평생 우중충한 그림만 그리고 산 것은 아니며, 《태양》이라는 작품처럼 밝고 
    		화사한 작품도 그린 바 있다.<br><br>
    		
    		지금도 무척 유명한 화가지만 생전에도 돈을 잘 번 화가이기도 했다. 생전에 두 지역의 넓은 땅을 구매해서 
    		거기서 살며 그림을 그렸을 정도였다.<br>
    		 </p>
    	</div>
    	
    	<div class="title topMar">대표 작품</div>
    	<div class="intro">
    		<ul class="majorWorks">
    			<li>
    				<img src="img/images/munch1.jpg" class="masterpiece">
    				<p style="text-align:center">절규</p>
    			</li>
    			<li>
    				<img src="img/images/munch2.jpg" class="masterpiece">
    				<p style="text-align:center">흡혈귀</p>
    			</li>
    			<li>
    				<img src="img/images/munch3.jpg" class="masterpiece">
    				<p style="text-align:center">이별</p>
    			</li>
    			<li>
    				<img src="img/images/munch4.jpg" class="masterpiece">
    				<p style="text-align:center">재</p>
    			</li>
    		</ul>
    		
    	</div>
    </section>
    <footer>
    	<jsp:include page="../includes/footer.jsp" flush="false" />
    </footer>
</body>
</html>