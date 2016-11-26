<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript'>
function checkOk(){
	closeOk();
	answer_load(del_keyword);
}
</script>
</head>
<body>

<form action="answerUpdate" method="post" name="update">

<input type="hidden" name="a_no" value="${dto.b_no}">
<div class="container">
	<p style="font-size:15px; color: #00bfa5">
		<i class="material-icons" style="size: 4rem;">message</i>
		 답글 수정 중..
	</p>	
 <!-- Table -->
 	<table style="color: white;">
 		<tr><th colspan="2" style="text-align: center;"><h3>관리자</h3></th></tr>
  		<tr>
    		<th style="width: 10%">제목</th><td colspan="3"><input type="text" name="a_title" value="${answer.a_title}"></td>
   		</tr>
   		<tr>
   			<th>내용</th>
   			<td><textarea rows="10" style="width: 100%; height: 100%; border: none;" name="a_content">${answer.a_content}</textarea></td>
   		</tr>
	</table>	
 	<!-- //table -->
</div>

<div class="container center">
	<div class="row">
		<div class="col s12 m12 l12">
        	<button type="button" onclick="answer_load('update_save')" class="btn btn-default">수정 완료</button>
        	<button type="button" onclick="javascript:qnapage_load('list')" class="btn btn-default">돌아가기</button>
        </div>
   	</div>
</div>

</form>

</body>
</html>