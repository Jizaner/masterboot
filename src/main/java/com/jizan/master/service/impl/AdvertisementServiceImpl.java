package com.jizan.master.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jizan.master.dao.AdvertisementDao;
import com.jizan.master.dao.BaseDao;
import com.jizan.master.entity.Advertisement;
import com.jizan.master.service.AdvertisementService;
import com.jizan.master.service.impl.BaseServiceImpl;

@Service
public class AdvertisementServiceImpl extends BaseServiceImpl<Advertisement> implements AdvertisementService {
	@Resource
	private AdvertisementDao advertisementDao;

	public BaseDao<Advertisement> getBaseDao() {
		return this.advertisementDao;
	}
}
