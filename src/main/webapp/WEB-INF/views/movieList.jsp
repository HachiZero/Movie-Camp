<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="searchList">
	<div class="row" id="searchList_list">    
	<!-- 영화 리스트 -->
	<div class="row"></div>
	<c:set var="SQUOT" value="'" />
	<c:set var="c" value="0"/>
	<c:if test="${not empty movie_info.results }">
		<c:forEach var="l" items="${movie_info.results }"> 
			<c:set var="c" value="${c+1 }"/>
			<c:if test="${c == 1 }">
			</c:if>
			<div class="col s12 m4 l3">
	        	<div class="card"  onclick="javascript:createCookie('${l.id}')">
				    <div class="card-image waves-effect waves-block waves-light" style="height: 100%;">
						<c:choose>
							<c:when test="${l.poster_path eq null || l.poster_path eq ''}">
								<img class="activator" src="http://bja.or.kr/core/images/etc/noimg_main.gif">
							</c:when>
							<c:otherwise>
								<img class="activator" src="https://image.tmdb.org/t/p/w500${l.poster_path}">
							</c:otherwise>
						</c:choose>
				    </div>
				    <div class="card-content" id="listCard">
				        <c:set var="title" value="${l.title}" />
		   				<c:set var="titlecut" value="${fn:substring(title, 0, 20) }" />
				      	<p>
				      		<form name="frm_detail" id="frm_detail" method="post" action="detail.do"> 
				      			<input type="hidden" name="id" value="${l.id }"/>
					      		<button onclick="javescript:movieDetail(${l.id});return false" id="listButton" >
					      			${titlecut }
					      			<c:if test="${fn:length(title) > 20 }">...</c:if>
					      		</button>
				      		</form>
				      		<!-- <i class="card-title activator material-icons right">more_vert</i> -->
				      	<p>
				    </div>
				    <div class="card-reveal">
						<span class="card-title grey-text text-darken-4">${title }<i class="material-icons right">close</i></span>
						<p>
							<i class="tiny material-icons">date_range</i> ${l.release_date } &nbsp;&nbsp;
							<i class="tiny material-icons">star</i>${l.vote_average}<br/>
							${l.overview }
						</p>
				    </div>
				</div>
	        </div>
	        
			<c:if test="${c == 4 }">
				<c:set var="c" value="0"/>
			</c:if>	 
		</c:forEach>      			
	</c:if>    
	</div>

	<!-- 리스트 페이징 -->
	<div class="row paging">
		<div class="col s12 m12 l12">
			<form name="frm_page" method="post" action="../controller/movieList">
				<input type="hidden" name="keyword"/>
				<input type="hidden" name="pageNum"/>
				<ul class="pagination">
					
					<c:set var="pageNum" value="${movie_info.pageNum }"/>
					<c:set var="currentPageLimitNum" value="${movie_info.currentPageLimitNum }"/>
					
					<!-- Paging limit per 10 -->
					<!-- Total page > 10 -->
					<c:if test="${movie_info.total_pages > 10}">
						<!-- Page / 10 -->
						<c:if test="${movie_info.total_pages % 10 == 0}">
							<c:set var="totalPageNum" value="${movie_info.total_pages / 10 }"/>
						</c:if>
						<c:if test="${movie_info.total_pages % 10 != 0}">
							<fmt:parseNumber var="totalPageNum" value="${(movie_info.total_pages/10)+1}" integerOnly="true" />						
						</c:if>
						
						<!-- left arrow -->
						<c:if test="${currentPageLimitNum == 1 }">
							<li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>						
						</c:if>
						<c:if test="${currentPageLimitNum > 1 }">
							<li class="active"><a href="javascript:page_move(${((currentPageLimitNum-1)*10)-9},'${movie_info.keyword}');"><i class="material-icons">chevron_left</i></a></li>						
						</c:if>
						
						<!-- paging -->
						<span class="searchList_paging">
						<c:set var="endPage" value="${currentPageLimitNum*10}"/>
						<c:if test="${endPage > movie_info.total_pages}">
							<c:set var="endPage" value="${movie_info.total_pages}"/>
						</c:if>
						<c:forEach var="page" begin="${(currentPageLimitNum*10)-9 }" end="${endPage}">
							<c:choose>
								<c:when test="${page == pageNum }">
									<li class="active disabled"><a id="searchlist_paging_selected" href="#!">${page}</a></li>
								</c:when>
								<c:otherwise>
									<li class="waves-effect"><a href="javascript:page_move(${page},'${movie_info.keyword}');">${page}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						</span>	
						<!-- right arrow -->
						<c:if test="${currentPageLimitNum == totalPageNum }">
							<li class="disabled"><a href="#!"><i class="material-icons">chevron_right</i></a>						
						</c:if>
						<c:if test="${currentPageLimitNum < totalPageNum }">
							<li class="active"><a href="javascript:page_move(${(currentPageLimitNum*10)+1 },'${movie_info.keyword}');"><i class="material-icons">chevron_right</i></a></li>	
						</c:if>							
						
					</c:if>
					
					<!-- Total page <= 10 -->
					<c:if test="${movie_info.total_pages <= 10}">
						<span class="searchList_paging less10">
							<c:forEach var="page" begin="1" end="${movie_info.total_pages}">
								<c:choose>
									<c:when test="${page == pageNum }">
										<li class="active disabled"><a id="searchlist_paging_selected" href="#!">${page}</a></li>
									</c:when>
									<c:otherwise>
										<li class="waves-effect"><a href="javascript:page_move(${page},'${movie_info.keyword}');">${page}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</span>
					</c:if>
				</ul>
			</form>
		</div>
	</div>
</div>

<!-- Modal Structure -->
<!-- 
<div id="modal1" class="modal modal-fixed-footer">
	<div class="modal-content">
		<div id="modal_title"></div>
		<iframe src="detail.do" id='iframe' width="100%" height="500px" scrolling="auto" frameborder="0"></iframe> 
	</div>
	<div class="modal-footer">
		<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Close</a>
	</div>
</div>
 --> 


