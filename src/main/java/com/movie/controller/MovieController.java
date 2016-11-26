package com.movie.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.HttpClientBuilder;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.movie.resources.Constant;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;

@Controller
public class MovieController {

	public HashMap<String, Object> genreList = null;
	private ObjectMapper mapper = new ObjectMapper(); // JSON Handling

	@RequestMapping(value = "/boxoffice", method = RequestMethod.GET)
	public ModelAndView boxoffice_kobis() {
		HashMap<String, Object> dailyResult = null;
		java.util.Calendar cal = java.util.Calendar.getInstance();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
		// 현재 년도, 월, 일
		cal.add(cal.DATE, -1);
		String yesterday = dateformat.format(cal.getTime());
		// System.out.println(yesterday);

		// 일별 박스오피스
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(Constant.KOBIS_KEY);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("targetDt", yesterday);

		try {
			String dailyResponse = service.getDailyBoxOffice(true, map);

			ObjectMapper mapper = new ObjectMapper();
			dailyResult = mapper.readValue(dailyResponse, HashMap.class);
		} catch (Exception e) {
			System.out.println("boxoffice_kobisDaily Error : " + e);
		}
		
		//주간 박스오피스
		java.util.Calendar cal2 = java.util.Calendar.getInstance();
		cal2.add(cal2.DATE, -7);
		String lastweek = dateformat.format(cal2.getTime());
		//System.out.println("lastweek: "+lastweek);
		HashMap<String, Object> weeklyResult = null;
		HashMap<String, String> map2 = new HashMap<String, String>();
		try {
			map2.put("targetDt", lastweek);
			map2.put("weekGb", "0");
			String weeklyResponse = service.getWeeklyBoxOffice(true, map2);
			weeklyResult = mapper.readValue(weeklyResponse, HashMap.class);
		} catch (Exception e) {
			System.out.println("boxoffice_kobisWeekly Error : " + e);
		}
		System.out.println("weeklyResult: "+weeklyResult);
		
		
		// System.out.println("dailyResult : " + dailyResult);
		ModelAndView view = new ModelAndView("main");
		view.addObject("dailyResult",dailyResult);
		view.addObject("weeklyResult",weeklyResult);
		return view;
	}

