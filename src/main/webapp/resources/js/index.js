
/*index.jsp : search page*/
$(document).ready(function() {

	$('.single-item').slick({
		arrows: false,
		dots: true
	});
	
	//관리자 : 게시글 삭제 기능 구현 시 필요한 변수**
	var del_keyword = "";
	
	$(".button-collapse").sideNav();
	$("#search_clear").click(function(){
		document.getElementById("search").value="";
		$("#search").focus();
	});
	
	$("#search_keyword").click(function(){
		var keyword = $("#search").val();
		if(keyword != ""){
			$('#form-action').submit();
		}else{
			Materialize.toast("검색어를 입력하세요.", 3000, 'rounded');
		}
	});
	function moveicon() {
		$('#search_title_icon').animate({left : '50px'});
		$('#search_title_icon').animate({left : '100px'}, moveicon);
	}
    
	/*FullPage */    
	$('#fullpage').fullpage({
		anchors: ['section_main', 'section_search', 'section_Top100', 'section_Genre', 'section_QnA'],
		menu:'#mainmenu_container',
		autoScrolling: true,
		scrollOverflow: true
	});
    
	/*Main Film*/	
    $('.autoplay').slick({
    	slidesToShow: 4,
    	slidesToScroll: -1, /* RTL:1, LTR:-1 */
    	autoplay: true,
    	autoplaySpeed: 1000
	});
    
    /* Detail Menu show
	 * detail 메뉴 클릭 시 해당 영역 보여주기*/    
    $('#detail_table tr td, #detail_table tr th').click(function (){
    	var detailmenu = String($(this).text());
    	switch (detailmenu) {
	    	case "INFO":
				$('#INFO').show();
				$('#Actor').hide();
				$('#Photo').hide();
				$('#Trailer').hide();
				$('#detailmenu_INFO').css("color","white");
				$('#detailmenu_Actor').css("color","black");
				$('#detailmenu_Photo').css("color","black");
				$('#detailmenu_Trailer').css("color","black");
				break;
			case "Actor":
				$('#detail_content_iframe').attr("src", "../detail_actor?id=" + $('#id').val());
				$('#detail_content_iframe').show();
				
				$('#INFO').hide();
				$('#Actor').show();
				$('#Photo').hide();
				$('#Trailer').hide();
				$('#detailmenu_INFO').css("color","black");
				$('#detailmenu_Actor').css("color","white");
				$('#detailmenu_Photo').css("color","black");
				$('#detailmenu_Trailer').css("color","black");
				break;
			case "Photo":
				$('#INFO').hide();
				$('#Actor').hide();
				$('#Photo').show();
				$('#Trailer').hide();
				$('#detailmenu_INFO').css("color","black");
				$('#detailmenu_Actor').css("color","black");
				$('#detailmenu_Photo').css("color","white");
				$('#detailmenu_Trailer').css("color","black");
				break;
			case "Trailer":
				$('#INFO').hide();
				$('#Actor').hide();
				$('#Photo').hide();
				$('#Trailer').show();
				$('#detailmenu_INFO').css("color","black");
				$('#detailmenu_Actor').css("color","black");
				$('#detailmenu_Photo').css("color","black");
				$('#detailmenu_Trailer').css("color","white");
				break;
			default:
				$('#detailmenu_INFO').css("color","white");
		}
	});
    
    /*Top100 Pagination Process**********************************************/
    $(".top100_page").click(function(){
    	if(!$(this).hasClass("active")){
    		$(".top100_page").removeClass("active");
    		$('.top100_page').removeAttr('id');
    		$(this).addClass("active");
    		$(this).attr("id", "searchlist_paging_selected");
    	}
    });
    
    $("#top100_go1").click(function(){
    	$(".top100_page").removeClass("active");
    	$('.top100_page').removeAttr('id');
		$("#top100_no1").addClass("active");
		$(this).attr("id", "searchlist_paging_selected");
    });
    
    $("#top100_go5").click(function(){
    	$(".top100_page").removeClass("active");
    	$('.top100_page').removeAttr('id');
		$("#top100_no5").addClass("active");
		$(this).attr("id", "searchlist_paging_selected");
    });
    
    //url주소 바뀌는지 확인 (top100 chart refresh 위함)
	window.onhashchange = function() {
		var url = location.href;
		if(url.indexOf("#section_Top100/1") > -1){
			$('#ifrm_Chart').attr('src', '../r_msgChart');				
		}
	};
    
    /*Genre in ready*********************************************************/
    $('#pageA tr td').click(function() { //add1 , #pageB tr td
        //alert($(this).text()); //ok
        var genre = String($(this).text());
        
        var url = "";
        switch(genre){
           case 'Action': url = '../movieList_genre?genre=28'; break;
           case 'Comedy': url = '../movieList_genre?genre=35'; break;
           case 'Drama': url = '../movieList_genre?genre=18'; break;
           case 'Fantasy': url = '../movieList_genre?genre=14'; break;
           case 'Horror': url = '../movieList_genre?genre=27'; break;
           case 'SF': url = '../movieList_genre?genre=878'; break;
           case 'Animation': url = '../movieList_genre?genre=16'; break;
           case 'Romance': url = '../movieList_genre?genre=10749'; break;
           case 'Thriller': url = '../movieList_genre?genre=53'; break;
           case 'Documentary': url = '../movieList_genre?genre=99'; break;
        }
        
        //alert($(this).parent().parent().attr('id'));
        var id = String($(this).parent().parent().attr('id'));
        if(id === "pageA"){
            $('#pageA tr td').css("background-color", "grey");
            $('#pageA tr .' + genre).css("background-color", "rgb(100, 100, 110)");
            
            $("#ifA").attr("src", url);
            
            //(이미지 보여주기 처리)
            $('.wrap-loading').removeClass('display-none');
            
            $(function() {
            	$('#ifA').load(function(){
            		//(이미지 감추기 처리)
                    $('.wrap-loading').addClass('display-none');		
            	});
            });
            location.href = '#section_Genre/0';
        }
     });
     //set movie_genre table height 100%
     $('.fp-tableCell').css('height', '100%');
     //set movieList values
     //readCookie();
     
    /*QnA(Modal) in ready*********************************************************/
    /* slick , modal 충돌  ==> $('.modal-trigger').leanModal({...}))  */ 
    $('.modal').modal({
        dismissible: true, // Modal can be dismissed by clicking outside of the modal
        opacity: .5, // Opacity of modal background
    });
    
    top100_load("list");
    //페이지 준비 완료 시 QnA게시글 가져오기
    qnapage_load("list");
});

