/*Cookie Record*/
function createCookie(id){
 var movieList = Cookies.getJSON("movieList");
 console.log(typeof movieList);
 
 if(typeof movieList == "undefined"){
    movieList = {"movies" : [id]};
 }else {
    
    b = true;
    for(i = 0; i < movieList["movies"].length; i++){
       if(id === movieList["movies"][i]){
          b = false;
       }
    }
    if(b === true && movieList["movies"].length < 30){
       movieList["movies"].push(id);
       //Materialize.toast('이 영화가 찜 리스트에 추가되었어요!', 3000, 'rounded');
    }else {
       //alert("이미 선택된 영화입니다.");
    }
    console.log(movieList["movies"]/* + " " + movieList["movies"].length*/);
 }
 //readCookie();
 Cookies.set('movieList', movieList, {expires : 365}); //365일 동안 남아있음
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
