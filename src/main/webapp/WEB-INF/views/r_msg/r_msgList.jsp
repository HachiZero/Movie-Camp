<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	Materialize.updateTextFields();
	
    $('#ex').DataTable({
    	scrollCollapse: true,
    	"ordering": false,
        "info": false,
        "bFilter": false,
    });
    $('input#input_text, textarea#r_name').characterCounter();
    $('input#textarea1, textarea#r_msg').characterCounter();
});
</script>
<style type="text/css">
input[type="text"][disabled] {
   border-bottom: 1px solid #9e9e9e;
   box-shadow: 0 1px 0 0 #000;
   color: #9e9e9e;
}
</style>
</head>
<body>
<div class="row">
  <div class="col s12 m6 l6" style="text-align: center; color: white; border: 3px solid #00bfa5; border-radius: 8px; height: 35rem;">
 	<form name="msg" method="post" onsubmit="return r_msgSubmit();"> 
	<div class="input-field col s7 m6 l3">
		<input id="input_text" type="text" name="r_name" length="5">
		<label for="input_text">닉네임</label>
	</div>
	<div class="input-field col s12 m12 l7">
		<input disabled placeholder="영화제목" type="text" id="r_movie_name2" name="r_movie_name2" class="validate">
		<label for="r_movie_name2" style="color: #00bfa5; text-align: left;">Top100에서 영화명을 선택하면 삽입됩니다.</label>
	</div>
		<input type="hidden" name="r_movie_name" id="r_movie_name">
		<input type="hidden" name="r_movie_id" id="r_movie_id">
	<div class="input-field col s12 m12 l2 radio_option" style="text-align: left;">
		<input class="with-gap" name="r_like" type="radio" id="good" value="good" checked>
        <label for="good" title="좋아요"><img src="../resources/images/good.png" height="15px" width="15px"><!-- 좋아요 --></label>
        <input class="with-gap" name="r_like" type="radio" id="bed" value="bed">
        <label for="bed" title="싫어요"><img src="../resources/images/bed.png" height="15px" width="15px"><!-- 싫어요 --></label>
	</div>
     
	<div class="input-field col s12">
		<textarea id="textarea1" class="materialize-textarea col s8 m8 l9" name="r_msg" length="90"></textarea>
		<label for="textarea1">덧글</label>
		<button type="submit" class="btn waves-effect waves-light col s4 m4 l3" name="action" style="font-size: 0.9rem; padding: 0px;">덧글작성</button>
	</div>
    </form>
	<c:choose>
		<c:when test="${count ne 0}">
			<table id="ex" class="uk-table uk-table-hover uk-table-striped" style="zoom: 0.9;">
				<thead>
					 <tr><th>Comment List</th></tr>
				</thead>
				<tbody>
				<c:forEach var="r" items="${list}">
					<tr>
						<td class="col s12 m12 l12" style="background-color: #121212;">
							<c:choose>
								<c:when test="${r.r_like == 'good'}">
									<img src="../resources/images/good.png" height="15px" width="15px">
								</c:when>
								<c:otherwise>
									<img src="../resources/images/bed.png"  height="15px" width="15px">
								</c:otherwise>
							</c:choose>
							<b>${r.r_name}</b>
							<span style="color: #c5c5c5;">[${r.r_movie_name}]</span>
							&nbsp;
							<c:if test="${admin != null}"> 
								<img id="icon_delete" src="../resources/images/remove_mint.png" onclick="javascript:top100_delete_id(${r.r_id})" height="15px" width="15px" title="덧글삭제" style="vertical-align: top;">
							</c:if> 
							&nbsp;&nbsp;
							<span style="color: #97d5c6">${r.r_date}</span>
						</td>
					</tr>
					<tr>
						<td class="left-align col s12" colspan="2" style="background-color: #121212"> > ${r.r_msg}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</c:when>
	 	<c:otherwise>
	    	<div class="col s12"><h5>덧글이 없습니다.</h5></div>
		</c:otherwise>
	</c:choose>
  </div>
</div>
</body>
</html>