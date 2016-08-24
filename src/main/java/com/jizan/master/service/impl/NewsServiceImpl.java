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
}
