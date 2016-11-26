package com.movie.adminmodel;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.resources.MovieAnnoInter;

@Repository
public class AdminDaoImpl implements AdminDaoInter{
	
	@Autowired
	private MovieAnnoInter inter;
	
	@Override
	public int adminLogin(Map<String, String> map) {
		return inter.adminLogin(map);
	}
}
