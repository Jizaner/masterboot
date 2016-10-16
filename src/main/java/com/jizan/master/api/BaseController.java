package com.jizan.master.api;

import java.io.File;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.jizan.master.entity.User;
import com.jizan.utils.JsonResult;
import com.jizan.utils.SystemConfig;

import io.swagger.annotations.ApiOperation;

public abstract class BaseController {

	@Resource
	private HttpServletRequest request;
	
	@Resource
	private HttpServletResponse response;
	
	public Integer getCurrentUserId(){
		String userid = request.getHeader("userid");
		return Integer.parseInt(userid);
	}

	@Value("${spring.upload-path.base}")
	public String baseUploadPath;//文件上传路径
	
	//@ApiOperation(value = "多文件上传接口#v1.0", notes = "多文件上传接口#v1.0")
	//@RequestMapping(value = "/avatar/upload/v1", method = RequestMethod.POST)
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
				//User currentUser = this.userService.findById(getCurrentUserId());
				//if (currentUser != null) {
					file.transferTo(newfile);
					//currentUser.setAvatar(fileSubPath);
					//this.userService.modify(currentUser);
					//return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,currentUser);
				//}
				return new JsonResult(SystemConfig.DEFEAT, SystemConfig.NOT_FOUND,"用户信息不存在！");
			} catch (Exception e) {
				return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION,e);
			}
		}
		return new JsonResult(SystemConfig.DEFEAT, SystemConfig.FAILURE);
	}

	

	//@ApiOperation(value = "上传头像接口#v1.0", notes = "上传新头像#v1.0")
	//@RequestMapping(value = "/avatar/upload/v2", method = RequestMethod.POST)
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
				/*User currentUser = this.userService.findById(getCurrentUserId());
				if (currentUser != null) {
					file.transferTo(newfile);
					currentUser.setAvatar(fileSubPath);
					this.userService.modify(currentUser);
					return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,currentUser);
				}*/
				return new JsonResult(SystemConfig.DEFEAT, SystemConfig.NOT_FOUND,"用户信息不存在！");
			} catch (Exception e) {
				return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION,e);
			}
		}
		return new JsonResult(SystemConfig.DEFEAT, SystemConfig.FAILURE,"头像传输失败！");
	}

	
}
