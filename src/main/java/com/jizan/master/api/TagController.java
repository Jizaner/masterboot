package com.jizan.master.api;

import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.*;

import com.jizan.utils.Pager;
import com.jizan.utils.SystemConfig;
import com.jizan.utils.JsonResult;

import com.jizan.master.entity.Tag;
import com.jizan.master.service.TagService;

@Api(value = "tag",description = "/*添加注释*/")
@RestController
@RequestMapping("/app/tag")
public class TagController extends BaseController {

	@Resource
	private HttpServletRequest request;

	@Resource
	private TagService tagService;

	/* Show ******************/
	@ApiOperation(value = "获取tag详情#v1.0",notes = "获取tag详情#v1.0")
	@RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Tag _show(@PathVariable("id") int id) {
		Tag tag = this.tagService.findById(id);
		
		 HttpSession session = request.getSession();
	      
		System.out.println(session.getAttribute("userid"));
		return tag;
	}

	/* List ******************/
	@ApiOperation(value = "获取tag列表#v1.0",notes = "获取tag列表#v1.0")
	@RequestMapping(value = "/list",method=RequestMethod.POST)
	@ResponseBody
	public List<Tag> _list() {
		List<Tag> list = this.tagService.listAll();
		return list;
	}

	/* Page ******************/
	@ApiOperation(value = "根据页码获取tag分页#v1.0",notes = "根据页码获取tag分页#v1.0")
	@RequestMapping(value = "/page/{num:\\d+}",method=RequestMethod.GET)
	@ResponseBody
	public Pager _page(@PathVariable("num") int pageNum) {
		int limit = 20;
		Pager pager = this.tagService.pageAll(pageNum, limit);
		return pager;
	}

	/* Pager ****************/
	@ApiOperation(value = "获取tag分页#v1.0",notes = "获取tag分页#v1.0")
	@RequestMapping(value = "/pager",method=RequestMethod.POST)
	@ResponseBody
	public Pager _pageTable(int offset, int limit) {
		int pageNum = offset / limit + 1;
		Pager pager = this.tagService.pageAll(pageNum, limit);
		return pager;
	}

	/* Add ******************/
	@ApiOperation(value = "新增tag#v1.0",notes = "新增tag#v1.0")
	@RequestMapping(value = "/new",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _new(@RequestBody Tag tag) {
		try {
			Random ram=new Random();
			//tag.setCreatedby(1000000+(long)Math.abs(ram.nextInt()%11));//取0~10之间的随机数
			tag.setCreatedby(getCurrentUserId());
			tag.setCreatedon(System.currentTimeMillis()/1000);
			this.tagService.add(tag);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

	/* Edit *****************/
	@ApiOperation(value = "更新tag#v1.0",notes = "更新tag#v1.0")
	@RequestMapping(value = "/update",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _update(Tag tag) {
		try {
			this.tagService.modify(tag);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

	/* Delete ***************/
	@ApiOperation(value = "删除tag#v1.0",notes = "删除tag#v1.0")
	@RequestMapping(value = "/delete",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _delete(
			@RequestParam(value = "ids", required = true, defaultValue = "") String idstring) {
		try {
			String[] ids = idstring.split(",");
			for (int i = 0; i < ids.length; i++) {
				this.tagService.removeById(Integer.parseInt(ids[i]));
			}
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

}
