package com.movie.resources;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.movie.answermodel.AnswerBean;
import com.movie.answermodel.AnswerDto;
import com.movie.boardmodel.BoardBean;
import com.movie.boardmodel.BoardDto;

public interface MovieAnnoInter {
	//board
	@Select("select * from board order by b_no desc limit #{pageChoice}, #{pageList}")
	List<BoardDto> selectDataAll(Map<String, Integer> map);
	
	@Select("select * from board where ${stype} like concat('%', #{sword}, '%') order by b_no desc limit #{pageChoice}, #{pageList}")
	List<BoardDto> selectSearchData(Map<String, String> map);
	
	@Select("select * from board where b_no=#{b_no}")
	BoardDto boardSelectPart(BoardBean bean);
	
	@Select("select count(*) from board") 
	int totalCount();
	
	@Select("select count(*) from board where ${stype} like concat('%', #{sword}, '%')")
	int totalSearchCount(Map<String, String> map);
	
	@Select("select max(b_no) from board") 
	int b_noMax();
	
	@Select("select count(*) from board where b_no=#{b_no} and b_pass=#{b_pass}")
	int checkPass(BoardBean bean);
	
	@Insert("insert into board values (#{b_no}, #{b_name}, #{b_pass}, #{b_email}, #{b_tel}, #{b_title}, #{b_content}, now(), 0)")
	boolean boardInsert(BoardBean bean);
	
	@Update("update board set b_name=#{b_name}, b_pass=#{b_pass}, b_email=#{b_email}, b_tel=#{b_tel}, b_title=#{b_title}, b_content=#{b_content} where b_no=#{b_no}")
	boolean boardUpdate(BoardBean bean);
	
	@Delete("delete from board where b_no=#{b_no}")
	boolean boardDelete(BoardBean bean);
	

	//admin
	@Select("select count(*) from admin where id=#{id} and password=#{password}") 
	int adminLogin(Map<String, String> map);

	
	//answer
	@Select("select * from answer where a_no=#{a_no}")
	AnswerDto answerSelectPart(String a_no);
	
	//보드 상태수정
	@Update("update board set b_state=1 where b_no=#{b_no}")
	boolean answerBoardUpdate(String b_no);
	
	@Update("update board set b_state=0 where b_no=#{b_no}")
	boolean answerBoardUpdateReset(String b_no);
	
	@Insert("insert into answer values (#{a_no}, #{a_title}, #{a_content}, now())") 
	boolean answerInsert(AnswerBean bean);
	
	@Update("update answer set a_title=#{a_title}, a_content=#{a_content} where a_no=#{a_no}")
	boolean answerUpdate(AnswerBean bean);
	
	@Select("select count(*) from answer where a_no=#{a_no}")
	int answerCount(String a_no);
	
	@Delete("delete from answer where a_no=#{a_no}")
	boolean answerDelete(String a_no);
	
	@Delete("delete from board where b_no=#{b_no}")
	boolean answerBoardDelete(String b_no);
}



















