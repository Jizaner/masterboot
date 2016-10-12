package com.jizan.master.api;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.*;

import com.jizan.utils.Pager;
import com.jizan.utils.SystemConfig;
import com.jizan.utils.JsonResult;

import com.jizan.master.entity.Favorite;
import com.jizan.master.service.FavoriteService;
import com.jizan.master.service.NewsService;
import com.jizan.master.service.TopicService;

@Api(value = "favorite",description = "添加注释")
@RestController
@RequestMapping("/app/favorite")
public class FavoriteController extends BaseController {

	@Resource
	private FavoriteService favoriteService;
	
	@Resource
	private NewsService newsService;
	
	@Resource
	private TopicService topicService;

	/* Show ******************/
	@ApiOperation(value = "获取favorite详情#v1.0",notes = "获取favorite详情#v1.0")
	@RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Favorite _show(@PathVariable("id") int id) {
		Favorite favorite = this.favoriteService.findById(id);
		return favorite;
	}

	/* List ******************/
	@ApiOperation(value = "获取favorite列表#v1.0",notes = "获取favorite列表#v1.0")
	@RequestMapping(value = "/list",method=RequestMethod.POST)
	@ResponseBody
	public List<Favorite> _list() {
		List<Favorite> list = this.favoriteService.listAll();
		return list;
	}

	/* Page ******************/
	@ApiOperation(value = "根据页码获取favorite分页#v1.0",notes = "根据页码获取favorite分页#v1.0")
	@RequestMapping(value = "/page/{num:\\d+}",method=RequestMethod.GET)
	@ResponseBody
	public Pager _page(@PathVariable("num") int pageNum) {
		int limit = 20;
		Pager pager = this.favoriteService.pageAll(pageNum, limit);
		return pager;
	}

	/* Page ******************/
/*	@ApiOperation(value = "根据收藏类型获取favorite分页#v1.0",notes = "根据页码获取favorite分页#v1.0")
	@RequestMapping(value = "/my/{category}/page/{num:\\d+}",method=RequestMethod.GET)
	@ResponseBody
	public Pager _myPage(@RequestParam Long userid, @PathVariable("category") String category, @PathVariable("num") int pageNum) {
		int limit = 20;
		Map<Object, Object> conditions = new HashMap<>();
		conditions.put("category", category);
		conditions.put("createdby", userid);
		Pager pagerwith=this.favoriteService.pageWith(pageNum, limit, conditions);
		return pagerwith;
	}
	*/
	/* Page ******************/
	@ApiOperation(value = "我的收藏分页列表#v1.0",notes = "根据category的不同分页获取结果#v1.0")
	@RequestMapping(value = "/my/{category}/page/{num:\\d+}",method=RequestMethod.GET)
	@ResponseBody
	public JsonResult _myNews(@PathVariable("category") String category, @PathVariable("num") int pageNum) {
		Map<Object, Object> conditions = new HashMap<Object, Object>();
		conditions.put("category", category);
		conditions.put("createdby", getCurrentUserId());
		List<Favorite> favorites=this.favoriteService.listBy(conditions);
		if (null!=favorites&&favorites.size()>0) {
			ArrayList<Object> ids= new ArrayList<Object>();
			for (Favorite favorite : favorites) {
				ids.add(favorite.getItemid());
			}
			if (category.equalsIgnoreCase("news")) {
				Map map = new HashMap<Object, Object>();
				map.put("idsList", ids);
				return new JsonResult(SystemConfig.SUCCESS,SystemConfig.WIN,newsService.pageByIds(map));
			}
			if (category.equalsIgnoreCase("topic")) {
				Map map = new HashMap<Object, Object>();
				map.put("idsList", ids);
				return new JsonResult(SystemConfig.SUCCESS,SystemConfig.WIN,topicService.pageByIds(map));
			}
		}
		return new JsonResult(SystemConfig.DEFEAT,SystemConfig.NOT_FOUND,"无数据！");
	}
	
