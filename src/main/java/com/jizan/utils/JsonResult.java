package com.jizan.utils;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class JsonResult {
	public int code;
	public String state;
	public String msg;
	public Object data;

	public String getMsg() {
		return this.msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getCode() {
		return this.code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public Object getData() {
		return this.data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	/**
	 * 返回信息
	 * 
	 * @param state
	 *            返回状态名称
	 * @param code
	 *            返回状态代码
	 */
	public JsonResult(String state, int code) {
		this.state = state;
		this.code = code;
	}

	/**
	 * 返回信息
	 * 
	 * @param state
	 *            返回状态名称
	 * @param code
	 *            返回状态代码
	 * @param msg
	 *            返回状态描述
	 */
	public JsonResult(String state, int code, String msg) {
		this.state = state;
		this.code = code;
		this.msg = msg;
	}

	/**
	 * 返回信息
	 * 
	 * @param state
	 *            返回状态名称
	 * @param code
	 *            返回状态代码
	 * @param data
	 *            返回数据内容
	 */
	public JsonResult(String state, int code, Object data) {
		this.state = state;
		this.code = code;
		this.data = data;
	}

	/**
	 * 返回信息
	 * 
	 * @param state
	 *            返回状态名称
	 * @param code
	 *            返回状态代码
	 * @param msg
	 *            返回状态描述
	 * @param data
	 *            返回数据内容
	 */
	public JsonResult(String state, int code, String msg, Object data) {
		this.state = state;
		this.code = code;
		this.msg = msg;
		this.data = data;
	}
}
