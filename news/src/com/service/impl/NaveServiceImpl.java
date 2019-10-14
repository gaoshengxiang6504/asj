package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.NaveDao;
import com.po.Nave;
import com.service.NaveService;

@Service
public class NaveServiceImpl implements NaveService {
 @Autowired
 private NaveDao naveDao;
@Override
public List<Nave> findByTitle(Nave nave) {
	// TODO Auto-generated method stub
	return this.naveDao.findByTitle(nave);
}


}
