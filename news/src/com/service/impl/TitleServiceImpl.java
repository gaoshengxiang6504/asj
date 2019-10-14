package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.TitleDao;
import com.po.Title;
import com.service.TitleService;
@Service
public class TitleServiceImpl implements TitleService{
   @Autowired
   private TitleDao titleDao;
	@Override
	public List<Title> findTitle(Title title) {
		// TODO Auto-generated method stub
		return this.titleDao.findTitle(title);
	}
	@Override
	public int addTitle(Title title) {
		// TODO Auto-generated method stub
		return titleDao.addTitle(title);
	}
	@Override
	public int updateTitle(Title title) {
		// TODO Auto-generated method stub
		return titleDao.updateTitle(title);
	}
	@Override
	public int deleteTitle(Title title) {
		// TODO Auto-generated method stub
		return titleDao.deleteTitle(title);
	}
}
