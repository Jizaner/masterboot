package com.jizan.master.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jizan.master.dao.CertificationDao;
import com.jizan.master.dao.BaseDao;
import com.jizan.master.entity.Certification;
import com.jizan.master.service.CertificationService;
import com.jizan.master.service.impl.BaseServiceImpl;

@Service
public class CertificationServiceImpl extends BaseServiceImpl<Certification> implements CertificationService {
	@Resource
	private CertificationDao certificationDao;

	public BaseDao<Certification> getBaseDao() {
		return this.certificationDao;
	}
}
