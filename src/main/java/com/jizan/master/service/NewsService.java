package com.jizan.master.service;

import java.util.List;
import java.util.Map;

import com.jizan.master.entity.News;
import com.jizan.master.service.BaseService;
import com.jizan.utils.DTPager;
import com.jizan.utils.Pager;

public interface NewsService extends BaseService<News> {

	/**根据ID数组分页查找数据集合
	 * @param paramList
	 * @return
	 */
	public abstract List<News> pageByIds(Map map);
	
	/**
	 * @param draw databases原样返回值，不需要做任何处理
	 * @param start 开始检索
	 * @param length 每页记录数
	 * @param conditions 其他查询条件
	 * @return
	 */
	public abstract DTPager dtpageWith(int draw, int start, int length,Map<Object, Object> conditions);

}
