package com.jizan.master.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jizan.master.dao.FeedbackDao;
import com.jizan.master.dao.BaseDao;
import com.jizan.master.entity.Feedback;
import com.jizan.master.service.FeedbackService;
import com.jizan.master.service.impl.BaseServiceImpl;

@Service
public class FeedbackServiceImpl extends BaseServiceImpl<Feedback> implements FeedbackService {
	@Resource
	private FeedbackDao feedbackDao;

	public BaseDao<Feedback> getBaseDao() {
		return this.feedbackDao;
	}
}
