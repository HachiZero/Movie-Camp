<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	$("input:text[name=b_title]").focus();	
});

function wformCheck(){
	var f = document.f;
	if ($("input:text[name=b_title]").val() == "") {
		Materialize.toast("제목을 입력하세요.", 3000, 'rounded');
		$("input:text[name=b_title]").focus();
		return;
	}
	if ($("input:text[name=b_name]").val() == "") {	
		Materialize.toast("이름을 입력하세요.", 3000, 'rounded');
		$("input:text[name=b_name]").focus();
		return;
	}
	if ($("input[name=b_email]").val() == "") {	
		Materialize.toast("이메일을 입력하세요.", 3000, 'rounded');
		$("input[name=b_email]").focus();
		return;
	}
	if ($("input[name=b_tel]").val() == "") {
		Materialize.toast("연락처를 입력하세요.", 3000, 'rounded');
		$("input[name=b_tel]").focus();
		return;
	}
	if ($("textarea[name=b_content]").val() == "") {
		Materialize.toast("내용을 입력하세요.", 3000, 'rounded');
		$("textarea[name=b_content]").focus();
		return;
	}
	if ($("input:text[name=b_pass]").val() == "") {
		Materialize.toast("해당 게시글의 비밀번호를 등록하세요.", 3000, 'rounded');
		$("input:text[name=b_pass]").focus();
		return;
	}
	
	$('.modalText').html("게시글을 수정하시겠습니까?");
	$('#modalOk').modal('open');

}

function checkOk(){
	closeOk();
	qnapage_load('update_post');
	Materialize.toast("게시글이 등록되었습니다.", 3000, 'rounded');	
}
</script>
<style type="text/css">
body{
	line-height: 1.0;
}
</style>
</head>

<body>
<%-- <%@ include file="../top.jsp" %> --%>

<!-- 글쓰기 -->
<form action="boardUpdate" method="post" name="f">
<input type="hidden" name="b_no" value="${dto.b_no}">
<div class="container">
	<p style="font-size:15px; color: #00bfa5">
		<i class="material-icons" style="size: 4rem;">mode_edit</i>
		게시글 수정 중..
		<br><br><br>
	</p>
	
    <!-- Table -->
 	<table style="color: white;">
  		<tr>
    		<th style="width: 10%">제목</th><td colspan="3"><input type="text" name="b_title" value="${dto.b_title}"></td>
   		</tr>
   		<tr>
   			<th>작성자</th><td><input type="text" name="b_name" value="${dto.b_name}"></td>
   		</tr>
   		<tr>
   			<th>메일</th><td><input type="email" name="b_email" value="${dto.b_email}"></td>
   		</tr>
   		<tr>
   			<th>연락처</th><td><input type="tel" name="b_tel" value="${dto.b_tel}"></td>
   		</tr>
   		<tr>
   			<th>내용</th>
   			<td><textarea rows="10" style="width: 100%; height: 100%; border: none;" name="b_content">${dto.b_content}</textarea></td>
   		</tr>
   		<tr>
   			<th>비밀번호</th><td><input type="text" name="b_pass"></td>
   		</tr>
	</table>	
 	<!-- //table -->
  	<input type="hidden" name="back_no" value="${dto.b_no}">
  	<input type="hidden" name="back_pass" value="${dto.b_pass}">
</div>
</form>

<br><br>
  
<!-- //게시판리스트 -->
<div class="container center">
	<div class="row">
		<div class="col s12 m12 l12">
        	<button type="button" onclick="javascript:wformCheck()" class="btn btn-default">등록완료</button>
        	<!-- <button type="button" onclick="javascript:history.back()" class="btn btn-default">돌아가기</button> -->
        	<button type="button" onclick="javascript:qnapage_load('back')" class="btn btn-default">돌아가기</button>
        </div>
   	</div>
</div>
<br>

<%-- <%@include file="../footer.jsp" %> --%>

</body>
</html>