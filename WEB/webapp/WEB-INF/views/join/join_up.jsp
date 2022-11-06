<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<head>
<title>우리의 예술 : 우예</title>
<style>

body {
  background-image:#34495e;
  min-width: 1250px;
}

.text {
  text-align: center;
  margin-bottom:50px;
  font-weight:bold;
}

.textForm {
  border-bottom: 1px solid #adadad;
  height: 40px;
  margin: 10px;
  padding: 10px 10px;
}


.textArea {
width:100%;
	padding: 10px;
  border:none;
  outline:none;
  color: #636e72;
  font-size:18px;
  background: none;
}

table{
	border:none;
}
.btn {
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:100%;
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

.joinForm{
	width:500px;
	margin:auto;
	padding:50px;
}

.textForm td{
	margin: 40px;
}

.marginTOP{
	margin-top:50px;
	border:none;
}
.shadow-dreamy{
	box-shadow:0 1px 2px rgba(0,0,0,0.07),0 2px 4px rgba(0,0,0,0.07),0 4px 8px rgba(0,0,0,0.07),0 8px 16px rgba(0,0,0,0.07),0 16px 32px rgba(0,0,0,0.07),0 32px 64px rgba(0,0,0,0.07);
	width:600px;
	margin:auto;
}
</style>
</head>

<body> 
<header>
	<jsp:include page="../includes/header.jsp" flush="false" />
</header>

<div class="container marginTOP">                                                               
      <h2 class="text">회원가입</h2>
      <hr style="margin: 0 20px 0 20px">
      
      <div class="shadow-dreamy">
      <form action="/join_submit1.do" method="POST" class="joinForm">
      	<table>
				<tr>
					<td class="textArea" width="70">아이디</td>
					<td align="left"><input name="id" type="text" class="textForm"></td>
				</tr>
				<tr>
					<td class="textArea">비밀번호</td>
					<td align="left"><input name="password" type="password" class="textForm"></td>
				</tr>
				<tr>
					<td class="textArea">이름</td>
					<td align="left"><input name="name" type="text" class="textForm"></td>
				</tr>
				<tr>
					<td class="textArea">닉네임</td>
					<td align="left"><input name="nickname" type="text" class="textForm"></td>
				</tr>
				<tr>
					<td class="textArea">전화번호</td>
					<td align="left"><input name="number" type="text" class="textForm"></td>
				</tr>
				<tr>
					<td class="textArea">생일</td>
					<td align="left"><input name="birth" type="text" maxlength='6' class="textForm"></td>
				</tr>
				<tr>
					<td><hr style="margin-top:50px;"></td>
					<td> <input type="submit" class="btn" value="가입하기" style="margin-top: 50px;  margin-left:30px; color: #fff;"/></td>
				</tr>
			</table>
		</form>
		</div>
</div>

    <footer>
	   	<jsp:include page="../includes/footer.jsp" flush="false" />
	</footer>
</body> 
</html>
    