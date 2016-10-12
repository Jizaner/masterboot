package com.jizan.master.api;

import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.*;

import com.jizan.utils.Pager;
import com.jizan.utils.SystemConfig;
import com.jizan.utils.JsonResult;

import com.jizan.master.entity.Version;
import com.jizan.master.service.VersionService;

@Api(value = "version",description = "/*添加注释*/")
@RestController
@RequestMapping("/app/version")
public class VersionController {

	@Resource
	private VersionService versionService;

	/* Show ******************/
	@ApiOperation(value = "根据ID获取version#v1.0",notes = "根据ID获取version#v1.0")
	@RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
	@ResponseBody
	public JsonResult _show(@PathVariable("id") int id) {
		Version version = this.versionService.findById(id);
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,version);
	}
	
	/* Show ******************/
	@ApiOperation(value = "获取最新版本号#v1.0",notes = "获取最新版本号#v1.0")
	@RequestMapping(value = "/show/latest", method = RequestMethod.GET)
	@ResponseBody
	public JsonResult _showLatest() {
		Version version = this.versionService.findLatest();
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,version);
	}
	

	/* List ******************/
	@ApiOperation(value = "获取全部version列表#v1.0",notes = "获取全部version列表#v1.0")
	@RequestMapping(value = "/list",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _list() {
		List<Version> list = this.versionService.listAll();
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,list);
	}

	/* Page ******************/
	@ApiOperation(value = "根据页码获取version分页数据#v1.0",notes = "根据页码获取version分页数据#v1.0")
	@RequestMapping(value = "/page/{num:\\d+}",method=RequestMethod.GET)
	@ResponseBody
	public JsonResult _page(@PathVariable("num") int pageNum) {
		int limit = 20;
		Pager pager = this.versionService.pageAll(pageNum, limit);
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,pager);
	}

	/* Pager ****************/
	@ApiOperation(value = "获取version分页#v1.0",notes = "获取version分页#v1.0")
	@RequestMapping(value = "/pager",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _pageTable(int offset, int limit) {
		int pageNum = offset / limit + 1;
		Pager pager = this.versionService.pageAll(pageNum, limit);
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN,pager);
	}

	/* Add ******************/
	@ApiOperation(value = "新增version#v1.0",notes = "新增version#v1.0")
	@RequestMapping(value = "/new",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _new(@RequestBody Version version) {
		try {
			Random ram=new Random();
			version.setCreatedby(1000000+(long)Math.abs(ram.nextInt()%11));//取0~10之间的随机数
			version.setCreatedon(System.currentTimeMillis()/1000);
			this.versionService.add(version);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

	/* Edit *****************/
	@ApiOperation(value = "更新version#v1.0",notes = "更新version#v1.0")
	@RequestMapping(value = "/update",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _update(Version version) {
		try {
			this.versionService.modify(version);
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

	/* Delete ***************/
	@ApiOperation(value = "删除version#v1.0",notes = "删除version#v1.0")
	@RequestMapping(value = "/delete",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult _delete(
			@RequestParam(value = "ids", required = true, defaultValue = "") String idstring) {
		try {
			String[] ids = idstring.split(",");
			for (int i = 0; i < ids.length; i++) {
				this.versionService.removeById(Integer.parseInt(ids[i]));
			}
		} catch (Exception e) {
			return new JsonResult(SystemConfig.DEFEAT, SystemConfig.EXCEPTION, e);
		}
		return new JsonResult(SystemConfig.SUCCESS, SystemConfig.WIN);
	}

}
