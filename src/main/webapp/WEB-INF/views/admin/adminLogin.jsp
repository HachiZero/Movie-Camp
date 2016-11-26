<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function confirm(){
	var f = document.f;
	if ($("input:text[name=id]").val() == "") {
		Materialize.toast("아이디를 입력하세요.", 3000, 'rounded');
		$("input:text[name=id]").focus();
		return;
	}	
	if ($("input:password[name=password]").val() == "") {
		Materialize.toast("비밀번호를 입력해 주세요.", 3000, 'rounded');
		$("input:text[name=password]").focus();
		return;
	}		
	/* f.submit(); */
	admin_login('post');
}
</script>
</head>
<body>
<%-- <%@ include file="../top.jsp" %> --%>
<br>

<c:if test="${admin != null}">
	
</c:if>

<div class="container">
	<div class="row">
		<div class="col s12 m12 l12">
		<form action="../controller/adminLogin" method="post" name="f" style="color: white;">
			<div class="center">
				<h4>관리자</h4>
				<i class="small material-icons" style="vertical-align : middle;">report_problem</i>
				 관리자 전용 로그인 페이지입니다.<br>
				 <div style="color: #121212;">일반 사용자는 뒤로 꺼졍^^</div>
			</div>
			<br><br><br>
			관리자 아이디 : <input type="text" name="id">
			관리자 비밀번호 : <input type="password" name="password">
			<div class="center">
				<input type="button" value="확인" class="btn" onclick="javascript:confirm()">
				<input type="button" value="돌아가기" class="btn" onclick="javascript:qnapage_load('list')">
			</div>
		</form>
		</div>
	</div>
</div>
<br><br><br><br><br>
</body>
</html>