<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
<script type="text/javascript" src="../controller/resources/js/r_msg.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(){
	$('.preloader-background').delay(1700).fadeOut('slow');
	
	$('.preloader-wrapper')
		.delay(1700)
		.fadeOut();
});
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css"> 
<style type="text/css">
   ::-webkit-scrollbar {
    width: 6px;
}
 
/* Track */
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
    -webkit-border-radius: 10px;
    border-radius: 10px;
}
 
/* Handle */
::-webkit-scrollbar-thumb {
    -webkit-border-radius: 10px;
    border-radius: 10px;
    background: rgba(255,255,255,0.8); 
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5); 
}
::-webkit-scrollbar-thumb:window-inactive {
   background: rgba(255,255,255,0.4); 
}

.preloader-background {
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #121212;
	
	position: fixed;
	z-index: 100;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;	
}
</style>
<body>
<div class="preloader-background">
	<div class="preloader-wrapper small active">
		<div class="spinner-layer spinner-green-only">
			<div class="circle-clipper left">
				<div class="circle"></div>
			</div>
			<div class="gap-patch">
				<div class="circle"></div>
			</div>
			<div class="circle-clipper right">
				<div class="circle"></div>
			</div>
		</div>
	</div>
</div>

<div class="row main" style="color: white;">
	<table class="col s12" style="font-size: 0.9rem">
		<c:set var="a" value="${(movie_info.pageNum * 20)-19}" />
		<c:forEach var="m" items="${movie_info.results}">
			<tr>
				<td rowspan="2">${a}위</td>
				<td rowspan="2"><a href="javascript:movieid('${m.id}','${m.title}')" style="color: #00bfa5;">${m.title}</td>
				<td style="padding: 0px !important;">${m.vote_average}/10</td>
			</tr>
			<tr>
				<td style="padding: 0px !important;">${fn:substring(m.popularity,0,4)}점</td>
				<c:set var="a" value="${a+1}" />
			</tr>
		</c:forEach>
	</table> 
</div>

<div class="row result_none"></div>

 </body>
</html>