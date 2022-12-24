<%@page import="project.shopping.musinsa.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 페이지</title>
</head>
<body>

<!-- 회원 정보 띄우기, 수정 버튼, 로그아웃버튼, 회원탈퇴버튼 -->

	<%
	String userId = (String) session.getAttribute("userId");
	
	if (userId == null) {
	%>
		out.print("<script>alert("로그인 해주세요."); location.href='/musinsa/user/login'</script>")
	<%
	} else {
	%>
	
	<script type="text/javascript">
		
	</script>
	
	
	<h1><%=userId %>님, 환영합니다!</h1>
	
	<!-- GET 방식으로 userid 전송 -->
<%-- 	<button onclick="location.href='select.do?userid=<%=userId %>'">회원정보</button> --%>
	<button onclick="update()"><a href="/musinsa/user/update">회원수정</button>
	<button onclick="logout()"><a href="/musinsa/user/logout">로그아웃</button>
	<button onclick="delete()"><a href="/musinsa/user/delete">회원탈퇴</button>
	
	
	

	<script type="text/javascript">
	// 회원 수정 버튼
	function update(){
		if(!confirm('정보를 수정  하시겠습니까?')) {
			return;
		} else {
			location.href="update.do?userid=<%=userId %>";
		}
	}
	
	}
	
	
	// 로그아웃 버튼
	function logout() {
		if(!confirm('로그아웃 하시겠습니까?')) {
			return;
		} else {
			location.href="logout.do?userid=<%=userId %>";
		}
	}
	
	// 회원 탈퇴 버튼
	function delete(){
		if(!confirm('탈퇴 하시겠습니까?')) {
			return;
		} else {
			location.href="delete.do?userid=<%=userId %>";
		}
	}
	
	
	
	
	</script>
	
	<%} %>
	

</body>
</html>