<%@page import="project.shopping.musinsa.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<% 
	String userId= (String) session.getAttribute("userId");
%>
<style type="text/css">
.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border-radius: 5px;
}

.pagination a:hover:not(.active) {
  background-color: #ddd;
  border-radius: 5px;
}

th {
	font-weight: normal;
}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<meta charset="UTF-8">

<title>상품상세설명</title>
</head>

<body>
	<h1><a style="text-decoration: none; color: black;" href="http://localhost:8080/musinsa/">MUSINSA</a></h1>
	<h3>상품 정보</h3>
		<a href="http://localhost:8080/musinsa/payment"><input type="button" value="결제내역"></a>
		<a href="http://localhost:8080/musinsa/cart"><input type="button" value="장바구니"></a>
		<a href="http://localhost:8080/musinsa/like"><input type="button" value="좋아요"></a>
		
		<hr>
	<form action="cart/register" method="POST">
	
	<div id=detail style="margin: auto;">
		<input hidden="" style="border:none" type="number" id="productNumber" name="productNumber" value="${vo.productNumber }" readonly="readonly">  
		상품 이름 : <input style="border:none" type="text" id="productName" name="productName" value="${vo.productName }" readonly="readonly">
		
		<p id="price">상품 가격 : ${vo.productPrice }</p>
		<p>상품 카테고리 : ${vo.productMainCategory }</p>
		<p>상품 사이즈 : 		
		<c:set var = "productSize" value="${vo.productSize}"/>
		<c:if test="${fn:contains(productSize, 'S')}">
			S<input type="radio" name="size" value="S" required="required">
		</c:if>
		
		<c:if test="${fn:contains(productSize, 'M')}">
			M<input type="radio" name="size" value="M" required="required">
		</c:if>
		
		<c:if test="${fn:contains(productSize, 'L')}">
			L<input type="radio" name="size" value="L" required="required">
		</c:if>
		
		<c:if test="${fn:contains(productSize, 'XL')}">
			XL<input type="radio" name="size" value="XL" required="required">
		</c:if></p>
		<p>수량 : <input id="cartAmount" type="number" name="cartAmount" value=1 required="required"></p>
		주문 금액 : <a id="payPrice">${vo.productPrice }</a>
		<p id="productGood"><i class="fas fa-heart"></i>  ${vo.productGood }</p>
		<p>상품 평점 : ${vo.productGrade }</p>
		<p>상품 정보 : ${vo.productInformation }</p>
		<img id="productImg" src="http://localhost:8080/musinsa/product/display?fileName=/${vo.productImg}" >
		<fmt:formatDate value="${vo.productDateRegister}"
					pattern="yyyy-MM-dd HH:mm:ss" var="productDateRegister"/>
		<p>상품 등록일 : ${productDateRegister }</p>
		<c:if test="${not empty sessionScope.userId}">
			<input type="submit" value="add to cart">	
		</c:if>
		
	
	</div>
	</form>
		<br><a href="/musinsa"><input type="button" value="상품 목록"></a>
		<button id="btn_good">like</button>
		<button id="btn_buy">buy</button>
		
		<br>
		<br>
		
<details>
    <summary id="">상세 정보 펼치기</summary>
    <c:forEach var="img" items="${imgList}">
		<div>
			<img src="http://localhost:8080/musinsa/product/display?fileName=/${img}" >
		</div>
		</c:forEach>