/*searchList Paging*************************************************************************************************************************************/
function page_move(pageNum, keyword){
	var state = $('#main_searchlist').css('display'); // state 변수에 ID가 moreMenu인 요소의 display의 속성을 '대입'
	var html= '';
	var show = $('#slideshow');
    if(state == 'none'){ // state가 none 상태일경우 
//        $('#main_searchlist').empty(); 
        $('#main_searchlist').show(); 
    }
    
    $.ajax({
    	type:"POST",
    	url:"../movieList",
    	data:"keyword="+keyword+"&pageNum="+pageNum,
    	dataType:"text", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
    	success : function(data) {
    		show.html("");
    		html += data;
    		show.html(html);
    		$.fn.fullpage.reBuild();
    	},
    	beforeSend:function(){
//          (이미지 보여주기 처리)
          $('.wrap-loading').removeClass('display-none');
    	},
    	complete:function(){
//          (이미지 감추기 처리)
          $('.wrap-loading').addClass('display-none');
    	},
    	error : function(xhr, status, error) {
    		var $toastContent = $('<span>검색 결과가 없습니다. 이전 페이지로 돌아갑니다.</span>');
    		Materialize.toast($toastContent, 3000, 'rounded');
    		history.back();
    	}
    });
    
    $("#sectionsearch").animate( { scrollTop : 0 }, 400 );
    
	location.href="/controller/resources/index.jsp#section_search/slide2";

};

/* searchlist Ajax  
 * 검색 할 때 searchlist로 갈 때의 ajax처리*/