	@RequestMapping(value = "/movieList", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView movieList_tmdb(@RequestParam("keyword") String keyword,
			@RequestParam(value = "pageNum", defaultValue = "1") String pageNum, HttpSession session)
			throws JSONException, ClientProtocolException, IOException {
		//System.out.println("movieList: "+pageNum+" "+keyword);
		HashMap<String, Object> tmdb_result = null;

		String url = Constant.TMDB_SEARCH_URL + Constant.TMDB_KEY + Constant.TMDB_SEARCH_LANG
				+ Constant.TMDB_SEARCH_PAGE;
		try {
			String sEncoded = URLEncoder.encode(keyword, "UTF-8");
			tmdb_result = mapper.readValue(new URL(url + pageNum + Constant.TMDB_SEARCH_Q + sEncoded), HashMap.class);
			// System.out.println(url + pageNum + Constant.TMDB_SEARCH_Q +
			// sEncoded);
		} catch (Exception e) {
			System.out.println("movieList_tmdb Error : " + e);
		}
		if(tmdb_result.get("total_results").toString().trim().equals("0")){
			return null;
		}else{
			tmdb_result.put("keyword", keyword);
			tmdb_result.put("pageNum", pageNum);
			int currentPageLimitNum = (Integer.parseInt(pageNum)/10)+1;
			if(Integer.parseInt(pageNum) % 10 == 0)	currentPageLimitNum = Integer.parseInt(pageNum)/10;
			tmdb_result.put("currentPageLimitNum", currentPageLimitNum);
			// System.out.println("movieController: "+tmdb_result);
			//System.out.println("total pages = "+tmdb_result.get("total_pages"));
			return new ModelAndView("movieList", "movie_info", tmdb_result);			
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public ModelAndView movieinfo_tmdb(@RequestParam("id") String id)
			throws JSONException, ClientProtocolException, IOException {
		System.out.println("==============================================");
		HashMap<String, Object> tmdb_detail = null;
		HashMap<String, Object> tmdb_videos = null;
		HashMap<String, Object> tmdb_images = null;
		HashMap<String, Object> tmdb_credit = null;

		String url_detail = Constant.TMDB_DETAIL_URL + id + Constant.TMDB_KEY + Constant.TMDB_SEARCH_LANG;
		String url_videos = Constant.TMDB_DETAIL_URL + id + Constant.TMDB_SEARCH_VIDEO + Constant.TMDB_KEY;
		String url_images = Constant.TMDB_DETAIL_URL + id + Constant.TMDB_SEARCH_IMAGE + Constant.TMDB_KEY;
		String url_credit = Constant.TMDB_DETAIL_URL + id + Constant.TMDB_SEARCH_CREDIT + Constant.TMDB_KEY;

		try {
			tmdb_detail = mapper.readValue(new URL(url_detail), HashMap.class);
			tmdb_videos = mapper.readValue(new URL(url_videos), HashMap.class);
			tmdb_images = mapper.readValue(new URL(url_images), HashMap.class);
			tmdb_credit = mapper.readValue(new URL(url_credit), HashMap.class);
		} catch (Exception e) {
			System.out.println("movieinfo_tmdb Error : " + e);
		}
		tmdb_detail.put("videos", tmdb_videos);
		tmdb_detail.put("images", tmdb_images);
		tmdb_detail.put("credit", tmdb_credit);

		// System.out.println("tmdb_videos : " + tmdb_videos);
		// System.out.println("tmdb_images : " + tmdb_images);
		// System.out.println("tmdb_credit : " + tmdb_credit);
		// System.out.println("tmdb_detail : " + tmdb_detail);

		// 영어 자료
		String url_detailEn = Constant.TMDB_DETAIL_URL + id + Constant.TMDB_KEY + "&language=en-US";
		HashMap<String, Object> tmdb_detailEn = null;
		try {
			tmdb_detailEn = mapper.readValue(new URL(url_detailEn), HashMap.class);
		} catch (Exception e) {
			// TODO: handle exception
		}

		// 만약 한국어 줄거리가 없으면..
		if (tmdb_detail.get("overview") == "" || tmdb_detail.get("overview") == null) {
			System.out.println(tmdb_detail.get("overview"));
			tmdb_detail.put("overview", tmdb_detailEn.get("overview"));
		}

		String movieNmEn2 = (String) tmdb_detailEn.get("title");
		String movieNmEn = movieNmEn2.replace(" ", "+");

		String openDt = (String) tmdb_detailEn.get("release_date").toString().substring(0,
				tmdb_detailEn.get("release_date").toString().indexOf("-"));

		// IMDB
	      String imdb_url = "http://www.omdbapi.com/?t=" + movieNmEn + "&y=" + openDt + "&plot=full&r=json";
	      // System.out.println(imdb_url);
	      HashMap<String, Object> imdbResult = mapper.readValue(new URL(imdb_url), HashMap.class);
	      // System.out.println(imdbResult);
	      String imdbID = "";
	      if (imdbResult.containsKey("Error")) {
	         // System.out.println("Error!");
	         try {
	            imdbResult = mapper.readValue(new URL("http://www.omdbapi.com/?t=" + movieNmEn + "&y="
	                  + (Integer.parseInt(openDt) - 1) + "&plot=full&r=json"), HashMap.class);
	            imdbID = imdbResult.get("imdbID").toString();
	         } catch (Exception e) {

	         }
	      }else{
	    	  imdbID = imdbResult.get("imdbID").toString();
	    	  
	      }

	      HttpPost http = new HttpPost("http://www.imdb.com/title/" + imdbID + "/soundtrack");
	      HttpClient httpClient = HttpClientBuilder.create().build();
	      HttpResponse response = httpClient.execute(http);
	      HttpEntity entity = response.getEntity();
	      ContentType contentType = ContentType.getOrDefault(entity);
	      Charset charset = contentType.getCharset();
	      BufferedReader br = new BufferedReader(new InputStreamReader(entity.getContent(), charset));
	      StringBuffer sb = new StringBuffer();
	      String line = "";

	      String soundtrack_title = "";

	      while ((line = br.readLine()) != null) {
	         if (line.contains("Performed by")) {
	            soundtrack_title += line + "\n";
	            
	         }
	         if (line.contains("soundTrack soda")) {
	            soundtrack_title += line + "\n";

	         }
	         sb.append(line + "\n");
	      }
	      // System.out.println(sb.toString().substring(sb.indexOf("soundtracks_content"),
	      // sb.indexOf("see_also")));

	      String str2 = soundtrack_title.replace("</div>", "");
	      String str3 = str2.replace("\n", "");
	      String str4 = str3.replace("\t", "");
	      String str5 = str4.replace("  ", "");
	      String[] str1 = str5.split("<br />");

	      String soundtrack = "";
	      for (int i = 0; i < str1.length; i++) {
	         if (str1[i].contains("<")) {
	            str1[i] = str1[i].substring(str1[i].indexOf(">") + 1, str1[i].length());
	            if (str1[i].contains("</a>")) {
	               str1[i] = str1[i].substring(0, str1[i].indexOf("<"));
	               soundtrack += str1[i - 1] + "\t" + str1[i] + "\n";
	            }
	         }

	         // System.out.println(i+" : "+str1[i]+" flag : "+flag1+"
	         // "+flag2+"\n");
	      }
	      String[] soundtrackarr = soundtrack.split("\n");
	      // for(String a:soundtrackarr){
	      // //System.out.println(a);
	      // }
	      // System.out.println(soundtrack);

	      // Youtube
	      String youtube_search1 = soundtrackarr[0].replace(" ", "+");
	      String youtube_search = youtube_search1.replace("\t", "+");
	      HttpPost http2 = new HttpPost("https://www.youtube.com/results?search_query=" + youtube_search);
	      HttpClient httpClient2 = HttpClientBuilder.create().build();
	      HttpResponse response2 = httpClient2.execute(http2);
	      HttpEntity entity2 = response2.getEntity();
	      ContentType contentType2 = ContentType.getOrDefault(entity2);
	      Charset charset2 = contentType2.getCharset();
	      BufferedReader br2 = new BufferedReader(new InputStreamReader(entity2.getContent(), charset));
	      StringBuffer sb2 = new StringBuffer();
	      String line2 = "";

	      String youtubelist = "";

	      while ((line2 = br2.readLine()) != null) {

	         if (line2.contains("/watch?")) {
	            try {
	               youtubelist += line2.substring(line2.indexOf("/watch?"), line2.indexOf("yt-uix-sessionlink"))
	                     + "\n";
	               // System.out.println("try: "+youtubelist);

	            } catch (Exception e) {
	               // System.out.println("catch: "+youtubelist);
	               youtubelist = "error";
	            }
	         }

	         sb2.append(line2 + "\n");

	      }
	      // System.out.println("youtube: "+youtubelist);
	      String str10 = youtubelist.replace("<li>", "");
	      String str11 = str10.replace("<div>", "");
	      // System.out.println(str11);
	      String str12 = str11.replace("\" class=\"", "");
	      String str13 = str12.replace("/watch?v=", "");
	      // System.out.println("str13: "+str13);
	      String[] soundtracklist = str13.split("\n");
	      // for(String a:soundtracklist){
	      // System.out.println("a: "+a);
	      // }
	      // System.out.println("soundtracklist[0]: "+soundtracklist[0]);
	      
	      String soundtrack_info = soundtrackarr[0].replace("\t", " -");
	      
	      if (soundtracklist[0].contains("error")) {
	         soundtracklist[0] = "qiJcXAuOMNU";
	         soundtrack_info = "la campanella -list";
	      }
	      tmdb_detail.put("soundtrack", soundtracklist[0]);
	      tmdb_detail.put("soundtrack_info", soundtrack_info);		System.out.println(tmdb_detail.get("overview"));
		return new ModelAndView("detail/movieDetail", "detail_info", tmdb_detail);
	}

	//////////////////////////////////////////////////////// add
	@RequestMapping(value = "/movieList_genre")
	public ModelAndView movieList_tmdb_genre(@RequestParam("genre") String genre,
			@RequestParam(value = "pageNum", defaultValue = "1") String pageNum, HttpSession session)
			throws JSONException, ClientProtocolException, IOException {
		HashMap<String, Object> tmdb_result = null;

		String sEncoded = URLEncoder.encode(genre, "UTF-8");
		String url = Constant.TMDB_DISCOVER_URL + sEncoded + Constant.TMDB_SEARCH_MOVIE + Constant.TMDB_KEY
				+ Constant.TMDB_SEARCH_LANG + Constant.TMDB_SEARCH_PAGE;
		try {
			tmdb_result = mapper.readValue(new URL(url + pageNum), HashMap.class);
			System.out.println(url + pageNum);
			///
			tmdb_result.put("pageNum", pageNum);
			int currentPageLimitNum = (Integer.parseInt(pageNum) / 10) + 1;
			if (Integer.parseInt(pageNum) % 10 == 0)
				currentPageLimitNum = Integer.parseInt(pageNum) / 10;
			tmdb_result.put("currentPageLimitNum", currentPageLimitNum);
			tmdb_result.put("genre", genre);
			System.out.println(url + ", " + pageNum + ", " + currentPageLimitNum);
			///
		} catch (Exception e) {
			System.out.println("movieList_tmdb Error : " + e);
		}
		System.out.println(tmdb_result);

		return new ModelAndView("movieList_genre", "movie_info", tmdb_result);
	}
	//////////////////////////////////////////////////////////
	// FOR COOKIES

	@RequestMapping(value = "/cookies", method = RequestMethod.GET)
	public ModelAndView cookieList(@RequestParam("movieList") String movieList, HttpSession session,
			HttpServletResponse response, HttpServletRequest request)
			throws JSONException, ClientProtocolException, IOException {
		JSONObject list = new JSONObject(movieList);
		JSONArray movies = list.getJSONArray("movies");
		System.out.println("movieList : " + movies);
		int length = movies.length();
		ArrayList<String> moviesList = new ArrayList<String>(); // codes array
		for (int i = 0; i < movies.length(); i++) {
			moviesList.add((String) movies.get(i)); // ok
		}

		// make movieList
		JSONArray movielist = new JSONArray();
		JSONObject movieDetail = null, movieList_cookie = new JSONObject();
		InputStream is = null;
		BufferedReader rd = null;
		for (String code : moviesList) {
			String url = Constant.TMDB_DETAIL_URL + code + Constant.TMDB_KEY + Constant.TMDB_SEARCH_LANG;
			System.out.println(url);
			try {
				is = new URL(url).openStream();
				rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
				String jsonText = readAll(rd);
				System.out.println(jsonText);
				movieDetail = new JSONObject(jsonText);
				is.close();
				// movieDetail = mapper.readValue(new URL(url),
				// JSONObject.class);
				System.out.println(movieDetail);

				String original_title = (String) movieDetail.get("original_title");
				String title = (String) movieDetail.get("title"); // korean
																	// title
				String overview = (String) movieDetail.get("overview");
				String vote_average = String.valueOf(movieDetail.get("vote_average"));
				String release_date = (String) movieDetail.get("release_date");
				String poster_path = (String) movieDetail.get("poster_path");
				String backdrop_path = (String) movieDetail.get("backdrop_path");
				JSONArray genres = movieDetail.getJSONArray("genres");
				// System.out.println(original_title + ", " + poster_path);

				movieDetail = new JSONObject();
				movieDetail.put("original_title", original_title);
				movieDetail.put("title", title);
				movieDetail.put("overview", overview);
				movieDetail.put("vote_average", vote_average);
				movieDetail.put("release_date", release_date);
				movieDetail.put("poster_path", poster_path);
				movieDetail.put("backdrop_path", backdrop_path);
				movieDetail.put("genres", genres);
				movieDetail.put("code", code);

			} catch (Exception e) {
				System.out.println("movieList_design Error : " + e);
			}
			movielist.put(movieDetail);
		}
		System.out.println(movielist);

		movieList_cookie.put("movies", movielist);
		System.out.println(movieList_cookie);
		System.out.println(movieList_cookie.get("movies"));
		return new ModelAndView("cookiePopup2", "movieList", jsonToMap(movieList_cookie));
	}

	// read json from web
	private static String readAll(Reader rd) throws IOException {
		StringBuilder sb = new StringBuilder();
		int cp;
		while ((cp = rd.read()) != -1) {
			sb.append((char) cp);
		}
		return sb.toString();
	}

	// json -> Map
	public static Map<String, Object> jsonToMap(JSONObject json) throws JSONException {
		Map<String, Object> retMap = new HashMap<String, Object>();
		if (json != JSONObject.NULL) {
			retMap = toMap(json);
		}
		return retMap;
	}

	public static Map<String, Object> toMap(JSONObject object) throws JSONException {
		Map<String, Object> map = new HashMap<String, Object>();

		Iterator<String> keysItr = object.keys();
		while (keysItr.hasNext()) {
			String key = keysItr.next();
			Object value = object.get(key);

			if (value instanceof JSONArray) {
				value = toList((JSONArray) value);
			} else if (value instanceof JSONObject) {
				value = toMap((JSONObject) value);
			}
			map.put(key, value);
		}
		return map;
	}

	public static List<Object> toList(JSONArray array) throws JSONException {
		List<Object> list = new ArrayList<Object>();
		for (int i = 0; i < array.length(); i++) {
			Object value = array.get(i);
			if (value instanceof JSONArray) {
				value = toList((JSONArray) value);
			}

			else if (value instanceof JSONObject) {
				value = toMap((JSONObject) value);
			}
			list.add(value);
		}
		return list;
	}

	// Top100
	@RequestMapping(value = "/top100")
	public ModelAndView movieRank_tmdb(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum,
			HttpSession session) throws JSONException, ClientProtocolException, IOException {
		HashMap<String, Object> tmdb_result = null;

		String url = Constant.TMDB_POPULAR_URL + Constant.TMDB_KEY + Constant.TMDB_SEARCH_LANG
				+ Constant.TMDB_SEARCH_PAGE;
		try {
			tmdb_result = mapper.readValue(new URL(url + pageNum), HashMap.class);
			tmdb_result.put("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println("movieList_tmdb Error : " + e);
		}

		return new ModelAndView("r_msg/topList", "movie_info", tmdb_result);
	}

	@RequestMapping(value = "/detail_actor")
	public ModelAndView movieinfo_tmdb_actor(@RequestParam("id") String id)
			throws JSONException, ClientProtocolException, IOException {
		System.out.println("==============================================");
		HashMap<String, Object> tmdb_credit = null;

		String url_credit = Constant.TMDB_DETAIL_URL + id + Constant.TMDB_SEARCH_CREDIT + Constant.TMDB_KEY;

		try {
			tmdb_credit = mapper.readValue(new URL(url_credit), HashMap.class);
		} catch (Exception e) {
			System.out.println("movieinfo_tmdb Error : " + e);
		}
		System.out.println("tmdb_credit: " + tmdb_credit);
		return new ModelAndView("detail/detail_actor", "detail_info", tmdb_credit);
	}

}
