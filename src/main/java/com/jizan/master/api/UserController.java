package com.jizan.master.api;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.alibaba.fastjson.*;
import com.jizan.master.entity.User;
import com.jizan.master.service.UserService;
import com.jizan.utils.*;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api(value = "用户接口", description = "")
@RestController
@RequestMapping("/user")
public class UserController extends BaseController {

	@Resource
	private UserService userService;
	
	/* Show ******************/
	@ApiOperation(value = "获取user详情#v1.0", notes = "获取user详情#v1.0")
	@RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
	@ResponseBody
	public JsonResult _show(@PathVariable("id") int id) {
		User user = this.userService.findById(id);
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN, user);
	}

	/* Show ******************/
	@ApiOperation(value = "获取我的详情#v1.0", notes = "获取user详情#v1.0")
	@RequestMapping(value = "/me", method = RequestMethod.GET)
	@ResponseBody
	public JsonResult _showMe() {
	if (getCurrentUserId()!=null) {
		User user = this.userService.findById(getCurrentUserId());
		if (user!=null) {
			return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN, user);
		}
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.NOT_FOUND,"查找不到该用户信息！");
	}
	return new JsonResult(SystemConfig.DEFEAT, SystemConfig.ERROR,"用户ID不能为空！");
	}
	
	/* List ******************/
	@ApiOperation(value = "获取user列表#v1.0", notes = "获取user列表#v1.0")
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public List<User> _list() {
		List<User> list = this.userService.listAll();
		return list;
	}

	/* Page ******************/
	@ApiOperation(value = "根据页码获取user分页#v1.0", notes = "根据页码获取user分页#v1.0")
	@RequestMapping(value = "/page/{num:\\d+}", method = RequestMethod.GET)
	@ResponseBody
	public Pager _page(@PathVariable("num") int pageNum) {
		int limit = 20;
		Pager pager = this.userService.pageAll(pageNum, limit);
		return pager;
	}

	/* Pager ****************/
	@ApiOperation(value = "获取user分页#v1.0", notes = "获取user分页#v1.0")
	@RequestMapping(value = "/pager", method = RequestMethod.POST)
	@ResponseBody
	public Pager _pageTable(int offset, int limit) {
		int pageNum = offset / limit + 1;
		Pager pager = this.userService.pageAll(pageNum, limit);
		return pager;
	}

	/* Add ******************/
	@ApiOperation(value = "新增user#v1.0", notes = "新增user#v1.0")
	@RequestMapping(value = "/new", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult _new(@RequestBody User user) {
		try {
			JsonResult result=_exist(user.getMobile());
			if(result.getCode()==SystemConfig.NOT_FOUND){
				if (user.getAvatar() == null || user.getAvatar() == "" || user.getAvatar().equals("")) {
					Random ram = new Random();
					user.setAvatar("resources/avatars/avatar_" + Math.abs(ram.nextInt() % 31) + ".jpg");// 取0~30之间的随机数
				}
				user.setRegistertime(System.currentTimeMillis() / 1000);
				this.userService.add(user);
				return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
			}else{
				return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXIST);
			}
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
	}

	/* Edit *****************/
	// @Deprecated
	@ApiOperation(value = "更新user#v1.0", notes = "更新user#v1.0")
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult _update(@RequestBody User user) {
		try {
			user.setId(getCurrentUserId());
			this.userService.modify(user);
			User latestUser=this.userService.findBy(user);
			return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,latestUser);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
	}
	
	/* Edit *****************/
	// @Deprecated
	@ApiOperation(value = "更新user#v1.0", notes = "更新user#v1.0")
	@RequestMapping(value = "/update/tags", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult _updateTags(@RequestBody String usertags) {
		try {
			//String tags="{\"tags\":[\"安全\",\"大数据\",\"区块链\"],"userid":10000003}";
			JSONObject jo=JSON.parseObject(usertags);
			/* int userid=Integer.valueOf(jo.getString("userid")); */
			JSONArray likes=jo.getJSONArray("tags");
			User user= this.userService.findById(getCurrentUserId());
			if (user!=null) {
				user.setTags(StringUtil.join(likes, ","));
				this.userService.modify(user);
				return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,user);
			}
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.ERROR,"用户不存在，操作失败！");
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		
	}

	/* Delete ***************/
	@Deprecated
	@ApiOperation(value = "删除user#v1.0", notes = "删除user#v1.0")
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult _delete(@RequestParam(value = "ids", required = true, defaultValue = "") String idstring) {
		try {
			String[] ids = idstring.split(",");
			for (int i = 0; i < ids.length; i++) {
				this.userService.removeById(Integer.parseInt(ids[i]));
			}
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

	@ApiOperation(value = "用户登录#v1.0", notes = "根据手机号码和登录密码登录r#v1.0")
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult _login(@RequestParam(value = "mobile", required = true) long mobile,
			@RequestParam(value = "password", required = true) String password) {
		try {
			User user = new User();
			user.setMobile(mobile);
			user.setPassword(password);
			User resultUser=this.userService.findBy(user);
			if (null != resultUser) {
			      /*HttpSession session = request.getSession();
			      session.setAttribute("userid", user.getId());*/
			      
				return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,resultUser);
			}
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.DEFEAT, SystemConfig.FAILURE);
	}

	@ApiOperation(value = "手机号码是否已注册#v1.0", notes = "用户手机号码是否已注册#v1.0")
	@RequestMapping(value = "/exist/mobile", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult _exist(@RequestParam(value = "mobile", required = true) long mobile) {
		try {
			User user = new User();
			user.setMobile(mobile);
			Map<String, Long> paramMap= new HashMap<String, Long> ();
			paramMap.put("mobile", mobile);
			if (null != this.userService.findByMap(paramMap)) {
				return new JsonResult(SystemConfig.SUCCESS, SystemConfig.EXIST);
			}else{
				return new JsonResult(SystemConfig.DEFEAT, SystemConfig.NOT_FOUND);
			}
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
	}

	@ApiOperation(value = "修改密码接口#v1.0", notes = "根据userId和旧密码，修改新密码#v1.0")
	@RequestMapping(value = "/change/password", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult _changePwd(@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "newpassword", required = true) String newpassword) {
		try {
			User user = new User();
			user.setId(getCurrentUserId());
			user.setPassword(password);
			if (null != this.userService.findBy(user)) {
				user.setPassword(newpassword);
				this.userService.modify(user);
				return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
			}
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.DEFEAT, SystemConfig.FAILURE);
	}

	@Deprecated
	@ApiOperation(value = "上传头像接口#v1.0", notes = "上传新头像#v1.0")
	@RequestMapping(value = "/avatar/upload/v1", method = RequestMethod.POST)
	public JsonResult _uploadAvatar(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {
		// 判断文件是否为空
		if (!file.isEmpty()) {
			try {
				// 获取上传文件旧名
				String name = file.getOriginalFilename();
				// 获取后缀名
				String last = name.substring(name.lastIndexOf(".") + 1);
				// 上传路径--文件保存路径
				String fileRootPath = request.getSession().getServletContext().getRealPath("/");
				String fileSubPath = "upload/avatar/" + System.currentTimeMillis() + new Random(50000).nextInt() + "."
						+ last;
				File newfile = new File(fileRootPath, fileSubPath);
				User currentUser = this.userService.findById(getCurrentUserId());
				if (currentUser != null) {
					file.transferTo(newfile);
					currentUser.setAvatar(fileSubPath);
					this.userService.modify(currentUser);
					return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,currentUser);
				}
				return new JsonResult(SystemConfig.DEFEAT, SystemConfig.NOT_FOUND,"用户信息不存在！");
			} catch (Exception e) {
				return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION,e);
			}
		}
		return new JsonResult(SystemConfig.DEFEAT, SystemConfig.FAILURE,"头像传输失败！");
	}

	@ApiOperation(value = "头像文件上传接口#v2.0", notes = "多文件上传接口#v2.0")
	@RequestMapping(value = "/avatar/upload/v2", method = RequestMethod.POST)
	public JsonResult _batchUploadFile(@RequestParam(value = "file", required = false) CommonsMultipartFile file, HttpServletRequest request) {
		// 判断文件是否为空
				if (!file.isEmpty()) {
					try {
						// 获取上传文件旧名
						String name = file.getOriginalFilename();
						// 获取后缀名
						String last = name.substring(name.lastIndexOf(".") + 1);
						// 上传路径--文件保存路径
						String fileRootPath = request.getSession().getServletContext().getRealPath("/");
						String fileSubPath = "upload/avatar/" + System.currentTimeMillis() + new Random(50000).nextInt() + "."
								+ last;
						File newfile = new File(fileRootPath, fileSubPath);
						User currentUser = this.userService.findById(getCurrentUserId());
						if (currentUser != null) {
							file.transferTo(newfile);
							currentUser.setAvatar(fileSubPath);
							this.userService.modify(currentUser);
							return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,currentUser);
						}
						return new JsonResult(SystemConfig.DEFEAT, SystemConfig.NOT_FOUND,"用户信息不存在！");
					} catch (Exception e) {
						return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION,e);
					}
				}
				return new JsonResult(SystemConfig.DEFEAT, SystemConfig.FAILURE,"头像传输失败！");
	}

	/* 发送验证码 */
	@RequestMapping(value = "/smscode/{mobile:\\d+}", method = RequestMethod.GET)
	public JsonResult _smsCode(@PathVariable("mobile") long mobile, HttpServletResponse response, HttpServletRequest request) {
		try {
			Map<String, Long> map = new HashMap<String, Long>();
			map.put("mobile", mobile);
			User u = userService.findByMap(map);
			if (u != null) {
				return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXIST);
			} else {
				long sendtime = System.currentTimeMillis();// 短信发送时间
				String code = SmsCode.smsCode();
				HttpSession session = request.getSession();
				String sessionid = session.getId();// 获取当前session的唯一ID
				session.setAttribute("verifycode", code);// 发送的验证码
				session.setAttribute("sendtime", sendtime);// 发送的时间
				// 1-使用短信服务商（易迅）接口
				SmsCode.sendSMS(mobile, code, "");
				// 2-使用北航短信服务接口
				// BuaaSMS.sendMessage("您的验证码为："+code+"，5分钟内有效。", mobile, 0);
				// -
				HashMap<String, String> dataMap = new HashMap<String, String>();
				dataMap.put("session", sessionid);
				dataMap.put("info", "验证码已发送至您的手机，请注意查收!");
				return new JsonResult(SystemConfig.SUCCESS, SystemConfig.EXIST, JSON.toJSONString(dataMap));
			}
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
	}

	
}
