package com.jizan.master.service;

import java.util.List;
import java.util.Map;

import com.jizan.master.entity.Topic;
import com.jizan.master.service.BaseService;
import com.jizan.utils.Pager;

public interface TopicService extends BaseService<Topic> {

	/**分页查询某用户回答过的主题
	 * @param paramMap key:repliedby
	 * @return
	 */
	public abstract Pager pageRepliedBy(int page, int limit,Map<Object, Object> conditions);
	
	/**根据ID数组分页查找数据集合
	 * @param paramList
	 * @return
	 */
	public abstract List<Topic> pageByIds(Map map);
	
	
	/**根据条件模糊查询问题列表
	 * @param paramMap key:repliedby
	 * @return
	 */
	public abstract Pager pageFuzzyBy(int page, int limit,Map<Object, Object> conditions);

	/**根据条件模糊查询统计问题数
	 * @param conditions
	 * @return
	 */
	public abstract int countFuzzyBy(Map<?, ?> conditions);
}
