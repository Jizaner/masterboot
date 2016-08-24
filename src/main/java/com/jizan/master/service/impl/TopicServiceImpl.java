package com.jizan.master.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jizan.master.dao.TopicDao;
import com.jizan.master.dao.BaseDao;
import com.jizan.master.entity.Topic;
import com.jizan.master.service.TopicService;
import com.jizan.master.service.impl.BaseServiceImpl;
import com.jizan.utils.Pager;

@Service
public class TopicServiceImpl extends BaseServiceImpl<Topic> implements TopicService {
	@Resource
	private TopicDao topicDao;

	public BaseDao<Topic> getBaseDao() {
		return this.topicDao;
	}
	
	/**分页查询某用户回答过的主题
	 * @param paramMap key:repliedby
	 * @return
	 */
	public Pager pageRepliedBy(int page, int limit,Map<Object, Object> conditions) {
		Pager pager = new Pager(Integer.valueOf(page), countRepliedBy(conditions), limit);
		conditions.put("startIdx", Integer.valueOf(pager.getStartIdx()));
		conditions.put("limit", Integer.valueOf(pager.getLimit()));
		List items = topicDao.pageRepliedBy(conditions);
		pager.setRows(items);
		return pager;
	}
	
	private int countRepliedBy(Map<Object, Object> conditions) {
		return topicDao.countRepliedBy(conditions);
	}

	public List<Topic> pageByIds(Map map) {
		return topicDao.pageByIds(map);
	}

}
