package com.jizan.master.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public abstract interface BaseDao<T> {
	
	/**根据对象新增数据
	 * @param paramT
	 * @return 返回值>0,表示操作成功
	 */
	public abstract int add(T paramT);

	/**根据ID删除数据
	 * @param paramSerializable
	 * @return 返回值>0,表示操作成功
	 */
	public abstract int removeById(Serializable paramSerializable);

	/**根据ID数组批量删除数据
	 * @param paramList
	 * @return 返回值>0,表示操作成功
	 */
	public abstract int removeByIds(List<?> paramList);
	
	/**根据对象删除数据
	 * @param entity
	 * @return 返回值>0,表示操作成功
	 */
	public abstract int removeBy(T entity);

	/**根据对象修改数据
	 * @param entity
	 * @return 返回值>0,表示操作成功
	 */
	public abstract int modify(T entity);
	
	/**按列表查询全部数据
	 * @return
	 */
	public abstract List<T> listAll();

	/**根据条件按列表查询数据
	 * @param paramMap
	 * @return
	 */
	public abstract List<T> listBy(Map<?, ?> paramMap);

	/**根据条件按分页查询
	 * @param paramMap
	 * @return 条件必须包含分页参数：{startIdx：起始索引},{limit：每页条数}
	 */
	public abstract List<T> pageBy(Map<?, ?> paramMap);

	/**根据条件按列表查询
	 * @param paramMap
	 * @return
	 */
	public abstract T findByMap(Map<?, ?> paramMap);

	/**根据对象查询数据
	 * @param paramT
	 * @return
	 */
	public abstract T findBy(T paramT);

	/**根据ID查询数据
	 * @param paramSerializable
	 * @return
	 */
	public abstract T findById(Serializable paramSerializable);

	/**统计记录总数
	 * @return
	 */
	public abstract int countAll();

	/**按条件统计记录数量
	 * @param paramMap
	 * @return
	 */
	public abstract int countBy(Map<?, ?> paramMap);

}