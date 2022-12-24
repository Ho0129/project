<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 게시판 게시물 수정</title>
</head>
<body>

	<h2>게시물 수정</h2>
	<form action ="csqnaUpdate" method="POST">
	<input type="hidden" name="page" value="${page }">
	
	<div>글 번호 : ${vo.boardNumber }</div>
	<input type="hidden" name="boardNumber" value="${vo.boardNumber }">
	
	<div>작성자 : ${vo.userId }</div>
	<input type="hidden" name="userId" value="${vo.userId}">
	
	<div>문의 내용 : ${vo.boardQnAList}
	<select id="selectList" name="boardQnAList">
			<option value="주문" <c:if test="${vo.boardQnAList eq '주문'}">selected="${vo.boardQnAList }"</c:if>>주문</option>
			<option value="결제" <c:if test="${vo.boardQnAList eq '결제'}">selected="${vo.boardQnAList }"</c:if>>결제</option>
			<option value="교환" <c:if test="${vo.boardQnAList eq '교환'}">selected="${vo.boardQnAList }"</c:if>>교환</option>
			<option value="취소" <c:if test="${vo.boardQnAList eq '취소'}">selected="${vo.boardQnAList }"</c:if>>취소</option>
			<option value="배송" <c:if test="${vo.boardQnAList eq '배송'}">selected="${vo.boardQnAList }"</c:if>>배송</option>
	   </select>
	</div>


	<div>제목</div>
	<input type="text" name="boardTitle"  value="${vo.boardTitle }" required>

	<div>문의내용</div>
	<textarea rows="20" cols="120" name="boardContent" required>${vo.boardContent }</textarea>

	<div><input type="submit" onclick="update()" value="수정하기"></div>

	<input type="button" value="이전화면" onclick="location.href='/musinsa/board/csqnaList'">
	
	</form>
	
	<script type="text/javascript">
	
 	function update() {
 		if(!confirm('수정하시겠습니까?')) {
 			return ;
 		} else {
 			
 		}
 	} // end update

	</script>
	
</body>
</html>