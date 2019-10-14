package com.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ContentDao;
import com.po.Content;
import com.service.ContentService;
@Service
public class ContentServiceImpl implements ContentService {
@Autowired
private ContentDao contentDao;
	@Override
	public int addContent(Content content) {
		// TODO Auto-generated method stub
		return contentDao.addContent(content);
	}
	@Override
	public Content listContent(Content content) {
		// TODO Auto-generated method stub
		return contentDao.listContent(content);
	}

}
