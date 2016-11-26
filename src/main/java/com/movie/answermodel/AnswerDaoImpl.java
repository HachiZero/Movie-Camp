package com.movie.answermodel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.boardmodel.BoardBean;
import com.movie.resources.MovieAnnoInter;

@Repository
public class AnswerDaoImpl implements AnswerDaoInter {
	
	@Autowired
	private MovieAnnoInter inter;
	
	@Override
	public AnswerDto answerSelectPart(String a_no) {
		return inter.answerSelectPart(a_no);
	}
	
	@Override
	public boolean answerInsert(AnswerBean bean) {
		return inter.answerInsert(bean);
	}
	
	@Override
	public boolean answerBoardUpdate(String b_no) {
		return inter.answerBoardUpdate(b_no);
	}
	
	@Override
	public boolean answerBoardUpdateReset(String b_no) {
		return inter.answerBoardUpdateReset(b_no);
	}
	
	@Override
	public boolean answerUpdate(AnswerBean bean) {
		return inter.answerUpdate(bean);
	}
	
	@Override
	public int answerCount(String a_no) {
		return inter.answerCount(a_no);
	}
	
	@Override
	public boolean answerDelete(String a_no) {
		return inter.answerDelete(a_no);
	}

	@Override
	public boolean answerBoardDelete(String b_no) {
		return inter.answerBoardDelete(b_no);
	}
	
}
