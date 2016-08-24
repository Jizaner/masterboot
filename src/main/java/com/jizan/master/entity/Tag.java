package com.jizan.master.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Tag {

	private Long id;
	private String title;
	private String category;
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

	public String getCategory(){
		return category;
	}

	public  void setCategory(String category){
		this.category = category;
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
