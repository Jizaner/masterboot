package com.jizan.master.api;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.jizan.master.entity.Topic;
import com.jizan.master.service.TopicService;
import com.jizan.utils.Pager;
import com.jizan.utils.StringUtil;
import com.jizan.utils.JsonResult;
import com.jizan.utils.SystemConfig;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api(value = "问题接口")
@RestController
@RequestMapping("/topic")
public class TopicController extends BaseController {

	@Resource
	private TopicService topicService;

	/* Show ******************/

	@ApiOperation(value = "获取topic详情#v1.0", notes = "获取topic详情#v1.0")
	// @ApiImplicitParam(name = "id", value = "唯一编码", required = true, dataType
	// = "String")
	@RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Topic _show(@PathVariable("id") long id) {
		Topic topic = this.topicService.findById(id);
		return topic;
	}

	/* List ******************/
	@ApiOperation(value = "获取topic列表#v1.0", notes = "获取topic列表#v1.0")
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public List<Topic> _list() {
		List<Topic> list = this.topicService.listAll();
		return list;
	}

	/* List ******************/
	@ApiOperation(value = "获取topic列表#v1.0", notes = "获取topic列表#v1.0")
	@RequestMapping(value = "/templist", method = RequestMethod.POST)
	@ResponseBody
	public List<Topic> _templist() {
		Map<String, List<Integer>> map = new HashMap<String, List<Integer>>();
		List<Integer> idsList = new ArrayList<Integer>();
		idsList.add(1);
		idsList.add(2);
		idsList.add(3);
		idsList.add(5);
		map.put("idsList", idsList);
		List<Topic> list = this.topicService.pageByIds(map);

		// List<Topic> list = this.topicService.listAll();
		return list;
	}

	/* Page ******************/
	@ApiOperation(value = "根据页码获取topic分页#v1.0", notes = "根据页码获取topic分页#v1.0")
	@RequestMapping(value = "/page/{num:\\d+}", method = RequestMethod.GET)
	@ResponseBody
	public Pager _page(@PathVariable("num") int pageNum) {
		int limit = 20;
		Pager pager = this.topicService.pageAll(pageNum, limit);
		return pager;
	}

	/* Pager ****************/
	@ApiOperation(value = "获取topic分页#v1.0", notes = "获取topic分页#v1.0")
	@RequestMapping(value = "/pager", method = RequestMethod.POST)
	@ResponseBody
	public Pager _pageTable(int offset, int limit) {
		int pageNum = offset / limit + 1;
		Pager pager = this.topicService.pageAll(pageNum, limit);
		return pager;
	}

	/* Add ******************/
	@ApiOperation(value = "新增topic#v1.0", notes = "新增topic#v1.0")
	@RequestMapping(value = "/new", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult _new(@RequestBody Topic topic) {
		try {
			// topic.setTitle(StringUtil.getRandomJianHan(20));
			// topic.setContent(StringUtil.getRandomJianHan(50));
			topic.setReplynum(0);
			topic.setCreatedby(getCurrentUserId());
			topic.setCreatedon(System.currentTimeMillis() / 1000);
			this.topicService.add(topic);// 在mapper.xml中必须声明id字段，才会获取mysql自增字段的ID号
			Topic newtopic = this.topicService.findById(topic.getId());
			return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN, newtopic);

		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
	}

	/* Edit *****************/
	@ApiOperation(value = "更新topic#v1.0", notes = "更新topic#v1.0")
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult _update(Topic topic) {
		try {
			this.topicService.modify(topic);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

	/* Delete ***************/
	@ApiOperation(value = "删除topic#v1.0", notes = "删除topic#v1.0")
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult _delete(@RequestParam(value = "ids", required = true, defaultValue = "") String idstring) {
		try {
			String[] ids = idstring.split(",");
			for (int i = 0; i < ids.length; i++) {
				this.topicService.removeById(Integer.parseInt(ids[i]));
			}
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

	/* Page ******************/
	@ApiOperation(value = "我提问的主题topic分页#v1.0", notes = "根据页码获取topic分页#v1.0")
	@RequestMapping(value = "/myask/page/{num:\\d+}", method = RequestMethod.GET)
	@ResponseBody
	public Pager _myAskPage(@PathVariable("num") int pageNum) {
		int limit = 20;
		Map<Object, Object> conditions = new HashMap<Object, Object>();
		conditions.put("createdby", getCurrentUserId());
		Pager pagerwith = this.topicService.pageWith(pageNum, limit, conditions);
		return pagerwith;
	}

	/* Page ******************/
	@ApiOperation(value = "我回答的主题topic分页#v1.0", notes = "根据页码获取topic分页#v1.0")
	@RequestMapping(value = "/myreply/page/{num:\\d+}", method = RequestMethod.GET)
	@ResponseBody
	public Pager _myReplyPage(@PathVariable("num") int pageNum) {
		int limit = 20;
		Map<Object, Object> conditions = new HashMap<Object, Object>();
		conditions.put("repliedby", getCurrentUserId());
		Pager pager = this.topicService.pageRepliedBy(pageNum, limit, conditions);
		return pager;
	}

	@ApiOperation(value = "新增主题，并上传多张图片#v1.0", notes = "新增主题，并上传多张图片#v1.0")
	@RequestMapping(value = "/new/images", method = RequestMethod.POST)
	public JsonResult _batchUploadFile(Topic topic,
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
					String fileSubPath = "upload/topic/" + System.currentTimeMillis() + new Random(50000).nextInt()
							+ "." + last;
					File newfile = new File(fileRootPath, fileSubPath);
					file[i].transferTo(newfile);
					imageList.add(fileSubPath);
				}
				String imageStr = StringUtil.join(imageList, ",");
				topic.setImages(imageStr);
			}
			topic.setReplynum(0);
			topic.setCreatedby(getCurrentUserId());
			topic.setCreatedon(System.currentTimeMillis() / 1000);
			this.topicService.add(topic);
			Topic newtopic = this.topicService.findById(topic.getId());
			return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN, newtopic);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
	}

}
