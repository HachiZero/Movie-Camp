<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- <link rel="stylesheet" type="text/css" href="resources/css/index.css"> -->
<script type="text/javascript">
function serach(){
	if(document.searchFrm.sword.value == ""){
		document.searchFrm.sword.focus();
		Materialize.toast("검색어를 입력하세요!", 4000);
		return;
	}
	qnapage_load("search");
	/* document.searchFrm.submit(); */
}

function getPassword(no) {
	var f = document.f;
	$('#modalPass').modal('open');
	$('#b_pass').focus();
	f.b_no.value = no;
	f.action = "/controller/boardDetail";
}

function checkPwd() {
	var f = document.f;
	if (f.b_pass.value == "") {
		Materialize.toast("비밀번호를 입력해주세요.", 4000);
		f.b_pass.focus();
		return;
	}
	/* f.submit();	 */
	qnapage_load("detail");
	$('#b_pass').val("");
	$('#modalPass').modal('close');
	$('#fullpage').fullpage.moveTo(4);
	$('#fullpage').fullpage.moveSectionDown();
	$('#fullpage').fullpage.moveSectionDown();
	$('#fullpage').fullpage.moveSectionDown();
	$('#fullpage').fullpage.moveSectionDown();
}

</script>

<!-- 메인 메뉴바 가운데 정렬 -->

<body>

<%-- <%@ include file="../top.jsp" %> --%>

<!-- 검색창 -->
<div class="container">
<br>
   <div class="row">
      <div class="col s12 m5 l5" style="color: #00bfa5;">
		 <c:if test="${admin != null}">
	      	<span><i class="material-icons" id="boardicon">verified_user</i><span style="vertical-align: super;"> 관리자 모드입니다.</span></span>
		 </c:if>
      </div>
      <div class="col s12 m7 l7">
            <form action="/controller/boardSearch" name="searchFrm" method="post" >
               <div class="col s1 m1 l1">
                  <a href="#" title="게시물 전체보기" onclick="javascript:qnapage_load('list')"><i class="material-icons" id="boardicon">view_list</i></a>
               </div>
               <div class="col s4 m4 l4">   
                  <select name="stype" class="browser-default" > <!-- style="width: 25%" -->
                     <option value="b_title" selected="selected">글제목</option>
                     <option value="b_name">글작성자</option>
                  </select>
               </div>
               <div class="col s4 m4 l4">
                  <input type="text" name="sword" placeholder="검색어를 입력하세요" class="validate" style="color: white;" onkeypress="if(event.keyCode==13){serach(); return false;}">
               </div>
               <div class="col s1 m1 l1">
                  <a href="javascript:serach();" title="검색하기"><i class="material-icons" id="boardicon">search</i></a>&nbsp;&nbsp;
               </div>
               <div class="col s1 m1 l1" >                  
                  <a href="#" onclick="javascript:qnapage_load('write_get')" title="글쓰기"><i class="material-icons" id="boardicon">mode_edit</i></a>
               </div>
               <div class="col s1 m1 l1">
					<c:choose>
               			<c:when test="${admin != null}">
               				<!-- 관리자 계정으로 로그인 한 경우 로그아웃 -->
							<a href="#" onclick="javascript:admin_login('out')" title="관리자 로그아웃"><i class="material-icons" id="boardicon">lock_open</i></a>
               			</c:when>
               			<c:otherwise>
               				<!-- 관리자 계정이 아닐 경우 로그인 -->
							<a href="#" onclick="javascript:admin_login('get')" title="관리자 로그인"><i class="material-icons" id="boardicon">vpn_key</i></a>
               			</c:otherwise>
               		</c:choose>
               </div>               
            </form>
      </div>
   </div>
</div>
<!-- //검색창 -->

<!-- 게시판리스트 -->
<div class="container">
<!-- Table -->
<c:choose>
	<c:when test="${list ne '[]'}">	
		<table class="highlight" id="qnalist" style="color: white;">
			<tr style="font-weight: bold">
				<th style="width: 15%">번호</th><th style="width: 45%">제목</th><th style="width: 15%">작성자</th><th style="width: 15%">작성일</th><th style="width: 10%">답변</th>
			</tr>
			<c:forEach var="b" items="${list}">
			<tr>
				<td>${b.b_no}</td>
				<c:if test="${admin != null}">
					<!-- 관리자 계정으로 로그인 한 경우 -->
					<td><a href="#" onclick="javascript:admin_load('${b.b_no}')">${b.b_title}<i  id="boardlock" class="material-icons">lock_outline</i></a></td>
				</c:if>
				<c:if test="${admin == null}">
					<!-- 일반 사용자인 경우 -->
					<td><a href="javascript:getPassword(${b.b_no})">${b.b_title}<i  id="boardlock" class="material-icons">lock_outline</i></a></td>
				</c:if>
				<td>${b.b_name}</td>
				<td>${fn:substring(b.b_date, 0, 10)}</td>
				<c:if test="${b.b_state == 0}">
					<td>미답변</td>
				</c:if>
				<c:if test="${b.b_state == 1}">
					<td>답변완료</td>
				</c:if>
			</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>
		<div class="col s12" style="text-align: center; color: white; padding-top: 40px; padding-bottom: 40px;"><h6>검색 결과가 없습니다.</h6></div>
	</c:otherwise>  	
