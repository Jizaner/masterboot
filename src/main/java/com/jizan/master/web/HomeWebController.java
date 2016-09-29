package com.jizan.master.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.swagger.annotations.Api;

@Api(value = "home", description = "/*添加注释*/")
@Controller
public class HomeWebController {

	@RequestMapping("/demo")
	public String _doView() {
		return "/angulr/index";
	}

	@RequestMapping(value = "/greeting", method = RequestMethod.GET)
	public String greeting(@RequestParam(name = "name", required = false, defaultValue = "world") String name,
			Model model) {
		model.addAttribute("xname", name);
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam(name = "name", required = false, defaultValue = "world") String name,Model model) {
		model.addAttribute("xname", name);
		return "login";
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajax", method = RequestMethod.GET)
	public String ajax(@RequestParam("username") String username) {
		return username;
	}

}
