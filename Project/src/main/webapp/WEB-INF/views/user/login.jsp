<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style type="text/css">
html, body {
  height: 100%;
  background: #ffffff;
}

#container {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  height: 100%;
}

#loginBox {
  width: 300px;
  text-align: center;
  background-color: #ffffff;
}
.input-form-box {
  border: 0px solid #ff0000;
  display: flex;
  margin-bottom: 5px;
}
.input-form-box > span {
  display: block;
  text-align: left;
  padding-top: 5px;
  min-width: 65px;
}
.button-login-box {
  margin: 10px 0;
}
#loginBoxTitle {
  color:#000000;
  font-weight: bold;
  font-size: 32px;
  text-transform: uppercase;
  padding: 5px;
  margin-bottom: 20px;
  background: linear-gradient(to right, #270a09, #8ca6ce);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
#inputBox {
  margin: 10px;
}

#inputBox button {
  padding: 3px 5px;
}
h3 {
	display : inline-block;
	padding : 0.6em;
}
    </style>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>로그인</title>
</head>
<body>

    <!--  html 전체 영역을 지정하는 container -->
    <div id="container">
      <!--  login 폼 영역을 : loginBox -->
      <div id="loginBox">
        <!-- 로그인 페이지 타이틀 -->
        <div id="loginBoxTitle">Musinsa Login</div>
        <!-- 아이디, 비번, 버튼 박스 -->
        <div id="inputBox">
        <form action="login" method="POST">
        	<div class="input-form-box"><span>아이디 </span><input type="text" name="userId" placeholder="아이디 입력" required="required" autofocus="autofocus" class="form-control"></div>
        	<div class="input-form-box"><span>비밀번호 </span><input type="password" name="userPassword" placeholder="비밀번호 입력"required="required" autofocus="autofocus" class="form-control"></div>
        	<div class="button-login-box">
        		<input type="submit" class="btn btn-dark btn-xs" style="width:100%" value="로그인">
        	</div>
        </form>
        </div>
      </div>
    </div>
    
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>

<script type="text/javascript">
$(document).ready(function(){	
	var url = window.location.search;
	var searchParams = new URLSearchParams(url);
	if(searchParams.get("result") == 0){
		alert("아이디 또는 비밀번호를 확인해주세요.");
		location.href="login";
	} else if (searchParams.get("result") == 1){
		alert("로그인 되었습니다.");
		location.href="/musinsa";
	}
});
	
</script>


</html>