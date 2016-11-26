<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.8.8/jquery.fullPage.css" />

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick-theme.css" />

<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"/>

<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
<link rel="icon" href="images/favicon.png" type="image/x-icon">

<script>
  //help modal open count
  var help_open = 0;
  
  function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
  }
</script>

<title>Movie Camp</title>
</head>
<body>
	<!-- MainMenu-->
	<div class="mainmenu_container" id="mainmenu_container">

		<!-- float:left css 때문에 역순으로 나열 (1123-ys) -->
		<ul id="menu" class="mainmenu">
			<li data-menuanchor="section_QnA" class="col s2">
				<a class="btn-large black" href="#section_QnA">QnA</a>
			</li>
			<li data-menuanchor="section_Genre" class="col s3">
				<a class="waves-effect waves-light btn-large black" href="#section_Genre">Genre</a>
			</li>
			<li data-menuanchor="section_Top100" class="col s3">
				<a class="waves-effect waves-light btn-large black" href="#section_Top100">Top100</a>
			</li>
			<li data-menuanchor="section_search" class="col s3">
				<a class="waves-effect waves-light btn-large black"	href="#section_search">Search</a>
			</li>
			<li>
				<div class="mainmenu_icon">
					<a id="i_help" onclick="helpModal();">
						<i class="material-icons" id="img_icon" title="도움말">live_help</i> 
					</a>
					<a id="i_star" href="javascript:open_log()">
						<!-- <i class="material-icons" id="img_icon" title="찜꽁목록보기">star</i> -->
						<img id="img_icon" src="images/wish.png" onmouseover="this.src='images/wish_hover.png'" onmouseout="this.src='images/wish.png'" style="width: 56px; margin-top: -6px;" title="찜꽁목록보기">  
					</a>
				</div>
			</li>
		</ul>
	</div>
	
	<div id="fullpage">
		<div class="section active" data-anchor="section_main" style="background-image: url('images/mainbackground.gif'); background-size: 100% 100%;">
			<div class="slide">
			<div class="autoplay">
				<div>
					<div class="image">
						<img src="images/pic1.png" />
					</div>
				</div>
				<div>
					<div class="image">
						<img src="images/pic2.png" />
					</div>
				</div>
				<div>
					<div class="image">
						<img src="images/pic3.png" />
					</div>
				</div>
				<div>
					<div class="image">
						<img src="images/pic4.png" />
					</div>
				</div>
				<div>
					<div class="image">
						<img src="images/pic5.png" />
					</div>
				</div>
				<div>
					<div class="image">
						<img src="images/pic6.png" />
					</div>
				</div>
				<div>
					<div class="image">
						<img src="images/pic7.png" />
					</div>
				</div>
				<div>
					<div class="image">
						<img src="images/pic8.png" />
					</div>
				</div>
			</div>
			</div>
		</div>
		<div class="section" data-anchor="section_search" style="background-color: #242424; text-align: center; margin: 0;">
			<div class="slide" data-anchor="slide1" style="margin-top: 15px">
				<!-- search section -->
				<div class="row">
					<div class="row main_title">
						<div class="col s4 m5 l6 main_title_icon">
							<a href="index.jsp">
								<i class="large material-icons shadow" id="search_title_icon">movie</i>
							</a>
						</div>
						<div class="col s8 m7 l6 main_title_text">
							Before <span class="main_title_large">&nbsp;Movie</span> , 
						</div>
					</div>
					<div class="row">
						<div class="col s12 m1 l2"></div>
						<div class="col s12 m10 l8">
							<nav class="searchBar">
								<div class="nav-wrapper">
									<form id="form-action" name="main_search_form" method="post" action="../movieList" onsubmit="mainsearch_silder();return false">
										<!-- method="post" -->
										<div class="input-field">
											<input type="search" name="keyword" id="search" class="autocomplete" placeholder="Input Movie Name" required>
											<label for="search"><i class="material-icons" id="search_keyword">search</i></label> 
											<i class="material-icons" id="search_clear">close</i>
										</div>
									</form>
								</div>
							</nav>
						</div>
						<div class="col s12 m1 l2"></div>
					</div>

					<!-- BoxOffice -->
					<div class="row" style="color: #ffffff;">
						<div class="col m1 l2"></div>
						<div class="col s12 m10 l8" id="dailyBoxOffice"
							style="background-color: #141414; border: 5px solid #00bfa5; border-radius: 10px;">
								<div class="slider single-item">
									<div id="search_carousel_daily">
										<p class="lead" id="lead" style="font-size: 1.9em; color: #00bfa5;">Daily Box Office</p>
										<!-- <p class="lead" id="lead">Daily Box Office</p>  1125ys-->
										<div id="boxoffice_container">
											<c:if test="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList }">
												<c:forEach var="boxoffice"
													items="${dailyResult.boxOfficeResult.dailyBoxOfficeList }">
													<table>
														<tr>
															<td id="boxoffice_rank">
																<c:out value="${boxoffice.rank }" />
															</td>
															<td id="boxoffice_rankInten">
																<c:if test="${boxoffice.rankInten > 0}">
																<b style="color: blue;">
																	<i class="tiny material-icons">arrow_upward</i>
																	<c:out value="${boxoffice.rankInten }" />
																</b>
																</c:if>
																<c:if test="${boxoffice.rankInten == 0}">
																	<b><c:out value="-" /></b>
																</c:if>
																<c:if test="${boxoffice.rankInten < 0}">
																	<b style="color: red;">
																		<i class="tiny material-icons">arrow_downward</i>
																		<c:out value="${fn:substring(boxoffice.rankInten,1,2) }" />
																	</b>
																</c:if>
															</td>
															<td id="boxoffice_movieNm">
																<b><c:out value="${boxoffice.movieNm }" /></b>
															</td>
															<td id="boxoffice_audiAcc">
																<fmt:formatNumber value="${boxoffice.audiAcc }" pattern="#,###" /> 명
															</td>
														</tr>
													</table>
												</c:forEach>
											</c:if>
										</div>
									</div>
									<div id="search_carousel_weekly">
										<p class="lead" id="lead" style="font-size: 1.9em; color: #00bfa5;">Weekly Box Office</p>
										<!-- <p class="lead" id="lead">Weekly Box Office</p>  1125ys-->
										<div id="boxoffice_container">
											<c:if test="${not empty weeklyResult.boxOfficeResult.weeklyBoxOfficeList }">
												<c:forEach var="boxoffice" items="${weeklyResult.boxOfficeResult.weeklyBoxOfficeList }">
													<table>
														<tr>
															<td id="boxoffice_rank">
																<c:out value="${boxoffice.rank }" />
															</td>
															<td id="boxoffice_rankInten">
																<c:if test="${boxoffice.rankInten > 0}">
																<b style="color: blue;">
																	<i class="tiny material-icons">arrow_upward</i>
																	<c:out value="${boxoffice.rankInten }" />
																</b>
																</c:if>
																<c:if test="${boxoffice.rankInten == 0}">
																	<b><c:out value="-" /></b>
																</c:if>
																<c:if test="${boxoffice.rankInten < 0}">
																	<b style="color: red;">
																		<i class="tiny material-icons">arrow_downward</i>
																		<c:out value="${fn:substring(boxoffice.rankInten,1,2) }" />
																	</b>
																</c:if>
															</td>
															<td id="boxoffice_movieNm">
																<b><c:out value="${boxoffice.movieNm }" /></b>
															</td>
															<td id="boxoffice_audiAcc">
																<fmt:formatNumber value="${boxoffice.audiAcc }" pattern="#,###" /> 명
															</td>
														</tr>
													</table>
												</c:forEach>
											</c:if>
										</div>
									</div>
								</div>
							</div>
						<div class="col s12 m1 l2"></div>
					</div>
				</div>
			</div>
			
			<div class="slide" data-anchor="slide2" id="main_searchlist" style="display: none;">
				<div id="slideshow">
					<%@include file="movieList.jsp" %>
				</div>
			</div>
			
			<div class="slide" data-anchor="slide3" id="main_searchdetail" style="display: none;">
				<div class="row" style="height: 100%;">
					<div id="detail_menu" class="row col s2 m2 l2">
						<table>
		                     <tr>
		                        <td>
		                            <table class="highlight centered" id="detail_table" style="border-radius: 3px;">
		                             <tbody>
		                                <tr><td id="detailmenu_INFO">INFO</th></tr>
		                                <tr><td id="detailmenu_Actor">Actor</td></tr>
		                                <tr><td id="detailmenu_Photo">Photo</td></tr>
		                                <tr><td id="detailmenu_Trailer">Trailer</td></tr>
		                             </tbody>
		                           </table>
		                        </td>
		                     </tr>
		                </table>
	                </div>
					<div class="row col s10 m10 l10">
						<div class="intro">
							<div id="slidedetailshow"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="section sec_top100" data-anchor="section_Top100" style="background-color: #121212;">
			<div class="slide">
				<div class="row" style="color: #ffffff; padding-left:10%; padding-right:10%; padding-top: 2%;">
					<div class="col s12 m5 l5" id="movieTop100"
						 style="background-color: #121212; border: 3px solid #00bfa5; border-radius: 10px;"> <!-- #141414 -->
						<p class="lead" id="lead" style="font-size: 1.9em; color: #00bfa5;">Movie Top 100</p>
						<iframe height="60%" width="100%" frameborder="0" class="col s12" src="../top100?pageNum=1" name="top100" style="height: 70%"></iframe>
						<div class="col offset-s1 l2"></div>
						<ul class="pagination col s11 l10 offset-l1" style="color: white;">
							<!-- 
							<li class="waves-effect" id="top100_go1">
								<a href="../top100?pageNum=1" target="top100" id="searchlist_paging_selected">
									<i class="material-icons">chevron_left</i>
								</a>
							</li>
							 -->
							<li class="top100_page waves-effect active" id="top100_no1">
								<a href="../top100?pageNum=1" target="top100">1</a>
							</li>
							<li class="top100_page waves-effect">
								<a href="../top100?pageNum=2" target="top100">2</a>
							</li>
							<li class="top100_page waves-effect">
								<a href="../top100?pageNum=3" target="top100">3</a>
							</li>
							<li class="top100_page waves-effect">
								<a href="../top100?pageNum=4" target="top100">4</a>
							</li>
							<li class="top100_page waves-effect" id="top100_no5">
								<a href="../top100?pageNum=5" target="top100">5</a>
							</li>
							<!-- 
							<li class="waves-effect" id="top100_go5">
								<a href="../top100?pageNum=5" target="top100">
									<i class="material-icons">chevron_right</i>
								</a>
							</li>
							 -->
						</ul>
					</div>
					<div class="col l1 m1"></div>
					<div class="top100_load"></div>
				</div>
			</div>
			<div class="slide" style="padding-left:5%; padding-right:5%;">
				<iframe id="ifrm_Chart" onload="resizeIframe(this)" width="100%" frameborder="0" class="col s12" style="text-align: center;"></iframe>
			</div>
		</div>
		<div class="section" data-anchor="section_Genre" style="background-color: #242424;">
	         <div class="slide active">
	               <div class="intro">
	                  <table style="height: 100%;">
	                     <tr>
	                        <td style="width:10%;">
	                            <table class="highlight centered" id="genre_table" style="border-radius: 3px;">
	                             <thead>
	                                <tr><th data-field="id">Genre</th></tr>
	                             </thead>
	                             
	                             <tbody id="pageA">
	                                <tr><td class="Action">Action</td></tr>
	                                <tr><td class="Comedy">Comedy</td></tr>
	                                <tr><td class="Drama">Drama</td></tr>
	                                <tr><td class="Fantasy">Fantasy</td></tr>
	                                <tr><td class="Horror">Horror</td></tr>
	                                <tr><td class="SF">SF</td></tr>
	                                <tr><td class="Animation">Animation</td></tr>
	                                <tr><td class="Romance">Romance</td></tr>
	                                <tr><td class="Thriller">Thriller</td></tr>
	                                <tr><td class="Documentary">Documentary</td></tr>
	                             </tbody>
	                           </table>
	                        </td>
	                        <td><iframe id="ifA" src="../movieList_genre?genre=28"></iframe></td>
	                     </tr>
	                  </table>
	               </div>
	         </div>
		</div>
		<div class="section" id="section_QnA_height" data-anchor="section_QnA" style="background-color: #121212;">
			<div class="qna_load"></div>
		</div>
		<%@include file="/WEB-INF/views/footer.jsp"%>	
	</div>
	
	<!-- board List Modal -->
	<!-- 비밀번호 폼 -->
	<!-- Modal Structure -->
	<div id="modalPass" class="modal center" style="background-color: #121212">
		<div class="modal-content">
			<div>
			<form name="f" id="f" method="get">
				<input type="hidden" name="b_no" id="b_no"/>
				<br>
				<h4 style="color: white;">비밀번호</h4>
				<label>해당 게시글의 비밀번호를 입력해주세요.</label>
		        <input type="password" maxlength="20" name="b_pass" id="b_pass" style="color: white;" onkeypress="if(event.keyCode==13){checkPwd(); return false;}">
		       	<button type="button" onclick="javascript:closePwd();" class="btn btn-default">Close</button>
		        <button type="button" onclick="javascript:checkPwd();" class="btn btn-default">OK</button>
			</form>
			</div>
		</div>
	</div> 
	<!-- //비밀번호 폼 -->
	
	<!-- 확인 폼 -->
	<!-- Modal Structure -->
	<div id="modalOk" class="modal center" style="background-color: #121212">
		<div class="modal-content">
			<div>
				<br>
				<h4 style="color: white;">확인</h4>
				<br><br>
				<h6 class="modalText" style="color: white;"></h6>
				<br><br><br>
		       	<button type="button" onclick="javascript:closeOk();" class="btn btn-default">Close</button>
		        <button type="button" onclick="javascript:checkOk();" class="btn btn-default">OK</button>
			</div>
		</div>
	</div> 
	<!-- //확인 폼 -->	
	
	<!-- 도움말 폼 -->
	<!-- Modal Structure -->
	<div id="modalHelp" class="modal modal-fixed-footer" style="background-color: #121212;">
	    <div class="modal-content" style="margin: 0;top: 0px;bottom: 0px;padding-top: 0px;padding-bottom: 0px;width: 96%;left: 7%;">
			<div class="slick_help">
			  <div style="font-size:3rem; vertical-align:middle; text-align:center;">
			  	<p id="help_txt">
			  	
			  		영화정보와 영화 OST를 함께 제공하는 Movie Camp입니다.  
			  	</p>
			  </div>		
			  <div><span>1/7</span><img src="images/help_Search.png"/></div>
			  <div><span>2/7</span><img src="images/help_Search2.png"/></div>
			  <div><span>3/7</span><img src="images/help_Search3.png"/></div>
			  <div><span>4/7</span><img src="images/help_Top100.png"/></div>
			  <div><span>5/7</span><img src="images/help_chart1.png"/></div>
			  <div><span>6/7</span><img src="images/help_gen.png"/></div>
			  <div><span>7/7</span><img src="images/help_QnA1.png"/></div>
			</div>
						
	    </div>
	    <div class="modal-footer">
			 <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat" style="color: #00bfa5">Close</a>
	    </div>
	</div> 
	<!-- //도움말 폼 -->
	
	<!-- Loading... -->
	<div class="wrap-loading display-none">
    	<div><img src="images/loading9.gif"/></div>
	</div>

</body>
</html>
