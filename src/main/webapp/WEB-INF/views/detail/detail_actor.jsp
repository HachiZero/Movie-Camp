<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
	<div class="detail_content row">
		<div class="row">
		    <c:if test="${detail_info.cast != '[]'}">
		      <c:forEach var="a" items="${detail_info.cast }">
		         <div class="col s12 m6 l6">
		            <table style="color: white;">
		               <tr>
		                  <td rowspan="2" style="width: 200px;"> <!-- style="width: auto;" -->
		                     <c:choose>
		                        <c:when test="${a.profile_path eq null || a.profile_path eq ''}">
		                           <img class="circle" src="https://cdn2.iconfinder.com/data/icons/pictograms-vol-1/400/human-128.png" style="height: 100px;">
		                        </c:when>
		                        <c:otherwise>
		                           <img class="circle" src="https://image.tmdb.org/t/p/w500${a.profile_path }" style="width:100px; height: 100px;">
		                        </c:otherwise>
		                     </c:choose>
		                  </td>
		                  <td id="detail_Actor_name" style="vertical-align: bottom;">${fn:trim(a.name) }</td>
		               </tr>
		               <tr><td id="detail_Actor_char" style="vertical-align: top;">(${fn:trim(a.character)})</td></tr>
		            </table> 
		         </div>   
		      </c:forEach> 
	      	</c:if>
	      	<div class="detail_null">
	      		<c:if test="${detail_info.credit.cast == '[]'}">
					자료가 없습니다.
				</c:if>
			</div>
		</div> 
   </div>
</body>
</html>