package com.jizan.master.service;

import com.jizan.master.entity.Version;
import com.jizan.master.service.BaseService;

public interface VersionService extends BaseService<Version> {
	
	public Version findLatest();

}
