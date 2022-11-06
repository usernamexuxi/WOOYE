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
</style>
</head>
<body>
<header>
	<jsp:include page="../includes/header.jsp" flush="false" />
</header>

    <section class="container">
    	<div class="intro">
    		<div class="img_name">
    			<img src="img/images/beethoven.jpg" class="imgs">
    			<p id="name">루트비히 판 베토벤 (Ludwig van Beethoven) <br> 1770년 12월 16일 - 	1827년 3월 26일 </p>
    		</div>
    		<p id="info">흔히 요제프 하이든, 볼프강 아마데우스 모차르트와 함께 고전파 음악을 대표하는 음악가로 알려져 있으나, 단지 
    		고전파라는 틀로 이 세 거장들을 묶어 버리기에는 각자가 음악이라는 분야에서 세운 봉우리가 너무나 우뚝하다. 
    		하이든은 소나타 양식을 비롯하여 교향곡, 현악 4중주, 협주곡 등 현재까지도 널리 쓰이는 여러 음악 양식들을 확립하고 
    		그 예술 가능성을 확인한 작곡가이다. 하이든 이후 모차르트는 하이든의 음악양식을 바탕으로 하면서 
    		자신의 창의적인 음악 스타일을 더하여 소나타, 교향곡, 협주곡, 실내악 등 다양한 여러 분야의 음악을 더욱 
    		발전시키고 고전주의 음악의 전성기를 이끌었다. 특히 오페라를 스토리와 음악이 긴밀하게 어울리는 진정한 
    		극음악 양식으로 개척하였다.  <br>
    		베토벤은 선배 작곡가들인 하이든과 모차르트가 확립한 양식들이 좀 더 깊이 있고 
    		큰 규모를 갖는 작품으로 도약할 수 있는 가능성을 모색하였다. 그는 곡의 전개방식과 화성·악기 배치 등에서 끊임없이
    		 새로운 실험을 추구하여 고전주의 형식을 완성하고 낭만주의 등 새로운 음악사조가 탄생할 수 있는 산파가 
    		 되어준 음악가로 평가받는다. <br><br>
    		 후배 또는 후계자를 자청한 슈베르트, 슈만, 브람스, 바그너, 브루크너 등을 위시해 수많은 음악가들이 
    		 모차르트와 베토벤의 영향을 받았으며 사실상 베토벤 이후의 모든 음악가들은 베토벤의 후예라고 볼 수 있다. 
    		 서양음악사가 대충 정리가 되고 음악교육의 커리큘럼이 확립된 지금에 와서는 전공이든 취미든 의무교육이든 
    		 서양음악을 일정 기간 공부한 사람 중에서 모차르트와 베토벤의 작품을 배우지 않은 사람은 없다. <br>
    		 </p>
    	</div>
    	
    	<div class="title topMar">대표 작품</div>
    	<div class="intro">
    		<ul class="majorWorks">
    			<li>
    				<iframe width="auto" height="300" src="https://www.youtube.com/embed/4Tr0otuiQuU" title="Beethoven - Moonlight Sonata" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    				<p style="text-align:center">Beethoven Sonata No.14 “Moonlight”</p>
    			</li>
    			<li>
    				<iframe width="auto" height="300" src="https://www.youtube.com/embed/jv2WJMVPQi8" title="Beethoven - Symphony No. 5 (Proms 2012)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    				<p style="text-align:center">Symphony No. 5</p>
    			</li>
    			<li>
    				<iframe width="auto" height="300" src="https://www.youtube.com/embed/SrcOcKYQX3c" title="Daniel Barenboim plays Beethoven Sonata No. 8 Op. 13 (Pathetique)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    				<p style="text-align:center">Beethoven Sonata No. 8 Op. 13</p>
    			</li>
    		</ul>
    		
    	</div>
    </section>
    <footer>
    	<jsp:include page="../includes/footer.jsp" flush="false" />
    </footer>
</body>
</html>