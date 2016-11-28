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
	$(this).css("display", "none"); //hide deleted movie
}

function deleteCookie() { //영
	Cookies.remove('movieList', {path:'/'});
	console.log("cookie deleted");
}
