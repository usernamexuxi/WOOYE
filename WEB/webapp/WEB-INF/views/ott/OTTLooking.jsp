 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리의 예술 : 우예</title>

<style>

#booking{
    text-align:center;
    font-weight:bold;
    font-size:25px;
    margin-top:200px;
}

.btn {
  margin-left:40%;
  margin-bottom: 40px;
  width:200px;
  height:40px;
  background: linear-gradient(125deg,#3e9ab0,#e6ba2f, #e6ba2f);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn:hover {
  background-position: right;
}
.videoNum{
	margin-bottom:60px;
}
#ott_video{
    min-width: 600px;
    max-height:1000px;
    margin-left:50%;
    transform: translateX(-50%);
}
.gomypage{
	margin-top:50px;
}
</style>
</head>
<body>
<header>
    <jsp:include page="../includes/header.jsp" flush="false" />
</header>

<div class="container">
	<div class="videoNum">
	    <h4>${ott_num}</h4>
	    <h1>${ott_title}</h1>
	</div>
	    <div>
	    	<video id="ott_video" controls src="${ott_video}" />
	    </div>
	
    
    <form action="/mypage.do?id=${userId}" method="POST" class="gomypage">
        <input type="submit" class="btn" value="마이페이지로 돌아가기" style="margin-top:50px; color:white;"/>
    </form>
    
</div>

    <footer>
        <jsp:include page="../includes/footer.jsp" flush="false" />
    </footer>
</body>
</html>