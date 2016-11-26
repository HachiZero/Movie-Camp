<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- 배경음악 -->
<div style="text-align: center;">
	<div class="soundtrack">
	<c:if test="${detail_info.soundtrack != null}">
 		<embed id="bgm" width="45px" height="25" src="http://www.youtube.com/v/${detail_info.soundtrack }?version=2&autoplay=1&loop=true"
			type="application/x-shockwave-flash" wmode="opaque" loop="true"></embed>
	</c:if>
	<c:if test="${detail_info.soundtrack_info != null}">
		<div id="soundtrack_info">(${detail_info.soundtrack_info })</div>
	</c:if>
	</div>
</div>

<!-- 제목 -->
<div id="detail_info_title">${detail_info.title }</div>
<c:if test="${(detail_info.original_title != null) && (detail_info.title != detail_info.original_title)}">
	<div id="detail_info_titleOg">( ${detail_info.original_title} )</div>
</c:if>
<input type="hidden" name="id" id="id" value="${detail_info.id }">


<!-- 메뉴1 -->
<div id="INFO">
		<div class="detail_content row">
			<div class="row col s12 m6 l4">
				<img src="https://image.tmdb.org/t/p/w500${detail_info.poster_path}"  id="detail_INFO_image"
					style="height: 350px;">
			</div>
			<div class="row col s12 m6 l8">
				<p id="detail_INFO_content">
	               장　 　르 ㅣ
	               <c:set var="genre" value=""/> 
	               <c:forEach var="g" items="${detail_info.genres }">
	               <c:set var="genre" value="${genre += g.name }, "/>
	               </c:forEach>
	               <c:set var="len" value="${fn:length(genre)}"/>
	               <c:out value="${fn:substring(genre, 0, len-2)}" /><br/>
	               
	               제작년도 ㅣ ${detail_info.release_date }<br/>
	                
	               제작국가 ㅣ 
	               <c:set var="country" value=""/> 
	               <c:forEach var="c" items="${detail_info.production_countries }">
	               <c:set var="country" value="${country += c.name }, "/>
	               </c:forEach>
	               <c:set var="len" value="${fn:length(country)}"/>
	               <c:out value="${fn:substring(country, 0, len-2)}" /><br/>
	               
	               제 작 사 ㅣ
	               <c:set var="production" value=""/>
	               <c:forEach var="p" items="${detail_info.production_companies }">
	               <c:set var="production" value="${production += p.name }, "/>
	               </c:forEach>
	               <c:set var="len" value="${fn:length(production)}"/>
	               <c:out value="${fn:substring(production, 0, len-2)}" /><br/>
	               <c:if test="${detail_info.vote_average  != null}">
	               평　 　점 ㅣ ${detail_info.vote_average }<br/>
	               </c:if>
	               <c:if test="${detail_info.overview != null}">
	               줄 거 리 ㅣ ${detail_info.overview }<br/>
	               </c:if>
           		</p>
		</div>
	</div>
</div>

<!-- 메뉴2 -->
<div id="Actor" style="display: none;">
	   <div class="detail_content row">
	   	<iframe id="detail_content_iframe" width="100%" style="height: 30em;"></iframe>
		  <%--  <div class="row">
		      <c:set var="cnt" value="0"/>
		      	<c:if test="${detail_info.credit.cast != '[]'}">
			      <c:forEach var="a" items="${detail_info.credit.cast }">
			         <div class="col s12 m6 l6">
			            <table>
			               <tr>
			                  <td rowspan="2" style="width: auto;">
			                     <c:choose>
			                        <c:when test="${a.profile_path eq null || a.profile_path eq ''}">
			                           <img class="circle" src="https://cdn2.iconfinder.com/data/icons/pictograms-vol-1/400/human-128.png" style="height: 100px;">
			                        </c:when>
			                        <c:otherwise>
			                           <img class="circle" src="https://image.tmdb.org/t/p/w500${a.profile_path }" style="width:100px; height: 100px;">
			                        </c:otherwise>
			                     </c:choose>
			                  </td>
			                  <td id="detail_Actor_name">${fn:trim(a.name) }</td>
			               </tr>
			               <tr><td id="detail_Actor_char">(${fn:trim(a.character)})</td></tr>
			            </table> 
			         </div>   
			      </c:forEach> 
		      	</c:if>
		      	<div class="detail_null">
		      		<c:if test="${detail_info.credit.cast == '[]'}">
						자료가 없습니다.
					</c:if>
				</div>
		   </div>  --%>
   </div>
</div>

<!-- 메뉴3 -->
<div id="Photo" style="display: none;">
		<div class="detail_content_media row col s12 m12 l12">
			<c:if test="${detail_info.images.backdrops != '[]'}">
				<div class="w3-content w3-display-container" style="width: auto;">
					<c:forEach var="i" items="${detail_info.images.backdrops }">
						<img class="mySlides"
							src="https://image.tmdb.org/t/p/w500${i.file_path }"
							style="width: 100%; height: 30rem;" onclick="doImgPop('https://image.tmdb.org/t/p/w500${i.file_path }')">
						<!-- random image -->
					</c:forEach>
	
					<a class="w3-btn-floating w3-display-left" onclick="plusDivs(-1)">&#10094;</a>
					<a class="w3-btn-floating w3-display-right" onclick="plusDivs(1)">&#10095;</a>
				</div>
			</c:if>	
			<div class="detail_null">
				<c:if test="${detail_info.images.backdrops == '[]'}">
					자료가 없습니다.
				</c:if>
			</div>
		</div>
</div>

<!-- 메뉴4 -->
<div id="Trailer" style="display: none;">
 		<div class="detail_content_media row col s12 m12 l12">
			<c:if test="${detail_info.videos.results != '[]'}">
				<div class="w3-content w3-display-container" style="width: auto;">
		            <c:forEach var="v" items="${detail_info.videos.results }">
 		               <iframe title="YouTube video player" class="youtube-player" type="text/html" width="100%" 
		               		src="http://www.youtube.com/embed/${v.key }" frameborder="0" allowFullScreen style="height: 30rem;">
							이 브라우저는 재생할 수 없습니다.
		               </iframe>
		               <!-- <br/> -->
		            </c:forEach>      
		         
		            <a class="w3-btn-floating w3-display-left" onclick="plusMDivs(-1)">&#10094;</a>
		            <a class="w3-btn-floating w3-display-right" onclick="plusMDivs(1)">&#10095;</a>
	         	</div>
         	</c:if>
         	<div class="detail_null">
	         	<c:if test="${detail_info.videos.results == '[]'}">
					자료가 없습니다.
				</c:if>
			</div>
		</div>
</div>

<script>

/* image slider */
var slideIndex = 1;

showDivs(slideIndex);

function plusDivs(n) {
   showDivs(slideIndex += n);
}

function showDivs(n) {
   var i;
   var x = document.getElementsByClassName("mySlides");
   if (n > x.length) {slideIndex = 1}
   if (n < 1) {slideIndex = x.length}
   for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
   }
   x[slideIndex-1].style.display = "block";
}

/* Trailer slider */
var slideMIndex = 1;

showMDivs(slideMIndex);

function plusMDivs(n) {
   showMDivs(slideMIndex += n);
}

function showMDivs(n) {
   var i;
   var x = document.getElementsByClassName("youtube-player");
   if (n > x.length) {slideMIndex = 1}
   if (n < 1) {slideMIndex = x.length}
   for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
   }
   x[slideMIndex-1].style.display = "block";
}

//////cookie add
$(document).ready(function(){
   //alert($("#id").val());
   createCookie($("#id").val());
});
//////
</script>