</details>
	
		
		
	
	<script type="text/javascript">
	$(document).ready(function () {
		
		$('#cartAmount').blur(function(){
			var amount = document.getElementById('cartAmount').value;
			if(amount < 0){
				alert('0보다 작게가 되겠어?');
				document.getElementById('cartAmount').value = 0;
				$("#payPrice").text(0);
			} else {
				var price = '${vo.productPrice}';
				var payPrice = amount * price;
				$("#payPrice").text(payPrice);
			}
		});
		
		$('#btn_good').click(function () {
			var userId = '<%=userId%>';
			if(userId === 'null') {
				alert('로그인이 필요한 서비스 입니다.');
				return;
			}
			var productNumber = ${vo.productNumber};
			var obj = {
					'userId' : userId,
					'productNumber' : productNumber
			};
			console.log(obj);
			
			$.ajax({
				type : 'POST',
				url : 'details',
				headers : {
					'content-type' : 'application/json',
	                'x-HTTP-Method-Override' : 'POST'
				},
				data : JSON.stringify(obj),
				success : function (result, status) {
					console.log(result);
					console.log(status);
					
					if(status == 'success') {
					location.reload();
					}
				}
				
			}); // end ajax()
			
		}); // end btn_good.click()
		
// 비회원 간단가입 팝업
		function showPopUp() {
			// 창 크기
			var width = 547;
			var height = 700;
			
			// pop 화면 기준 가운데 정렬
			var left = (window.screen.width / 2) - (width/2);
			var top = (window.screen.height / 4);
			
			// 윈도우 속성 지정
			var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
			
			// 연결을 원하는 url
			const url = "user/simpleJoin";
			
			// 등록된 url 및  window 속성 기준으로 팝업창을 연다.
			
			window.open(url, "hello", windowStatus);
			
		}
		
// 구매버튼
		$('#btn_buy').click(function(){
			var userId = '<%=userId%>';
			if(userId === 'null') {
				if(!confirm('비회원으로 주문하시겠습니까?')) {
					location.href = 'user/login';
					return;
				} else {
					showPopUp();
					return;
				}
			}
			var IMP = window.IMP;
			var payPrice = document.getElementById('payPrice').innerText;
			if($('input:radio[name=size]').is(':checked') == false){
				alert('사이즈를 선택해주세요');
				return;
			}
			IMP.init('imp80165535');
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid: "payment_" + new Date().getTime(), // 상점에서 관리하는 주문 번호를 전달
			    name : '${vo.productName }',
			    amount : payPrice,
			    buyer_name : '<%=userId%>',
			    
			}, function(rsp) { // callback 로직
				console.log(rsp);
				if(rsp.success) {
					var msg = '결제가 완료되었습니다.';
					var userId = '<%=userId%>';
					var productNumber = '${vo.productNumber}';
					var paymentPrice = document.getElementById('payPrice').innerText;
					var paymentAmount = document.getElementById('cartAmount').value;
					var paymentProductSize = document.querySelector('input[name="size"]:checked').value;
					var obj = {
							'userId' : userId,
							'productNumber' : productNumber,
							'paymentPrice' : paymentPrice,
							'paymentAmount' : paymentAmount,
							'paymentProductSize' : paymentProductSize
					};
					$.ajax({
						type : 'POST',
						url : 'payment/register',
						headers : {
							'content-type' : 'application/json',
			                'x-HTTP-Method-Override' : 'POST'
						},
						data : JSON.stringify(obj),
						success : function (result, status) {
							if(status == 'success') {
								  location.href = 'payment';
							}
						}
					}) // end ajax
					
				} else {
					var msg = '결제에 실패했습니다.';
				} 
				alert(msg);
			});
			
			
			
		}); // end btn_buy.click()
		
		$('#btn_cart').click(function () {
			var userId = <%=userId%>;
			var productNumber = ${vo.productNumber};
			var cartAmount = document.getElementById(cartAmount).innerText;
			var cartSize = document.querySelector('input[name="size"]:checked').value;
			var obj = {
					'userId' : userId,
					'productNumber' : productNumber,
					'cartAmount' : cartAmount,
					'cartSize' : cartSize,
			};
			
			$.ajax({
				type : 'POST',
				url : 'cart/register',
				headers : {
					'content-type' : 'application/json',
	                'x-HTTP-Method-Override' : 'POST'
				},
				data : JSON.stringify(obj),
				success : function (result, status) {
					
					if(status == 'success') {
					location.reload();
					}
				}
				
			}); // end ajax()
		
	}); // end btn_good.click()
	
		
		
	}); // end document
		
	</script>
	
