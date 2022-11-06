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
    			<img src="img/images/Hisa.jpg" class="imgs">
    			<p id="name">히사이시 조 (Joe Hisaishi) <br> 1950년 12월 6일 출생 </p>
    		</div>
    		<p id="info">당시 미국 중심으로 미니멀리즘 사조의 음악에 관심이 많았던 그는 1974년 TV애니메이션 '최초의 인간 갸루토즈'로 공식 
    		데뷔했다. 1984년 히사이시 조는 미야자키 하야오·타카하타 이사오 등이 만든 '바람계곡 나우시카'의 음악 감독으로 발탁 됐다. 
    		당시는 무명이었던 그는 해당 작품이 엄청난 흥행을 거두며 미야자키 하야오 감독의 모든 극장판 애니메이션 음악 감독으로 활동했다.
    		 '천공의 성 라퓨타'(1986) '이웃집 토토로'(1988) '마녀 배달부 키키'(1989) '모노노케 히메'(1997) 등에서 활약하며 
    		 일본 영화계 떠오르는 영화 음악 감독으로 인기를 끌었다. <br>
    		 나우시카의 흥행 성공으로 이후 미야자키가 맡게 되는 거의 모든 극장판 애니메이션의 음악감독으로 활동하게 되었고, 
    		 1985년에는 녹음 스튜디오인 '원더 스테이션' 을 자비로 개장해 솔로 앨범 등의 제작에 사용하기 시작했다. 
    		 1991년에는 기타노 다케시와도 공동 작업을 시작해 그 여름, 가장 조용한 바다를 시작으로 2002년의 'Dolls' 까지 
    		 7편의 영화에서 음악감독을 맡았다.<br>
    		 1992년에 일본 아카데미상 최우수 음악상을 수상하면서 영화음악이나 방송음악의 전문가로 인정받기 시작했고, 
    		 관현악단을 동원한 솔로 콘서트나 앨범 제작 등 한층 스케일 큰 음악 작업에도 본격적으로 뛰어들기 시작했다. 
    		 1998년 나가노 동계 패럴림픽에서는 개막식의 음악 총감독을 맡기도 했다.<br>
    		 2001년에는 자신이 음악감독 외에 영화감독까지 맡아 제작한 음악 영화 '쿼텟(Quartet)' 을 발표하기도 했고, 
    		 피아니스트나 키보디스트 외에도 직접 지휘를 맡아 공연하는 횟수가 늘어나기 시작했다. 2004년에 개최된 칸 국제영화제에서는 
    		 일본 음악인으로서는 최초로 영화제 개막식에서 버스터 키튼의 무성영화 '제너럴(The General)' 의 음악 작곡과 지휘를 맡아 
    		 화제가 되기도 했다.<br>
    		 </p>
    	</div>
    	
    	<div class="title topMar">대표 작품</div>
    	<div class="intro">
    		<ul class="majorWorks">
    			<li>
    				<iframe width="auto" height="300" src="https://www.youtube.com/embed/l0GN40EL1VU" title="Joe Hisaishi - Summer" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    				<p style="text-align:center">summer</p>
    			</li>
    			<li>
    				<iframe width="auto" height="300" src="https://www.youtube.com/embed/4iWT_j9uY0k" title="Joe Hisaishi - “Merry-Go-Round of Life (from Howl’s Moving Castle)” – Keyboard Visualizer" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    				<p style="text-align:center">merry-go-round</p>
    			</li>
    			<li>
    				<iframe width="auto" height="300" src="https://www.youtube.com/embed/TK1Ij_-mank" title="Joe Hisaishi - One Summer's Day" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    				<p style="text-align:center">One Summer's Day</p>
    			</li>
    		</ul>
    		
    	</div>
    </section>
    <footer>
    	<jsp:include page="../includes/footer.jsp" flush="false" />
    </footer>
</body>
</html>