function mainsearch_silder(){
	var search = $('#search').val();
	var state = $('#main_searchlist').css('display'); // state 변수에 ID가 moreMenu인 요소의 display의 속성을 '대입'
	var html= '';
	var show = $('#slideshow');
    if(state == 'none'){ // state가 none 상태일경우 
        $('#main_searchlist').show();
    }
    $.ajax({
    	type:"POST",
    	url:"../movieList",
    	data:"keyword="+search,
    	dataType:"text", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
    	success : function(data) {
    		if(data == ""){
    			var $toastContent = $('<span>검색 결과가 없습니다.</span>');
        		Materialize.toast($toastContent, 3000, 'rounded');
        		location.href="/controller/resources/index.jsp#section_search/slide1";
    		}else{
    			html += data;
    			show.html(html);
    			$.fn.fullpage.reBuild();    			
    		}
    	},
        beforeSend:function(){
//            (이미지 보여주기 처리)
            $('.wrap-loading').removeClass('display-none');
        },
        complete:function(){
//            (이미지 감추기 처리)
            $('.wrap-loading').addClass('display-none');
     
        },
    	error : function(xhr, status, error) {
    		var $toastContent = $('<span>검색 결과가 없습니다.</span>');
    		Materialize.toast($toastContent, 3000, 'rounded');
    		history.back();
    	}
    });
    location.href="/controller/resources/index.jsp#section_search/slide2";
}

/* movieDetail Ajax
 * 검색 후에 영화 제목을 클릭한 후 무비디테일로 갈 때의 ajax처리*/
function movieDetail(id){
	$('#detailmenu_INFO').css("color","white");
	$('#detailmenu_Actor').css("color","black");
	$('#detailmenu_Photo').css("color","black");
	$('#detailmenu_Trailer').css("color","black");
	var state = $('#main_searchdetail').css('display'); 
	var html= '';
	var show = $('#slidedetailshow');
	if(state == 'none'){ // state가 none 상태일경우
        $('#main_searchdetail').show(); 
    }
	$.ajax({
    	type:"POST",
    	url:"../detail",
    	data:"id="+id,
    	dataType:"text", 
    	success : function(data) {
    		$('.wrap-loading').addClass('display-none');
    		html += data;
    		show.html(html);
    		$.fn.fullpage.reBuild();
    	},
    	beforeSend:function(){
//          (이미지 보여주기 처리)
          $('.wrap-loading').removeClass('display-none');
    	},
    	complete:function(){
//          (이미지 감추기 처리)
          $('.wrap-loading').addClass('display-none');
   
    	},
    	error : function(xhr, status, error) {
    		var $toastContent = $('<span>상세 결과가 없습니다. 이전 페이지로 돌아갑니다.</span>');
    		Materialize.toast($toastContent, 5000, 'rounded');
    		history.back();
    	}
    });
    location.href="/controller/resources/index.jsp#section_search/slide3";
 }

/*Cookie Record*/
//cookies************************************************************************************************************************************
//////////////////////////////////////////////////////////////////////////////////////////add2
function removeMovieFromCookie(id){ //특정 영화를 쿠키에서 제거
    var movieList = Cookies.getJSON("movieList");
    if(typeof movieList == "undefined"){
	return
    }else {
	b = false;
	for(i = 0; i < movieList["movies"].length; i++){
    	    if(id === movieList["movies"][i]){
		delete movieList["movies"][i];
		movieList["movies"].splice(i, 1);
		i--;
	    }
	}
	    console.log(movieList["movies"]/* + " " + movieList["movies"].length*/);
    }
    Cookies.set('movieList', movieList);
}

function deleteCookie() { //영화목록 전체삭제
    Cookies.remove('movieList', {path:'/'});
    console.log("cookie deleted");
}

function open_log() { //팝업창 열기
	if(Cookies.get("movieList", {path:'/'}) === undefined || Cookies.get("movieList", {path:'/'}).length < 14) {
		Materialize.toast("선택된 영화가 없습니다.", 3000, 'rounded');
	}else {
		var url = "../cookies?movieList=" + Cookies.get("movieList", {path:'/'})
		window.open(url, '_blank', 'scrollbars=no,menubar=no,height=600,width=500,resizable=no,toolbar=no,status=no');   
	}
}
/////////////////////////////////////////////////////////////////////////////////////////////////

