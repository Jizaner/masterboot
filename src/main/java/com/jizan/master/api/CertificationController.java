package com.jizan.master.api;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import io.swagger.annotations.*;

import com.jizan.utils.Pager;
import com.jizan.utils.StringUtil;
import com.jizan.utils.SystemConfig;
import com.jizan.vendors.qiniu.QiniuBase;
import com.jizan.vendors.qiniu.QiniuUpload;
import com.jizan.utils.JsonResult;

import com.jizan.master.entity.Certification;
import com.jizan.master.entity.Topic;
import com.jizan.master.service.CertificationService;

@Api(value = "certification",description = "/*添加注释*/")
@RestController
@RequestMapping("/certification")
public class CertificationController extends BaseController {

	@Resource
	private CertificationService certificationService;
	@Value("${spring.upload-path.certification}")
	private String certUploadPath;

	/* Show ******************/
	@ApiOperation(value = "根据ID获取certification#v1.0",notes = "根据ID获取certification#v1.0")
	@RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
	@ResponseBody
	public JsonResult _show(@PathVariable("id") int id) {
		Certification certification = this.certificationService.findById(id);
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,certification);
	}

	/* List ******************/
	@ApiOperation(value = "获取全部certification列表#v1.0",notes = "获取全部certification列表#v1.0")
	@RequestMapping(value = "/list",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _list() {
		List<Certification> list = this.certificationService.listAll();
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,list);
	}

	/* MyList ******************/
	@ApiOperation(value = "获取我的全部certification列表#v1.0",notes = "获取我的全部certification列表#v1.0")
	@RequestMapping(value = "/mylist",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _myList() {
		Map<String, Integer> paramMap=new HashMap<String, Integer>();
		paramMap.put("createdby", getCurrentUserId());
		List<Certification> list = this.certificationService.listBy(paramMap);
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,list);
	}

	
	/* Page ******************/
	@ApiOperation(value = "根据页码获取certification分页数据#v1.0",notes = "根据页码获取certification分页数据#v1.0")
	@RequestMapping(value = "/page/{num:\\d+}",method=RequestMethod.GET)
	@ResponseBody
	public JsonResult _page(@PathVariable("num") int pageNum) {
		int limit = 20;
		Pager pager = this.certificationService.pageAll(pageNum, limit);
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,pager);
	}

	/* Pager ****************/
	@ApiOperation(value = "获取certification分页#v1.0",notes = "获取certification分页#v1.0")
	@RequestMapping(value = "/pager",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _pageTable(int offset, int limit) {
		int pageNum = offset / limit + 1;
		Pager pager = this.certificationService.pageAll(pageNum, limit);
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,pager);
	}

	/* Add ******************/
	@ApiOperation(value = "新增certification#v1.0",notes = "新增certification#v1.0")
	@RequestMapping(value = "/new",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _new(@RequestBody Certification certification) {
		try {
			certification.setCreatedon(System.currentTimeMillis()/1000);
			certification.setCreatedby(getCurrentUserId());
			this.certificationService.add(certification);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

	/* Edit *****************/
	@ApiOperation(value = "更新certification#v1.0",notes = "更新certification#v1.0")
	@RequestMapping(value = "/update",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _update(Certification certification) {
		try {
			this.certificationService.modify(certification);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

	/* Delete ***************/
	@ApiOperation(value = "删除certification#v1.0",notes = "删除certification#v1.0")
	@RequestMapping(value = "/delete",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _delete(
			@RequestParam(value = "ids", required = true, defaultValue = "") String idstring) {
		try {
			String[] ids = idstring.split(",");
			for (int i = 0; i < ids.length; i++) {
				this.certificationService.removeById(Integer.parseInt(ids[i]));
			}
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

	@ApiOperation(value = "上传多张图片到自有服务器#v1.0", notes = "上传多张图片#v1.0;其中：<br>cert_type=company（企业）或person（个人）;<br>image_type=front(正面）或reverse（背面）或handing（手持）")
	@RequestMapping(value = "/upload/{cert_type}/{image_type}", method = RequestMethod.POST)
	public JsonResult _batchUploadFile(@PathVariable("cert_type") String certtype,@PathVariable("image_type") String imagetype,@RequestParam(value = "file", required = false) CommonsMultipartFile[] file, HttpServletRequest request) {
			// 判断文件是否为空
			if (file != null && file.length > 0) {
				try {
				ArrayList<String> imageList = new ArrayList<String>();

				for (int i = 0; i < file.length; i++) {
					String name = file[i].getOriginalFilename();
					String last = name.substring(name.lastIndexOf(".") + 1);
					// 上传路径--文件保存路径
					String fileRootPath = request.getSession().getServletContext().getResource("/").toString();//("/")+baseUploadPath;
					String fileSubPath = certUploadPath+certtype+"/" +imagetype+ "_"+System.currentTimeMillis() + new Random(50000).nextInt()
							+ "." + last;
					//String fileRootPath = request.getSession().getServletContext().getRealPath("../../");
					//String fileSubPath = "/upload/certification/"+certtype+"/" +imagetype+ "_"+System.currentTimeMillis() + new Random(50000).nextInt()
					//		+ "." + last;
					File newfile = new File(fileRootPath, fileSubPath);
					file[i].transferTo(newfile);
					imageList.add(fileSubPath);
				}
				
				String imageStr = StringUtil.join(imageList, ",");
				
//				Certification certification= new Certification();
//				certification.setImages(imageStr);
//				certification.setType(certtype);
//				certification.setCreatedby(getCurrentUserId());
//				certification.setCreatedon(System.currentTimeMillis() / 1000);
//				this.certificationService.add(certification);
//				Certification certification1 = this.certificationService.findById(certification.getId());
//				return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN, certification1);
				return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN, imageStr);
				} catch (Exception e) {
					return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
				}
			}
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION);
		
	}
}
