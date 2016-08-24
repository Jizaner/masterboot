package com.jizan.master.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jizan.utils.Pager;

import com.jizan.master.dao.BaseDao;
import com.jizan.master.service.BaseService;

public abstract class BaseServiceImpl<T> implements BaseService<T> {
	public abstract BaseDao<T> getBaseDao();

	public int add(T entity) {
		return getBaseDao().add(entity);
	}

	public int modify(T entity) {
		return getBaseDao().modify(entity);
	}

	public int removeById(Serializable id) { 
		return getBaseDao().removeById(id);
	}

	public int removeByIds(List ids) {
		return getBaseDao().removeByIds(ids);
	}

	public int removeBy(T entity) {
		return getBaseDao().removeBy(entity);
	}
	
	public List<T> listAll() {
		return getBaseDao().listAll();
	}

	public List<T> pageBy(Map<?, ?> map) {
		return getBaseDao().pageBy(map);
	}

	public List<T> listBy(Map<?, ?> map) {
		return getBaseDao().listBy(map);
	}

	public T findById(Serializable id) {
		return getBaseDao().findById(id);
	}

	public T findByMap(Map<?, ?> map) {
		return getBaseDao().findByMap(map);
	}

	public T findBy(T entity) {
		return getBaseDao().findBy(entity);
	}

	public int countAll() {
		return getBaseDao().countAll();
	}

	public int countBy(Map<?, ?> map) {
		return getBaseDao().countBy(map);
	}

	public Pager pageAll(Pager pager) {
		Map<String, Integer> pagerMap = new HashMap<String, Integer>();
		pagerMap.put("startIdx", Integer.valueOf(pager.getStartIdx()));
		pagerMap.put("limit", Integer.valueOf(pager.getLimit()));
		List items = getBaseDao().pageBy(pagerMap);
		pager.setRows(items);
		return pager;
	}

	public Pager pageAll(int page, int limit) {
		Pager pager = new Pager(Integer.valueOf(page), countAll(), limit);
		Map<String, Integer> pagerMap = new HashMap();
		pagerMap.put("startIdx", Integer.valueOf(pager.getStartIdx()));
		pagerMap.put("limit", Integer.valueOf(pager.getLimit()));
		List items = getBaseDao().pageBy(pagerMap);
		pager.setRows(items);
		return pager;
	}
	
	public Pager pageWith(int page, int limit,Map<Object, Object> conditions) {
		Pager pager = new Pager(Integer.valueOf(page), countBy(conditions), limit);
		//Map<String, Integer> allConditionsMap = new HashMap();
		conditions.put("startIdx", Integer.valueOf(pager.getStartIdx()));
		conditions.put("limit", Integer.valueOf(pager.getLimit()));
		List items = getBaseDao().pageBy(conditions);
		pager.setRows(items);
		return pager;
	}
}