	/* Pager ****************/
	@ApiOperation(value = "获取favorite分页#v1.0",notes = "获取favorite分页#v1.0")
	@RequestMapping(value = "/pager",method=RequestMethod.POST)
	@ResponseBody
	public Pager _pageTable(int offset, int limit) {
		int pageNum = offset / limit + 1;
		Pager pager = this.favoriteService.pageAll(pageNum, limit);
		return pager;
	}

	/* Add ******************/
	@ApiOperation(value = "新增favorite#v1.0",notes = "新增favorite#v1.0<br>其中，category的值为：news或topic或user等")
	@RequestMapping(value = "/new",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _new(@RequestBody Favorite favorite) {
		try {
			if (this.favoriteService.findBy(favorite)!=null) {
				return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXIST,"不能重复收藏！");
			}
			Random ram=new Random();
			//favorite.setCreatedby(10000000+(long)Math.abs(ram.nextInt()%11));//取0~10之间的随机数
			favorite.setCreatedby(getCurrentUserId());
			favorite.setCreatedon(System.currentTimeMillis()/1000);
			this.favoriteService.add(favorite);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

	/* Edit *****************/
	@ApiOperation(value = "更新favorite#v1.0",notes = "更新favorite#v1.0")
	@RequestMapping(value = "/update",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _update(@RequestBody Favorite favorite) {
		try {
			this.favoriteService.modify(favorite);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

	/* Delete ***************/
	@ApiOperation(value = "根据ID删除favorite#v1.0",notes = "删除favorite#v1.0")
	@RequestMapping(value = "/delete",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _delete(
			@RequestParam(value = "ids", required = true, defaultValue = "") String idstring) {
		try {
			String[] ids = idstring.split(",");
			for (int i = 0; i < ids.length; i++) {
				this.favoriteService.removeById(Integer.parseInt(ids[i]));
			}
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

	/* Delete ***************/
	@Deprecated
	@ApiOperation(value = "根据条件删除favorite#v1.0",notes = "删除favorite#v1.0")
	@RequestMapping(value = "/deleteby",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _deleteBy(@RequestBody Favorite favorite) {
		try {
				this.favoriteService.removeBy(favorite);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}
	

	/* change state ******************/
	@ApiOperation(value = "用户添加或取消收藏#v1.0",notes = "如果已收藏，则取消；如果未收藏，则添加。#v1.0")
	@RequestMapping(value = "/state/change",method=RequestMethod.GET)
	@ResponseBody
	public JsonResult _changeState(@RequestParam String category,@RequestParam Long itemid) {
		Favorite queryItem= new Favorite();
		queryItem.setCategory(category);
		queryItem.setItemid(itemid);
		queryItem.setCreatedby(getCurrentUserId());
		if (null != this.favoriteService.findBy(queryItem)) {
			this.favoriteService.removeBy(queryItem);
			return new JsonResult(SystemConfig.SUCCESS, SystemConfig.EXIST, "已成功取消收藏！");
		}else{
			queryItem.setCreatedon(System.currentTimeMillis()/1000);
			this.favoriteService.add(queryItem);
			return new JsonResult(SystemConfig.SUCCESS, SystemConfig.NOT_FOUND, "已成功加入收藏！");
		}
	}
		
	/* show state ******************/
	@ApiOperation(value = "判断用户是否已收藏#v1.0",notes = "判断用户是否已收藏#v1.0")
	@RequestMapping(value = "/state/show",method=RequestMethod.GET)
	@ResponseBody
	public JsonResult _showState(@RequestParam String category,@RequestParam Long itemid) {
		Favorite queryItem= new Favorite();
		queryItem.setCategory(category);
		queryItem.setItemid(itemid);
		queryItem.setCreatedby(getCurrentUserId());
		if (null != this.favoriteService.findBy(queryItem)) {
			return new JsonResult(SystemConfig.SUCCESS, SystemConfig.EXIST, "Has collected!");
		}else{
			return new JsonResult(SystemConfig.SUCCESS, SystemConfig.NOT_FOUND, "Has not collected!");
		}
	}
}
