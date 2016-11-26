package com.movie.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.movie.adminmodel.AdminDaoImpl;

@Controller
public class AdminController {
	
	@Autowired
	private AdminDaoImpl dao;
	
	//로그인창으로
	@RequestMapping(value="adminLogin", method=RequestMethod.GET)
	public ModelAndView loginProcess(HttpSession session){
		ModelAndView modelAndView = new ModelAndView();
		String admin = (String)session.getAttribute("admin");
		if(admin == null){
			modelAndView.setViewName("admin/adminLogin");
		}else{
			/*modelAndView.setViewName("admin/adminManager");*/
			modelAndView.setViewName("board/boardList");
		}
		
		return modelAndView; //뷰네임 
	}

	//로그인
	@RequestMapping(value="adminLogin", method=RequestMethod.POST)
	public String loginSubmit(@RequestParam("id") String id, @RequestParam("password") String password, HttpSession session){
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", password);
		
		int b = dao.adminLogin(map);
		if(b > 0){
			session.setAttribute("admin", id);
			/*return "redirect:/resources/index.jsp";*/
			return "redirect:boardList";
		}else{
			return "admin/checkFalse";
		}
	}
	
	
	@RequestMapping(value="adminLogout", method=RequestMethod.GET)
	public String adminLogout(HttpSession session){
		session.setAttribute("admin", null);
		/*return "redirect:/resources/index.jsp";*/
		return "redirect:boardList";
	}

}



















