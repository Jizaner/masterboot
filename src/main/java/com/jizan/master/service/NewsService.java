package com.jizan.master.service;

import java.util.List;
import java.util.Map;

import com.jizan.master.entity.News;
import com.jizan.master.service.BaseService;

public interface NewsService extends BaseService<News> {

	/**根据ID数组分页查找数据集合
	 * @param paramList
	 * @return
	 */
	public abstract List<News> pageByIds(Map map);
}
