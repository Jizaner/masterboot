package com.jizan.master.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {

	// @Autowired
	// private LegalInterceptor
	// legalInterceptor;//需要在该拦截器上添加@Configuration注解才能注入
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 多个拦截器组成一个拦截器链
		// addPathPatterns 用于添加拦截规则
		// excludePathPatterns 用户排除拦截
		registry.addInterceptor(new ApiSecurityInterceptor()).addPathPatterns("/**");
		//mng/registry.addInterceptor(new UserSecurityInterceptor()).addPathPatterns("/console#/**").addPathPatterns("/console/**");
		registry.addInterceptor(new UserSecurityInterceptor()).addPathPatterns("/mng/**");
		super.addInterceptors(registry);
		// registry.addInterceptor(new
		// LegalInterceptor()).addPathPatterns("/xx/**")//要拦截的请求
		// .excludePathPatterns("/xxx/*");//不拦截的请求
		// registry.addInterceptor(legalInterceptor).addPathPatterns("/**");//推荐

	}

}