<%@page import="project.shopping.musinsa.persistence.UserDAO"%>
<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@page import="project.shopping.musinsa.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<title>회원정보 수정 페이지</title>

<style type="text/css">

/* 중복아이디 존재하지 않는경우 */
	.userId_ok{
		color : green;
		display : none;
	}
	
	
/* 중복아이디 존재하는 경우 */
	.userId_no{
		color : red;
		display : none;
	}
	
/* 비밀번호가 일치하는 경우 */
	.userpw_ok{
		color : green;
		display : none;
	}
		
/* 비밀번호가 일치하지 않는경우 */
	.userpw_no{
		color : red;
		display : none;
	}

/* 회원가입 유효성 검사 */

 	.userId_chk {
 		color : red;
 		display : none;
 	}
 	
 	.userPassword_chk {
 	color : red;
 	display : none;
 	}
 	
 	.userName_chk {
 	color : red;
 	display : none;
 	}
 	
 	.userGender_chk {
 	color : red;
 	display : none;
 	}
 	
 	.userHeight_chk {
 	color : red;
 	display : none;
 	}
 	
 	.userWeight_chk {
 	color : red;
 	display : none;
 	}
 	
 	.userAge_chk {
 	color : red;
 	display : none;
 	}
 	
 	.userEmail_chk {
 	color : red;
 	display : none;
 	}
 	
 	.userPhone_chk {
 	color : red;
 	display : none;
 	}
 	
 	.userAddress_chk {
 	color : red;
 	display : none;
 	}
 	
</style>

</head>
	

