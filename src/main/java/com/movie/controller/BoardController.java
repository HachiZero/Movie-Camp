package com.movie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.movie.answermodel.AnswerDaoInter;
import com.movie.answermodel.AnswerDto;
import com.movie.boardmodel.BoardBean;
import com.movie.boardmodel.BoardDaoInter;
import com.movie.boardmodel.BoardDto;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDaoInter inter;

	@Autowired
	private AnswerDaoInter answerDaoInter; 
	
	//�쟾泥댁옄猷�
	@RequestMapping("/boardList")
	public ModelAndView listProcess(@RequestParam(value="page", defaultValue="1") String page , @RequestParam(value="list", defaultValue="10") String list, HttpSession session){
		session.setAttribute("stype", null);
		session.setAttribute("sword", null);
		int pageNum = 1; //�븯�떒 �럹�씠吏� �닔
		int pageList = 10; //1�럹�씠吏��뿉 蹂댁뿬吏� 寃뚯떆湲� �닔
		int b_pageList = 10; //1釉붾윮�뿉 蹂댁뿬吏� �럹�씠吏� �닔;
		int block = 1; //釉붾윮 �닔
		//�븯�떒 �럹�씠吏��닔
		try{
			pageNum = Integer.parseInt(page);
		}catch(Exception e){
			pageNum = 1; 
		}
		if(pageNum <= 0) pageNum = 1; 
		

		// 寃뚯떆湲��닔
		try{
			pageList = Integer.parseInt(list);
		}catch(Exception e){
			pageList = 10; 
		}
		if(pageList <= 0) pageList = 1;
		// /寃뚯떆湲��닔
		
		block = (int)Math.ceil((double)pageNum/b_pageList); 

		int b_start_page = ((block-1) * b_pageList) + 1; 
		int b_end_page = b_start_page + b_pageList - 1; 

		int totalPage = (int)Math.ceil((double)inter.totalCount()/pageList); 
		if (b_end_page > totalPage) b_end_page = totalPage; 

		int totalBlock = (int)Math.ceil((double)totalPage/b_pageList); 

		//DB limit (db�뒗 �떆�옉�럹�씠吏�媛� 0);
		int pageChoice = (pageNum - 1) * pageList; //
		
		Map<String, Integer> map = new HashMap();
		map.put("pageChoice", pageChoice);
		map.put("pageList", pageList);
		
		List<BoardDto> boardlist = inter.selectDataAll(map);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("board/boardList");
		
		modelAndView.addObject("list", boardlist);
		modelAndView.addObject("pageNum", pageNum);
		modelAndView.addObject("pageList", pageList);
		modelAndView.addObject("block", block);
		modelAndView.addObject("b_start_page", b_start_page);
		modelAndView.addObject("b_end_page", b_end_page);
		modelAndView.addObject("totalPage", totalPage);
		modelAndView.addObject("totalBlock", totalBlock);
		
		return modelAndView;
	}

	//검색
	@RequestMapping("boardSearch")
	public ModelAndView searchProcess(@RequestParam("stype") String stype, @RequestParam("sword") String sword, @RequestParam(value="page", defaultValue="1") String page , @RequestParam(value="list", defaultValue="10") String list, HttpSession session){
		session.setAttribute("stype", stype);
		session.setAttribute("sword", sword);
		int pageNum = 1; //페이지 초기값 설정
		int pageList = 10; //1~10
		int b_pageList = 10; //마지막 페이지
		int block = 1; //釉붾윮 �닔
		//�븯�떒 �럹�씠吏��닔
		try{
			pageNum = Integer.parseInt(page);
		}catch(Exception e){
			pageNum = 1; //parameter page媛믪씠 �젣��濡� �븞�뱾�뼱�삤硫� 1;
		}
		if(pageNum <= 0) pageNum = 1; //parameter page媛� �씠�긽�븳媛� �뱾�뼱�삤硫� 1;
		// /�븯�떒 �럹�씠吏��닔

		// 寃뚯떆湲��닔
		try{
			pageList = Integer.parseInt(list);
		}catch(Exception e){
			pageList = 10; 
		}
		if(pageList <= 0) pageList = 1; 
		// /寃뚯떆湲��닔
		
		block = (int)Math.ceil((double)pageNum/b_pageList); 

		int b_start_page = ((block-1) * b_pageList) + 1; 
		int b_end_page = b_start_page + b_pageList - 1; 
		
		Map<String, String> searchMap = new HashMap();
		searchMap.put("stype", stype);
		searchMap.put("sword", sword);

		int totalPage = (int)Math.ceil((double)inter.totalSearchCount(searchMap)/pageList); 
		
		if (b_end_page > totalPage) b_end_page = totalPage; 

		int totalBlock = (int)Math.ceil((double)totalPage/b_pageList); 

		//DB limit (db�뒗 �떆�옉�럹�씠吏�媛� 0);
		int pageChoice = (pageNum - 1) * pageList; //
		
		String pageC = String.valueOf(pageChoice);
		String pageL = String.valueOf(pageList);
		
		Map<String, String> map = new HashMap();
		map.put("pageChoice", pageC);
		map.put("pageList", pageL);
		map.put("stype", stype);
		map.put("sword", sword);
		
		List<BoardDto> boardlist = inter.selectSearchData(map);
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("board/boardList");
		System.out.println("===========================================" + boardlist);
		modelAndView.addObject("list", boardlist);
		modelAndView.addObject("pageNum", pageNum);
		modelAndView.addObject("pageList", pageList);
		modelAndView.addObject("block", block);
		modelAndView.addObject("b_start_page", b_start_page);
		modelAndView.addObject("b_end_page", b_end_page);
		modelAndView.addObject("totalPage", totalPage);
		modelAndView.addObject("totalBlock", totalBlock);
		
		return modelAndView;
	}
	
	//board detail post
	@RequestMapping(value="boardDetail", method=RequestMethod.POST, headers={"Content-type=application/json"}) 
	@ResponseBody
	public ModelAndView detailProcess(@RequestBody BoardBean bean, HttpSession session){
		ModelAndView modelAndView = new ModelAndView();
		String admin = (String)session.getAttribute("admin");
		int b = 0;
		
		if(admin == null) b = inter.checkPass(bean);
		else b = 1;
		if(b > 0){
			BoardDto dto = inter.boardSelectPart(bean);
			modelAndView .addObject("dto", dto);
			if(dto.getB_state() != "0") {
				AnswerDto answer = answerDaoInter.answerSelectPart(bean.getB_no());
				modelAndView.addObject("answer", answer);
			}
			modelAndView.setViewName("board/boardDetail");
		}else{
			modelAndView.setViewName("board/checkFalse");
		}
		return modelAndView;
	}

	//board detail get
	@RequestMapping(value="boardDetail", method=RequestMethod.GET) 
	public ModelAndView detailProcess_get(BoardBean bean, HttpSession session){
		ModelAndView modelAndView = new ModelAndView();
		String admin = (String)session.getAttribute("admin");
		int b = 0;
		
		if(admin == null) b = inter.checkPass(bean);
		else b = 1;
		if(b > 0){
			BoardDto dto = inter.boardSelectPart(bean);
			modelAndView .addObject("dto", dto);
			if(dto.getB_state() != "0") {
				AnswerDto answer = answerDaoInter.answerSelectPart(bean.getB_no());
				modelAndView.addObject("answer", answer);
			}
			modelAndView.setViewName("board/boardDetail");
		}else{
			modelAndView.setViewName("board/checkFalse");
		}
		return modelAndView;
	}	
	
	//board write get
	@RequestMapping(value="boardWrite", method=RequestMethod.GET)
	public ModelAndView writeProcess(BoardBean bean){
		ModelAndView modelAndView = new ModelAndView();
		int count = 1;
		try {
			count = inter.b_noMax() + 1;
		} catch (Exception e) {
			count = 1;
		}
		modelAndView.setViewName("board/boardWrite");
		modelAndView.addObject("count", count);
		return modelAndView; //酉곕꽕�엫 
	}
	
	//board write post
	@RequestMapping(value="boardWrite", method=RequestMethod.POST, headers = {"Content-type=application/json"})
	@ResponseBody
	public String writeSubmit(@RequestBody BoardBean bean){
		System.out.println("JSON.stringify : " + bean);
		boolean b = false;
		try {
			b = inter.boardInsert(bean);
		} catch (Exception e) {
			System.out.println("boardWrite err: " + e);
		}
		if(b)
			return "redirect:boardList";
		else
			return "redirect:resources/error.jsp";
	}

	//수정 페이지 로드
	@RequestMapping(value="boardUpdate_get", method=RequestMethod.POST, headers = {"Content-type=application/json"})
	@ResponseBody	
	public ModelAndView updateProcess(@RequestBody BoardBean bean){
		ModelAndView modelAndView = new ModelAndView();
		int b = inter.checkPass(bean);

		if(b > 0){
			BoardDto dto = inter.boardSelectPart(bean);
			modelAndView.setViewName("board/boardUpdate");
			modelAndView.addObject("dto", dto);
		}else{
			modelAndView.setViewName("board/checkFalse");
		}
		return modelAndView; //酉곕꽕�엫 
	}
	
	//수정 처리
	@RequestMapping(value="boardUpdate_post", method=RequestMethod.POST, headers = {"Content-type=application/json"})
	@ResponseBody	
	public String updateSubmit(@RequestBody BoardBean bean){
		if(inter.boardUpdate(bean))
			return "redirect:boardList";
		else
			return "redirect:resources/error.jsp";
	}
	
	//삭제
	@RequestMapping(value="boardDelete", method=RequestMethod.POST, headers = {"Content-type=application/json"})
	@ResponseBody
	public String delteSubmit(@RequestBody BoardBean bean){
		int b = inter.checkPass(bean);
		if(b > 0){
			if(answerDaoInter.answerCount(bean.getB_no()) > 0){
				if(answerDaoInter.answerDelete(bean.getB_no())){
					if(inter.boardDelete(bean)){
						return "redirect:boardList";
					}else{
						return "board/checkFalse";/*return "redirect:resources/error.jsp";*/
					}
				}else{
					return "board/checkFalse";/*return "redirect:resources/error.jsp";*/
				}
			}else{
				if(inter.boardDelete(bean)){
					return "redirect:boardList";			
				}
				return "board/checkFalse";/*"redirect:resources/error.jsp";*/		
			}
		}else{	
			return "board/checkFalse";
		}
	}

}
