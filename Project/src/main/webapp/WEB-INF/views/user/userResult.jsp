<%@page import="project.shopping.musinsa.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<!-- 회원 정보 띄우기, 수정 버튼, 로그아웃버튼, 회원탈퇴버튼 -->

	<%
	String userId = (String) session.getAttribute("userId");
	UserVO vo  = (UserVO) request.getAttribute("vo");
	%>
	
	<h1><%=userId %>님, 환영합니다!</h1>
	
	<input type="button" value="정보수정" onclick="location.href='/musinsa/user/update?userId=<%=userId%>'">
	<c:if test="${userId ne 'admin'}">
	<input type="button" value="1:1 문의" onclick="location.href='/musinsa/board/userList?userId=<%=userId%>&page=${pageMaker.criteria.page }'">
	</c:if>
	<input type="button" value="메인화면" onclick="location.href='/musinsa'">
	
	
	<br><br>
	<br><br>
	<input type="button" value="로그아웃" onclick="logout()">
	
<!-- 	<script type="text/javascript"> -->
 	<script type="text/javascript">
 	
 	function logout() {
 		if(!confirm('로그아웃 하시겠습니까?')) {
 			return;
 		} else {
			location.href="logout?userid=<%=userId%>"; 
 		}
 	} // end logout

 	</script>

	
</body>
</html>