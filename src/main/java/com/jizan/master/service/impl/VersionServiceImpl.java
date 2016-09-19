package com.jizan.master.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jizan.master.dao.VersionDao;
import com.jizan.master.dao.BaseDao;
import com.jizan.master.entity.Version;
import com.jizan.master.service.VersionService;
import com.jizan.master.service.impl.BaseServiceImpl;

@Service
public class VersionServiceImpl extends BaseServiceImpl<Version> implements VersionService {
	@Resource
	private VersionDao versionDao;

	public BaseDao<Version> getBaseDao() {
		return this.versionDao;
	}
	
	public Version findLatest(){
		
		return versionDao.findLatest();
	}
}
