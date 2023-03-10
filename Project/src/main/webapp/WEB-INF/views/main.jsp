<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
href="https://fonts.googleapis.com/icon?family=Material+Icons">

<meta charset="UTF-8">
<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
<style>
.dropdown {
	list-style-type: none;
	float: left;
	margin-left: auto;
	margin-right: auto;
}

.productUl {
	list-style-type: none;
	float: left;
	margin-left: auto;
	margin-right: auto;
}

.bd-navbar {
  position: sticky;
  top: 0;
  z-index: 1071;
  min-height: 4rem;
  box-shadow: 0 0.5rem 1rem rgba(0,0,0,.05), inset 0 -1px 0 rgba(0,0,0,.1);
}
.bd-sidebar {
  position: sticky;
  top: 4rem;
  z-index: 1000;
  height: calc(100vh - 4rem);
  background: #eee;
  border-right: 1px solid rgba(0,0,0,.1);
  max-width: 220px;
  display: flex;
  padding: 0;
  overflow-y: hidden;
  flex-direction: column;
}
.bd-sidebar-body {
  height: 100%;
  overflow-y: auto;
  display: block;
}
.bd-sidebar-body .nav {
  display: block;
}
.bd-sidebar-body .nav>li>a {
  display: block;
  padding: .25rem 1.5rem;
  font-size: 90%;
}
.bd-sidebar-footer {
  padding: 1rem;
  background: #ddd;
}
</style>

<title>MUSINSA</title>

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script> -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> -->
<% 

	String loginChk = (String) session.getAttribute("loginChk");
	String userId= (String) session.getAttribute("userId");
	if(loginChk != null && loginChk.equals("Chk")){
		session.setAttribute("loginChk", "");
%>
<% 		
	}
%>

</head>
<body>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>

<header class="navbar navbar-expand navbar-dark bg-dark bd-navbar">
  <a class="navbar-brand" style="text-decoration: none; color: white;" href="http://localhost:8080/musinsa/">MUSINSA</a> 
  <c:if test="${not empty sessionScope.userId}">
			<a style="color: white;">??????????????? <%=userId%>???</a>
			</c:if>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
   	 <c:if test="${empty sessionScope.userId}">
    	<li id="login" class="login_button"><a class="nav-link" href="/musinsa/user/login">?????????</a></li>
 	    <li id="join" class="join_button"><a class="nav-link" href="/musinsa/user/join">????????????</a></li>
 	    <li><a class="nav-link" id="show"  style="cursor: pointer;">????????? ????????????</a></li>
 	    
    </c:if>
     
	<c:if test="${not empty sessionScope.userId}">
		<li id ="userResult" class="mypage_button"><a class="nav-link" href="/musinsa/user/userResult?userId='<%=userId%>'">???????????????</a></li>	
		<li id="logout"><a class="nav-link" href="/musinsa/user/logout">????????????</a></li>	
		<li><a class="nav-link" href="http://localhost:8080/musinsa/payment">?????? ??????</a></li>
		<li><a class="nav-link" href="http://localhost:8080/musinsa/cart">????????????</a></li>
		<li><a class="nav-link"  href="http://localhost:8080/musinsa/like">?????????</a></li>		
	</c:if>
	
	<c:if test="${userId eq 'admin'}">
		<li id="verify" class="verify_button"><a class="nav-link" href="/musinsa/user/verify">?????????</a></li>
		<li><a class="nav-link" href="../musinsa/product/list">?????? ??????</a></li> 
	</c:if>
	
      <li class="nav-item"><a class="nav-link" href="#"><!-- 2??? ?????? --></a></li>
    </ul>
  </div>
<!-- ???????????? ?????? -->
  	<div class="search_by_name" >
			<input type="text" id="nameSearch" placeholder="?????????" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="true">
			<ul id="ab" class="dropdown" aria-labelledby="nameSearch" style="position: relative; z-index:2;">
  			</ul>
	</div>
</header>

