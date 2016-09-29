package com.jizan.utils;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class SystemConfig {
	public static final Map<String, Object> token = new HashMap<String, Object>();
	public static final String SUCCESS = "success";// 客户端操作成功
	public static final String DEFEAT = "opps!";// 客户端操作失败

	public static final int WIN = 200;// 操作成功
	public static final int ERROR = 500;// 操作错误
	public static final int FAILURE = 400;// 操作失败
	public static final int TIMEOUT = 401;// 请求超时
	public static final int EXIST = 403;// 记录已存在
	public static final int NOT_FOUND = 404;// 查不到记录
	public static final int SIGN_WRONG = 402;// 签名错误
	public static final int ILLEGALITY = 405;// 非法操作
	public static final int EXCEPTION = 444;
	
	
	public static String appid = "dqL7zCmc4d8GEltrMiqqe1";
	public static String appkey = "IK31XAhMWu8w9KoXwd4vj9";
	public static String masterSecret = "2AC7ziNvNu7zToAYvRWdd6";
	public static String url = "http://sdk.open.api.igexin.com/serviceex";
	
	public static final String IMAGE_SAVE_PATH = "aaaaa";
	public static final String IMAGE_RELATIVE_SAVE_PATH = "bbbb";
	
	/*public static void main(String[] args){
		String argas="{\"tags\":[\"安全\",\"大数据\",\"区块链\"]}";
		
		JSONObject jo=JSON.parseObject(argas);
		JSONArray likes=jo.getJSONArray("tags"); //得到likes数组
		
		System.out.println(StringUtil.join(likes, ","));
	}*/
	
}
