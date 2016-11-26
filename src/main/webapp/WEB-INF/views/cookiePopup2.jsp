<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Movie Camp - 찜꽁 영화 리스트</title>
   <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta http-equiv="cleartype" content="on">
   <meta charset="utf-8">
   <meta name="msapplication-TileColor" content="#00d573">
   <meta name="msapplication-TileImage" content="https://www.themoviedb.org/assets/bbbc36f5620f0c7d852a8d51495fdecd/images/icons/v4/mstile-144x144.png">
   <meta name="keywords" content="Movies, TV Shows, Reviews, API, Actors, Actresses, Photos, User Ratings, Synopsis, Trailers, Teasers, Credits, Cast">
   <meta name="mobile-web-app-capable" content="yes">
   <meta name="HandheldFriendly" content="True">
   <meta name="MobileOptimized" content="320">
   
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <meta name="apple-mobile-web-app-capable" content="yes">
   
   <meta name="theme-color" content="#00d573">

   
   <link rel="manifest" href="https://www.themoviedb.org/manifest.json">
   <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
   <link rel="preconnect" href="https://image.tmdb.org/" crossorigin>
   <link rel="canonical" href="https://www.themoviedb.org/movie">
   <link rel="search" type="application/opensearchdescription+xml" title="TMDb Search" href="/opensearch.xml">
   <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400italic,600,700&subset=latin' rel='stylesheet' type='text/css'>
   
   <script src="resources/js/lazysize.js" async></script>
   <script src="resources/js/tmdb_copy.js"></script>
  
   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   
   <link rel="icon" type="image/png" href="resources/images/favicon.png" sizes="32x32">
   <link rel="shortcut icon" href="/resources/images/favicon.png" type="image/x-icon">
   <link rel="icon" href="resources/images/favicon.png" type="image/x-icon">
   <link rel="stylesheet" href="resources/css/tmdb_copy.css">
   <style type="text/css">
      main{
         padding-top: 50px;
      }
      div.page_wrap:after {
          content: "";
          display: block;
          height: 0px;
      }
      div.media {
          width: 100%;
          margin: 0 auto;
          margin-top: 50px;
          margin-bottom: 10px;
      }
      .btn-floating {
         display: inline-block;
         color: #fff;
         position: relative;
         overflow: hidden;
         z-index: 1;
         width: 37px;
         height: 37px;
         line-height: 37px;
         padding: 0;
         background-color: #26a69a;
         border-radius: 50%;
         transition: .3s;
         cursor: pointer;
         vertical-align: middle;
      }   
      #img_delete:hover{
         cursor: pointer;
      } 
   </style>
   <style type="text/css">
      @import url(https://fonts.googleapis.com/css?family=Roboto:100,200,300,400,500);
      body {
        min-height: 100vh;
        overflow-x: hidden;
        font-family: Roboto;
      }
      
      .container_share {
        bottom: 0;
        position: fixed;
        margin: 1em;
        left: 0px; /* 왼쪽으로 이동시킨다 */
      }
      
      .send_button {
        box-shadow: 0px 5px 11px -2px rgba(0, 0, 0, 0.18), 
                    0px 4px 12px -7px rgba(0, 0, 0, 0.15);
        border-radius: 50%;
        display: block;
        width: 56px;
        height: 56px;
        margin: 20px auto 0;
        position: relative;
        -webkit-transition: all .1s ease-out;
                transition: all .1s ease-out;  
      }
      
      .send_button:active, 
      .send_button:focus, 
      .send_button:hover {
        box-shadow: 0 0 4px rgba(0,0,0,.14),
          0 4px 8px rgba(0,0,0,.28);
      }
      
      .send_button:not(:last-child) {
        width: 40px;
        height: 40px;
        margin: 20px auto 0;
        opacity: 0;
        -webkit-transform: translateY(50px);
            -ms-transform: translateY(50px);
                transform: translateY(50px);
      }
      
      .container_share:hover 
      .send_button:not(:last-child) {
        opacity: 1;
        -webkit-transform: none;
            -ms-transform: none;
                transform: none;
        margin: 15px auto 0;
      }
      
      /* Unessential styling for sliding up send_button at differnt speeds */
      
      .send_button:nth-last-child(1) {
        -webkit-transition-delay: 25ms;
                transition-delay: 25ms;
        background-image: url('https://cdn4.iconfinder.com/data/icons/flat-circle-content/800/circle-content-share-social-128.png');
        background-size: contain;
      }
      
      .send_button:not(:last-child):nth-last-child(2) {
        -webkit-transition-delay: 50ms;
                transition-delay: 20ms;
        background-image: url('http://cbwconline.com/IMG/Facebook-Flat.png');
        background-size: contain;
      }
      
      .send_button:not(:last-child):nth-last-child(3) {
        -webkit-transition-delay: 75ms;
                transition-delay: 40ms;
        background-image: url('http://cbwconline.com/IMG/Twitter-Flat.png');
        background-size: contain;
      }
      
      .send_button:not(:last-child):nth-last-child(4) {
        -webkit-transition-delay: 100ms;
                transition-delay: 60ms;
        background-image: url('//mud-kage.kakao.com/14/dn/btqc6xrxbuT/7VJk7YSWITkz9K9pbXEffk/o.jpg');
        background-size: contain;
      }
      
      .send_button:not(:last-child):nth-last-child(5) { /* 삭제용 버튼 */
        -webkit-transition-delay: 100ms;
                transition-delay: 60ms;
        background-image: url('https://cdn3.iconfinder.com/data/icons/flat-circle-content/512/flat-style-circle-delete-trash-64.png');
        background-size: contain;
      }
      
      /* Show tooltip content on hover */
      [tooltip]:before {
        bottom: 25%;
        font-family: arial;
        font-weight: 600;
        border-radius: 2px;
        background: #585858;
        color: #fff;
        content: attr(tooltip);
        font-size: 12px;
        visibility: hidden;
        opacity: 0;
        padding: 5px 7px;
        margin-right: 12px;
        position: absolute;
        left: 110%;
        white-space: nowrap;
      }
      [tooltip]:hover:before,
      [tooltip]:hover:after {
        visibility: visible;
        opacity: 1;
      }
   </style>
</head>
<body class="en v4">

<div class="page_wrap">

<header class="normal smaller">
  <div class="content">
    <div class="sub_media">

      <div class="left">
        <ul class="primary">
          
            <li></li>
            <li class="logo">
				<a href="#" onclick="javascript:open_home()" title="Movie Camp">
					<img width="45" height="40" src="resources/images/favicon.png">
				</a>
            </li>
            <li></li>
          
        </ul>
      </div>

    </div>
  </div>
  
</header>

<main id="main">
  <div class="media">
    <h2><span class="title">Movie Log</span></h2>
    <div id="countView"></div>

   <div class="results">
    <c:forEach var="a" items="${movieList.movies}" varStatus="status">
      <c:if test="${status.index eq 0 }">
          <c:set var="m_poster" value="${a.poster_path}" />
          <c:set var="m_title" value="${a.title} 외 ${fn:length(movieList.movies)-1}건의 영화정보" />
      </c:if>      
       
       <div class="item backdrop card ${a.code}" id="${a.title}" title="${a.poster_path}">
     
        <div class="image_content">
         <img class=" backdrop lazyload" data-sizes="auto" src="https://image.tmdb.org/t/p/w960_and_h540_bestv2${a.backdrop_path}" alt="${a.title}">
       </div>
       
       <div class="content">
         <p style="width:100%;">
            <%-- <a id="${a.code}" class="title result" href="/movie/${a.code}" title="${a.title}" alt="${a.original_title}">${a.title}</a> --%>
            ${a.title}
            <img id="img_delete" src="resources/images/X_2.png" value="${a.code}" name="deleteCookie" style="width: 5%; height: auto; left: 93%; position: absolute;">
         </p>
         <p class="meta">
           <span class="genres">
            <c:forEach var="b" items="${a.genres}">
               ${b.name} 
            </c:forEach>
         </span>
         </p>
       </div>
     </div>
     <c:set var="cnt" value="${cnt + 1}"></c:set>
   </c:forEach>
   <div id="movieCount" class="${cnt}"></div>
   </div>
  </div>
<!-- 공유하기 기능  -->
 <!-- 리스트 -->
   <nav class="container_share"> 
   
     <a href="#" class="send_button" tooltip="TrashCan" onclick="deleteAll();"></a>
     
     <a href="#" class="send_button" tooltip="Kakaotalk" onclick="send_kakao();"></a>
     
     <a href="#" class="send_button" tooltip="Twitter" onclick="send_twitter();"></a>
     
     <a href="#" class="send_button" tooltip="Facebook" onclick="send_facebook('https://www.google.com');"></a>
   
     <a class="send_button" tooltip="Share" href="#"></a>
   
   </nav>

 <!-- 기능 -->
   <script type='text/javascript'>
   //<![CDATA[
   // 사용할 앱의 JavaScript 키를 설정해 주세요.
   Kakao.init('0db815a9ddd371c9b00c21ff1765e2cb');
   // 카카오 로그인 버튼을 생성합니다.
   function send_kakao(){
      var m_id = Cookies.get("movieList", {path:'/'});
      m_id = m_id.replace(/"/gi, "'");
      var m_title = $(".item.backdrop.card").get(0).id + '외 ' + $(".item.backdrop.card").size() + '건의 영화정보';
      var m_image = $(".item.backdrop.card").get(0).title;
      /* 
      g 의 의미는: 발생할 모든 pattern에 대한 전역 검색 
      i 의 의미는: 대/소문자 구분 안함 
      m 의 의미는: 여러 줄 검색(여기서는 사용하지 않았다. 원한다면 하자.)
       */
       Kakao.Auth.login({
           //// 메모챗을 발송하기 위해서는 로그인할때 추가적인 scope 을 얻어야 한다.
           scope: "PROFILE,TALK_MESSAGE",
           success: function(res) {
               Kakao.API.request({
                   url: '/v1/api/talk/memo/send',
                   data: {
                      template_id: '1955',
                      args: '{"\${movie_name}":"' + m_title + '","\${movie_image}": "https://image.tmdb.org/t/p/w500' + m_image + '", "\${movie_id}": "' + m_id + '"}'
                   },
                   success: function(res) {
                      /* Materialize.toast('전송 성공!', 3000); */
                       console.log(res);
                   },
                   fail: function(error) {
                      /* Materialize.toast('Error!! 관리자에게 문의하세요.', 3000); */
                       Materialize.toast('Error! \n' + JSON.stringify(error), 3000, 'rounded');
                       console.log(error);
                   }
               })
           },
           fail: function(error) {
               console.log(error);
           }
       });
   }
   //]]>
   
   function send_facebook(url){
      /* Materialize.toast('facebook\n서비스 준비 중입니다.', 3000); */
      window.open('http://www.facebook.com/sharer/sharer.php?u=' + url);
      Materialize.toast('전송 성공!', 3000, 'rounded');
   }
   
   function send_twitter(){
      Materialize.toast('twitter\n서비스 준비 중입니다.', 3000, 'rounded');
   }
   </script>

</main> <!-- opened in header -->
</div> <!-- page_wrap opened in html_head -->

<script>
  function appendStyle(styles) { //show date, vote
    var css = document.createElement('style');
    css.type = 'text/css';

    if (css.styleSheet) {
      css.styleSheet.cssText = styles;
    } else {
      css.appendChild(document.createTextNode(styles));
    }

    document.getElementsByTagName("head")[0].appendChild(css);
  }
  var styles = '';
</script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script><!-- 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script> -->
    <script type="text/javascript" src="resources/js/jscookie.js"></script>
    <script type="text/javascript" src="resources/js/cookiePage.js"></script> <!-- removeMovie -->

   <script type="text/javascript">
      $("img[name='deleteCookie']").click(function() {
    	 //쿠키 삭제
         var code = $(this).attr("value");
         removeMovieFromCookie(code);
         console.log("delete success");
         $(".item.backdrop.card." + code).remove();
         
      	//count 뺌
 		 var txt = $("#countView").text();
 		 var txt1 = txt.split(' : ');
 		 var txt2 = txt1[1].split(' / ');
 		 $("#countView").text(" 현재 찜꽁된 영화 리스트 : " + (txt2[0]-1) + " / 50");
		 Materialize.toast('덧글을 삭제했습니다.', 3000, 'rounded');
	  	 
      });

      function deleteAll() {
          deleteCookie();
          window.close();
      };
      //for logo
      function open_home(){
    	  window.open("http://localhost:8080/controller/resources/index.jsp", "_blank")
      }
      $(document).ready(function() {
    	  var movieList = $("#movieCount").attr("class");
    	  $("#countView").text(" 현재 찜꽁된 영화 리스트 : " + movieList + " / 50");
      });
      
   </script>
  </body>
</html>