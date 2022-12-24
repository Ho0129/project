<%@page import="project.shopping.musinsa.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<title>관리자</title>
</head>
<body>

	<%
	String userId = (String) session.getAttribute("userId");
	UserVO vo  = (UserVO) request.getAttribute("vo");
	
	if (userId == null) {
	%>
		out.print("<script>alert("로그인 해주세요"); location.href='login'</script>")
	<%
	} else {
	
	%>
	
    <h1>관리자 페이지 입니다.</h1>
    <input type="button" value="공지사항" onclick="location.href='/musinsa/board/verifyList?userId=<%=userId%>&page=${pageMaker.criteria.page }'">
	<input type="button" value="사용자 문의" onclick="location.href='/musinsa/board/csqnaList?userId=<%=userId%>'">
	<br>
	<br>
	<input type="button" value="메인화면" onclick="location.href='/musinsa'">
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

	<%
	}
	%>
	

</body>
</html>