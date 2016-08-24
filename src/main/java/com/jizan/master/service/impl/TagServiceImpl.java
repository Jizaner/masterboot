package com.jizan.master.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jizan.master.dao.TagDao;
import com.jizan.master.dao.BaseDao;
import com.jizan.master.entity.Tag;
import com.jizan.master.service.TagService;
import com.jizan.master.service.impl.BaseServiceImpl;

@Service
public class TagServiceImpl extends BaseServiceImpl<Tag> implements TagService {
	@Resource
	private TagDao tagDao;

	public BaseDao<Tag> getBaseDao() {
		return this.tagDao;
	}
}
