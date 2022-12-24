<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>QnA 답변</title>
</head>
<body>
	<h1>답변 등록</h1>
	<input type="hidden" name="productQuestionNumber" value="${productQuestionNumber }">
	<input type="hidden" name="productNumber" value="${productNumber }">
	문의 하신 내용 : <br><textarea rows="10" cols="130" readonly style="resize: none; font-size: 20px;">${Qvo.productQuestionContent }</textarea><br><br>
		답변 작성 : <br><textarea name="questionReply" rows="10" cols="130" style="resize: none;" placeholder="답변 작성 해주세요."></textarea>
		<input type="button" value="답변 등록" id="insertAnswer">
		
	<script type="text/javascript">
		$(document).ready(function() {
			$('#insertAnswer').click(function() {
				console.log(this);
				var productNumber = $('input[name=productNumber]').val();
				var questionReply = $('textarea[name=questionReply]').val();
				var productQuestionNumber = $('input[name=productQuestionNumber]').val();
				console.log("게시글 번호 : " + productQuestionNumber + ", 답변내용 : " + questionReply);
				
				$.ajax({
					type : 'PUT',
					url : '/musinsa/qa/Answer/' + productQuestionNumber,
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'PUT'
					},
					data : JSON.stringify({
						'questionReply' : questionReply
					}),
					success : function(result) {
						console.log(result);
						if(result == 1) {
							alert('답변이 정상적으로 등록되었습니다.');
						 	window.opener.location.href="/musinsa/detail?productNumber=" + productNumber;
							window.close();
						}
					}
				}); // end ajax()
			}); // end insertAnswer.click()
			
		}); // end document()
	</script>
</body>
</html>