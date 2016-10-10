package com.jizan.master.interceptor;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ApiSecurityInterceptor extends HandlerInterceptorAdapter {

	private static final Logger log = Logger.getLogger(ApiSecurityInterceptor.class);
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println(handler.getClass());  
	    HandlerMethod handlerMethod = (HandlerMethod) handler;  
	    System.out.println(handlerMethod.getMethod());  
		String secretKey = request.getHeader("secretKey");
		if (secretKey!=null && secretKey.equalsIgnoreCase("7E72FB27FC800C6E906557BAEE4ED1DC")) {
			DateFormat df3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String userid = request.getHeader("userid");
			System.out.println(df3.format(System.currentTimeMillis())+": 请求合法。["+userid+"]["+secretKey+"]");
			
			return true;
		}else{
			DateFormat df3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			System.out.println(df3.format(System.currentTimeMillis())+": 非法请求！");
			return true;
		}
		
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("postHandle......");
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println(preHandle(request, response, handler));
	}

}
