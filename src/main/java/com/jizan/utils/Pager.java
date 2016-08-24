package com.jizan.utils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Pager implements Serializable {

	private static final long serialVersionUID = 1L;
	private int startIdx;
	private int total;
	private int limit;
	private int page;
	private int totalPages;
	private List<Object> rows = new ArrayList<Object>();

	public Pager(Integer pageIdx, int total, int limit) {
		this.total = total;
		this.page = ((pageIdx != null) && (!pageIdx.equals("")) && (!pageIdx.equals("0")) ? pageIdx.intValue() : 1);
		this.limit = limit;

		this.startIdx = ((pageIdx.intValue() - 1) * this.limit);
		this.totalPages = (total % this.limit == 0 ? total / this.limit : total / this.limit + 1);
	}

	public int getStartIdx() {
		return this.startIdx;
	}

	public void setStartIdx(int startIdx) {
		this.startIdx = startIdx;
	}

	public int getLimit() {
		return this.limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getTotal() {
		return this.total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPage() {
		return this.page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPages() {
		return this.totalPages;
	}

	public void setPages(int pages) {
		this.totalPages = pages;
	}

	public List<Object> getRows() {
		return this.rows;
	}

	public void setRows(List<Object> rows) {
		this.rows = rows;
	}
}
