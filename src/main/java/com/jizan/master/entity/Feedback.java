package com.jizan.master.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Feedback {

	private Long id;
	private String content;
	private String images;
	private String category;
	private Integer createdby;
	private Long createdon;

	public Long getId(){
		return id;
	}

	public  void setId(Long id){
		this.id = id;
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

	public String getCategory(){
		return category;
	}

	public  void setCategory(String category){
		this.category = category;
	}

	public Integer getCreatedby(){
		return createdby;
	}

	public  void setCreatedby(Integer createdby){
		this.createdby = createdby;
	}

	public Long getCreatedon(){
		return createdon;
	}

	public  void setCreatedon(Long createdon){
		this.createdon = createdon;
	}


}
