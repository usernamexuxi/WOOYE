<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
.MainPageRecommCate{
	margin-top:10%;
}
.MainPageRecommCate table{
	text-align: center;
	margin-top: 100px;
	margin-right: auto;
	width: 100%;
	height: 100%;
}
.MainPageRecommCate td{
	padding: 20px;
	border:none;
}
.MainPageRecommCate tr{
	border-collapse:collapse;
}

.MainPageRecommCate img{
	width:auto;
	height: 250px;
}

.v-line {
  border-left : medium solid #d3d3d3;
  height : 150px;
}
</style>

<section class="MainPageRecommCate">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item">
			    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true" style="font-weight:bold; font-size:2em; color:#aaa;">추천</a>
			  </li>
		  <li class="nav-item" role="presentation">
		    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Artist</button>
		  </li>
		  <li class="nav-item" role="presentation">
		    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Musician</button>
		  </li>
		  <li class="nav-item" role="presentation">
		    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">Exhibition/Concert</button>
		  </li>
		</ul>
		<div class="tab-content" id="myTabContent">
		  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
				<table>
		    		<tr>
				    	<td><a href="/info_submit_gogh.do"><img src="img/images/Gogh1.jpg"></a></td>
				    	<td><div class="v-line"></div></td>
				    	<td><img src="img/images/Gogh2.jpg"></td>
				    	<td><img src="img/images/Gogh3.jpg"></td>
				    </tr>
				    <tr>
				    	<td>빈센트 반 고흐</td>
				    	<td></td>
				    	<td>&lt;별이 빛나는 밤&gt;</td>
				    	<td>&lt;아몬드 꽃 피는 나무&gt;</td>
				    </tr>
		    	</table>
		</div>
		
		  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
			<table>
			    <tr>
			    	<td><a href="/info_submit_hisa.do"><img src="img/images/Hisa.jpg"></a></td>
			    	<td><div class="v-line"></div></td>
			    	<td><iframe width="auto" height="300" src="https://www.youtube.com/embed/l0GN40EL1VU" title="Joe Hisaishi - Summer" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></td>
			    	<td><iframe width="auto" height="300" src="https://www.youtube.com/embed/4iWT_j9uY0k" title="Joe Hisaishi - “Merry-Go-Round of Life (from Howl’s Moving Castle)” – Keyboard Visualizer" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></td>
			    </tr>
			    
			    <tr>
			    	<td>히사이시 조</td>
			    	<td></td>
			    	<td>&lt;summer&gt;</td>
			    	<td>&lt;merry-go-round&gt;</td>
			    </tr>
	    	</table>
		</div>
		  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
		  		<table>
		    		<tr>
				    	<td><img src="img/images/classic1.jpg"></td>
				    	<td><img src="img/images/classic2.jpg"></td>
				    	<td><img src="img/images/poster4.jpg"></td>
				    	<td><img src="img/images/poster7.png"></td>
				    </tr>
				    <tr>
				    	<td>&lt;북한 어린이를 위한 자선 음악회&gt;</td>
				    	<td>&lt;시네 클래식식&gt;</td>
				    	<td>&lt;바다를 품다&gt;</td>
				    	<td>&lt;오롯 그릇&gt;</td>
				    </tr>
		    	</table>
		  </div>
		</div>
</section>