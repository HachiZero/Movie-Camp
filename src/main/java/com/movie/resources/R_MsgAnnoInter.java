package com.movie.resources;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.movie.r_msgmodel.R_MsgBean;
import com.movie.r_msgmodel.R_MsgDto;



public interface R_MsgAnnoInter {
	
	@Select("select DATE_FORMAT(r_date,'%Y/%m/%d/%H:%i:%s') as r_date, r_ip, r_name, r_msg,r_movie_name,r_like,r_id from r_msg order by r_date desc")
	List<R_MsgDto> R_MsgSelectAll();
	@Select("select count(*) as r_msg_count from r_msg")
	String R_MsgCount();
	@Select("select count(r_like) as good, r_movie_name from r_msg where r_like = 'good' GROUP BY r_like,r_movie_name")
	List<R_MsgDto> R_MsgGoodList();
	@Select("select count(r_like) as bed, r_movie_name from r_msg where r_like = 'bed' GROUP BY r_like,r_movie_name")
	List<R_MsgDto> R_MsgBedList();
	@Select("select count(r_like) as goodcount from r_msg WHERE r_like = 'good'")
	String R_MsgGoodCount();
	@Select("select count(r_like) as bedcount from r_msg WHERE r_like = 'bed'")
	String R_MsgBedCount();
	@Insert("INSERT INTO r_msg(r_ip,r_name,r_date,r_msg,r_movie_id,r_like,r_movie_name) VALUES (#{r_ip},#{r_name},now(),#{r_msg},#{r_movie_id},#{r_like},#{r_movie_name})")
	boolean R_MsgInsert(R_MsgBean bean);
	@Delete("DELETE from r_msg WHERE r_id=#{r_id}")
	boolean R_MsgDelete(String id);
}
