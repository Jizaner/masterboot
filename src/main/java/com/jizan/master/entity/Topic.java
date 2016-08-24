package com.jizan.master.entity;

import java.util.HashMap;

import com.fasterxml.jackson.annotation.JsonInclude;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@JsonInclude(JsonInclude.Include.NON_NULL)
@ApiModel
public class Topic {

	@ApiModelProperty(value = "问题编码", required = true)
	private Long id;
	@ApiModelProperty(value = "问题标题", required = true)
	private String title;
	@ApiModelProperty(value = "问题内容")
	private String content;
	@ApiModelProperty(value = "问题图片")
	private String images;
	@ApiModelProperty(value = "问题标签")
	private String tags;
	@ApiModelProperty(value = "回答数")
	private Integer replynum;
	@ApiModelProperty(value = "作者", required = true)
	private Long createdon;
	@ApiModelProperty(value = "发表时间", required = true)
	private Integer createdby;
	private HashMap<String, String> author;

	public HashMap<String, String> getAuthor() {
		return author;
	}

	public void setAuthor(HashMap<String, String> author) {
		this.author = author;
	}

	public Long getId(){
		return id;
	}

	public  void setId(Long id){
		this.id = id;
	}

	public String getTitle(){
		return title;
	}

	public  void setTitle(String title){
		this.title = title;
	}

	public String getContent(){
		return content;
	}

	public  void setContent(String content){
		this.content = content;
	}

	public String getImages(){
		return images;
	}

	public  void setImages(String images){
		this.images = images;
	}

	public String getTags(){
		return tags;
	}

	public  void setTags(String tags){
		this.tags = tags;
	}

	public Integer getReplynum(){
		return replynum;
	}

	public  void setReplynum(Integer replynum){
		this.replynum = replynum;
	}

	public Long getCreatedon(){
		return createdon;
	}

	public  void setCreatedon(Long createdon){
		this.createdon = createdon;
	}

	public Integer getCreatedby(){
		return createdby;
	}

	public  void setCreatedby(Integer createdby){
		this.createdby = createdby;
	}


}
