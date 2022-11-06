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
    			<img src="img/images/Gogh1.jpg" class="imgs">
    			<p id="name">빈센트 반 고흐 (Vincent van Gogh) <br> 1853년 3월 30일 - 1890년 7월 29일 </p>
    		</div>
    		<p id="info">네덜란드의 화가로서 일반적으로 서양 미술사상 가장 위대한 화가 중 한 사람으로 여겨진다. 그는 자신의 작품 
    		전부(900여 점의 그림들과 1100여 점의 습작들)를 정신질환(측두엽 기능장애로 추측됨)을 앓고 자살을 감행하기 전의  단지 10년 동안에 만들어냈다. 
    		그는 살아있는 동안 거의 성공을 거두지 못하고 사후에 비로소 알려졌는데, 
    		특히 1901년 3월 17일 파리에서 71점의 그림을 전시한 이후 명성을 얻게 되었다. <br>
    		
    		반 고흐는 흔히 탈인상주의 화가로 분류되며, 또한 인상파, 야수파, 초기 추상화, 표현주의에 미친 영향이 
    		지대하며 20세기 예술의 여러 다른 분야에 영감을 주었다. 암스테르담에 있는 반 고흐 미술관은 반 고흐의 
    		작품과 그의 동시대인들의 작품이 전시되어 있다. 네덜란드의 또 다른 도시인 오테를로에 있는 크뢸러-뮐러 
    		박물관도 상당히 많은 빈센트 반 고흐의 그림을 소장하고 있다. <br> <br>
    		
    		반 고흐가 그린 몇몇 그림들은 세상에서 가장 비싼 그림들 사이에 순위가 매겨지기도 한다. 
    		1987년 3월 30일에 반 고흐의 그림 '아이리스'가 뉴욕의 소더비즈에서 5390만 미국 달러라는 기록으로 팔렸다. 
    		1990년 5월 15일에 그의 '가셰 박사의 초상'(첫째판)이 크리스티즈에서 8,250만 달러(한국돈으로 약 580억원)에 
    		일본의 다이쇼와제지 명예회장 사이토 료에이(당시 74세)에게 팔림에 따라, 새로운 최고가 기록을 세웠다. <br>
    		 </p>
    	</div>
    	
    	<div class="title topMar">대표 작품</div>
    	<div class="intro">
    		<ul class="majorWorks">
    			<li>
    				<img src="img/images/Gogh2.jpg" class="masterpiece">
    				<p style="text-align:center">별이 빛나는 밤</p>
    			</li>
    			<li>
    				<img src="img/images/Gogh3.jpg" class="masterpiece">
    				<p style="text-align:center">아몬드 꽃 피는 나무</p>
    			</li>
    			<li>
    				<img src="img/images/Gogh4.jpg" class="masterpiece">
    				<p style="text-align:center">감자 먹는 사람들</p>
    			</li>
    			<li>
    				<img src="img/images/gogh5.jpg" class="masterpiece">
    				<p style="text-align:center">붓꽃</p>
    			</li>
    		</ul>
    		
    	</div>
    </section>
    <footer>
    	<jsp:include page="../includes/footer.jsp" flush="false" />
    </footer>
</body>
</html>