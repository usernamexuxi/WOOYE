<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.wooye.user.UserVO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리의 예술 : 우예</title>
<link href="${pageContext.request.contextPath}/resources/css/seatBooking.css" rel="stylesheet" type="text/css">

<style>
.btn {
  margin-left:50%;
  transform: translateX(-50%);
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
</style>
</head>
<body>
<header>
	<jsp:include page="../includes/header.jsp" flush="false" />
</header>

<section id="seatBooking"> 
	<div class="movie-container">
      <label>전시회/공연 좌석 선택</label>
    </div>

    <ul class="showcase">
      <li>
        <div class="seat"></div>
        <small>N/A</small>
      </li>
      <li>
        <div class="seat selected"></div>
        <small>Selected</small>
      </li>
      <li>
        <div class="seat occupied"></div>
        <small>Occupied</small>
      </li>
    </ul>

    <div class="container">
      <div class="screen"></div>

      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        
      </div>
      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat occupied"></div>
        <div class="seat occupied"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>
      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat occupied"></div>
        <div class="seat occupied"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>
      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>
      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat occupied"></div>
        <div class="seat occupied"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>
      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat occupied"></div>
        <div class="seat occupied"></div>
        <div class="seat occupied"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>
      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat occupied"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat occupied"></div>
        <div class="seat occupied"></div>
        <div class="seat"></div>
      </div>
    </div>

    <p class="text">
      You have selected <span id="count">0</span> seats for a price of $<span id="total">0</span>
    </p>
    
    <script src="../resources/js/seatBooking.js"></script>
</section>

	<form action="/exconcompl.do" method="POST" class="exconseat">
	<input type="hidden" name="user_id" value="${userId}">
	<input type="hidden" name="excon_seq" value="A1">
	<input type="hidden" name="excon_name" value="전시회 제목">
	<input type="hidden" name="start_date" value="20220922">
	<input type="hidden" name="end_date" value="20220923">
	<input type="hidden" name="place" value="우리집">
	<input type="hidden" name="genre" value="현대미술">
	<c:if test="${userName != null}"><input type="submit" class="btn" value="예약하기" style="margin-top: 100px"/></c:if>
	</form>

    <footer>
    		<jsp:include page="../includes/footer.jsp" flush="false" />
    </footer>
</body>
</html>