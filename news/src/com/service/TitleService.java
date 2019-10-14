package com.service;

import java.util.List;

import com.po.Title;

public interface TitleService {
	public List<Title> findTitle(Title title);
	public int addTitle(Title title);
	public int updateTitle(Title title);
	public int deleteTitle(Title title);
	
}
