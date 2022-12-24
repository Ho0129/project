<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<title>${vo.boardTitle }</title>
<style type="text/css">
.detail {
	text-align: center;
}
</style>
</head>
<%
	String sessionId = (String) session.getAttribute("userId");
%>
<body>
<div class="detail">
	<h2>1:1문의 내역</h2>
	<br><br>
	
	<div> 번호  : ${vo.boardNumber }</div>
	
	<div> 작성자 : ${vo.userId } </div>
	
	<div> 문의유형  : ${vo.boardQnAList }</div>
	
	<div> 제목 : ${vo.boardTitle }</div>
	
	<div> 작성일 : ${vo.boardDateCreated }</div>
	
	<div>
    <textarea style="resize: none;" rows="20" cols="100" readonly>${vo.boardContent }</textarea>
   	</div>
   	
   	<div id="replies"></div>
   	<!-- 댓글 -->
   	
   	<br><br><br><br><br>
   	<c:if test="${userId eq 'admin' }">
   		<div>
   			<textarea style="resize: none;" rows="5" cols="100" id="replyText"></textarea>
    		<button id="btn_insert">댓글 등록</button>
   		</div>
   	</c:if>
   	
   	<!-- 받아서 쓰기 위해  -->
   	<input type="hidden" id="boardNumber" value="${vo.boardNumber }">
   	<input type="hidden" id="userId" value="${sessionScope.userId }">
   	
   
   <a href="userList?page=${page }&userId=${vo.userId }">
   <input type="button" value= "글 목록"></a>
   
   <c:if test="${userId ne 'admin'}">
  		<a href="csqnaUpdate?boardNumber=${vo.boardNumber }&page=${page }">
  		<input type="button" value="글 수정"></a>
   	
   		<form action="csqnaDelete" method="POST">
  			<input type="hidden" name="boardNumber" value="${vo.boardNumber }">
   			<input type="submit" value="글 삭제">
   		</form>
	</c:if>
	
	<input type="button" value="메인화면" onclick="location.href='/musinsa'">
   </div>
   <script type="text/javascript">
   $(document).ready(function(){
	   getAllReplies();
	   
   	$(document).on('click', '#btn_insert', function() {
   		var replyContent = $('textarea[id=replyText]').val();
   		var boardNumber = $('#boardNumber').val();
   		var userId = $('#userId').val();
   		 console.log(replyContent + boardNumber + userId);
   		var obj ={
				'boardNumber' : boardNumber,
				'userId' : userId,
				'replyContent' : replyContent
   		};
   		// $. ajax로 송수신
   		$.ajax({
   			url : '../boardreplies',
   			type : 'POST',
   			headers : {
                'Content-Type' : 'application/json', 
                'X-HTTP-Method-Override' : 'POST'	
   			},
   			data : JSON.stringify(obj), // JSON으로 변환
   			success : function(result, status) {
   				console.log(result)
   				console.log(status)
   				if(result == 1) {
   					alert('댓글 입력 성공');
   					getAllReplies();
   				}
   			}
   		}); // end ajax()
   	}); // end on btn_insert 
   	
	// 전체 댓글 가져오기 
	function getAllReplies() {
		var boardNumber = $('#boardNumber').val();
		console.log(boardNumber);
		
		var url = '../boardreplies/all/' + boardNumber;
		console.log(url);
		
		$.getJSON(
		 url,
		 function(data){
			 console.log('test');
			 console.log(data);
			 var userId = $('#userId').val();
			 var list='';
			 
			 $(data).each(function(){
				 console.log(this);
				 
				 var replyDateCreated = new Date(this.replyDateCreated);
				 var disabled = '';
				 var readonly= '';
				 if(userId == this.userId) {
					 disabled = '';
					 readonly = '';
				 } else {
					 disabled = 'disabled';
					 readonly = 'readonly';
				 }
				 
				 list += '<div class="reply_item">'
                     + '<pre>'
                     + '<input type="hidden" id="replyNumber" value="'+ this.replyNumber +'"/>'
                     + '<input type="hidden" id="userId" value="'+ this.userId +'"/>'
                     + this.userId 
                     + '&nbsp;&nbsp;' // 공백
                     + '<input type="text" ' + readonly + ' id="replyContent" value="'+ this.replyContent +'" />'
                     + '&nbsp;&nbsp'
                     + replyDateCreated
                     + '&nbsp;&nbsp;'
                     + '<button class="btn_update" ' + disabled + '>수정</button>'
                     + '&nbsp;&nbsp;'
                     + '<button class="btn_delete" ' + disabled + '>삭제</button>'
                     + '</pre>'
                     + '</div>';
               }); // end each()
               $('#replies').html(list);
            }
         ); // end getJSON
      } // end getAllReplies  
      
      // 댓글 수정
      $('#replies').on('click', '.reply_item .btn_update', function(){
    	  console.log(this);
    	  
    	  var replyNumber = $(this).prevAll('#replyNumber').val();
    	  var replyContent = $(this).prevAll('#replyContent').val();
    	  
    	  console.log("선택된 댓글 번호 : " + replyNumber + ", 댓글 내용 : " + replyContent);
    	  
    	  $.ajax({
    		  type : 'PUT',
    		  url : '../boardreplies/' + replyNumber,
    		  headers : {
                  'Content-Type' : 'application/json', 
                  'X-HTTP-Method-Override' : 'PUT'
               },
               data : JSON.stringify({'replyContent' : replyContent}),
               success : function(result) {
            	   console.log(result);
            	   if(result == 1) {
            		   alert('댓글 수정 성공');
            		   getAllReplies();
            	   }
               }
    		  
    	  }); // end ajax
      }); // end update
      
      // 댓글 삭제
            $('#replies').on('click', '.reply_item .btn_delete', function(){
            console.log(this);
            
            var boardNumber = $('#boardNumber').val();
            var replyNumber = $(this).prevAll('#replyNumber').val();
            
            // ajax 요청
            $.ajax({
               type : 'DELETE',
               url : '../boardreplies/' + replyNumber,
               headers : {
                   'Content-Type' : 'application/json', 
                   'X-HTTP-Method-Override' : 'DELETE'
                }, 
               	data : JSON.stringify({
               		'boardNumber' : boardNumber
               	}), 
               success : function(result) {
                  console.log(result);
                  if(result == 1) {
                     alert('댓글 삭제 성공!');
                     getAllReplies();
                  }
               }
            }); // end ajax()
         });  // end replies.on()    
         
   });
   </script>
   	
   
</body>
</html>