//Top100************************************************************************************************************************************
//r_msg msg
function r_msgSubmit(){
     var inp = input_text.value.length;
     var area = textarea1.value.length;
     var moviename = r_movie_name2.value;

     if (moviename == '') {
        Materialize.toast('영화를 선택해주세요!', 3000, 'rounded');
        return false;
     } else if (inp == 0 || inp > 5) {
        Materialize.toast('내용을 제대로 작성해주세요!', 3000, 'rounded');
        input_text.value = "";
        input_text.focus();
        return false;
     } else if (area == 0 || area > 90) {
        Materialize.toast('내용을 제대로 작성해주세요!', 3000, 'rounded');
        textarea1.value = "";
        textarea1.focus();
        return false;
     }
     top100_load("insert");
     return false;
}

function top100_load(url_type){
	if(url_type == "list"){
		$(".top100_load").load("/controller/r_msg");
	}
	else if(url_type == "insert"){
		var r_name = $("input:text[name=r_name]").val();	
		var r_msg = $("textarea[name=r_msg]").val();
		var r_movie_id = $("input:hidden[name=r_movie_id]").val();
		var r_like = $("input:radio[name=r_like]:checked").val();
		var r_movie_name = $("input:hidden[name=r_movie_name]").val();
		
		$.ajax({
			type : "POST",
			url : "/controller/r_insert",
			data : JSON.stringify({'r_name' : r_name, 'r_msg' : r_msg, 'r_movie_id' : r_movie_id, 'r_like' : r_like, 'r_movie_name' : r_movie_name}),
			dataType:"text",
			contentType : "application/json; charset=UTF-8",
			success:function(result) {
				if(result.indexOf("error") == -1){
					var strArray = result.split(':');
					$(".top100_load").load(strArray[1]);
					Materialize.toast('덧글을 등록했습니다.', 3000, 'rounded');
		    	}else{
		    		Materialize.toast("저장하지 못했습니다. 개발자에게 문의주세요.", 3000);
		    	}
			}
		});
	}
}

