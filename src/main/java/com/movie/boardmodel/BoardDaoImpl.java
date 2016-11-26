package com.movie.boardmodel;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.movie.resources.MovieAnnoInter;

@Repository
public class BoardDaoImpl implements BoardDaoInter{
	
	@Autowired
	private MovieAnnoInter inter;
	
	@Override
	public List<BoardDto> selectDataAll(Map<String, Integer> map) {
		return inter.selectDataAll(map);
	}
	
	@Override
	public List<BoardDto> selectSearchData(Map<String, String> map) {
		return inter.selectSearchData(map);
	}
	
	@Override
	public BoardDto boardSelectPart(BoardBean bean) {
		return inter.boardSelectPart(bean);
	}
	
	@Override
	public int b_noMax() {
		return inter.b_noMax();
	}
	
	@Override
	public int totalCount() {
		return inter.totalCount();
	}
	
	@Override
	public int totalSearchCount(Map<String, String> map) {
		return inter.totalSearchCount(map);
	}
	
	@Override
	public int checkPass(BoardBean bean) {
		return inter.checkPass(bean);
	}
	
	@Override
	public boolean boardInsert(BoardBean bean) {
		return inter.boardInsert(bean);
	}
	
	@Override
	public boolean boardUpdate(BoardBean bean) {
		return inter.boardUpdate(bean);
	}
	
	@Override
	public boolean boardDelete(BoardBean bean) {
		return inter.boardDelete(bean);
	}
	
}















