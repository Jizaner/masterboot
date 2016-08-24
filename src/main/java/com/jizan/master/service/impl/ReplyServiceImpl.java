package com.jizan.master.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jizan.master.dao.ReplyDao;
import com.jizan.master.dao.BaseDao;
import com.jizan.master.entity.Reply;
import com.jizan.master.service.ReplyService;
import com.jizan.master.service.impl.BaseServiceImpl;

@Service
public class ReplyServiceImpl extends BaseServiceImpl<Reply> implements ReplyService {
	@Resource
	private ReplyDao replyDao;

	public BaseDao<Reply> getBaseDao() {
		return this.replyDao;
	}
}