function top100_delete_id(r_id){
	$.ajax({
		type : "POST",
		url : "/controller/r_delete",
		data : {'r_id' : r_id},
		dataType:"text",
		success:function(result) {
			$(".top100_load").html(result);
			Materialize.toast('덧글을 삭제했습니다.', 3000, 'rounded');
		}
	});
}
/*
function top100_pageload(){
	//1122
    //(이미지 보여주기 처리)
    $('.preloader-wrapper').removeClass('display-none');
	//alert("1234asdf");
    $(function() {
    	$("iframe[name=top100]").load(function(){
    		//(이미지 감추기 처리)
            $('.preloader-wrapper').addClass('display-none');
    		//alert("asdf1234");
    	});
	});
}
*/
//QnA************************************************************************************************************************************
function qnapage_load(url_type){
	//===============boardList
	if(url_type == "list"){
		$(".qna_load").load("/controller/boardList");
		$.fn.fullpage.reBuild();
	}
	//===============boardSearch
	else if(url_type == "search"){
		var stype = $("select[name=stype]").val();
		var sword = $("input:text[name=sword]").val();
		$.ajax({
			type : "GET",
			url : "/controller/boardSearch",
			data : {'stype' : stype, 'sword' : sword},
			dataType:"text",
			success:function(result) {
				$(".qna_load").html(result);
				$.fn.fullpage.reBuild();
			}
		});
	}
	//===============boardDetail
	else if(url_type == "detail"){
		var b_no = $("input:hidden[name=b_no]").val();
		var b_pass = $("input[name=b_pass]").val();
		$.ajax({
			type : "POST",
			url : "/controller/boardDetail",
			data : JSON.stringify({'b_no' : b_no, 'b_pass' : b_pass}),
			contentType: 'application/json',
			dataType:"text",
			success:function(result) {
				$('#modalPass').modal('close');
				if(result.indexOf("password_not_matched") == -1){
					$(".qna_load").html(result);
		    	}else{
		    		Materialize.toast("비밀번호가 틀렸습니다.", 3000, 'rounded');
		    	}
				$.fn.fullpage.reBuild();
			}
		});
	}
	//===============boardUpdate -> Detail(back)
	else if(url_type == "back"){
		var b_no = $("input:hidden[name=back_no]").val();
		var b_pass = $("input:hidden[name=back_pass]").val();
		$.ajax({
			type : "POST",
			url : "/controller/boardDetail",
			data : JSON.stringify({'b_no' : b_no, 'b_pass' : b_pass}),
			contentType: 'application/json',
			dataType:"text",
			success:function(result) {
				$('#modalPass').modal('close');
				if(result.indexOf("password_not_matched") == -1){
					$(".qna_load").html(result);
		    	}else{
		    		Materialize.toast("비밀번호가 틀렸습니다.", 3000, 'rounded');
		    	}
				$.fn.fullpage.reBuild();
			}
		});
	}	
	//===============boardWrite Get
	else if(url_type == "write_get"){
		/*$(".qna_load").load("/controller/boardWrite");*/
		/*$.fn.fullpage.reBuild( );*/
		$.ajax({
			type : "GET",
			url : "/controller/boardWrite",
			dataType:"text",
			success:function(result) {
				$(".qna_load").html(result);
				$.fn.fullpage.reBuild();
			}
		});
	}	
	//===============boardWrite Post
	else if(url_type == "write_post"){
		var b_no = $("input:hidden[name=b_no]").val();
		var b_title = $("input:text[name=b_title]").val();
		var b_name = $("input:text[name=b_name]").val();
		var b_email = $("input[name=b_email]").val();	
		var b_tel = $("input[name=b_tel]").val();
		var b_content = $("textarea[name=b_content]").val();
		var b_pass = $("input:text[name=b_pass]").val();

		$.ajax({
			type : "POST",
			url : "/controller/boardWrite",
			data : JSON.stringify({'b_no' : b_no, 'b_title' : b_title, 'b_name' : b_name, 
					'b_email' : b_email, 'b_tel' : b_tel, 'b_content' : b_content, 'b_pass' : b_pass}),
			contentType: 'application/json',
			dataType:"text",
			success:function(result) {
				var strArray = result.split(':');
				$(".qna_load").load('/controller/' + strArray[1]);
				$.fn.fullpage.reBuild();
			}
		});
	}
	//===============boardDelete Post
	else if(url_type == "delete"){
		var b_no = $("input:hidden[name=b_no]").val();
		var b_pass = $("input[name=b_pass]").val();
		
		$.ajax({
			type : "POST",
			url : "/controller/boardDelete",
			data : JSON.stringify({'b_no' : b_no, 'b_pass' : b_pass}),
			contentType: 'application/json',
			dataType:"text",
			success:function(result) {
				/*$('#modalPass').modal('close');*/
				if(result.indexOf(":") == -1){
					Materialize.toast("비밀번호가 틀렸습니다.", 3000, 'rounded');
				}else{  //게시판으로 이동
					var strArray = result.split(':');
					$(".qna_load").load('/controller/' + strArray[1]);
					Materialize.toast("게시글이 삭제되었습니다.", 3000, 'rounded');
					$(".qna_load").load(result);
				}
				$.fn.fullpage.reBuild();
			}
		});
	}	
	//===============boardUpdate GET
	else if(url_type == "update_get"){
		   var b_no = $("input:hidden[name=b_no]").val();
		   var b_pass = $("input[name=b_pass]").val();
		   $.ajax({
		     type : "POST",
		     url : "/controller/boardUpdate_get",
		     data : JSON.stringify({'b_no' : b_no, 'b_pass' : b_pass}),
		     dataType:"text",
		     contentType : "application/json; charset=UTF-8",
		     success:function(result) {
		    	 if(result.indexOf("password_not_matched") == -1){
		    		 $(".qna_load").html(result);
		    	 }else{
		    		 Materialize.toast("비밀번호가 틀렸습니다.", 3000, 'rounded');
		    	 }
		    	 $.fn.fullpage.reBuild();
		     }
		   });
		}  
	//===============boardUpdate POST
	else if(url_type == "update_post"){
		var b_no = $("input:hidden[name=b_no]").val();
		var b_title = $("input:text[name=b_title]").val();
		var b_name = $("input:text[name=b_name]").val();
		var b_email = $("input[name=b_email]").val();	
		var b_tel = $("input[name=b_tel]").val();
		var b_content = $("textarea[name=b_content]").val();
		var b_pass = $("input:text[name=b_pass]").val();
		
		$.ajax({
			type : "POST",
			url : "/controller/boardUpdate_post",
			data : JSON.stringify({'b_no' : b_no, 'b_title' : b_title, 'b_name' : b_name, 
				'b_email' : b_email, 'b_tel' : b_tel, 'b_content' : b_content, 'b_pass' : b_pass}),
			dataType:"text",
			contentType : "application/json; charset=UTF-8",
			success:function(result) {
				$('#modalPass').modal('close');
				if(result.indexOf(":") == -1){
					$(".qna_load").load(result);
				}else{
					var strArray = result.split(':');
					$(".qna_load").load('/controller/' + strArray[1]);
				}
				$.fn.fullpage.reBuild();
			}
		});
	}
}