<div style="display: grid; place-items: center; min-height: 40vh;">	
<h2 id="Qna">Q &amp; A</h2>
   <table id="contents">
      <colgroup>
         <col width="7%">
         <col width="8%">
         <col width="15%">
         <col width="auto">
         <col width="12%">
         <col width="13%">
         <col width="10%">
         <c:if test="${sessionScope.userId eq 'admin' }">
         	<col width="7%">
         </c:if>
      </colgroup>
      <thead style="background-color: #d3d3d3; color: black;">
         <tr>
            <th scope="col">번호</th>
            <th scope="col">답변여부</th>
            <th scope="col">구분</th>
            <th scope="col">내용</th>
            <th scope="col">작성자</th>
            <th scope="col">등록일자</th>
            <th scope="col">변경</th>
            <c:if test="${sessionScope.userId eq 'admin' }">
            	<th scope="col">답변 등록</th>
            </c:if>
         </tr>
      </thead>
      <tbody id="question">
         <c:forEach var="Qvo" items="${list }">
            <tr id="questionText">
               <td id="questionNumber">${Qvo.productQuestionNumber }</td>
               <td id="questionWhether"><strong>${Qvo.productQuestionWhether }</strong></td>
               <td id="questionType">${Qvo.productQuestionType }</td>
               <c:choose>
               	<c:when test="${sessionScope.userId eq Qvo.userId }">
					<td id="title">
                  		<button style="border: none; background-color: white; font-size: 15px;" type="button">${Qvo.productQuestionTitle }▼</button>
               		</td>
               	</c:when>
               	<c:when test="${sessionScope.userId eq 'admin' }">
					<td id="title">
                  		<button style="border: none; background-color: white; font-size: 15px;" type="button">${Qvo.productQuestionTitle }▼</button>
               		</td>
               	</c:when>
               	<c:otherwise>
               		<td id="title">${Qvo.productQuestionType }&nbsp;QnA&nbsp;&nbsp;<img src="resources/Image/Lock.png" width="20px" height="20px"></td>
               	</c:otherwise>
               </c:choose>
               <td id="questionUserId">${Qvo.userId }</td>
               <fmt:formatDate value="${Qvo.productQuestionDateCreated }"
               pattern="yyyy-MM-dd" var="productQuestionDateCreated"/>
               <td id="questionDate">${productQuestionDateCreated }</td>
               <td><c:if test="${sessionScope.userId eq Qvo.userId }">
               	<button onclick="window.open('qaUpdate?productQuestionNumber=${Qvo.productQuestionNumber }&&productNumber=${vo.productNumber }', '수정', 
               	'scrollbars=yes, resizable=no, width=600, height=960, left=600px, top=0');return false">수정</button> 
               </c:if>
               <c:if test="${sessionScope.userId ne Qvo.userId }">
				<button onclick="window.open('qaUpdate?productQuestionNumber=${Qvo.productQuestionNumber }&&productNumber=${vo.productNumber }', '수정', 
				'scrollbars=yes, resizable=no, width=600, height=960, left=600px, top=0');return false" disabled>수정</button>               	
               </c:if>
               <input type="button" class="deleteBtn" value="삭제"></td>
               <c:if test="${sessionScope.userId eq 'admin' }">
					<td>
					<button onclick="window.open('Answer?productQuestionNumber=${Qvo.productQuestionNumber}&&productNumber=${vo.productNumber }', '답변', 
					'scrollbars=yes, resizable=no, width=1000, height=600, left=600px, top=0');return false">답변작성</button>
					</td>
               </c:if>
            </tr>
            <tr id="conts" style="display: none;">
               <td colspan="8"><h4>문의내용</h4><p>${Qvo.productQuestionContent }</p>
               <c:if test="${not empty Qvo.questionReply }">
               <hr>
               <div class="questionReply" style="background-color: #f3eae8; color: black;">
               <h4 style="text-align: left;">답변</h4>
               		<p style="text-align: left;">운영자 : ${Qvo.questionReply }</p>
               	 </div>
               	 </c:if></td>
            </tr>
         </c:forEach>
      </tbody>
   </table>

   <!-- 페이지 처리 -->
   <ul class="pagination">
      <c:if test="${pageMaker.isHasPrev() }">
         <li><a href="detail?page=${pageMaker.startPageNo -1 }&&productNumber=${vo.productNumber }" class="active">&laquo;</a></li>
      </c:if>
      <c:forEach var="i" begin="${pageMaker.startPageNo }" end="${pageMaker.endPageNo }">
         <li><a href="detail?page=${i }&&productNumber=${vo.productNumber }">${i }</a></li>
      </c:forEach>
      <c:if test="${pageMaker.isHasNext() }">
         <li><a href="detail?page=${pageMaker.endPageNo + 1 }&&productNumber=${vo.productNumber }">&raquo;</a></li>
      </c:if>
   </ul>
