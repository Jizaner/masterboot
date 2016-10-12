package com.jizan.master.api;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.jizan.master.entity.Feedback;
import com.jizan.master.entity.Topic;
import com.jizan.master.entity.User;
import com.jizan.master.service.FeedbackService;
import com.jizan.utils.Pager;
import com.jizan.utils.StringUtil;
import com.jizan.utils.JsonResult;
import com.jizan.utils.SystemConfig;
import com.jizan.vendors.qiniu.QiniuBase;
import com.jizan.vendors.qiniu.QiniuUpload;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api(value = "意见反馈接口")
@RestController
@RequestMapping("/app/feedback")
public class FeedbackController extends BaseController {

	@Resource
	private FeedbackService feedbackService;
	
	
	
	@Value("${spring.upload-path.feedback}")
	private String feedbackUploadPath;
	/* Show ******************/
	@ApiOperation(value = "获取feedback详情#v1.0", notes = "获取feedback详情#v1.0")
	@RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Feedback _show(@PathVariable("id") int id) {
		Feedback feedback = this.feedbackService.findById(id);
		return feedback;
	}

	/* List ******************/
	@ApiOperation(value = "获取feedback列表#v1.0", notes = "获取feedback列表#v1.0")
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public List<Feedback> _list() {
		List<Feedback> list = this.feedbackService.listAll();
		return list;
	}

	/* Page ******************/
	@ApiOperation(value = "根据页码获取feedback分页#v1.0", notes = "根据页码获取feedback分页#v1.0")
	@RequestMapping(value = "/page/{num:\\d+}", method = RequestMethod.GET)
	@ResponseBody
	public Pager _page(@PathVariable("num") int pageNum) {
		int limit = 20;
		Pager pager = this.feedbackService.pageAll(pageNum, limit);
		return pager;
	}

	/* Pager ****************/
	@ApiOperation(value = "获取feedback分页#v1.0", notes = "获取feedback分页#v1.0")
	@RequestMapping(value = "/pager", method = RequestMethod.POST)
	@ResponseBody
	public Pager _pageTable(int offset, int limit) {
		int pageNum = offset / limit + 1;
		Pager pager = this.feedbackService.pageAll(pageNum, limit);
		return pager;
	}

