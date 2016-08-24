package com.jizan.master.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;


import com.jizan.utils.Pager;

public abstract interface BaseService<T>{
	
  public abstract int add(T paramT);

  public abstract int modify(T paramT);

  public abstract int removeById(Serializable id);

  public abstract int removeByIds(List<?> paramList);

  public abstract int removeBy(T paramT);
  
  public abstract List<T> listAll();

  public abstract List<T> listBy(Map<?, ?> paramMap);

  public abstract List<T> pageBy(Map<?, ?> paramMap);

  public abstract T findByMap(Map<?, ?> paramMap);

  public abstract T findBy(T paramT);

  public abstract T findById(Serializable id);

  public abstract int countAll();

  public abstract int countBy(Map<?, ?> paramMap);

  public abstract Pager pageAll(Pager paramPager);

  public abstract Pager pageAll(int paramInt1, int paramInt2);
	
  public abstract Pager pageWith(int page, int limit,Map<Object, Object> conditions);
	
}