<div class="container-fluid">
  <div class="row flex-nowrap">
    <div class="col-3 bd-sidebar">
      <div class="bd-sidebar-body">
        <details>
        	<summary>??????</summary>
        		<ul>
        			<li><a onclick="middle(this)" style="cursor: pointer;">??????</a></li>
        			<li><a onclick="middle(this)" style="cursor: pointer;">?????????</a></li>
        			<li><a onclick="middle(this)" style="cursor: pointer;">?????????</a></li>
        			<li><a onclick="middle(this)" style="cursor: pointer;">?????????</a></li>
        			<li><a onclick="middle(this)" style="cursor: pointer;">??????&amp;????????????</a></li>
        			<li><a onclick="middle(this)" style="cursor: pointer;">??????&amp;?????????</a></li>
        		</ul>
        	
        	
        </details>
        
        <details>
        	<summary>??????</summary>
        		<ul id="">
        			<li><a onclick="middle(this)" style="cursor: pointer;">????????????</a></li>
        			<li><a onclick="middle(this)" style="cursor: pointer;">????????????</a></li>
        			<li><a onclick="middle(this)" style="cursor: pointer;">?????????&amp;????????????</a></li>
        			<li><a onclick="middle(this)" style="cursor: pointer;">??????????????????</a></li>
        			<li><a onclick="middle(this)" style="cursor: pointer;">?????????</a></li>
        			<li><a onclick="middle(this)" style="cursor: pointer;">?????????</a></li>
        		</ul>
        	
        	
        </details>

        <br>
      </div>
      <div class='bd-sidebar-footer'>
        	Musinsa
      </div>
    </div>
    

    
    
    <main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
      
	     <div class="slide_div_wrap">
				<div class="slide_div">
					<div>
						<a>
							<img src="https://image.msscdn.net/images/img/2022111016554100000094448.jpg" width="800" height="400" style="margin: auto;">
						</a>
					</div>
					<div>
						<a>
							<img src="https://image.msscdn.net/images/img/2022110909043700000045327.jpg" width="800" height="400" style="margin: auto;">
						</a>
					</div>
					<div>
						<a>
							<img src="https://cdn.apnews.kr/news/photo/202010/20201025_1_bodyimg_1301291.JPG" width="800" height="400" style="margin: auto;">
						</a>
					</div>	
					<div>
						<a>
							<img src="https://www.kocca.kr/n_content/vol24/img/new/special_people2/people2_7.jpg" width="800" height="400" style="margin: auto;">
						</a>
					</div>	
				</div>	
			</div>
     <!-- ??????????????? ?????? --> 
      <div id = "mainProductList">
      <c:forEach var="vo" items="${list}">
	<div class="productList" style="margin: auto;">
		<ul class="productUl">
			<li  style="margin:auto; border: 1px solid grey; width: 150px; height: 280px; text-align: center;    
			display: table-cell; vertical-align: middle;" >
				<a href="detail?productNumber=${vo.productNumber }"> <!-- ????????? ??????????????? ?????? -->
					<!-- <div class="photo"> -->
						<img alt="" src="product/display?fileName=/${vo.productImg}" style="width: 125px; height: 150px;"></a>
					<!-- </div> -->
					<!-- <div class="information"> -->
						<p>
						<a>${vo.productName }</a> <br>
						<a>${vo.productBrand }</a> <br>
						<a>${vo.productPrice }???</a> <br>
						<a>${vo.productSize }</a> <br>
						<a>?????? : ${vo.productGrade }</a><br>
						<a><i class="fas fa-heart"></i> ${vo.productGood }</a> 
						</p>
					<!-- </div> -->
			</li>
		</ul>
	</div>
	</c:forEach>
	</div>
	<!-- ??????????????? ??? -->
    </main>
  </div>
</div>


<!-- ???????????? -->
<script type="text/javascript">
	$('#logout .nav-link').on('click', function() {
		if(!confirm('???????????? ???????????????????')) {
			return false;
		} else {
			alert('?????????????????? ???????????????!');
		}
	});
</script>

<script type="text/javascript">
      $.noConflict(); // ?????? ?????? ??????
</script>

  <!--   <script type="text/javascript">
		$('#topUl').on('click', function(e) {
			var middleCategory = document.getElementById('middleCategory').text;
			console.log(middleCategory);
		});
    </script> -->

	<script type="text/javascript">
	function middle(e) {
		var middleCategory = e.text;
		console.log(middleCategory);
		var url = 'category/' +middleCategory;
		console.log(url);
		$.ajax({
			type : 'get',
			url : 'category/' + middleCategory,
			data : JSON.stringify(middleCategory),
			success : function(data) {
				console.log(data);
			}
		}) // end ajax
	};
	</script>

<script type="text/javascript">
		$(document).ready(function() {
			$('#nameSearch').on('keyup change', function() {
				
				var txt = document.getElementById('nameSearch').value;
				console.log(txt);
				
				$.ajax({
					type : 'get',
					url : 'search/' + txt,
					data : JSON.stringify(txt),
					success : function(data) {
						console.log("data" + data);
						var list = '';
						$(data).each(function() {
							console.log(this);
							list +=  '<li><a class="dropdown-item" href="detail?productNumber='+this.productNumber+'">'
							+ '<img src="http://localhost:8080/musinsa/product/display?fileName=/' 
									+ this.productImg 
									+'" width="30px" height="60px">' 
									+ this.productName+' ' 
									+ this.productPrice 
									+ '???' 
									+'</a></li>'
							;
							
						}) // end each
						$('#ab').html(list);
						
					} // end function(data)
					
					
				}) // end ajax
				
				
			}); // end nameSerach.keyup
			
			
			$(".slide_div").slick(
			{
					dots: true,
					autoplay : true,
					autoplaySpeed: 3000
			}		
			);
		});
		
		$('#show').click(function() {
			// ??? ??????
			var width = 700;
			var height = 550;
			
			// pop ?????? ?????? ????????? ??????
			var left = (window.screen.width / 2) - (width/2); // ????????? ???????????? ??????????????? ????????????
			var top = (window.screen.height / 4);
			
			// ????????? ?????? ??????
			var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
			
			// ????????? ????????? url
			const url = "user/nonUserPayment";
			
			// ????????? url ???  window ?????? ???????????? ???????????? ??????.
			
			window.open(url, "hello", windowStatus);
		})
		
		
	</script>
	
</body>

<% 
	if(userId != null){
		
%>

<script type="text/javascript">
 	$('#login').hide();
	$('#logout').show();	
	$('#join').hide();
	
</script>

<% 		
	}
%>
</html>