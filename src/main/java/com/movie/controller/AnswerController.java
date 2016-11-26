package com.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.movie.answermodel.AnswerBean;
import com.movie.answermodel.AnswerDaoInter;
import com.movie.answermodel.AnswerDto;


@Controller
public class AnswerController {

	@Autowired
	private AnswerDaoInter inter;

	/*
	//�꽑�깮�옄猷�
	@RequestMapping("answerDetail")
	public ModelAndView answerDetail(@RequestParam("no") String a_no){
		boardController �솗�씤
	}
	*/
	
	//�떟蹂��벑濡앹셿猷�
	@RequestMapping(value="answerWrite", method=RequestMethod.POST, headers={"Content-type=application/json"})
	@ResponseBody	
	public String answerWrite(@RequestBody AnswerBean bean){
		boolean b = false;
		try {
			b = inter.answerInsert(bean);
			inter.answerBoardUpdate(bean.getA_no());
		} catch (Exception e) {
			System.out.println("answerWrite err: " + e);
		}
		if(b)
			return "redirect:boardList";
		else
			return "redirect:resources/error.jsp";
	}

	@RequestMapping(value="answerUpdate", method=RequestMethod.GET)
	public ModelAndView answerUpdate(@RequestParam("a_no") String a_no){
		ModelAndView modelAndView = new ModelAndView();
		AnswerDto answer = inter.answerSelectPart(a_no);
		modelAndView.setViewName("redirect:boardDetail?b_no="+a_no);
		modelAndView.addObject("answer", answer);
		modelAndView.addObject("mode", a_no);
		return modelAndView;
	}
	
	//�뾽�뜲�씠�듃�셿猷�
	@RequestMapping(value="answerUpdate", method=RequestMethod.POST, headers={"Content-type=application/json"})
	@ResponseBody	
	public String answerUpdate(@RequestBody AnswerBean bean){
		inter.answerUpdate(bean);
			return "redirect:boardList";
	}
	
	//�궘�젣
	@RequestMapping("answerDelete")
	public String answerDelete(@RequestParam("a_no") String a_no){
		if(inter.answerDelete(a_no)){
			inter.answerBoardUpdateReset(a_no);
			return "redirect:boardList";
		}else{
			return "redirect:resources/error.jsp";
		}
	}
	
	@RequestMapping("selectAllDelete")
	public String selectAllDelete(@RequestParam("a_no") String a_no){
		if(inter.answerCount(a_no) > 0){
			if(inter.answerDelete(a_no)){
				inter.answerBoardDelete(a_no);
				return "redirect:boardList";
			}else{
				return "redirect:resources/error.jsp";
			}
		}else{
			inter.answerBoardDelete(a_no);
			return "redirect:boardList";
		}
	}
	
}














