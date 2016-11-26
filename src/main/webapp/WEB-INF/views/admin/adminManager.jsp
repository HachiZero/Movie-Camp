<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="../top.jsp" %>
<br>
<div class="row center">
	<div class="col s12 m12 l12">
		<h2>${admin} 관리자님 환영합니다</h2>
		<a href="adminLogout"><button class="btn">로그아웃</button></a>
	</div>
</div>	
<%@include file="../footer.jsp" %>

</body>
</html>