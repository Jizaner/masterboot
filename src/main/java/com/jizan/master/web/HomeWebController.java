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

	//--foreend
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String defaultPage(@RequestParam(name = "name", required = false, defaultValue = "world") String name,
			Model model) {
		model.addAttribute("xname", name);
		return "index";
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String indexPage(@RequestParam(name = "name", required = false, defaultValue = "world") String name,
			Model model) {
		model.addAttribute("xname", name);
		return "index";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerPage(@RequestParam(name = "name", required = false, defaultValue = "world") String name,Model model) {
		model.addAttribute("xname", name);
		return "register";
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String doLogin(@RequestParam(name = "account", required = true) String account,@RequestParam(name = "password", required = true) String password,Model model) {
		model.addAttribute("xname", account);
		System.out.println(account+"---"+password);
		return "register";
	}
	//--backend
	@RequestMapping("/console")
	public String _doView() {
		return "/angulr/index";
	}
	
	//--ajax 
	@ResponseBody
	@RequestMapping(value = "/ajax", method = RequestMethod.GET)
	public String ajax(@RequestParam("username") String username) {
		return username;
	}

}
