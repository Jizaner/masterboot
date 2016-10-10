package com.jizan.master.web;

import java.util.Enumeration;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jizan.master.entity.User;
import com.jizan.master.service.UserService;
import com.jizan.utils.JsonResult;
import com.jizan.utils.SystemConfig;

import io.swagger.annotations.Api;

@Api(value = "home", description = "/*添加注释*/")
@Controller
public class HomeWebController {
	@Resource
	private UserService userService;
	@Resource
	private HttpServletRequest request;

	@Resource
	private HttpServletResponse response;

	// --foreend
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
	public String registerPage(@RequestParam(name = "name", required = false, defaultValue = "world") String name,
			Model model) {
		model.addAttribute("xname", name);
		return "register";
	}

	@RequestMapping(value = "api/login", method = RequestMethod.POST)
	public String doLogin(@RequestParam(name = "account", required = true) String account,
			@RequestParam(name = "password", required = true) String password) {
		// model.addAttribute("xname", account);
		try {
			User user = new User();
			user.setMobile(Long.valueOf(account));
			user.setPassword(password);
			User resultUser = this.userService.findBy(user);
			if (null != resultUser) {
				HttpSession session = request.getSession();
				session.setAttribute("cur_user", user);
				return "redirect:/console";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:/register";

	}
	
	@RequestMapping(value = "api/console/login", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult doLoginViaJson(@RequestBody Map<String,String> accountinfo) {
		// model.addAttribute("xname", account);
		try {
			User user = new User();
			user.setMobile(Long.valueOf(accountinfo.get("account")));
			user.setPassword(accountinfo.get("password"));
			User resultUser = this.userService.findBy(user);
			if (null != resultUser) {
				HttpSession session = request.getSession();
				session.setAttribute("cur_user", user);
				return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN, user);
			}
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.ERROR,e);
		}
		return new JsonResult(SystemConfig.DEFEAT, SystemConfig.ERROR);
	}
	
	

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String doLogout() {
		// 清除session
		Enumeration<String> em = request.getSession().getAttributeNames();
		while (em.hasMoreElements()) {
			request.getSession().removeAttribute(em.nextElement().toString());
		}
		request.getSession().removeAttribute("cur_user");
		request.getSession().invalidate();
		return "redirect:/register";
	}

	// --backend
	@RequestMapping("/console")
	public String _doView() {
		return "/angulr/index";
	}

	// --ajax
	@ResponseBody
	@RequestMapping(value = "/ajax", method = RequestMethod.GET)
	public String ajax(@RequestParam("username") String username) {
		return username;
	}

}
