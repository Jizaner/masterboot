package com.jizan.master.dao;

import java.util.List;
import java.util.Map;

import com.jizan.master.dao.BaseDao;
import com.jizan.master.entity.Topic;

public interface TopicDao extends BaseDao<Topic> {

	/**分页查询某用户回答过的问题
	 * @param paramMap key:repliedby
	 * @return
	 */
	public abstract List<Topic> pageRepliedBy(Map<?, ?> paramMap);

	/**统计某用户回答过的问题数
	 * @param conditions
	 * @return
	 */
	public int countRepliedBy(Map<?, ?> conditions);
	
	
	/**根据条件模糊查询问题列表
	 * @param paramMap key:repliedby
	 * @return
	 */
	public abstract List<Topic> pageFuzzyBy(Map<?, ?> paramMap);

	/**根据条件模糊查询统计问题数
	 * @param conditions
	 * @return
	 */
	public int countFuzzyBy(Map<?, ?> conditions);
	
	/**根据ID数组分页查找数据集合
	 * @param paramList
	 * @return
	 */
	public abstract List<Topic> pageByIds(Map map);
	
}
