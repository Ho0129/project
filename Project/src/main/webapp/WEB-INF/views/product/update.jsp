<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>상품 정보 수정 페이지</title>
</head>
<body>
<h1><a style="text-decoration: none; color: black;" href="http://localhost:8080/musinsa/">MUSINSA</a></h1>
	<h3>상품 정보 수정</h3>
	<form action="update" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="page" value="${page}">
			<input type="hidden" name="productNumber" value="${vo.productNumber}">
			상품명 : <input type="text" name="productName" value="${vo.productName }" required="required">
			<br>
			브랜드 : <input type="text" name="productBrand" placeholder="브랜드" required="required">
			<br>
			상품 가격 : <input type="number" name="productPrice" value="${vo.productPrice }" required="required"> 
			<p>상품 정보 :</p> 
			<textarea rows="20" cols="80" name="productInformation" required="required">${vo.productInformation}</textarea>
			<br>
			사이즈 : 
				S<input type="checkbox" name="size" value="S">
			 	M<input type="checkbox" name="size" value="M">	
			 	L<input type="checkbox" name="size" value="L">	
			 	XL<input type="checkbox" name="size" value="XL">
			<br>
			현재 사진 :
			<br>
			<img src="display?fileName=/${vo.productImg}"> 
			<br>
		  	<input type="file" id="gdsImg" name="files" multiple="multiple" />
			<br>
			카테고리 : 
				상의<input type="radio" name="productMainCategory" value="상의" > 하의<input type="radio" name="productMainCategory" value="하의">
			
			<br>중분류 카테고리 : <div id="productMiddleCategory1"></div>
				
			
			
			<br><br>
			
			
			<input type="submit" value="상품 정보 수정">
			
	</form>
	
	<script type="text/javascript">
		$("input:radio[name=productMainCategory]").click(function() {
			var mainCategory = $("input:radio[name=productMainCategory]:checked").val( );
			console.log(mainCategory);
			if(mainCategory === '상의') {
				var list = '';
				list += 
					'후드<input type="radio" name="productMiddleCategory" value="후드"> 맨투맨<input type="radio" name="productMiddleCategory" value="맨투맨">'
					+ '반팔티<input type="radio" name="productMiddleCategory" value="반팔티"> 긴팔티<input type="radio" name="productMiddleCategory" value="긴팔티">'
					+ '셔츠/블라우스<input type="radio" name="productMiddleCategory" value="셔츠"> 니트/스웨터<input type="radio" name="productMiddleCategory" value="니트/스웨터">';
				$('#productMiddleCategory1').html(list);
			} else {
				var list = '';
				list += 
					'데님팬츠<input type="radio" name="productMiddleCategory" value="데님팬츠"> 코튼팬츠<input type="radio" name="productMiddleCategory" value="코튼팬츠">'
					+ '슬랙스/슈트팬츠<input type="radio" name="productMiddleCategory" value="슬랙스/슈트팬츠"> 트레이닝팬츠<input type="radio" name="productMiddleCategory" value="트레이닝팬츠">'
					+ '숏팬츠<input type="radio" name="productMiddleCategory" value="숏팬츠"> 레깅스<input type="radio" name="productMiddleCategory" value="레깅스">';
				$('#productMiddleCategory1').html(list);
			}
			
		}); // end productMainCategory.click
	</script>	
	
</body>
</html>