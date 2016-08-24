package com.jizan.master.dao;

import java.util.List;
import java.util.Map;

import com.jizan.master.dao.BaseDao;
import com.jizan.master.entity.News;

public interface NewsDao extends BaseDao<News> {

	/**根据ID数组分页查找数据集合
	 * @param paramList
	 * @return
	 */
	public abstract List<News> pageByIds(Map map);
}
