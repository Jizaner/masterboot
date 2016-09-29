package com.jizan.master.service.impl;

import java.util.HashMap;
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
import com.jizan.utils.StringUtil;

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
	
	public Pager pageAll(int page, int limit) {
		Pager pager = new Pager(Integer.valueOf(page), countAll(), limit);
		Map<String, Integer> pagerMap = new HashMap<String, Integer>();
		pagerMap.put("startIdx", Integer.valueOf(pager.getStartIdx()));
		pagerMap.put("limit", Integer.valueOf(pager.getLimit()));
		List items = getBaseDao().pageBy(pagerMap);
		for (int i = 0; i < items.size(); i++) {
			String imagesStr=((Topic) items.get(i)).getImages();
			String[] imagesArray=imagesStr.split(",");
			for (int j = 0; j < imagesArray.length; j++) {
				imagesArray[j]=imagesArray[j]+"!thumbnail";
			}
			String newImagesStr= StringUtil.join(imagesArray, ",");
			((Topic) items.get(i)).setImages(newImagesStr);
		}
		pager.setRows(items);
		return pager;
	}
}
