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
    			<img src="img/images/mozart.jpg" class="imgs">
    			<p id="name">볼프강 아마데우스 모차르트 (Wolfgang Amadeus Mozart) <br> 1756년 1월 27일 - 1791년 12월 5일 </p>
    		</div>
    		<p id="info">모차르트는 어린 시절부터 주목할 만한 음악을 남겼기 때문에 음악 역사상 가장 재능이 뛰어났던 
    		불세출의 천재로 인정받고 있다. 35년의 짧은 생애에도 불구하고 현존하는 작품 수만 무려 쾨헬 번호(K.) 
    		626편에 이르는 곡을 남긴 괴수이며 단순히 곡 수만 많은 것이 아니라 다수의 작품들이 음악성 측면에서 
    		최고의 경지에 올라 있으며 음악사에서 중요한 전환점을 만들었다. <br>
    		모차르트의 음악은 천상에서 내려올 거 같이 아름답고 순수한 멜로디, 짜임새있는 천재성이 돋보이는 곡의 구조, 
    		대중성 모두 하나라도 놓치는 거 없이 정말 완벽하다고 할 수 있는데, 
    		그의 곡을 들으며 악보도 함께 보면 천재라는 단어가 모차르트라는 인물을 표현하기에 부족할 정도다. <br><br>
    		
    		모차르트의 가장 놀라운 능력은 기악 성악을 가리지 않고 모든 형식의 음악에 능했으며 그것도 그냥 
    		두루두루 잘한다 수준이 아니라 거의 끝판왕급 역량을 보여줬다는 점이다. 
    		모차르트처럼 기악곡 분야 전반과 성악곡 분야 전반에서 모두 뛰어난 걸작을 남긴 음악가는 극히 드물다.
    		 기악곡의 경우 독주곡/실내악/협주곡/교향곡과 같은 다양한 음악장르에서 (첼로나 트럼펫 정도를 제외하고)
    		 특정 악기에 국한되지 않고 다양한 악기를 위한 작품 및 다양한 악기의 조합으로 이루어진 작품을 남겼으며, 
    		 성악곡의 경우에도 독창곡/합창곡/오페라/종교음악 등의 거의 모든 장르에서 역사적인 명작들을 남겼다. <br>
    		 </p>
    	</div>
    	
    	<div class="title topMar">대표 작품</div>
    	<div class="intro">
    		<ul class="majorWorks">
    			<li>
    				<iframe width="auto" height="300" src="https://www.youtube.com/embed/gb1tnmgPEFo" title="Seong-Jin Cho  Mozart Piano Concerto No.21" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    				<p style="text-align:center">Mozart Piano Concerto No.21</p>
    			</li>
    			<li>
    				<iframe width="auto" height="300" src="https://www.youtube.com/embed/Hm9SSSD-_eQ" title="손열음  -  터키행진곡" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    				<p style="text-align:center">Turkish March</p>
    			</li>
    			<li>
    				<iframe width="auto" height="300" src="https://www.youtube.com/embed/-V4bGocFwnE" title="Krystian Zimerman plays Mozart Sonata No. 10 in C Major, K 330 (Complete)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    				<p style="text-align:center">Mozart Sonata No. 10 in C Major, K 330</p>
    			</li>
    		</ul>
    		
    	</div>
    </section>
    <footer>
    	<jsp:include page="../includes/footer.jsp" flush="false" />
    </footer>
</body>
</html>