package com.jizan.master.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class News {

	private Long id;
	private String title;//标题
	private String summary;//摘要信息
	private String cover;//封面图片url
	private String content;//列表显示的内容
	private String source;//来源，例如36kr
	private String url;//web页面地址
	private String tags;//标签
	private int readnum;//阅读量
	private Long createdon;
	private Integer createdby;
	
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

	public String getSummary(){
		return summary;
	}

	public  void setSummary(String summary){
		this.summary = summary;
	}

	public String getCover(){
		return cover;
	}

	public  void setCover(String cover){
		this.cover = cover;
	}

	public String getContent(){
		return content;
	}

	public  void setContent(String content){
		this.content = content;
	}

	public String getSource(){
		return source;
	}

	public  void setSource(String source){
		this.source = source;
	}

	public String getUrl(){
		return url;
	}

	public  void setUrl(String url){
		this.url = url;
	}

	public String getTags(){
		return tags;
	}

	public  void setTags(String tags){
		this.tags = tags;
	}

	public Integer getReadnum(){
		return readnum;
	}

	public  void setReadnum(Integer readnum){
		this.readnum = readnum;
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