<body>

	<%
	String userId = (String) session.getAttribute("userId");
	UserVO vo  = (UserVO) request.getAttribute("vo");
	if (userId == null) {
	%>
		out.print("<script>alert("로그인 해주세요."); location.href='/musinsa/user/login'</script>")
	<%
	} else {
	%>
	

	<!-- 회원 정보 가져오기  -->
	<h2><%=userId %>님, 정보 수정 페이지</h2>
 	<form id="update" action="update" method="POST">
 	
	<div>아이디</div>
	 <input type="text" id="userId" name="userId" value=<%=userId %> readonly> <!-- 아이디는 수정 못함 -->
	
	 <div>비밀번호</div>
	<input type="password" name="userPassword" id="userPasswordChk1" value="${vo.userPassword}" placeholder="비밀번호 입력" required="required"><br>
	비밀번호 재입력<br><input type="password" id="userPasswordChk2" value="${vo.userPassword}" placeholder="비밀번호 확인" required="required"><br>
	<div class="userpw_ok">비밀번호가 일치합니다.</div>
	<div class="userpw_no">비밀번호가 일치하지 않습니다.</div>
	<div class="userPassword_chk">비밀번호를 입력해주세요.</div>
	
	<div>이름</div>
	<input type="text" name="userName" id="userName" value="${vo.userName}" placeholder="이름 입력" required="required"><br><br>
	<div class="userName_chk">이름을 입력해주세요.</div>
	
	<div>성별</div>
	 남자<input type="radio" name="userGender" id="userGender" value="man"  checked=<c:if test="${userGender == 'man'}">checked</c:if>>
	 여자<input type="radio" name="userGender" id="userGender" value="woman" checked=<c:if test="${userGender == 'woman'}">checked</c:if>><br><br>
	 <div class="userGender_chk">성별을 선택해주세요.</div>

	<div>키</div>
	<input type="text" name="userHeight" id="userHeight" placeholder="키 입력" value="${vo.userHeight}" required="required">cm<br>
	<div class="userHeight_chk">키를 입력해주세요.</div>
	
	<div>몸무게</div>
	<input type="text" name="userWeight" id="userWeight" placeholder="몸무게 입력" value="${vo.userWeight}" required="required">kg<br>
	<div class="userWeight_chk">몸무게를 입력해주세요.</div>
	
	<div>나이</div>
	<input type="number" name="userAge" id="userAge" placeholder="나이 입력" value="${vo.userAge}" required="required"><br>
	<div class="userAge_chk">나이를 입력해주세요.</div>
	
	<div>이메일</div>
	<input type="email" name="userEmail" id="userEmail" placeholder="이메일 입력" value="${vo.userEmail}" required="required"><br>
	<div class="userEmail_chk">이메일을 입력해주세요.</div>
	<div>연락처</div>
	 <input type="text" name="userPhone"  id="userPhone" placeholder="연락처 입력" value="${vo.userPhone}" required="required"><br>
	<div class="userPhone_chk">연락처를 입력해주세요.</div>
	
	<div>주소</div>
		<input type="text" name="userAddress01" id="sample6_postcode"  value=${vo.userAddress01 } placeholder="우편번호">
		<input type="button" name="userAddress" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" name="userAddress02" id="sample6_address" value="${vo.userAddress02}" placeholder="주소"/><br>
		<input type="text" name="userAddress03" id="sample6_detailAddress" value="${vo.userAddress03}" placeholder="상세주소"/>
	  	<input type="text" name="userAddress04" id="sample6_extraAddress" value="${vo.userAddress04}" placeholder="참고항목"/>	
	  	<div class="userAddress_chk">주소를 입력해주세요.</div>
	  	<br><br>
		<input type="submit" id="updateBtn" value="수정하기" class="update_button">
		<input type="button" value="이전화면" onclick="location.href='/musinsa/user/userResult'">
</form>
	<%
	}
	%>
    	<br><button id="deleteId">회원탈퇴</button> <!-- form안에 있으면 update 같이되서 밖에 빼줘야함! -->
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

 <script type="text/javascript">  
	$(document).ready(function(){	
		var url = window.location.search;
		var searchParams = new URLSearchParams(url);
		if(searchParams.get("result") == 1){
			alert("수정이 완료되었습니다.");
			location.href="userResult?userId=" + $("#userId").val();
		}
		
		$("#deleteId").on("click", function(){
			if(!confirm('회원탈퇴 하시겠습니까?')){
				return;
			} else {
				location.href="deleteId?userId=" + $("#userId").val();
			}
		});
	});
	
	// 주소 API
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    } // end sample6_execDaumPostcode()

	
	
    // 비밀번호 확인  
 	$('#userPasswordChk2').blur(function(){ // userPassword 칸을 벗어나면 실행
 		passwordChk();
 		console.log("비밀번호체크 테스트");
 	}); // end function 
 	
   	function passwordChk(){
 	   if($('#userPasswordChk1').val() != $('#userPasswordChk2').val()){
 		  $('.userpw_no').css("display","inline-block");
 		  $('.userpw_ok').css("display", "none");
 	 	
 	   } else {
 			$('.userpw_ok').css("display", "inline-block");
 			$('.userpw_no').css("display","none");
 	   }
 	} // end passwordChk
 	
	// 공백 검사
	$('#userName').blur(function(){  
        if($("#userName").val() != "") {
    		$('.userName_chk').css("display", "none");
        }
 	}); 
 	
	$('#userHeight').blur(function(){  
        if($("#userHeight").val() != "") {
    		$('.userHeight_chk').css("display", "none");
        }
 	});
	
	$('#userWeight').blur(function(){  
        if($("#userWeight").val() != "") {
    		$('.userWeight_chk').css("display", "none");
        }
 	});
	
	$('#userAge').blur(function(){  
        if($("#userAge").val() != "") {
    		$('.userAge_chk').css("display", "none");
        }
 	});
	
	$('#userEmail').blur(function(){  
        if($("#userEmail").val() != "") {
    		$('.userEmail_chk').css("display", "none");
        }
 	});
	$('#userPhone').blur(function(){  
        if($("#userPhone").val() != "") {
    		$('.userPhone_chk').css("display", "none");
        }
 	});
	
	$('#sample6_postcode').blur(function(){  
        if($("#sample6_postcode").val() != "") {
    		$('.userAddress_chk').css("display", "none");
        }
 	});
	
	$('#sample6_address').blur(function(){  
        if($("#sample6_address").val() != "") {
    		$('.userAddress_chk').css("display", "none");
        }
 	});
	
	$('#sample6_detailAddress').blur(function(){  
        if($("#sample6_detailAddress").val() != "") {
    		$('.userAddress_chk').css("display", "none");
        }
 	});
	
	// 비밀번호 일치 후 회원가입
 	$('.update_button').on("click", function(){
 		if($('#userPasswordChk1').val() != $('#userPasswordChk2').val()){
 			alert("비밀번호가 일치하지 않습니다.");
 			$('#userPasswordChk2').focus();
 			return false; // 비밀번호가 일치하지 않으면 그대로 
 		} else {
 		}
 	});


 </script>
   
</html>