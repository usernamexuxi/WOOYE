<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>
<title>우리의 예술 : 우예</title>
<style>
#logo{
	width: 220px;
	height: 70px;
	float: left;
	margin-right: 20px;
}
.btn {
  width:200px;
  height:40px;
  margin-left:50%;
  background: linear-gradient(125deg,#3e9ab0,#e6ba2f, #e6ba2f);
  background-position: left;
  background-size: 200%;
  color: #fff;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}
.part {
	height: 300px;
	margin: 20px;
	padding: 0 30px 0 30px;
}

.part_name {
	font-weight: bold;
	font-size: 20px;
	margin-bottom: 30px;
}
.colorSpan{
	color:#3e9ab0;
}
</style>

<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet" />

</head>
<body>
	<header>
		<jsp:include page="../includes/header.jsp" flush="false" />
	</header>
	
<div class="container">
	<form action="/join_submit2.do?id=${userId}" method="POST">
		<div class="mainMid">
			<div class="part" id="aria_part">
				<p class="part_name">관심가는 <span class="colorSpan">시대</span>를 선택하세요. (최소 3개)</p>
				<select class="form-control" name="e1" multiple="multiple">
					<option name="K1" value="르네상스 (1400년 ~ 1600년)">르네상스 (1400년 ~ 1600년)</option>
					<option name="K2" value="바로크 (1580년 ~ 1750년)">바로크 (1580년 ~ 1750년)</option>
					<option name="K3" value="로코코 (1715년 ~ 1789년)">로코코 (1715년 ~ 1789년)</option>
					<option name="K4" value="고전주의 (1750년 ~ 1820년)">고전주의 (1750년 ~ 1820년)</option>
					<option name="K5" value="낭만주의 (1800년 ~ 1850년)">낭만주의 (1800년 ~ 1850년)</option>
					<option name="K6" value="사실주의 (1855년 ~ 1XXX년)">사실주의 (1855년 ~ 1XXX년)</option>
					<option name="K7" value="인상주의 (1863년 ~ 1890년)">인상주의 (1863년 ~ 1890년)</option>
					<option name="K8" value="표현주의 (1905년 ~ 1930년)">표현주의 (1905년 ~ 1930년)</option>
					<option name="K9" value="초현실주의 (1920년 ~ XXXX년)">초현실주의 (1920년 ~XXXX년)</option>
					<option name="K10" value="팝아트 (1960년 ~ XXXX년)">팝아트 (1960년 ~ XXXX년)</option>
				</select>
			</div>

			<div class="part" id="musician_part">
				<p class="part_name">관심가는 <span class="colorSpan">음악가</span>를 선택하세요. (최소 5개)</p>
				<select class="form-control" name="e2" multiple="multiple">
					<option name="C1" value="루트비히 판 베토벤">루트비히 판 베토벤</option>
					<option name="C2" value="니콜라이 림스키코르사코프">니콜라이 림스키코르사코프</option>
					<option name="C3" value="카미유 생상스">카미유 생상스</option>
					<option name="C4" value="표트르 일리치 차이콥스키">표트르 일리치 차이콥스키</option>
					<option name="C5" value="세르게이 라흐마니노프">세르게이 라흐마니노프</option>
					<option name="C6" value="엑토르 베를리오즈">엑토르 베를리오즈</option>
					<option name="C7" value="요한 제바스타인 바흐">요한 제바스타인 바흐</option>
					<option name="C8" value="프레데리크 쇼팽">프레데리크 쇼팽</option>
					<option name="C9" value="모리스 라벨">모리스 라벨</option>
					<option name="C10" value="프리드리히 다니엘 루돌프 쿨라우">프리드리히 다니엘 루돌프 쿨라우</option>
					<option name="C11" value="프란츠 요제프 하이든">프란츠 요제프 하이든</option>
					<option name="C12" value="프란츠 베터 슈베르트">프란츠 베터 슈베르트</option>
					<option name="C13" value="엔니오 모리코네">엔니오 모리코네</option>
					<option name="C14" value="에투아르도 디 카푸아">에투아르도 디 카푸아</option>
					<option name="C15" value="안톤 브루크너">안톤 브루크너</option>
					<option name="C16" value="볼프강 아마데우스 모차르트">볼프강 아마데우스 모차르트</option>
					<option name="C17" value="요한 슈트라우스 2세">요한 슈트라우스 2세</option>
					<option name="C18" value="자코모 푸치니">자코모 푸치니</option>
					<option name="C19" value="요하네스 브람스">요하네스 브람스</option>
					<option name="C20" value="조지 프레드릭 헨델">조지 프레드릭 헨델</option>
					<option name="C21" value="알레산드로 스카를라티">알레산드로 스카를라티</option>
					<option name="C22" value="클로드 드뷔시">클로드 드뷔시</option>
					<option name="C23" value="비발디">비발디</option>
					<option name="C24" value="펠릭스 멘델스존">펠릭스 멘델스존</option>
					<option name="C25" value="헤르만 네케">헤르만 네케</option>
					<option name="C26" value="리하르트 바그너">리하르트 바그너</option>
					<option name="C27" value="표트르 일리치 차이콥스키">표트르 일리치 차이콥스키</option>
				</select>
			</div>

			<div class="part" id="artist_part">
				<p class="part_name">관심가는 <span class="colorSpan">화가</span>를 선택하세요. (최소 5개)</p>
				<select class="form-control" name="e3" multiple="multiple">
					<option name="M1" value="세르게이 유리예비치 수데이킨">세르게이 유리예비치 수데이킨</option>
					<option name="M2" value="세르게이 비노그라도프">세르게이 비노그라도프</option>
					<option name="M4" value="미켈란젤로 부오나로티">미켈란젤로 부오나로티</option>
					<option name="M5" value="레오나르도 다 빈치">레오나르도 다 빈치</option>
					<option name="M6" value="라파엘로 산치오">라파엘로 산치오</option>
					<option name="M7" value="피터 반 몰">피터 반 몰</option>
					<option name="M8" value="렘브란트 하르먼손 반 레인">렘브란트 하르먼손 반 레인</option>
					<option name="M9" value="요하네스 페르메이르">요하네스 페르메이르</option>
					<option name="M10" value="헤다">헤다</option>
					<option name="M11" value="피터 클레즈">피터 클레즈</option>
					<option name="M12" value="대 오아시스 베르트">대 오아시스 베르트</option>
					<option name="M13" value="보갱">보갱</option>
					<option name="M14" value="아르테미시아 젠틸레스키">아르테미시아 젠틸레스키</option>
					<option name="M15" value="장 오노레 프라고나르">장 오노레 프라고나르</option>
					<option name="M16" value="프랑수아 부셰">프랑수아 부셰</option>
					<option name="M17" value="장 앙투안 와토">장 앙투안 와토</option>
					<option name="M18" value="지오반니 안토니오 카날">지오반니 안토니오 카날</option>
					<option name="M19" value="마인데르트 호베마">마인데르트 호베마</option>
					<option name="M20" value="자크 루이 다비드">자크 루이 다비드</option>
					<option name="M21" value="니콜라 푸생">니콜라 푸생</option>
					<option name="M22" value="외젠 들라크루아">외젠 들라크루아</option>
					<option name="M23" value="다비드 프리드리히">다비드 프리드리히</option>
					<option name="M24" value="아돌프 멘젤">아돌프 멘젤</option>
					<option name="M25" value="마틴 존슨 히드">마틴 존슨 히드</option>
					<option name="M26" value="귀스타브 쿠르베">귀스타브 쿠르베</option>
					<option name="M27" value="장프랑수아 밀레">장프랑수아 밀레</option>
					<option name="M28" value="존 컨스터블">존 컨스터블</option>
					<option name="M29" value="오노레 도미에">오노레 도미에</option>
					<option name="M30" value="빈센트 반 고흐">빈센트 반 고흐</option>
					<option name="M31" value="클로드 모네">클로드 모네</option>
					<option name="M32" value="폴 세잔">폴 세잔</option>
					<option name="M33" value="조르주 쇠라">조르주 쇠라</option>
					<option name="M34" value="에드바르 뭉크">에드바르 뭉크</option>
					<option name="M35" value="구스타프 클림트">구스타프 클림트</option>
					<option name="M36" value="에곤 쉴레">에곤 쉴레</option>
					<option name="M37" value="마르크 샤갈">마르크 샤갈</option>
					<option name="M38" value="르네 마그리트">르네 마그리트</option>
					<option name="M39" value="살바도르 달리">살바도르 달리</option>
					<option name="M40" value="호안 미로">호안 미로</option>
					<option name="M41" value="조르지오 데 키리코">조르지오 데 키리코</option>
					<option name="M42" value="타카시 무라카미">타카시 무라카미</option>
					<option name="M43" value="키스 해링">키스 해링</option>
					<option name="M44" value="앤디 워홀">앤디 워홀</option>
					<option name="M45" value="로이 리히텐슈타인">로이 리히텐슈타인</option>
				</select>
			</div>

			<div class="part" id="art_part">
				<p class="part_name">관심가는 <span class="colorSpan">명화</span>를 선택하세요. (최소 7개)</p>
				<select class="form-control" name="e4" multiple="multiple">
					<option name='J1' value='모나리자'>모나리자 (레오나르도 다 빈치)
						</option>
					<option name='J2' value='천지창조'>천지창조 (미켈란젤로 부오나로티)
						</option>
					<option name='J3' value='최후의 만찬'>최후의 만찬 (레오나르도 다 빈치)
						</option>
					<option name='J4' value='아테네 학당'>아테네 학당 (라파엘로 산치오)
						</option>
					<option name='J5' value='최후의 심판'>최후의 심판 (미켈란젤로 부오나로티)
						</option>
					<option name='J6' value='십자가에서 내려지는 그리스도'>십자가에서 내려지는 그리스도
						(피터 반 몰)
						</option>
					<option name='J7' value='야경'>야경 (렘브란트 하르먼손 반 레인)
						</option>
					<option name='J8' value='진주귀걸이를 한 소녀'>진주귀걸이를 한 소녀 (요하네스
						페르메이르)
						</option>
					<option name='J9' value='정물'>정물 (헤다)
						</option>
					<option name='J10' value='와인잔이 있는 정물'>와인잔이 있는 정물 (피터 클레즈)
						</option>
					<option name='J11' value='꽃병이 있는 정물'>꽃병이 있는 정물 (대 오아시스
						베르트)
						</option>
					<option name='J12' value='오감'>오감 (보갱)
						</option>
					<option name='J13' value='홀로페르네스를 죽이는 유디트'>홀로페르네스를 죽이는 유디트
						(아르테미시아 젠틸레스키)
						</option>
					<option name='J14' value='그네'>그네 (장 오노레 프라고나르)
						</option>
					<option name='J15' value='퐁파두르 후작부인'>퐁파두르 후작부인 (프랑수아 부셰)
						</option>
					<option name='J16' value='제르생의 간판'>제르생의 간판 (장 앙투안 와토)
						</option>
					<option name='J17' value='베니스 대운하 입구'>베니스 대운하 입구 (지오반니
						안토니오 카날)
						</option>
					<option name='J18' value='미델하르니스의 가로수길'>미델하르니스의 가로수길
						(마인데르트 호베마)
						</option>
					<option name='J19' value='호라티우스 형제의 맹세'>호라티우스 형제의 맹세 (자크
						루이 다비드)
						</option>
					<option name='J20' value='알프스를 넘는 나폴레옹'>알프스를 넘는 나폴레옹 (자크
						루이 다비드)
						</option>
					<option name='J21' value='4계절 연작화 : 겨울'>4계절 연작화 : 겨울 (니콜라
						푸생)
						</option>
					<option name='J22' value='무아테시에 부인'>무아테시에 부인 (장오귀스트도미니크
						앵그르)
						</option>
					<option name='J23' value='아르카디아에도 나는 있다'>아르카디아에도 나는 있다
						(니콜라 푸생)
						</option>
					<option name='J24' value='민중을 이끄는 자유의 여신'>민중을 이끄는 자유의 여신
						(외젠 들라크루아)
						</option>
					<option name='J25' value='파가니니의 초상'>파가니니의 초상 (외젠 들라크루아)
						</option>
					<option name='J26' value='겨울 풍경'>겨울 풍경 (다비드 프리드리히)
						</option>
					<option name='J27' value='발코니 방'>발코니 방 (아돌프 멘젤)
						</option>
					<option name='J28' value='금색 벨벳 천에 목련'>금색 벨벳 천에 목련 (마틴 존슨
						히드)
						</option>
					<option name='J29' value='과일 정물'>과일 정물 (귀스타브 쿠르베)
						</option>
					<option name='J30' value='안녕하십니까, 쿠르베 씨'>안녕하십니까, 쿠르베 씨
						(귀스타브 쿠르베)
						</option>
					<option name='J31' value='이삭 줍는 여인들'>이삭 줍는 여인들 (장프랑수아 밀레)
						</option>
					<option name='J32' value='비벤호 공원'>비벤호 공원 (존 컨스터블)
						</option>
					<option name='J33' value='삼등열차'>삼등열차 (오노레 도미에)
						</option>
					<option name='J34' value='별이 빛나는 밤'>별이 빛나는 밤 (빈센트 반 고흐)
						</option>
					<option name='J35' value='인상 해돋이'>인상 해돋이 (클로드 모네)
						</option>
					<option name='J36' value='해바라기'>해바라기 (빈센트 반 고흐)
						</option>
					<option name='J37' value='사과 바구니'>사과 바구니 (폴 세잔)
						</option>
					<option name='J38' value='그랑드자트섬의 일요일 오후'>그랑드자트섬의 일요일 오후
						(조르주 쇠라)
						</option>
					<option name='J39' value='절규'>절규 (에드바르 뭉크)
						</option>
					<option name='J40' value='더 키스'>더 키스 (구스타프 클림트)
						</option>
					<option name='J41' value='꽃피는 아몬드 나무'>꽃피는 아몬드 나무 (빈센트 반
						고흐)
						</option>
					<option name='J42' value='꽈리 열매가 있는 자화상'>꽈리 열매가 있는 자화상 (에곤
						쉴레)
						</option>
					<option name='J43' value='나와 마을'>나와 마을 (마르크 샤갈)
						</option>
					<option name='J44' value='골콩드'>골콩드 (르네 마그리트)
						</option>
					<option name='J45' value='연인들'>연인들 (르네 마그리트)
						</option>
					<option name='J46' value='기억의 지속'>기억의 지속 (살바도르 달리)
						</option>
					<option name='J47' value='어릿광대의 사육제'>어릿광대의 사육제 (호안 미로)
						</option>
					<option name='J48' value='거리의 신비와 우수'>거리의 신비와 우수 (조르지오 데
						키리코)
						</option>
					<option name='J49' value='꽃공'>꽃공 (타카시 무라카미)
						</option>
					<option name='J50' value='빛나는 아기'>빛나는 아기 (키스 해링)
						</option>
					<option name='J51' value='캠벨 수프 통조림'>캠벨 수프 통조림 (앤디 워홀)
						</option>
					<option name='J52' value='마릴린먼로1'>마릴린먼로1 (앤디 워홀)
						</option>
					<option name='J53' value='차 안에서'>차 안에서 (로이 리히텐슈타인)
						</option>
				</select>
			</div>

			<div class="part" id="classic_part">
				<p class="part_name">관심가는 <span class="colorSpan">클래식</span>을 선택하세요. (최소 7개)</p>
				<select class="form-control" name="e5" multiple="multiple">
					<option name="G1" value='왕벌의 비행'>왕벌의 비행 (니콜라이 림스키코르사코프)
						</option>
					<option name="G2" value='죽음의 무도'>죽음의 무도 (카미유 생상스)
						</option>
					<option name="G3" value='바이올린 협주곡 라 장조 작품번호 61'>바이올린 협주곡 라
						장조 작품번호 61 (루트비히 판 베토벤)
						</option>
					<option name="G4" value='피아노 협주곡 2번'>피아노 협주곡 2번 (표트르 일리치
						차이콥스키)
						</option>
					<option name="G5" value='파가니니 주제에 의한 광시곡'>파가니니 주제에 의한 광시곡
						(세르게이 라흐마니노프)
						</option>
					<option name="G6" value='환상교향곡'>환상교향곡 (엑토르 베를리오즈)
						</option>
					<option name="G7" value='바 장조 파스토랄레'>바 장조 파스토랄레 (요한 제바스타인
						바흐)
						</option>
					<option name="G8" value='피아노 소나타 8번'>피아노 소나타 8번 (로트비히 판
						베토벤)
						</option>
					<option name="G9" value='피아노 소나타 3번'>피아노 소나타 3번 (프레데리크 쇼팽)
						</option>
					<option name="G10" value='물의 유희'>물의 유희 (모리스 라벨)
						</option>
					<option name="G11" value='엘리제를 위하여'>엘리제를 위하여 (루트비히 판 베토벤)
						</option>
					<option name="G12" value='쿨라우 소나티네 Op.20 No.1'>쿨라우 소나티네
						Op.20 No.1 (프리드리히 다니엘 루돌프 쿨라우)
						</option>
					<option name="G13" value='발라드 4번'>발라드 4번 (프레데리크 쇼팽)
						</option>
					<option name="G14" value='밤의 가스파르'>밤의 가스파르 (모리스 라벨)
						</option>
					<option name="G15" value='대 푸가 B플랫장조 133'>대 푸가 B플랫장조 133
						(루트비히 판 베토벤)
						</option>
					<option name="G16" value='태양 4중주곡집'>태양 4중주곡집 (프란츠 요제프 하이든)
						</option>
					<option name="G17" value='교향곡 22번 Eb장조 철학자'>교향곡 22번 Eb장조
						철학자 (프란츠 요제프 하이든)
						</option>
					<option name="G18" value='교향곡 31번 D장조 호른 신호'>교향곡 31번 D장조
						호른 신호(프란츠 요제프 하이든)
						</option>
					<option name="G19" value='교향곡 제9번'>교향곡 제9번 (프란츠 베터 슈베르트)
						</option>
					<option name="G20" value='송어'>송어 (프란츠 베터 슈베르트)
						</option>
					<option name="G21" value='죽음과 소녀'>죽음과 소녀(프란츠 베터 슈베르트)
						</option>
					<option name="G22" value='마왕'>마왕 (프란츠 베터 슈베르트)
						</option>
					<option name="G23" value='Nella Fantasia'>Nella Fantasia
						(엔니오 모리코네)
						</option>
					<option name="G24" value='O Sole Mio'>O Sole Mio (에투아르도 디
						카푸아)
						</option>
					<option name="G25" value='미사 제3번 F단조'>미사 제3번 F단조 (안톤 브루크너)
						</option>
					<option name="G26" value='아이네 클라이네 나흐트무지크'>아이네 클라이네 나흐트무지크
						(볼프강 아마데우스 모차르트)
						</option>
					<option name="G27" value='피아노 협주곡 17번'>피아노 협주곡 17번 (볼프강
						아마데우스 모차르트)
						</option>
					<option name="G28" value='저녁 산들바람은 부드럽게'>저녁 산들바람은 부드럽게
						(볼프강 아마데우스 모차르트)
						</option>
					<option name="G29" value='박쥐(오페레타)'>박쥐(오페레타) (요한 슈트라우스 2세)
						</option>
					<option name="G30" value='Nessun dorma'>Nessun dorma (자코모
						푸치니)
						</option>
					<option name="G31" value='피아노 5중주 F단조 Op.34'>피아노 5중주 F단조
						Op.34 (요하네스 브람스)
						</option>
					<option name="G32" value='독일 레퀴엠'>독일 레퀴엠 (요하네스 브람스)
						</option>
					<option name="G33" value='나를 울게 하소서'>나를 울게 하소서 (조지 프레드릭
						헨델)
						</option>
					<option name="G34" value='현악 4중주 6번(op.1-6) C장조'>현악 4중주
						6번(op.1-6) C장조(요제프 하이든)
						</option>
					<option name="G35" value='4중주 소나타 4번 d단조'>4중주 소나타 4번 d단조
						(알레산드로 스카를라티)
						</option>
					<option name="G36" value='바이올린 소나타 G단조 L.140'>바이올린 소나타 G단조
						L.140(클로드 드뷔시)
						</option>
					<option name="G37" value='오르간 협주곡 Op.4'>오르간 협주곡 Op.4 (게오르크
						프리드리히 헨델)
						</option>
					<option name="G38" value='미사 제1번'>미사 제1번 (안톤 브루크너)
						</option>
					<option name="G39" value='조화의 영감'>조화의 영감 (비발디)
						</option>
					<option name="G40" value='한여름 밤의 꿈 Op.61'>한여름 밤의 꿈 Op.61
						(펠릭스 멘델스존)
						</option>
					<option name="G41" value='바이올린 협주곡 e단조 Op.64'>바이올린 협주곡 e단조
						Op. 64 (펠릭스 멘델스존)
						</option>
					<option name="G42" value='엘리야'>엘리야 (펠릭스 멘델스존)
						</option>
					<option name="G43" value='크시코스의 우편마차'>크시코스의 우편마차(헤르만 네케)
						</option>
					<option name="G44" value='아름답고 푸른 도나우강'>아름답고 푸른 도나우강 (요한
						슈트라우스 2세)
						</option>
					<option name="G45" value='결혼 행진곡'>결혼 행진곡 (리하르트 바그너)
						</option>
					<option name="G46" value='호두까기 인형'>호두까기 인형 (표트르 일리치 차이콥스키)
						</option>
					<option name="G47" value='바이올린 협주곡 D장조'>바이올린 협주곡 D장조 (표트르
						일리치 차이콥스키)
						</option>
					<option name="G48" value='뉘른베르크의 명가수'>뉘른베르크의 명가수 (리하르트
						바그너)
						</option>
					<option name="G49" value='루슬란과 류드밀라'>루슬란과 류드밀라 (미하일 글린카)
						</option>
					<option name="G50" value='토카타와 푸가'>토카타와 푸가 (요한 제바스타인 바흐)
						</option>
				</select>
			</div>
		</div>
		<input class="btn btn-secondary mb-3" onclick="alert('다음 페이지로 넘어갈 때까지 잠시 기다려주세요.');" type="submit" value="취향 기입" style="margin-left:80%; color: #fff;" />
	</form>
</div>
	<!-- footer/ copyright -->
	<footer>
		<jsp:include page="../includes/footer.jsp" flush="false" />
	</footer>
	
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>    
    <!-- select2 javascript cdn -->    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>
    <!-- // select2 초기화   -->
    <script> $('select').select2(); </script>

</body>
</html>