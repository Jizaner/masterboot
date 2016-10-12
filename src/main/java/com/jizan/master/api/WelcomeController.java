
package com.jizan.master.api;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;

@Api(value = "WEB端接口")
@RestController
@RequestMapping("/app/web")
public class WelcomeController extends BaseController{

	@Value("${application.message:Hello World}")
	private String message = "Hello World";

	@RequestMapping(value = "/hello",method=RequestMethod.GET)
	public String welcome(Map<String, Object> model) {
		model.put("time", new Date());
		model.put("message", this.message);
		return "welcome";
	}

	@RequestMapping(value = "/foo",method=RequestMethod.GET)
	public String foo(Map<String, Object> model) {
		throw new RuntimeException("Foo");
	}

}
