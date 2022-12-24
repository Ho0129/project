<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>댓글</title>
</head>
<body>
   <div style="text-align: center;">
      <input type="text" id="userId" >
      <input type="text" id="replyContent">
      <button id="btn_add">작성</button>
   </div>
   <div style="text-align: center;">
      <div id="replies"></div>
   </div>
   <div>
      <br><br><br><br><br><br><br><br><br><br><br><br><br>
   </div>

	<script type="text/javascript">
	$(docment).ready(function () {
		getAllReplies();
		
		// 댓글 등록
		$('#btn_add').click(function(){
			var boardNumber = $('boardNumber').val();
			var userId = $('userId').val();
			var replyContent = $('replyContent').val();
			var obj = {
					'boardNumber' : boardNumber,
					'userId' : userId,
					'replyContent' : replyContent
			};
			console.log(obj);

			$.ajax({
				type : 'POST',
				url : 'replies',
				hearders : {
		            'Content-Type' : 'application/json', 
		            'X-HTTP-Method-Override' : 'POST'	
				},
				
				data : JSON.stringify(obj),
				success : function(result, status) {
					console.log(result);
					console.log(status)
					
					if(result == 1){
						alert('댓글 입력 성공');
						getAllReplies();
						
						}
					}
			});
		}); // end ajax
	}); // end click
	
	// 전체 댓글 가져오기 
	function getAllReplies () {
		var boardNumber = $(boardNumber).val();
		
		var url = 'replies/all/' + boardNumber;
		
		$.getJSON(
		 url,
		 function(data){
			 console.log(data);
			 var userId = $('#userId').val();
			 var list='';
			 
			 $(data).each(function(){
				 console.log(this);
				 
				 var replyDateCreadted = new Date(this.replyDateCreated);
				 var disabled = '';
				 var readonly= '';
				 if(userId == this.userId) {
					 disabled = '';
					 readonly = '';
				 }
				 
				 list += '<div class=".reply_item">'
                     + '<pre>'
                     + '<input type="hidden" id="replyNumber" value="'+ this.replyNumber +'"/>'
                     + '<input type="hidden" id="userId" value="'+ this.userId +'"/>'
                     + this.userId 
                     + '&nbsp;&nbsp;' // 공백
                     + '<input type="text" ' + readonly + ' id="replyContent" value="'+ this.replyContent +'" />'
                     + '&nbsp;&nbsp'
                     + replyDateCreated
                     + '&nbsp;&nbsp'
                     + '<button class="btn_update" ' + disabled + '>수정</button>'
                     + '<button class="btn_delete" ' + disabled + '>삭제</button>'
                     + '</pre>'
                     + '</div>';
               }); // end each()
               $('#replies').html(list);
            }
         ); // end getJSON
      } // end getAllReplies  
      
      // 댓글 수정
      $('#replies'). on('click', '.reply_item .btn_update', function(){
    	  console.log(this);
    	  
    	  var replyNumber = $(this).prevAll('#replyNumber').val();
    	  var replyContent = $(this).prevAll('#replyContent').val();
    	  
    	  console.log("선택된 댓글 번호 : " + replyNumber + ", 댓글 내용 : " + replyContent);
    	  
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
            var replyId = $(this).prevAll('#replyId').val();
            
            // ajax 요청
            $.ajax({
               type : 'DELETE',
               url : 'replies/' + replyId,
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
            });
         });  // end replies.on()         
      }); // end document
   
	</script>

</body>
</html>