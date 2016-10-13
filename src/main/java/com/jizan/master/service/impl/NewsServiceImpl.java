package com.jizan.master.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jizan.master.dao.NewsDao;
import com.jizan.master.dao.BaseDao;
import com.jizan.master.entity.News;
import com.jizan.master.service.NewsService;
import com.jizan.master.service.impl.BaseServiceImpl;
import com.jizan.utils.DTPager;
import com.jizan.utils.Pager;

@Service
public class NewsServiceImpl extends BaseServiceImpl<News> implements NewsService {
	@Resource
	private NewsDao newsDao;

	public BaseDao<News> getBaseDao() {
		return this.newsDao;
	}

	public List<News> pageByIds(Map map) {
		return newsDao.pageByIds(map);
	}
	public DTPager dtpageWith(int draw, int start, int length,Map<Object, Object> conditions) {
		DTPager dtPagerpager = new DTPager(draw,Integer.valueOf(start), countBy(conditions), length);
		dtPagerpager.setRecordsFiltered(countBy(conditions));
		conditions.put("startIdx", Integer.valueOf(dtPagerpager.getStart()));
		conditions.put("limit", Integer.valueOf(dtPagerpager.getLength()));
		List items = getBaseDao().pageBy(conditions);
		dtPagerpager.setData(items);
		return dtPagerpager;
	}

}
