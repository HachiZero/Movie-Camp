package com.movie.r_msgmodel;

import java.util.List;
import java.util.Map;

public interface R_MsgInter {
	
	List<R_MsgDto> R_MsgSelectAll();
	List<R_MsgDto> R_MsgGoodList();
	List<R_MsgDto> R_MsgBedList();
	boolean R_MsgDelete(String r_id);
	boolean R_MsgDelay(String r_ip);
	boolean R_MsgInsert(R_MsgBean bean);
	String R_MsgCount();
	String R_MsgGoodCount();
	String R_MsgBedCount();
}
