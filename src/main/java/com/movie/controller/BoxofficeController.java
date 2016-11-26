package com.movie.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;

@Controller
public class BoxofficeController {
	@RequestMapping("boxoffice")
	public HashMap<String, Object> boxoffice() {
		HashMap<String, Object> dailyResult = null;
		
		java.util.Calendar cal = java.util.Calendar.getInstance();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
		//현재 년도, 월, 일
		cal.add(cal.DATE, -1);
		String yesterday = dateformat.format(cal.getTime());
		System.out.println(yesterday);

		//일별 박스오피스
		String targetDt = yesterday;
		String itemPerPage = "10";
		String multiMovieYn = "";
		String repNationCd = "";
		String wideAreaCd = "";

		String key = "e4b048bc2090d7234c54d044ed8f83af";
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
	
		try {
			String dailyResponse = service.getDailyBoxOffice(true, targetDt, itemPerPage, multiMovieYn, repNationCd,
					wideAreaCd);
			
			ObjectMapper mapper = new ObjectMapper();
			dailyResult = mapper.readValue(dailyResponse, HashMap.class);
			
			//request.setAttribute("dailyResult", dailyResult);
			
			String codeResponse = service.getComCodeList(true, "0105000000");
			HashMap<String, Object> codeResult = mapper.readValue(codeResponse, HashMap.class);
			//request.setAttribute("codeResult", codeResult);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return dailyResult;
	}
}
