/*Cookie Record*/
function createCookie(id){
 var movieList = Cookies.getJSON("movieList"); //쿠키에서 영화목록을 jsonString 방식으로 받는다
 //console.log(typeof movieList);
 
 if(typeof movieList == "undefined"){ //쿠키에 영화목록이 없으면 jsonString 생성
    movieList = {"movies" : [id]};
 }else { //있으면 추가
    b = true;
    for(i = 0; i < movieList["movies"].length; i++){ //중복 검사
       if(id === movieList["movies"][i]){
          b = false;
       }
    }
    if(b === true && movieList["movies"].length < 50){ //로딩 시간 단축과 url 길이를 조절하기 위해 50개까지 저장할 수 있게끔 제한
       movieList["movies"].push(id);
    }else {
       //alert("이미 선택된 영화입니다.");
    }
    console.log(movieList["movies"]/* + " " + movieList["movies"].length*/);
 }
 //readCookie();
 Cookies.set('movieList', movieList, {expires : 365}); //365일 동안 유지된다
}

function readCookie(){
 var movieList = Cookies.get("movieList", {path:'/'});
 console.log(movieList);
 $("#cookieList").val(movieList);
 alert($("#cookieList").val());
}

//for cookie 11 15 02 26
function page_move_genre(s_page, s_genre){
   var f = document.frm_page;
   f.genre.value = s_genre; 
   f.pageNum.value = s_page; 
   f.submit();
};
/////////////////////////////////////////////////////////////////////////////////////////////////
