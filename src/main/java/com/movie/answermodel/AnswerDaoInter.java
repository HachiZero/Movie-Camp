package com.movie.answermodel;

public interface AnswerDaoInter {
	AnswerDto answerSelectPart(String a_no);
	boolean answerBoardUpdate(String b_no); 
	boolean answerBoardUpdateReset(String b_no);
	boolean answerInsert(AnswerBean bean);
	boolean answerUpdate(AnswerBean bean);
	int answerCount(String a_no);
	boolean answerDelete(String a_no);
	boolean answerBoardDelete(String b_no);
	
}