</div>
   <br>
   
   <!-- 작성 버튼 함수 추가 -->
   <c:if test="${empty sessionScope.userId }">
   		<p style="margin-left: 60%;">* 문의글 작성은 로그인이 필요한 서비스 입니다. *<a href="/musinsa/user/login"><button>로그인</button></a></p>
   		
   </c:if>
   <c:if test="${not empty sessionScope.userId }">
   		<button onclick="btnInsert()" style="margin-left: 70%;">문의글 작성</button>
   </c:if>
   
   <!-- Review -->
   <h2 id="reviewAll">구매후기</h2>
   <div class="review" style="border: 1px solid black; width: 70%; margin-left: 15%;">
   <div id="REVIEW">
	<h1>REVIEW</h1>
	<hr>
	</div>
      <!-- Review 리스트 -->
      <div class="review-list-wrap" id="reviewlist">
            <div class="review-list">
               	<div class="review-content">
              	 <c:forEach var="rvo" items="${reviewList }" varStatus = "status">
                  	<!-- 리뷰 틀 만들기 -->
                  	<input type="hidden" value="${rvo.productNumber }">
                  	<div id="reviewId"><p>아이디 : ${rvo.userId }</p></div>
                  	<input type="hidden" id="rvoId" value="${rvo.userId }">
                  	<div id="userGender"><p>성별 : ${rvo.userGender }</p></div>
                  	<div id="userHeight"><p>키 : ${rvo.uvo.userHeight }cm</p></div>
                  	<div id="userWeight"><p>몸무게 : ${rvo.uvo.userWeight }kg</p></div>
                  	<div id="reviewGrade"><p>평점 : ${rvo.reviewGrade }</p></div>
                  	<div class="showReview">리뷰 : ${rvo.reviewContent }</div><br>
                  	<button class="reviewDelete" value="${rvo.reviewNumber }" style="margin-left: 70%;">삭제</button><br>
                  	<p style="display: inline; width: 90%; height: 100%; border: none; background-color: white; font-size: 18px;">------------------댓글 목록▼</p><br>
                  	<div class="replies${rvo.reviewNumber }"></div> <!-- 댓글이 등록되는 div -->
                  	<c:if test="${not empty sessionScope.userId }">
                  		<div class="test">
                  			<textarea class="replyText" style="width: 90%; height: 100%; resize: none;" placeholder="20자  이내로 입력해주세요."></textarea>
                  			<input type="hidden" class="reviewNo" value="${rvo.reviewNumber }">
                  			<button class="replyAdd">댓글 입력</button>
                  		</div>
                  	</c:if>
                  	<c:if test="${empty sessionScope.userId }">
                  		* 댓글 작성은 로그인이 필요한 서비스 입니다. *&nbsp;<a href="/musinsa/user/login"><button>로그인</button></a>
                  	</c:if>
                  	<hr>
                  </c:forEach> 
                 <c:if test="${not empty sessionScope.userId }">
                 <div>
                 <h3>리뷰 작성&gt;ㅁ&lt;</h3>
                  <p>평점 : 
                  	<select name="reviewGrade">
                  		<option value="5">5</option>
                  		<option value="4">4</option>
                  		<option value="3">3</option>
                  		<option value="2">2</option>
                  		<option value="1">1</option>
                  	</select></p>
					<textarea style="width: 90%; height: 100%; resize: none;" placeholder="10자 이내로 입력해주세요." id="reviewContent"></textarea>
                  	<button style="margin-left: 90%;" id="reviewBtn">리뷰 작성</button><br>
               	</div>
               </c:if>
               <c:if test="${empty sessionScope.userId }">
               		<p style="margin-left: 60%;">* 리뷰작성 및 댓글 작성은 로그인이 필요한 서비스 입니다. *&nbsp;<a href="/musinsa/user/login"><button>로그인</button></a></p>
               </c:if>
            </div>
      </div>
   </div>
   </div>

   <!-- 받아서 쓰기 위함 -->
   <input type="hidden" name="sessionId" value="${sessionScope.userId }">
   <input type="hidden" name="uvoAge" value="${sessionScope.UserVO.userAge }">
   <input type="hidden" name="uvoGender" value="${sessionScope.UserVO.userGender }">
   
	<!-- 리뷰 작성 -->
	   <script type="text/javascript">
	   $(document).ready(function() {
	      $('#reviewBtn').click(function() {
	         // 이클립스 댓글 바로 보여주는거 활용해서 ajax 
	         var userId = $('input[name=sessionId]').val();
	         var productNumber = ${vo.productNumber}
	         var reviewContent = $('#reviewContent').val();
	         var reviewGrade = $('select[name=reviewGrade]').val();
	         var userAge = $('input[name=uvoAge]').val();
	         var userGender = $('input[name=uvoGender]').val();
	            console.log(userId);
	            console.log(productNumber);
	            console.log(reviewContent);
	            console.log(reviewGrade);
	            console.log(userAge);
	            console.log(userGender);
	            
	         if(reviewContent == '') {
	        	 alert('작성 후 등록해주세요.');
	        	 return;
	         } else {
		         var obj = {
		               'userId' : userId,
		               'productNumber' : productNumber,
		               'reviewContent' : reviewContent,
		               'reviewGrade' : reviewGrade,
		               'userAge' : userAge,
		               'userGender' : userGender
		         };
		         console.log(obj);
		         
		         // $.ajax로 송수신
		         $.ajax({
		            type : 'POST',
		            url : 'reviews',
		            headers : {
		               'Content-Type' : 'application/json',
		               'X-HTTP-Method-Override' : 'POST'
		            },
		            data : JSON.stringify(obj),
		            success : function(result, status) {
		               console.log(result);
		               console.log(status);
		               if(result == 1) {
		                  alert('정상적으로 등록 되었습니다.')
		                  location.reload();
		               }
		            }
		         }); // end ajax()
	         }
	      }); // end reviewBtn.click()
	   }); // end document()
   
   // 리뷰 삭제
   $(document).on('click', '.review-content .reviewDelete', function(e) {
	      var reviewNumber = this.value;
	      console.log(reviewNumber);
	      var sessionId = $('input[name=sessionId]').val();
	      var userId = $(this).prevAll('#rvoId').val();
	      console.log("로그인한 아이디 : " + sessionId + ", 글 작성자 : " + userId);
	       if(sessionId != userId) {
	         alert('본인이 작성한 글만 삭제 가능합니다.');
	         return;
	      } else {
	         $.ajax({
	            type : 'DELETE',
	            url : 'reviews/' + reviewNumber,
	            headers : {
	               'Content-Type' : 'application/json',
	               'X-HTTP-Method-Override' : 'DELETE'
	            },
	            data : JSON.stringify({
	               'reviewNumber' : reviewNumber
	            }) ,
	            success : function(result) {
	               console.log(result);
	               if(result == 1) {
	                  alert('리뷰 삭제 완료되었습니다.');
	                  location.reload();
	               }
	            }
	         }); // end ajax()
	      } 
	   }); // end document.on()
   </script>
      
   <!-- 댓글 -->
   <script type="text/javascript">
      $(document).ready(function() {
         var reviewListNumber = ${reviewListNumber};
         console.log(reviewListNumber);
         for(var i = 0; i < reviewListNumber.length; i++) {
            console.log(i);
            getAllReplies(reviewListNumber[i]);
         }
         console.log('test');
         
         var status = false;
         $('.replyAdd').click(function() {
            var replyContent = $(this).siblings('.replyText').val();
            var reviewNumber = $(this).siblings('input[class=reviewNo]').val();
            console.log(reviewNumber);
            console.log("댓글 내용 = " + replyContent + ", 리뷰번호 = " + reviewNumber);
            
            if(replyContent == '') {
               alert('작성 후 등록해주세요');
               return;
            } else {
               var objParams = {
                     reviewNumber : $(this).siblings('input[class=reviewNo]').val(),
                     replyContent : $(this).siblings('.replyText').val().replace('/n', '<br>'),
                     userId : $('input[name=sessionId]').val()
               };
               console.log(objParams);
                  
               $.ajax({
                  type : "POST",
                  url : "replies",
                  headers : {
                     "Content-Type" : "application/json",
                     "X-HTTP-Method-Override" : "POST"
                  },
                 data : JSON.stringify(objParams),
                  success : function(rvo) {
                     if(rvo.code != "OK") {
                        alert(rvo.message);
                        return false;
                     } else {
                        alert("댓글 등록 성공");
                        getAllReplies(reviewNumber);
                     }
                  },
                  error : function(request, status, error) {
                     console.log("AJAX_ERROR");
                  }
               }); // end ajax
            }
            
         }); // end replyAdd.click()
               
         function getAllReplies(index) {
            var reviewNumber = index;
            console.log('콘솔 위치 확인');
            console.log(reviewNumber);
               var url = 'replies/all/' + reviewNumber;
                  
                $.getJSON(
                      url,
                      function(data) {
                         console.log(data);
                         var userSession = $('input[name=sessionId]').val();
                         var list = '';
                         reviewNumber;
                            
                         $(data).each(function() {
                            console.log(this);
                            var replyDateCreated = new Date(this.replyDateCreated);
                            var disabled = '';
                            var readonly = '';
                            if(userSession == this.userId) {
                               disabled = '';
                               readonly = '';
                            } else {
                               disabled = 'disabled';
                               readonly = 'readonly';
                            }
                               
                            list += '<div class="reply_item" style="width: 100%; height: 100%;">'
                               + '<pre>'
                               + '<input type="hidden" id="reviewNumber" value="' + this.reviewNumber + '" >'
                               + '<input type="hidden" id="replyNumber" value="' + this.replyNumber + '" />'
                               + '<input type="hidden" id="userSession" value="' + userSession + '" />'
                               + '<input type="hidden" id="userId" value="' + this.userId + '" />'
                               + this.userId
                               + '&nbsp;&nbsp;'
                               + '<input type="text" id="replyContent" value="' + this.replyContent + '" ' + readonly + ' />'
                               + '&nbsp;&nbsp;'
                               + replyDateCreated
                               + '&nbsp;&nbsp;'
                               + '<button class="btn_update" ' + disabled + '>수정</button>'
                               + '&nbsp;&nbsp;'
                               + '<button class="btn_delete" ' + disabled + '>삭제</button>'
                               + '<br>'
                               + '<br>'
                               + '<div class="re-reply"></div>'
                               + '&nbsp;&nbsp;'
                               + '&nbsp;&nbsp;'
                               + '&nbsp;&nbsp;'
                               + '<br>'
                               + '<button class="btn_reReplyShow">답글 확인</button>'
                               + '</pre>'
                               + '</div>'; 
                         }); // end data.each()
                         $('.replies' + reviewNumber).html(list);
                
                       } // end function()
                     ); // end getJSON()
               
            } // end getAllReplies()
            
            // 대댓글 등록
            $('.review-content').on('click', '.reply_item .btn_re-reply', function(a) {
               console.log('a test');
               var replyNumber = this.value;
               console.log(replyNumber);
               var reReplyContent = $(this).prevAll('#re-replyContent').val();
               var sessionId = $('input[name=sessionId]').val();
               var reviewNumber = $(this).prevAll('#reviewNumber').val();
               console.log("선택한 댓글의 게시글 번호 : " + replyNumber + ", 선택한 댓글 번호 : " + replyNumber + ", 대댓글 내용 : " + reReplyContent + ", 작성자 : " + sessionId);
               if(sessionId == '') {
                  alert('로그인이 필요한 서비스입니다.');
                  location.href = "/musinsa/user/login";
               } else if(reReplyContent == '') {
                  alert('공백은 등록 할 수 없습니다.')
                  return;
               } else {
                  var obj = {
                     replyNumber : this.value,
                     reReplyContent : $(this).prevAll('#re-replyContent').val(),
                     userId : $('input[name=sessionId]').val(),
                  }
                  console.log(obj);
                  
                  $.ajax({
                     type : 'POST',
                     url : 're-replies',
                     headers : {
                        'Content-Type' : 'application/json',
                        'X-HTTP-Method-Override' : 'POST'
                     },
                     data : JSON.stringify(obj),
                     success : function(result, status) {
                        console.log(result);
                        console.log(status);
                        if(result == 1) {
                           alert('대댓글이 정상적으로 등록 되었습니다.')
                           console.log('요기');
                        }
                     }
                     
                  }); // end ajax()
               }
               
            }); // end review-content.on()
            
         // 대댓글 불러오기
           $(document).on('click' , '.reply_item .btn_reReplyShow', function(e){
               var replyNumber = $(this).prevAll('#replyNumber').val();
               var userId = $(this).prevAll('#userId').val();
               var sessionId = $('input[name=sessionId]').val();
               
               var url = 're-replies/all/' + replyNumber;
               var target = $(this);
               console.log('test43123');
               console.log($(this).prevAll('#replyNumber').val());
               
               $.getJSON(
                  url,
                  function(data) {
                     var reReplyBtnCreate = '';
                     var text = '';
                   console.log(data);
                   reReplyBtnCreate += '대댓글 작성 : <input type="text" id="re-replyContent">'
                    + '&nbsp;&nbsp;'
                    + '&nbsp;&nbsp;'
                     + '<button class="btn_re-reply" value="' + replyNumber + '" style="background-color: black; color: white;">대댓글 작성</button>'
                     + '&nbsp;&nbsp;'
                     + '&nbsp;&nbsp;'
                     + '&nbsp;&nbsp;'
                     + '<br>'
                     + '&nbsp;&nbsp;'
                     + '&nbsp;&nbsp;';
                     
                   $(data).each(function(index) {
                      console.log(this);
                      console.log(index);
                      if(sessionId == data[index].userId) {
                         disabled = '';
                         readonly = '';
                      } else {
                         disabled = 'disabled';
                         readonly = 'readonly';
                      }
                         
                  text += '<div id="reText">' 
                        + '&nbsp;&nbsp;&nbsp;&nbsp;ㄴ' 
                        + '&nbsp;&nbsp;' 
                        + data[index].userId 
                        + ' : ' 
                        + '<input type="text" value="' + data[index].reReplyContent + '" ' + readonly + '>'
                        + '&nbsp;&nbsp;'
                        + '&nbsp;&nbsp;'
                        + '<button class="deleteRe" value="' + this.reReplyNumber + '" ' + disabled + '>삭제</button>'
                        + '<br>'
                        + '<br>'
                        + '</div>';
                      
                   }); // end data.each()
                   target.siblings('.re-reply').html('<div>' + reReplyBtnCreate + '</div>');
                   if(data.length != 0) {
                      target.siblings('.re-reply').append(text);
                   }
                } // end function()
             ); // end getJSON()
         
            }) // end document.on()
            
            // 특정 div 새로고침
            function reloadDiv() {
               $('#reText').load(location.href+'#reText');
            }
            
            // 대댓글 삭제
            $('.review-content').on('click', '.reply_item .re-reply #reText .deleteRe', function(e) {
               var reReplyNumber = this.value;
               console.log(reReplyNumber);
               
               $.ajax({
                  type : 'DELETE',
                  url : 're-replies/' + reReplyNumber,
                  headers : {
                     'Content-Type' : 'application/json',
                     'X-HTTP-Method-Override' : 'DELETE'
                  },
                  data : JSON.stringify({
                     'reReplyNumber' : reReplyNumber
                  }),
                  success : function(result) {
                     if(result == 1) {
                        alert('대댓글이 삭제 되었습니다.');
                        reloadDiv();
                     }
                  }
               }); // end ajax()
            });
         
            // 댓글 수정
            $(document).on('click', '.reply_item .btn_update', function() {
               var replyNumber = $(this).prevAll('#replyNumber').val();
               var replyContent = $(this).prevAll('#replyContent').val();
               var reviewNumber = $(this).prevAll('#reviewNumber').val();
               console.log("선택한 댓글 번호 : " + replyNumber + ", 댓글 내용 : " + replyContent + ", 리뷰글번호 : " + reviewNumber);
               
               $.ajax({
                  type : 'PUT',
                  url : 'replies/' + replyNumber,
                  headers : {
                     'Content-Type' : 'application/json',
                     'X-HTTP-Method-Override' : 'PUT'
                  },
                  data : JSON.stringify({'replyContent' : replyContent}),
                  success : function(result) {
                     console.log(result);
                     if(result == 1) {
                        alert('댓글이 수정되었습니다.');
                        getAllReplies(reviewNumber);
                     }
                  }
               }); // end ajax()
            }); // end document.on()
            
            // 댓글 삭제
            $(document).on('click', '.reply_item .btn_delete', function() {
               var replyNumber = $(this).prevAll("#replyNumber").val();
               var reviewNumber = $(this).prevAll('#reviewNumber').val();
               console.log("선택된 댓글 번호 : " + replyNumber);
               
               $.ajax({
                  type : 'DELETE',
                  url : 'replies/' + replyNumber,
                  headers : {
                     'Content-Type' : 'application/json',
                     'X-HTTP-Method-Override' : 'DELETE'
                  },
                  data : JSON.stringify({
                     'replyNumber' : replyNumber
                  }),
                  success : function(result) {
                     console.log(result);
                     if(result == 1) {
                        alert('댓글 삭제 완료되었습니다.');
                        getAllReplies(reviewNumber);
                     }
                  }
               }); // end ajax()
            }); // end document.on()
            
     }); // end document()
   </script>

   
   <!-- 제목 클릭시 내용이 뜨게 하는 script문 -->
   <script type="text/javascript">
      $(document).ready(function() {
         $('#contents #title button').on('click' ,function() {
            var currentRow = $(this).closest('tr');
            var detail = currentRow.next('tr');
            
            if(detail.is(":visible")) {
               detail.hide();
            } else {
               detail.show();
            }
         });
      }); // end document()
      
      // btnInsert() 클릭시 팝업창 
      function btnInsert() {
         var w = window.open('qaregister?productNumber=${vo.productNumber}', '문의글 작성', 'target=_blank, scrollbars=yes, resizable=no, width=600, height=960, left=600px');
         var productNumber = ${vo.productNumber};
         console.log(productNumber);
         $.ajax({
            url : 'qaregister?productNumber=' + productNumber,
            method : 'GET',
            dataType : 'jsp',
            success : eventSuccess
         });
         function eventSuccess(data) {
            w.location.href = 'qaregister?productNumber=' + ${vo.productNumber};
         }
      } // end btnInsert()
      
      $('.deleteBtn').click(function() {
            var userId = $('input[name=sessionId]').val();
            if(userId == '') {
               alert('로그인 후 이용 가능한 서비스 입니다.');
               location.href = "/musinsa/user/login";
            } else if(confirm('정말 삭제 하시겠습니까?')) {
              var str = '';
               var deleteBtn = $(this);
         
                  var tr = deleteBtn.parent().parent();
               var td = tr.children();
         
               console.log("row : " + tr.text());
         
               var no = td.eq(0).text();
               console.log(no);
            
               var no1 = td.eq(4).text();
               console.log(no1);
               
               if(userId != no1) {
                  alert('본인이 작성한 글만 삭제가 가능합니다.')
                  return;
               }
               
               $.ajax({
           	 	type : 'DELETE',
				url : '/musinsa/qa/' + no,
                headers : {
                     'Content-Type' : 'application/json',
                     'X-HTTP-Method-Override' : 'DELETE'
                  },
                  data : JSON.stringify({
                     'productQuestionNumber' : no
                  }),
                  success : function(result) {
                     console.log(result);
                     alert('정상적으로 삭제 되었습니다.')
                     location.reload();
                  }
               
               }); // end ajax()
            } 
         
      }); // end deleteBtn.click()
   </script>

	
</body>
</html>





