	/* Add ******************/
	@ApiOperation(value = "新增feedback#v1.0", notes = "新增feedback#v1.0")
	@RequestMapping(value = "/new", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult _new(@RequestBody Feedback feedback) {
		try {
			// Random ram=new Random();
			// feedback.setCreatedby(10000000+(long)Math.abs(ram.nextInt()%11));//取0~10之间的随机数
			feedback.setCreatedon(System.currentTimeMillis() / 1000);
			feedback.setCreatedby(getCurrentUserId());
			this.feedbackService.add(feedback);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

	/* Edit *****************/
	@ApiOperation(value = "更新feedback#v1.0", notes = "更新feedback#v1.0")
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult _update(Feedback feedback) {
		try {
			this.feedbackService.modify(feedback);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

	/* Delete ***************/
	@ApiOperation(value = "删除feedback#v1.0", notes = "删除feedback#v1.0")
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult _delete(@RequestParam(value = "ids", required = true, defaultValue = "") String idstring) {
		try {
			String[] ids = idstring.split(",");
			for (int i = 0; i < ids.length; i++) {
				this.feedbackService.removeById(Integer.parseInt(ids[i]));
			}
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

	@ApiOperation(value = "新增feedback，并上传多张图片#v1.0", notes = "新增feedback，并上传多张图片#v1.0")
	@RequestMapping(value = "/new/images", method = RequestMethod.POST)
	public JsonResult _batchUploadFile(Feedback feedback,
			@RequestParam(value = "file", required = false) CommonsMultipartFile[] file, HttpServletRequest request) {
		try {
			// 判断文件是否为空
			if (file != null && file.length > 0) {
				ArrayList<String> imageList = new ArrayList<String>();
				for (int i = 0; i < file.length; i++) {
					String name = file[i].getOriginalFilename();
					String last = name.substring(name.lastIndexOf(".") + 1);
					// 上传路径--文件保存路径
					String fileRootPath = request.getSession().getServletContext().getRealPath("/");
					String fileSubPath = feedbackUploadPath + System.currentTimeMillis() + new Random(50000).nextInt()
							+ "." + last;
					File newfile = new File(fileRootPath, fileSubPath);
					file[i].transferTo(newfile);
					imageList.add(fileSubPath);
				}
				String imageStr = StringUtil.join(imageList, ",");
				feedback.setImages(imageStr);
			}
			feedback.setCreatedon(System.currentTimeMillis() / 1000);
			feedback.setCreatedby(getCurrentUserId());
			this.feedbackService.add(feedback);
			return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
	}

	@ApiOperation(value = "新增feedback，并上传单张图片#v1.0", notes = "新增feedback，并上传单张图片#v1.0")
	@RequestMapping(value = "/new/image", method = RequestMethod.POST)
	public JsonResult _batchUploadSingleFile(Feedback feedback,
			@RequestParam(value = "file", required = false) CommonsMultipartFile file, HttpServletRequest request) {
		// 判断文件是否为空
		try {
			if (file != null) {
				ArrayList<String> imageList = new ArrayList<String>();
				String name = file.getOriginalFilename();
				String last = name.substring(name.lastIndexOf(".") + 1);
				// 上传路径--文件保存路径
				String fileRootPath = request.getSession().getServletContext().getRealPath("/")+"upload\\feedback1";//+baseUploadPath;
				String fileRootPath2 = request.getSession().getServletContext().getResource("/").getPath()+"upload/feedback1";
				//String fileRootPth = request.getSession().getServletContext().getRealPath("/")+baseUploadPath;//
				String fileSubPath = System.currentTimeMillis() + new Random(50000).nextInt() + "." + last;
				File newfile = new File(fileRootPath, fileSubPath);
				if(!newfile.exists()&&!newfile.isDirectory()){
					newfile.mkdir();
				}
				file.transferTo(newfile);
				imageList.add(fileSubPath);
				String imageStr = StringUtil.join(imageList, ",");
				feedback.setImages(imageStr);
			}
			feedback.setCreatedon(System.currentTimeMillis() / 1000);
			feedback.setCreatedby(getCurrentUserId());
			this.feedbackService.add(feedback);
			return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
	}
	
	@ApiOperation(value = "新增feedback，并上传多张图片到七牛云服务器#v1.0", notes = "新增主题，并上传多张图片#v1.0")
	@RequestMapping(value = "/new/images/v2", method = RequestMethod.POST)
	public JsonResult _batchUploadFileV2(Feedback feedback,
			@RequestParam(value = "file", required = false) CommonsMultipartFile[] file, HttpServletRequest request) {
		try {
			String httpName = QiniuBase.HttpName;//"http://od8rh27zr.bkt.clouddn.com";//qiniu
			String bucketName =QiniuBase.BucketName;// "ommasters";//qiniu
			// 判断文件是否为空
			if (file != null && file.length > 0) {
				ArrayList<String> imageList = new ArrayList<String>();

				for (int i = 0; i < file.length; i++) {
					String name = file[i].getOriginalFilename();
					String last = name.substring(name.lastIndexOf(".") + 1);
					 // 上传到七牛后保存的文件名
			        String key = "feedback_"+System.currentTimeMillis() + new Random(50000).nextInt()+ "." + last;
			        byte[] fileByte = file[i].getBytes();
			        new QiniuUpload().upload(fileByte, key, bucketName);
					imageList.add(httpName+"/"+key);
				}
				String imageStr = StringUtil.join(imageList, ",");
				feedback.setImages(imageStr);
			}
			feedback.setCreatedby(getCurrentUserId());
			feedback.setCreatedon(System.currentTimeMillis() / 1000);
			this.feedbackService.add(feedback);
			return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
	}

}
