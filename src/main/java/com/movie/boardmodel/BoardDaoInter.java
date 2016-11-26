package com.movie.boardmodel;

import java.util.List;
import java.util.Map;

public interface BoardDaoInter {
	List<BoardDto> selectDataAll(Map<String, Integer> map);
	List<BoardDto> selectSearchData(Map<String, String> map);
	BoardDto boardSelectPart(BoardBean bean);		
	int totalCount();
	int totalSearchCount(Map<String, String> map);
	int b_noMax();  
	int checkPass(BoardBean bean);
	boolean boardInsert(BoardBean bean);
	boolean boardUpdate(BoardBean bean);
	boolean boardDelete(BoardBean bean);
}