</c:choose>
<!-- //table -->
</div>

<!-- //게시판리스트 -->
<div class="container">
	<div class="row">
		<div class="col s12 m12 l12">
			<ul class="pagination"  style="text-align: center;">
				<!-- 첫페이지로 가기 -->
				<c:if test="${pageNum <= 1}"> 
					<!-- <li class="disabled"><a href="#">First</a></li> -->
				</c:if>		 
				<c:if test="${pageNum > 1}">
					<c:if test="${sword != null}">
						<%-- <li class="waves-effect"><a href="#" onclick="javascript:qnapage_page('', '${pageList}', '${stype}', '${sword}')">First</a></li> --%>
					</c:if>
					<c:if test="${sword == null}">
						<%-- <li class="waves-effect"><a href="#" onclick="javascript:qnapage_list('', '${pageList}')">First</a></li> --%>	
					</c:if>
				</c:if>
				<!-- //첫페이지로 가기 -->
				
				<!-- 이전 10개 -->	
				<c:if test="${block <= 1}">
					<li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
				</c:if>
				<c:if test="${block > 1}">
					<c:if test="${sword != null}">
						<%-- <li class="waves-effect"><a href="/controller/boardSearch?page=${b_start_page - 1}&list=${pageList}&stype=${stype}&sword=${sword}"><i class="material-icons">chevron_left</i></a></li> --%>
						<li class="waves-effect"><a href="#" onclick="javascript:qnapage_page('${b_start_page - 1}', '${pageList}', '${stype}', '${sword}')"><i class="material-icons">chevron_left</i></a></li>
					</c:if>
					<c:if test="${sword == null}">
						<li class="waves-effect"><a href="#" onclick="javascript:qnapage_list('${b_start_page - 1}', '${pageList}')"><i class="material-icons">chevron_left</i></a></li>
					</c:if>
				</c:if>
				<!-- //이전 10개 -->
				
				<!-- 페이지 리스트 -->
				<c:forEach var="i" begin="${b_start_page}" end="${b_end_page}">
					<c:if test="${pageNum == i}">
						<li class="active"><a href="#!" id="searchlist_paging_selected">${i}</a></li>
					</c:if>
					
					<c:if test="${pageNum != i}">
						<c:if test="${sword != null}">
							<%-- <li class="waves-effect"><a href="/controller/boardSearch?page=${i}&list=${pageList}&stype=${stype}&sword=${sword}">${i}</a></li> --%>
							<li class="waves-effect"><a href="#" onclick="javascript:qnapage_page('${i}', '${pageList}', '${stype}', '${sword}')">${i}</a></li>
						</c:if>
						<c:if test="${sword == null}">
							<li class="waves-effect"><a href="#" onclick="javascript:qnapage_list('${i}', '${pageList}')">${i}</a></li>
						</c:if>
					</c:if>
				</c:forEach>
				<!-- //페이지 리스트 -->
				
				<!-- 다음 10개 -->
				<c:if test="${block >= totalBlock}">
					<li class="disabled"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
				</c:if>
				<c:if test="${block < totalBlock}">
					<c:if test="${sword != null}">
						<%-- <li class="waves-effect"><a href="/controller/boardSearch?page=${b_end_page + 1}&list=${pageList}&stype=${stype}&sword=${sword}"><i class="material-icons">chevron_right</i></a></li> --%>
						<li class="waves-effect"><a href="#" onclick="javascript:qnapage_page('${b_end_page + 1}', '${pageList}', '${stype}', '${sword}')"><i class="material-icons">chevron_right</i></a></li>
					</c:if>
					<c:if test="${sword == null}">
						<li class="waves-effect"><a href="#" onclick="javascript:qnapage_list('${b_end_page + 1}', '${pageList}')"><i class="material-icons">chevron_right</i></a></li>
					</c:if>
					
				</c:if>
				<!-- //다음 10개 -->
				
				<!-- 마지막페이지 -->
				<!-- 
				<c:if test="${pageNum >= totalPage}">
					<li class="disabled"><a href="#!">Last</a></li>
				</c:if>
				<c:if test="${pageNum < totalPage}">
					<c:if test="${sword != null}">
						<li class="waves-effect"><a href="#" onclick="javascript:qnapage_page('${totalPage}', '${pageList}', '${stype}', '${sword}')">Last</a></li>
					</c:if>
					<c:if test="${sword == null}">
						<li class="waves-effect"><a href="#" onclick="javascript:qnapage_list('${totalPage}', '${pageList}')">Last</a></li>
					</c:if>
				</c:if>
				 -->
				<!-- //마지막페이지 -->
			</ul>
		</div>
	</div>
</div>

</body>
</html>