/**
 * 
 */
/**
 * @author Administrator
 *
 */
package com.jizan.master.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.jizan.master.entity.User;


/**
 * 拦截未登录的用户信息
 * @author lance
 * 2014-6-10下午9:57:20
 */
public class UserSecurityInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		 //验证用户是否登陆
        Object obj = request.getSession().getAttribute("cur_user");
        if (obj == null || !(obj instanceof User)) { 
        	//如果是ajax类型，响应
            if (request.getHeader("x-requested-with") != null && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {  
                response.getWriter().print("/");  
            }else{  
                response.sendRedirect(request.getContextPath() + "/");
            }  
            return false;//终止后面的拦截器的执行  
        }else{  
            return true;//让下一个拦截器去处理  
        }
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}