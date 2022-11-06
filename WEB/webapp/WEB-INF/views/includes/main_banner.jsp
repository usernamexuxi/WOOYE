<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
/* Make the image fully responsive */

.carousel-inner img {
    width: 100%;
    height: 100%;
}
</style>
</head>
<body>
<div class="container mt-3">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ul>
            <!-- The slideshow -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <a href="/exconmore2.do"><img src="img/banner01.png" style="float:right"><p>Banner1</p></a>
                </div>
                <div class="carousel-item">
                    <a href="/exconmore.do"><img src="img/banner02.png" style="float:right"><p>Banner2</p></a>
                </div>
                <div class="carousel-item">
                    <a href="/exconmore2.do"><img src="img/banner03.png" style="float:right"><p>Banner3</p></a>
                </div>
                <div class="carousel-item">
                    <a href="/exconmore.do"><img src="img/banner04.png" style="float:right"><p>Banner4</p></a>
                </div>
            </div>
            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#myCarousel" data-slide="next"> 
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
    </div>
</body>
</html>