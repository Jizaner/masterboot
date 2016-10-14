package com.jizan.utils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;

/**
 * 用于datatables.js的分页格式化工具
 * @author Administrator
 *
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class DTPager implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int draw;//draw要原封不动的返回给datatables页面，为了防止每次请求不会乱
	private int start;//开始查询的索引
	private int length;//每页数据条数
	private int recordsTotal;//没有过滤的记录数（数据库里总共记录数）
	private int recordsFiltered;//过滤后的记录数，默认=recordsTotal
	private List<Object> data = new ArrayList<Object>();//表中中需要显示的数据
	private String error;//当出错时，定义友好提示

	/**
	 * @param draw 原值返回给datatables即可
	 * @param start 开始索引
	 * @param recordsTotal 总记录数
	 * @param Length 每页记录数
	 */
	public DTPager(int draw,int start, int recordsTotal, int Length) {
		this.draw = draw;
		this.recordsTotal = recordsTotal;
		this.start = start;
		this.length = Length;
	}
	
	public int getStart() {
		return this.start;
	}

	public void setStart(int Start) {
		this.start = Start;
	}

	public int getLength() {
		return this.length;
	}

	public void setLength(int Length) {
		this.length = Length;
	}

	public int getRecordsTotal() {
		return this.recordsTotal;
	}

	public void setRecordsTotal(int recordsTotal) {
		this.recordsTotal = recordsTotal;
	}

	public List<Object> getData() {
		return this.data;
	}

	public void setData(List<Object> data) {
		this.data = data;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public int getRecordsFiltered() {
		return recordsFiltered;
	}

	public void setRecordsFiltered(int recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}
}
