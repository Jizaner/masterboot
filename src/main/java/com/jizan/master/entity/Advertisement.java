package com.jizan.master.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Advertisement {

	private Integer id;
	private String imageurl;
	private String redirecturl;
	private String description;
	private Integer redirectnum;
	private String position;
	private Long createdon;
	private Long createdby;

	public Integer getId(){
		return id;
	}

	public  void setId(Integer id){
		this.id = id;
	}

	public String getImageurl(){
		return imageurl;
	}

	public  void setImageurl(String imageurl){
		this.imageurl = imageurl;
	}

	public String getRedirecturl(){
		return redirecturl;
	}

	public  void setRedirecturl(String redirecturl){
		this.redirecturl = redirecturl;
	}

	public String getDescription(){
		return description;
	}

	public  void setDescription(String description){
		this.description = description;
	}

	public Integer getRedirectnum(){
		return redirectnum;
	}

	public  void setRedirectnum(Integer redirectnum){
		this.redirectnum = redirectnum;
	}

	public String getPosition(){
		return position;
	}

	public  void setPosition(String position){
		this.position = position;
	}

	public Long getCreatedon(){
		return createdon;
	}

	public  void setCreatedon(Long createdon){
		this.createdon = createdon;
	}

	public Long getCreatedby(){
		return createdby;
	}

	public  void setCreatedby(Long createdby){
		this.createdby = createdby;
	}


}
