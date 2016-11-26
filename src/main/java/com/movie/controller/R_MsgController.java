package com.movie.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.movie.r_msgmodel.R_MsgBean;
import com.movie.r_msgmodel.R_MsgDto;
import com.movie.r_msgmodel.R_MsgInter;



@Controller
public class R_MsgController {
	
	@Autowired
	private R_MsgInter inter;
	
	private int pageSize = 10; // 한 페이지당 출력 행 수
	
	@RequestMapping(value="/r_msg")
	public ModelAndView select(@RequestParam(value="pagenum", defaultValue="1")String pagenum){
		int currentPage = Integer.parseInt(pagenum); // 페이지 쪽 수 
		int startRow = (currentPage -1)* pageSize; // 0부터 숫자..
		int endRow = pageSize;
		
		int count = Integer.parseInt(inter.R_MsgCount());
		ModelAndView view = new ModelAndView();
		
		List<R_MsgDto> list = inter.R_MsgSelectAll();
		
		view.setViewName("r_msg/r_msgList");
		view.addObject("list",list);
		view.addObject("count",count);
		
		return view;
	}
	
	@RequestMapping(value="/r_delete", method=RequestMethod.POST)
	public String delete(@RequestParam(value="r_id")String r_id){
		
		boolean b = inter.R_MsgDelete(r_id);
		
		if(b) return "redirect:/r_msg"; /* "redirect:/resources/index.jsp#section_Top100";*/
		else return "redirect:resources/error.jsp"; /*"redirect:../error.jsp";*/
	}
	
	@RequestMapping(value="/r_insert", method=RequestMethod.POST, headers={"Content-type=application/json"})
	@ResponseBody
	public String insert(@RequestBody R_MsgBean bean){
		try {
//			클라이언트 아이피를 가져오는 작업
			 HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		        String ip = req.getHeader("X-FORWARDED-FOR");
		        if (ip == null)
		            ip = req.getRemoteAddr();
		        System.out.println("clientIP : "+ ip);
		        bean.setR_ip(ip);
		}catch (Exception e) {
			System.out.println("ip err"+e);
		}
		//System.out.println(dto.getR_movie_name());
		// 스크립트 입력 방어 xss
				String xss = bean.getR_msg();
				xss = xss.replaceAll("<", "&lt;");
				xss = xss.replaceAll(">", "&gt;");
		        xss = xss.replaceAll("\\(", "&#40;");
		        xss = xss.replaceAll("\\)", "&#41;");
		        xss = xss.replaceAll("'", "&#39;");
		        xss = xss.replaceAll("eval\\((.*)\\)", "");
		        xss = xss.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
		        //System.out.println("=========================================="+xss);
		        bean.setR_msg(xss);
		boolean b = inter.R_MsgInsert(bean);
		System.out.println("b : " + b);
		if(b) return "redirect:/controller/r_msg"; /*"redirect:/resources/index.jsp#section_Top100";*/
		else return "redirect:resources/error.jsp"; /*"redirect:../error.jsp";*/
	}
	
	@RequestMapping(value="/r_msgChart")
	public ModelAndView chart(){
		ModelAndView view = new ModelAndView();
		List<R_MsgDto> goodlist = inter.R_MsgGoodList();
		String tag = "";
		String tag2 = "";
		// list의 테스트 값을 받아 형변환 해주는 역
		for (R_MsgDto list : goodlist) {
			tag += "['"+list.getR_movie_name()+"',"+list.getGood()+"],";
		}
		//System.out.println(tag);
		List<R_MsgDto> bedlist = inter.R_MsgBedList();
		for (R_MsgDto list2 : bedlist){
			tag2 += "['"+list2.getR_movie_name()+"',"+list2.getBed()+"],";
		}
		String goodcount = inter.R_MsgGoodCount();
		String bedcount = inter.R_MsgBedCount();
		
		view.setViewName("r_msg/r_msgChart");
		view.addObject("goodlist",tag);
		view.addObject("goodcount",goodcount);
		view.addObject("bedlist",tag2);
		view.addObject("bedcount",bedcount);
		
		return view;
	}
}

