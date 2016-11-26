<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript'>
var del_keyword = "";

function checkOk(){
	closeOk();
	answer_load(del_keyword);
}
</script>
</head>
<body>
<br><br>
<div class="container">
	<p style="font-size:15px; color: #00bfa5">
		<i class="material-icons" style="size: 4rem;">message</i>
		 관리자 답글
	</p>
 <!-- Table -->
 	<table class="bordered" border="1" style="color: white;">
 		<tr>
 			<th colspan="4" style="background-color: #00bfa5;"></th>
 		</tr>
  		<tr>
    		<th style="width: 100px">제목</th><td colspan="3">${answer.a_title}</td>
   		</tr>
   		<tr>
   			<th>작성자</th><td>관리자</td> <th style="width: 100px">작성일</th><td>${fn:substring(answer.a_date, 0, 10)}</td>
   		</tr>
   		<tr>
   			<th rowspan="4">내용</th>
   			<td colspan="3" rowspan="4"><textarea rows="10" style="width: 100%; height: 100%; border: none;" readonly="readonly">${answer.a_content}</textarea></td>
   		</tr>
	</table>
<!-- //table -->  
</div>

<br>

<form action="" name="answerF">
	<input type="hidden" name="a_no" value="${answer.a_no}">
</form>


<c:if test="${admin != null}">
<div class="container center">
	<div class="row">
		<div class="col s12 m12 l12">
        	<button type="button" onclick="javascript:answerUpdate()" class="btn btn-default">답변 수정</button>
        	<button type="button" onclick="javascript:answerDelete('delReply')" class="btn btn-default">답변 삭제</button>
        	<button type="button" onclick="javascript:answerDelete('delAll')" class="btn btn-default">게시글 삭제</button></a>
        	<button type="button" onclick="javascript:qnapage_load('list')" class="btn btn-default">돌아가기</button>
        </div>
   	</div>
</div>
</c:if>

</body>
</html>