function qnapage_page(page, list, stype, sword){
	$.ajax({
		type : "GET",
		url : "/controller/boardSearch",
		data : {'page' : page, 'list' : list, 'stype' : stype, 'sword' : sword},
		dataType:"text",
		success:function(result) {
			$(".qna_load").html(result);
			$.fn.fullpage.reBuild();
		}
	});
}

function qnapage_list(page, list){
	$.ajax({
		type : "GET",
		url : "/controller/boardList",
		data : {'page' : page, 'list' : list},
		dataType:"text",
		success:function(result) {
			$(".qna_load").html(result);
			$.fn.fullpage.reBuild();
		}
	});
}

function admin_login(send){
	//login - get
	if(send == "get"){
		$.ajax({
			type : "GET",
			url : "/controller/adminLogin",
			dataType:"text",
			success:function(result) {
				$(".qna_load").html(result);
				$.fn.fullpage.reBuild();
			}
		});
	}
	//login - post
	else if(send == "post"){
		var id = $("input:text[name=id]").val();
		var password = $("input[name=password]").val();
		$.ajax({
			type : "POST",
			url : "/controller/adminLogin",
			data : {'id' : id, 'password' : password},
			dataType:"text",
			success:function(result) {
				if(result.indexOf("password_not_matched") == -1){
					Materialize.toast("관리자 계정으로 로그인 했습니다.", 3000, 'rounded');
					/*top100_load("list");*/
					$(".top100_load").load("/controller/r_msg");
					$(".qna_load").html(result);
				}
				else{
					Materialize.toast("비밀번호가 틀렸습니다.", 3000, 'rounded');
				}	
				$.fn.fullpage.reBuild();
			}
		});
	}
	//logout
	else if(send == "out"){
		$.ajax({
			type : "GET",
			url : "/controller/adminLogout",
			dataType:"text",
			success:function(result) {
				Materialize.toast("관리자 계정을 로그아웃 했습니다.", 3000, 'rounded');
				/*top100_load("list");*/
				$(".top100_load").load("/controller/r_msg");
				$(".qna_load").html(result);
				$.fn.fullpage.reBuild();
			}
		});
	}	
}

function admin_load(num){
	var b_no = num;
	$.ajax({
		type : "POST",
		url : "/controller/boardDetail",
		data : JSON.stringify({'b_no' : b_no}),
		contentType: 'application/json',
		dataType:"text",
		success:function(result) {
			if(result.indexOf("password_not_matched") == -1){
				$(".qna_load").html(result);
			}else{
				Materialize.toast("비밀번호가 틀렸습니다.", 3000, 'rounded');
			}
			$.fn.fullpage.reBuild();
		}
	});
	closePwd();
}

