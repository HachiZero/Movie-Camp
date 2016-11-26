package com.movie.resources;

public class Constant {
	public static final String KOBIS_KEY = "fbfb0ceafa07f356234a048e8614c3a7";
	
	public static final String TMDB_KEY = "?api_key=d1b9b3017556e3c7a76ab26c7b941033";
	public static final String TMDB_SEARCH_URL = "https://api.themoviedb.org/3/search/movie";
	public static final String TMDB_DETAIL_URL = "https://api.themoviedb.org/3/movie/";
	public static final String TMDB_COMPANY_URL = "https://api.themoviedb.org/3/company/";
	public static final String TMDB_SEARCH_LANG = "&language=ko-KR";
	public static final String TMDB_SEARCH_Q = "&query=";
	public static final String TMDB_SEARCH_PAGE = "&page=";
	public static final String TMDB_SEARCH_IMAGE = "/images";
	public static final String TMDB_SEARCH_VIDEO = "/videos";
	public static final String TMDB_SEARCH_SIMILAR = "/similar";
	public static final String TMDB_SEARCH_CREDIT = "/credits";
	
	//Genre
	public static final String TMDB_SEARCH_GENRE = "&with_genre="; //add
    public static final String TMDB_SEARCH_MOVIE = "/movies"; //add
    public static final String TMDB_DISCOVER_URL = "https://api.themoviedb.org/3/genre/"; //add
    
    //Top100
    public static final String TMDB_POPULAR_URL = "https://api.themoviedb.org/3/movie/popular";
}
