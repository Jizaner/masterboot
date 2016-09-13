package com.jizan.master.api;

import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.*;

import com.jizan.utils.Pager;
import com.jizan.utils.SystemConfig;
import com.jizan.utils.JsonResult;

import com.jizan.master.entity.Advertisement;
import com.jizan.master.service.AdvertisementService;

@Api(value = "advertisement",description = "/*添加注释*/")
@RestController
@RequestMapping("/advertisement")
public class AdvertisementController {

	@Resource
	private AdvertisementService advertisementService;

	/* Show ******************/
	@ApiOperation(value = "根据ID获取advertisement#v1.0",notes = "根据ID获取advertisement#v1.0")
	@RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
	@ResponseBody
	public JsonResult _show(@PathVariable("id") int id) {
		Advertisement advertisement = this.advertisementService.findById(id);
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,advertisement);
	}

	/* List ******************/
	@ApiOperation(value = "获取全部advertisement列表#v1.0",notes = "获取全部advertisement列表#v1.0")
	@RequestMapping(value = "/list",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _list() {
		List<Advertisement> list = this.advertisementService.listAll();
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,list);
	}

	/* Page ******************/
	@ApiOperation(value = "根据页码获取advertisement分页数据#v1.0",notes = "根据页码获取advertisement分页数据#v1.0")
	@RequestMapping(value = "/page/{num:\\d+}",method=RequestMethod.GET)
	@ResponseBody
	public JsonResult _page(@PathVariable("num") int pageNum) {
		int limit = 20;
		Pager pager = this.advertisementService.pageAll(pageNum, limit);
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,pager);
	}

	/* Pager ****************/
	@ApiOperation(value = "获取advertisement分页#v1.0",notes = "获取advertisement分页#v1.0")
	@RequestMapping(value = "/pager",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _pageTable(int offset, int limit) {
		int pageNum = offset / limit + 1;
		Pager pager = this.advertisementService.pageAll(pageNum, limit);
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,pager);
	}

	/* Add ******************/
	@ApiOperation(value = "新增advertisement#v1.0",notes = "新增advertisement#v1.0")
	@RequestMapping(value = "/new",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _new(@RequestBody Advertisement advertisement) {
		try {
			Random ram=new Random();
			advertisement.setCreatedby(1000000+(long)Math.abs(ram.nextInt()%11));//取0~10之间的随机数
			advertisement.setCreatedon(System.currentTimeMillis()/1000);
			this.advertisementService.add(advertisement);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

	/* Edit *****************/
	@ApiOperation(value = "更新advertisement#v1.0",notes = "更新advertisement#v1.0")
	@RequestMapping(value = "/update",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _update(Advertisement advertisement) {
		try {
			this.advertisementService.modify(advertisement);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

	/* Delete ***************/
	@ApiOperation(value = "删除advertisement#v1.0",notes = "删除advertisement#v1.0")
	@RequestMapping(value = "/delete",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _delete(
			@RequestParam(value = "ids", required = true, defaultValue = "") String idstring) {
		try {
			String[] ids = idstring.split(",");
			for (int i = 0; i < ids.length; i++) {
				this.advertisementService.removeById(Integer.parseInt(ids[i]));
			}
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

}
