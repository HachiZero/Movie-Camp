<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function answerWrite(){
/*  	var a_no = $("input:hidden[name=a_no]").val();
	var a_title = $("input:text[name=a_title]").val();
	var a_content = $("textarea[name=a_content]").val();
	
	if (a_title == "") {
		Materialize.toast("제목을 입력하세요.", 4000);
		$("input:text[name=a_title]").focus();
		return;
	}
	if (a_content == "") {	
		Materialize.toast("내용을 입력하세요.", 4000);
		$("textarea[name=a_content]").focus();
		return;
	} 

	$.ajax({
		type : "POST",
		url : "/controller/answerWrite",
		data : JSON.stringify({'a_no' : a_no, 'a_title' : a_title, 'a_content' : a_content}),
		contentType : "application/json; charset=UTF-8",
		dataType:"text",
		success:function(result) {
			Materialize.toast("답변을 저장 했습니다.", 4000);
			var strArray = result.split(':');
			$(".qna_load").load('/controller/' + strArray[1]);
		}
	}); */
}

function checkOk(){
	closeOk();
	answer_load(del_keyword);
}	
</script>
</head>
<body>

<form action="" method="post" name="answerF">
	<input type="hidden" name="a_no" value="${dto.b_no}">
	<br><br>
	<div class="container">
	<p style="font-size:15px; color: #00bfa5">
		<i class="material-icons" style="size: 4rem;">message</i>
		 답글 작성 중..
	</p>	
	 <!-- Table -->
	 	<table>
	 		<!-- <tr>
	 			<th colspan="2" style="text-align: center; color: white;">
	 				<i class="material-icons" style="size: 4rem;">message</i>
	 				<h5>답변</h5>
	 			</th>
	 		</tr> -->
	  		<tr>
	    		<th style="width: 10%; color: white;">제목</th><td colspan="3"><input type="text" name="a_title" style="color: white;"></td>
	   		</tr>
	   		<tr>
	   			<th style="color: white;">내용</th>
	   			<td><textarea rows="10" style="width: 100%; height: 100%; border: none; color: white;" name="a_content"></textarea></td>
	   		</tr>
		</table>	
	 	<!-- //table -->
	</div>
	<br>
	<div class="container center">
		<div class="row">
			<div class="col s12 m12 l12">
	        	<button type="button" onclick="javascript:answer_load('write')" class="btn btn-default">답변 등록</button>
	        	<button type="button" onclick="javascript:answerDelete('delAll')" class="btn btn-default">게시글 삭제</button>
	        	<button type="button" onclick="javascript:qnapage_load('list')" class="btn btn-default">돌아가기</button>
	        </div>
	   	</div>
	</div>
</form>
</body>
</html>