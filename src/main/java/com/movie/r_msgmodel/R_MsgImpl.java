package com.movie.r_msgmodel;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.movie.resources.R_MsgAnnoInter;

@Repository
public class R_MsgImpl implements R_MsgInter {
	
	@Autowired
	private R_MsgAnnoInter inter;
	
	
	@Override
	public List<R_MsgDto> R_MsgSelectAll() {
		return inter.R_MsgSelectAll();
	}
	
	@Override
	public String R_MsgCount() {
		return inter.R_MsgCount();
	} 
	
	@Override
	public boolean R_MsgInsert(R_MsgBean bean) {
		try {
			inter.R_MsgInsert(bean);
			return true;
		} catch (Exception e) {
			System.out.println("insert err "+e);
			return false;
		}
		
		
	}
	
	@Override
	public boolean R_MsgDelay(String r_ip) {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public boolean R_MsgDelete(String r_id) {
		boolean b = false;
		b = inter.R_MsgDelete(r_id);
		return b;
	}
	
	@Override
	public List<R_MsgDto> R_MsgBedList() {
		return inter.R_MsgBedList();
	}
	
	@Override
	public List<R_MsgDto> R_MsgGoodList() {
		return inter.R_MsgGoodList();
	}
	
	@Override
	public String R_MsgBedCount() {
		return inter.R_MsgBedCount();
	}
	
	@Override
	public String R_MsgGoodCount() {
		return inter.R_MsgGoodCount();
	}

}
