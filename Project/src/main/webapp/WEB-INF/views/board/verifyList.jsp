<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
table, th, td {
	border-style: solid;
	border-width: 1px;
	text-align: center;
}

ul {
	list-style-type: none;
}

li {
	display: inline-block;
}
</style>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<%
	String userId = (String) session.getAttribute("userId");
%>

<body>

	<h1>공지사항</h1>

	<hr>
	<table>
		<thead>
			<tr>
				<th style="width: 50px">번호</th>
				<th style="width: 70px">문의유형</th>
				<th style="width: 300px">제목</th>
				<th style="width: 100px">작성자</th>
				<th style="width: 100px">작성일</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="vo" items="${userList }">
				<tr>
					<td>${vo.boardNumber }</td>
					<td>${vo.boardQnAList }</td>
					<td><a href="csqnaDetail?boardNumber=${vo.boardNumber}&page=${pageMaker.criteria.page }">${vo.boardTitle}</a> 
					<!-- 댓글 눌러도 페이지 유지-->
					</td>
					
					<td>${vo.userId }</td>
					<fmt:formatDate value="${vo.boardDateCreated }"
					pattern="yyyy-MM-dd HH:mm:ss" var="boardDateCreated"/>
					<td>${boardDateCreated }</td>
				</tr>
				
			</c:forEach>
		</tbody>
	</table>
	
	<input type="hidden" value="${vo.userId }">

	<ul>
		<c:if test="${pageMaker.isHasPrev()}">
			<li><a href="verifyList?userId=${vo.userId }&page=${pageMaker.getStartPageNo() - 1}">이전</a></li>
		</c:if>
	
		<c:forEach var="i" begin="${pageMaker.startPageNo }" end="${pageMaker.endPageNo }">
			<li><a href="verifyList?userId=${vo.userId }&page=${i}">${i }</a></li>
		</c:forEach>
		
		<c:if test="${pageMaker.isHasNext()}">
			<li><a href="verifyList?userId=${vo.userId }&page=${pageMaker.getEndPageNo() + 1}">다음</a></li>
		</c:if>
	</ul>
	
	<br><br>
	<a href="csqnaRegister"><input type="button" value="글 작성"></a>
	
	<!-- BoardController -> registerPOST()에서 보낸 데이터 저장 -->
	<input type="hidden" id="insertAlert" value="${insert_result }">
	<form action="verifyList" method="GET">
    <input type="hidden" name="userId" value="${userId }">
    
    <input type="button" value="이전화면" onclick="location.href='/musinsa/user/verify'">
    
   </form>
   	
	
	<script type="text/javascript">
		var result = $('#insertAlert').val();
		if(result == 'success') {
			alert('새 글 작성 성공!');
		}
		
		
	</script>


