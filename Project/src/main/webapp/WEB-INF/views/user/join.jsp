<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<title>회원 가입</title>

<style>

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

<form action="join" method="POST">

	<h1>회원 가입</h1>
	
	<div>아이디</div>
	 <input type="text" name="userId" id ="userId" class="userId" placeholder="아이디 입력" required="required">
		<div class="userId_ok">사용 가능한 아이디 입니다.</div>
		<div class="userId_no">사용하고 있는 아이디 입니다.</div>
		<div class="userId_chk">아이디를 입력해주세요.</div>
		
	 <div>비밀번호</div>
	<input type="password" name="userPassword" id="userPasswordChk1" class="userPassword" placeholder="비밀번호 입력" required="required"><br>
	비밀번호 재입력<br><input type="password"  id="userPasswordChk2" class="userPassword" placeholder="비밀번호 확인" required="required">
	<div class="userpw_ok">비밀번호가 일치합니다.</div>
	<div class="userpw_no">비밀번호가 일치하지 않습니다.</div>
	<div class="userPassword_chk">비밀번호를 입력해주세요.</div>
	
	<div>이름</div>
	<input type="text" name="userName" id="userName" class="userName" placeholder="이름 입력" required="required"><br><br>
	<div class="userName_chk">이름을 입력해주세요.</div>
	
	<div>성별</div>
	 남자<input type="radio" name="userGender" id="userGender" class="userGender" value="man" required="required" checked>
	 여자<input type="radio" name="userGender" id="userGender" class="userGender" value="woman" required="required"><br><br>
	<div class="userGender_chk">성별을 선택해주세요.</div>
	
	<div>키</div>
	<input type="text" name="userHeight" id="userHeight" class="userHeight" placeholder="키 입력" required="required">cm<br>
	<div class="userHeight_chk">키를 입력해주세요.</div>
	
	<div>몸무게</div>
	<input type="text" name="userWeight" id="userWeight" class="userWeight" placeholder="몸무게 입력" required="required">kg<br>
	<div class="userWeight_chk">몸무게를 입력해주세요.</div>
	
	<div>나이</div>
	<input type="number" name="userAge" id="userAge" class="userAge" placeholder="나이 입력" required="required"><br>
	<div class="userAge_chk">나이를 입력해주세요.</div>
	
	<div>이메일</div>
	<input type="email" name="userEmail" id="userEmail" class="userEmail" placeholder="이메일 입력" required="required"><br>
	<div class="userEmail_chk">이메일을 입력해주세요.</div>
	
	<div>연락처</div>
	 <input type="text" name="userPhone"  id="userPhone" class="userPhone" placeholder="연락처 입력" required="required"><br>
	<div class="userPhone_chk">연락처를 입력해주세요.</div>
	
	<div>주소</div>
		<input type="text" name="userAddress01"  class="userAddress" id="sample6_postcode"  placeholder="우편번호" required="required">
		<input type="button" name="userAddress" class="userAddress" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" required="required"><br>
		<input type="text" name="userAddress02" class="userAddress" id="sample6_address" placeholder="주소" required="required"><br>
		<input type="text" name="userAddress03" class="userAddress" id="sample6_detailAddress" placeholder="상세주소"required="required">
	    <input type="text" name="userAddress04" class="userAddress" id="sample6_extraAddress" placeholder="참고항목">	
	    <div class="userAddress_chk">주소를 입력해주세요.</div>
	    <br><br>
	
 	<input type="submit" id="joinChk" value="가입하기" class="join_button">
 	
	<input type="button" value="메인화면" onclick="location.href='/musinsa'">
	
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">


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

    
    
    
    // 아이디 중복검사(아이디 중복일 경우 = 1, 중복이 아닐 경우 = 0)
    $(document).ready(function(){
    	$('input[name=userId]').blur(function(){ // userId 칸을 벗어나면 userIdChk 실행
    	    function userIdChk(){
    	        var userId = $.trim($('input[name=userId]').val()); // // .userId에 입력되는 값
    	        var data = {'userId' : userId} // // '컨트롤에 넘길 데이터 이름' : 데이터(.userId에 입력되는 값)
    	        //-> RESTController로 이동 // 컨트롤러->서비스->dao->xml->db조회 
    	        if(userId != ""){
    	        	$('.userId_chk').css("display", "none");
    	        $.ajax({
    	        		type : "post",
    	        		url : "join/userIdChk", //  가야되는 컨트롤러 url 
    	        		headers : {
    	                    'Content-Type' : 'application/json',
    	                    'X-HTTP-Method-Override' : 'POST'
    	                 },
    	        		data : JSON.stringify(data),
    	        		success : function(result){ // db조회 성공 후 리턴값이 돌아오면 
    	        		if(result == 1) { 
    	        			$('.userId_no').css("display","inline-block");
    	        			$('.userId_ok').css("display","none");
    	        		} else {
    	        			$('.userId_ok').css("display", "inline-block");
    	        			$('.userId_no').css("display", "none");
    	        			} 
    	        		}	// end success
    	        	  }); // end ajax
    	        	} // end if
    	        }; // end userIdChk
    		userIdChk(); 
    		console.log("keyup 테스트");	
    	});// end function
    	
    	
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
 	$('.join_button').on("click", function(){
 		if($('#userPasswordChk1').val() != $('#userPasswordChk2').val()){
 			alert("비밀번호가 일치하지 않습니다.");
 			$('#userPasswordChk2').focus();
 			return false; // 비밀번호가 일치하지 않으면 그대로 
 		} else {
 	//		alert("회원가입 완료 되었습니다.");
 		}
 	});
   
   // 회원가입완료 예외 체크  
   	   var userIdChk = false;
	   var userPasswordChk = false;
	   var userNameChk = false;
	   var userGenderChk = false;
	   var userHeightChk = false;
	   var userWeightChk = false;
	   var userAgeChk = false;
	   var userEmailChk = false;
	   var userPhoneChk = false;
	   var userAddressChk = false;

	   $(".join_button").click(function(){
		   var userId = $.trim($('.userId').val());
		   var userPassword = $.trim($('.userPassword').val());
		   var userName = $.trim($('.userName').val());
		   var userHeight = $.trim($('.userHeight').val());
		   var userWeight = $.trim($('.userWeight').val());
		   var userAge = $.trim($('.userAge').val());
		   var userEmail = $.trim($('.userEmail').val());
		   var userPhone = $.trim($('.userPhone').val());
		   var userAddress01 = $.trim($('#sample6_postcode').val());
		   var userAddress02 = $.trim($('#sample6_address').val());
		   var userAddress03 = $.trim($('#sample6_detailAddress').val());	
		   
		   // 회원가입 공백 검사
		   if(userId == ""){
			   $('.userId_chk').css("display", "block");
			   userIdChk = false;
			   
		   } else if(userPassword == "") {
			   $('.userPassword_chk').css("display", "block");
			   userPasswordChk = false;
		   } else if (userName == ""){
			   $('.userName_chk').css("display", "block");
			   userNameChk = false; 
			   
		   } else if (userHeight == "") {
	            $('.userHeight_chk').css('display','block');
	            userHeightChk = false;
			   
		   } else if (userWeight == "") {
	            $('.userWeight_chk').css('display','block');
	            userWeightChk = false;
			   
		   } else if (userAge == "") {
	            $('.userAge_chk').css('display','block');
	            userAgeChk = false;
			   
		   } else if (userEmail == "") {
	            $('.userEmail_chk').css('display','block');
	            userEmailChk = false;
		   } else if (userPhone == "") {
		         $('.userPhone_chk').css('display','block');
		         userPhoneChk = false;
			   
		   } else if (userAddress01 == "" || userAddress02 == "" || userAddress03 == "" ) {
		         $('.userAddress_chk').css('display','block');
		         userAddressChk = false;
		   }// end join_button
			
		   
		   // 칸마다 값이 있을 때 텍스트 없애기
		   if(userId != ""){
			   userIdChk = true;
			   $('.userId_chk').css("display", "none");
  
		   }
		   if(userPassword != ""){
			   userPasswordChk = true;
			   $('.userPassword_chk').css("display", "none");
			   
		   }
		   if(userName != ""){
			   userNameChk = true;
			   $('.userName_chk').css("display", "none");
			   
		   }
		   if(userHeight != ""){
	           userHeightChk = true;
	           $('.userHeight_chk').css('display', 'none');
			   
		   }
		   if(userWeight != ""){
		       userWeightChk = true;
		       $('.userWeight_chk').css('display', 'none');
			   
		   }
		   if(userAge != ""){
	           userAgeChk = true;
	           $('.userAge_chk').css('display', 'none');
			   
		   }
		   if(userEmail != ""){
	           userEmailChk = true;
	           $('.userEmail_chk').css('display', 'none');
			   
		   }
		   if(userPhone != ""){
	           userPhoneChk = true;
	           $('.userPhone_chk').css('display', 'none');
			   
		   }
		   if(userAddress01 != "" && userAddress02 != "" && userAddress03 != "" ){
		       userAddressChk = true;
		       $('.userAddress_chk').css('display', 'none');  
		   }
		   
		   // 유효검사 완료시 회원가입 
		    if(userIdChk&&userPasswordChk&&userNameChk&&userHeightChk&&userWeightChk&&userAgeChk&&userEmailChk&&userPhoneChk&&userAddressChk ){
		    	return true;       
		    } else {		    	
		    	return false;
		    }
		   
	   }); // end joinChk
   }); // end document()
    
</script>

</body>
</html>