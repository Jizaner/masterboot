package com.jizan.master.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.*;

import com.jizan.utils.Pager;
import com.jizan.utils.JsonResult;
import com.jizan.utils.SystemConfig;
import com.jizan.master.entity.Reply;
import com.jizan.master.entity.Topic;
import com.jizan.master.service.ReplyService;
import com.jizan.master.service.TopicService;

@Api(value = "回答接口")
@RestController
@RequestMapping("/reply")
public class ReplyController extends BaseController{

	@Resource
	private ReplyService replyService;
	
	@Resource
	private TopicService topicService;
	

	/* Show ******************/
	@ApiOperation(value = "获取reply详情#v1.0",notes = "获取reply详情#v1.0")
	@RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Reply _show(@PathVariable("id") int id) {
		Reply reply = this.replyService.findById(id);
		return reply;
	}

	/* List ******************/
	@ApiOperation(value = "获取reply列表#v1.0",notes = "获取reply列表#v1.0")
	@RequestMapping(value = "/list",method=RequestMethod.POST)
	@ResponseBody
	public List<Reply> _list() {
		List<Reply> list = this.replyService.listAll();
		return list;
	}

	/* Page ******************/
	@ApiOperation(value = "根据页码获取reply分页#v1.0",notes = "根据页码获取reply分页#v1.0")
	@RequestMapping(value = "{topicid:\\d+}//page/{num:\\d+}",method=RequestMethod.GET)
	@ResponseBody
	public Pager _page(@PathVariable("topicid") int topidId,@PathVariable("num") int pageNum) {
		int limit = 20;
		Map<Object, Object> conditions = new HashMap<Object, Object>();
		conditions.put("topicid", topidId);
		Pager pager = this.replyService.pageWith(pageNum, limit, conditions);
		return pager;
	}

	/* Pager ****************/
	@ApiOperation(value = "获取reply分页#v1.0",notes = "获取reply分页#v1.0")
	@RequestMapping(value = "/pager",method=RequestMethod.POST)
	@ResponseBody
	public Pager _pageTable(int offset, int limit) {
		int pageNum = offset / limit + 1;
		Pager pager = this.replyService.pageAll(pageNum, limit);
		return pager;
	}

	/* Add ******************/
	@ApiOperation(value = "新增reply#v1.0",notes = "新增reply#v1.0")
	@RequestMapping(value = "/new",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _new(@RequestBody Reply reply) {
		try {
			Topic topic = this.topicService.findById(reply.getTopicid());
			if (topic!=null) {
				topic.setReplynum(topic.getReplynum()+1);
				this.topicService.modify(topic);
				reply.setCreatedon(System.currentTimeMillis()/1000);
				reply.setCreatedby(getCurrentUserId());
				this.replyService.add(reply);
				return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,topic);
			}
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.NOT_FOUND,"您回答的问题不存在！");
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
	}

	/* Edit *****************/
	@ApiOperation(value = "更新reply#v1.0",notes = "更新reply#v1.0")
	@RequestMapping(value = "/update",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _update(Reply reply) {
		try {
			this.replyService.modify(reply);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

	/* Delete ***************/
	@ApiOperation(value = "删除reply#v1.0",notes = "删除reply#v1.0")
	@RequestMapping(value = "/delete",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _delete(
			@RequestParam(value = "ids", required = true, defaultValue = "") String idstring) {
		try {
			String[] ids = idstring.split(",");
			for (int i = 0; i < ids.length; i++) {
				this.replyService.removeById(Integer.parseInt(ids[i]));
			}
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

}
