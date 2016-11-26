<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
 	<link rel="stylesheet" href="/controller/resources/css/index.css">
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>	
<header>
	<!-- top menu start -->  
	<div class="navbar-fixed"> <!-- fixed topbar -->
		<nav class="topbar">
			<div class="row">
				<div class="col s2 m3 l3" style="text-align: right;">
					<a href="resources/index.jsp"><i class="large material-icons" id="img_icon">movie</i></a>				
				</div>
				<div class="col s8 m6 l6">
					<nav class="searchBar z-depth-0 col s8 m6 l6">
					  <div class="nav-wrapper">
					    <form action="../controller/movieList" id="form-action" method="post">
					      <div class="input-field">
					        <input type="search" name="keyword" id="search" class="autocomplete" placeholder="영화 제목을 검색하세요" required>
					        <label for="search"><i class="material-icons" id="search_keyword">search</i></label>
					        <i class="material-icons" id="search_clear">close</i>
					      </div>
					    </form>
					  </div>
					</nav>
				</div>			
				<div class="col s2 m3 l3"></div>			
			</div>
		</nav>
	</div>  
	<!-- top menu end -->  
</header>
