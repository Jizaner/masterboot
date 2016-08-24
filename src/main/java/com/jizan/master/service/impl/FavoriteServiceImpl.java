package com.jizan.master.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jizan.master.dao.FavoriteDao;
import com.jizan.master.dao.BaseDao;
import com.jizan.master.entity.Favorite;
import com.jizan.master.service.FavoriteService;
import com.jizan.master.service.impl.BaseServiceImpl;

@Service
public class FavoriteServiceImpl extends BaseServiceImpl<Favorite> implements FavoriteService {
	@Resource
	private FavoriteDao favoriteDao;

	public BaseDao<Favorite> getBaseDao() {
		return this.favoriteDao;
	}
}
