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
    			<img src="img/images/monet.jpg" class="imgs">
    			<p id="name">클로드 모네 (Claude Monet) <br> 1840년 11월 14일 - 1926년 12월 5일 </p>
    		</div>
    		<p id="info">
    		‘인상주의’의 창시자이며, 서양 미술사에서 가장 중요하고 유명한 화가로 손꼽히는 인물 중 한 명이다. 대상을 뚜렷하고 명확하게 표현하는 전통 회화 기법을 거부하고, 
    		빛에 따라 실시간으로 변화하는 대상의 색과 형태를 포착하여 그리는 인상주의로 당대 미술계의 새로운 움직임을 일으켰다. <br><br>
    		
    		인상주의라는 말 자체가 클로드 모네의 그림 중 매우 중요한, &lt;인상, 해돋이&gt;라는 작품에서 시작이 된다. 
    		이 그림은 1874년 모네, 피에르오귀스트 르누아르, 에드가 드가를 포함한 일군의 화가들이 개최했던 
    		'앵데팡당 전(展) ( Salon des Artistes Indépendants )' 에 처음으로 선보였는데, 이 전시에 대한 비평문에서 
    		비평가 루이 르루아는 &lt;인상, 해돋이&gt;가 스케치에 지나지 않는다고 비난했으며,  부정적인 의미에서 
    		이 전시회에 '인상주의자의 전시회'라는 별칭을 붙였다. 하지만 이들은 인상주의자라는 단어를 자랑스럽게 받아들였다. <br><br>
    		심지어 다른 인상파 화가들조차 빛의 변화를 포착하는 데에만 집중해서 대상 자체의 형태를 파악하기 어렵고 
    		무게감이 떨어진다는 인상주의의 한계를 자각하고 화풍을 바꿀 때까지도 그만은 끝까지 인상주의 화풍을 고수했다. 
    		인상주의를 시작하고 인상주의를 끝까지 지킨, 실로 인상파의 아버지라고 할 수 있는 인물. 오늘날 인상파라고 
    		말할 때 떠올리는 작품의 대부분이 바로 그의 작품이다.<br>
    		 </p>
    	</div>
    	
    	<div class="title topMar">대표 작품</div>
    	<div class="intro">
    		<ul class="majorWorks">
    			<li>
    				<img src="img/images/monet1.jpg" class="masterpiece">
    				<p style="text-align:center">파라솔을 든 여인</p>
    			</li>
    			<li>
    				<img src="img/images/monet2.jpg" class="masterpiece">
    				<p style="text-align:center">아이리스가 있는 모네의 정원</p>
    			</li>
    			<li>
    				<img src="img/images/monet3.jpg" class="masterpiece">
    				<p style="text-align:center">양귀비 들판</p>
    			</li>
    			<li>
    				<img src="img/images/monet4.jpg" class="masterpiece">
    				<p style="text-align:center">생타드레스의 해변가</p>
    			</li>
    		</ul>
    		
    	</div>
    </section>
    <footer>
    	<jsp:include page="../includes/footer.jsp" flush="false" />
    </footer>
</body>
</html>