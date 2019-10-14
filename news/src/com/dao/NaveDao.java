package com.dao;

import java.util.List;

import com.po.Nave;

public interface NaveDao {
  public List<Nave> findByTitle(Nave nave);

}
