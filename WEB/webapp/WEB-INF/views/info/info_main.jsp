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

<link href="${pageContext.request.contextPath}/resources/css/forTab.css" rel="stylesheet" type="text/css">

<style>
.section{
	height:400px;
	margin:20px 20px 80px 20px;
	padding:0 60px 0 60px;
	border-left: 1px solid green;
}
.imgs {
	margin: 20px;
	padding-top:30px;
	height: 300px;
	float: left;
}
.name{
	margin:0;
	font-size: 20px;
	font-weight:bold;
}
.imgInfo{
	margin: 30px;
	padding: 100px 40px 0 100px;
}
.btn{
	width:200px;
	padding: 5px;
	margin-left:80%;
	background: #3e9ab0;
	color:white;
	border:none;
}

#name-input{
	box-sizing: border-box;
	width: 250px;
	height: 35px;
	border: 4px 1.3px #a3a3a3;
	background: none;
	color: #111;
	font-size: 16px;
	font-weight: bold;
}

#name-btn{
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
.serch{
	padding-bottom:30px;
	margin-bottom: 20px;
}

.text-center{
	padding-top:30px;
}
</style>
</head>
<body>
<header>
	<jsp:include page="../includes/header.jsp" flush="false" />
</header>
<section class="container">
	<div class="serch">
	    <!-- <h5> 검색 시 이름 정확하게 입력하세요. (ex. 빈센트 반 고흐) </h5>
	    <form action="/infosearch.do" method="GET" class="exconsearch">
	    	<input type = "text" id="name-input" name="artist">
	    	<input type = "submit" id="name-btn" value="검색">
	    </form> -->
	    
	    <form action="/infosearch.do" method="GET" class="exconsearch">
	    	<div class="input-group mb-3">
		  	<input type="text" id="name-input1" class="form-control" name="artist" placeholder="검색시 이름 정확하게 입력하세요. (ex. 빈센트 반 고흐)" aria-label="Recipient's username" aria-describedby="button-addon2">
		  	<input class="btn btn-outline-secondary" type="submit" id="name-btn button-addon2" value="검색"></button>
			</div>
		</form>
	</div>
	    	
	<div class="tabs">
	    <input id="all" type="radio" name="tab_item" checked>
	    <label class="tab_item" for="all">음악가</label>
	    <input id="programming" type="radio" name="tab_item">
	    <label class="tab_item" for="programming">화가</label>
	    
	    
	    <div class="tab_content" id="all_content">
	        <div class="section">
	        	<img src="img/images/Hisa.jpg" class="imgs">
	        	<div class="imgInfo">
	        	<p class="name">히사이시 조</p>
	        	<p class="name">久石 譲 | Joe Hisaishi</p>
	        	<br>
	        	나가노현의 나카노시 태생으로, 어릴 적 스즈키 신이치가 설립한 스즈키 바이올린 학교에서 바이올린을 배운 경험이 있다. 
	        	히비야 고등학교를 거쳐 도쿄의 구니타치 음악대학 작곡과를 졸업했고, 대학 시절부터 이런저런 밴드의 세션 키보디스트나 작·편곡자로 활동했다.
	        	</div>
	        	<form action="/info_submit_hisa.do" method="POST" class="infoForm">
	        	<input type="submit" class="btn" value="더보기"/>
	        	</form>
	        </div>
	        <div class="section">
	        	<img src="img/images/beethoven.jpg" class="imgs">
	        	<div class="imgInfo">
	        	<p class="name">루트비히 판 베토벤</p>
	        	<p class="name">Ludwig van Beethoven</p>
	        	<br>
	        	 독일 및 오스트리아의 클래식 작곡가. 바흐·모차르트와 함께 음악 역사상 크나큰 업적을 이룩한 작곡가로 평가받는다. 음악사에서도 손꼽히는 존재로 악성(樂聖)으로 칭송받는다. 
	        	 그만큼 현재까지도 큰 영향력과 명성을 갖고 있는 인물이다. 
	        	 </div>
	        	 <form action="/info_submit_beethoven.do" method="POST" class="infoForm">
	        	<input type="submit" class="btn" value="더보기"/>
	        	</form>
	        </div>
	        <div class="section">
	        	<img src="img/images/mozart.jpg" class="imgs">
	        	<div class="imgInfo">
	        	<p class="name">볼프강 아마데우스 모차르트</p>
	        	<p class="name">Wolfgang Amadeus Mozart</p>
	        	<br>
	        	오스트리아의 음악가이다. 바흐, 베토벤과 더불어 역사적으로 가장 뛰어난 음악적 업적을 이룩한 작곡가로 인정받고 있으며, 음악의 신동(神童)이라는 별명을 가지고 있다. 
	        	그의 음악은 불멸의 반열에 올랐으며 문명사회에 살고 있는 사람이라면 클래식에 전혀 관심이 없더라도 모차르트의 이름 정도는 알고 있다.</div>
	        	<form action="/info_submit_mozart.do" method="POST" class="infoForm">
	        	<input type="submit" class="btn" value="더보기"/>
	        	</form>
	        </div>
	    </div>
	    <div class="tab_content" id="programming_content">
	        <div class="section">
	        	<img src="img/images/Gogh1.jpg" class="imgs">
	        	<div class="imgInfo">
	        	<p class="name">빈센트 반 고흐</p>
	        	<p class="name">Vincent van Gogh</p>
	        	<br>
	        	 네덜란드의 화가로서 일반적으로 서양 미술사상 가장 위대한 화가 중 한 사람으로 여겨진다. 
	        	 그는 자신의 작품 전부(900여 점의 그림들과 1100여 점의 습작들)를 정신질환
	        	 (측두엽 기능장애로 추측됨)을 앓고 자살을 감행하기 전의 단지 10년 동안에 만들어냈다. 
	        	 그는 살아있는 동안 거의 성공을 거두지 못하고 사후에 비로소 알려졌는데, 
	        	 특히 1901년 3월 17일 파리에서 71점의 그림을 전시한 이후 명성을 얻게 되었다.
	        	 </div>
	        	 <form action="/info_submit_gogh.do" method="POST" class="infoForm">
	        	<input type="submit" class="btn" value="더보기"/>
	        	</form>
	        </div>
	        <div class="section">
	        	<img src="img/images/monet.jpg" class="imgs">
	        	<div class="imgInfo">
	        	<p class="name">클로드 모네</p>
	        	<p class="name">Claude Monet</p>
	        	<br>
	        	 프랑스의 화가. ‘인상주의’의 창시자이며, 서양 미술사에서 가장 중요하고 유명한 화가로 손꼽히는 인물 중 한 명이다. 
	        	 대상을 뚜렷하고 명확하게 표현하는 전통 회화 기법을 거부하고, 빛에 따라 실시간으로 변화하는 대상의 색과 형태를 포착하여 그리는 인상주의로 당대 미술계의 새로운 움직임을 일으켰다.
	        	 </div>
	        	 <form action="/info_submit_monet.do" method="POST" class="infoForm">
	        	<input type="submit" class="btn" value="더보기"/>
	        	</form>
	        </div>
	        <div class="section">
	        	<img src="img/images/munch.jpg" class="imgs">
	        	<div class="imgInfo">
	        	<p class="name">에드바르트 뭉크</p>
	        	<p class="name">Edvard Munch</p>
	        	<br>
	        	 노르웨이의 표현주의 화가 겸 판화 작가. 노르웨이에선 위인 대접을 받는 인물로, 그의 초상이 1,000 노르웨이 크로네 지폐에 들어가 있다. 
	        	 어릴 적 어머니와 누이의 죽음, 그리고 연속된 사랑의 실패를 겪은 뭉크는 인간의 삶과 죽음의 문제, 그리고 존재의 근원에 존재하는 고독, 질투, 불안 등을 인물화로 표현하는 성향을 갖게 되었다. 
	        	 또한 본인의 몸이 태어날 때부터 약해서 이런 방면으로 많이 생각했기 때문이라고 알려져 있다.
	        	 </div>
	        	 <form action="/info_submit_munch.do" method="POST" class="infoForm">
	        	<input type="submit" class="btn" value="더보기"/>
	        	</form>
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
</section>

<footer>
    <jsp:include page="../includes/footer.jsp" flush="false" />
</footer>
</body>
</html>