function answer_load(send){
	//답글 쓰기
	if(send == "write"){
	 	var a_no = $("input:hidden[name=a_no]").val();
		var a_title = $("input:text[name=a_title]").val();
		var a_content = $("textarea[name=a_content]").val();
		
		if (a_title == "") {
			Materialize.toast("제목을 입력하세요.", 3000, 'rounded');
			$("input:text[name=a_title]").focus();
			return;
		}
		if (a_content == "") {	
			Materialize.toast("내용을 입력하세요.", 3000, 'rounded');
			$("textarea[name=a_content]").focus();
			return;
		} 

		$.ajax({
			type : "POST",
			url : "/controller/answerWrite",
			data : JSON.stringify({'a_no' : a_no, 'a_title' : a_title, 'a_content' : a_content}),
			contentType : "application/json; charset=UTF-8",
			dataType:"text",
			success:function(result) {
				Materialize.toast("답변을 저장 했습니다.", 3000, 'rounded');
				var strArray = result.split(':');
				$(".qna_load").load('/controller/' + strArray[1]);
				$.fn.fullpage.reBuild();
			}
		});
	}
	//답글 수정
	else if(send == "update"){
	 	var a_no = $("input:hidden[name=a_no]").val();
	 	$.ajax({
			type : "GET",
			url : "/controller/answerUpdate",
			data : {'a_no' : a_no},
			dataType:"text",
			success:function(result) {
				$(".qna_load").html(result);
				$.fn.fullpage.reBuild();
			}
		});
	}
	//답글 수정 저장
	else if(send == "update_save"){
	 	var a_no = $("input:hidden[name=a_no]").val();
	 	var a_title = $("input:text[name=a_title]").val();
	 	var a_content = $("textarea[name=a_content]").val();
	 	$.ajax({
			type : "POST",
			url : "/controller/answerUpdate",
			data : JSON.stringify({'a_no' : a_no, 'a_title' : a_title, 'a_content' : a_content}),
			dataType:"text",
			contentType : "application/json; charset=UTF-8",
			success:function(result) {
				var strArray = result.split(':');
				$(".qna_load").load('/controller/' + strArray[1]);
				Materialize.toast("답변을 저장 했습니다.", 3000, 'rounded');
				$.fn.fullpage.reBuild();
			}
		});
	}	
	//답글 삭제
	else if(send == "delete"){
	 	var a_no = $("input:hidden[name=a_no]").val();
	 	$.ajax({
			type : "GET",
			url : "/controller/answerDelete",
			data : {'a_no' : a_no},
			dataType:"text",
			success:function(result) {
				$(".qna_load").html(result);
				Materialize.toast("답변을 삭제 했습니다.", 3000, 'rounded');
				$.fn.fullpage.reBuild();
			}
		});
	}
	//게시글 & 답글 모두 삭제
	else if(send == "delete_all"){
	 	var a_no = $("input:hidden[name=a_no]").val();
	 	$.ajax({
			type : "GET",
			url : "/controller/selectAllDelete",
			data : {'a_no' : a_no},
			dataType:"text",
			success:function(result) {
				$(".qna_load").html(result);
				Materialize.toast("게시글을 삭제 했습니다.", 3000, 'rounded');
				$.fn.fullpage.reBuild();
			}
		});
	}	
}

//관리자 : 답변 update
function answerUpdate(){
	answer_load('update');
}

//관리자 : 답변 delete 구분하는 파트(답변만 or 게시글+답변 삭제)
function answerDelete(mode){
	if(mode == "delReply"){
		del_keyword = "delete";
	}else if(mode == "delAll"){
		del_keyword = "delete_all";
	}
	$('.modalText').html("정말 삭제하시겠습니까?");
	$('#modalOk').modal('open');
}

// ---Modal 설정--- //
function closePwd() {
	$('#modalPass').modal('close');
	$('#b_pass').val("");
	/*materialize과 slack의 충돌로 
	 * modal 창 다음에 맨 위 페이지로 올라가는 
	 * 현상 때문에 작성.*/
	$('#fullpage').fullpage.silentMoveTo('section_QnA');
}

function closeOk() {
	$('#modalOk').modal('close');
	/*$('#fullpage').fullpage.silentMoveTo('section_QnA');*/
}


function helpModal(){
	$('#modalHelp').modal('open');
	if(help_open == 0){
		/* Help */
		$('.slick_help').slick({
			dots: true,
			touchMove : true,
			infinite: true,
			speed: 500,
			fade: true,
			slidesToShow: 1,
			slidesToScroll: 1, /* RTL:1, LTR:-1 */
			autoplay: true,
			autoplaySpeed: 5000
		});
	}
	help_open += 1;
}
