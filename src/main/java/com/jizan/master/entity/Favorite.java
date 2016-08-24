package com.jizan.master.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Favorite {

	private Long id;
	private Long itemid;
	private String category;
	private Integer createdby;
	private Long createdon;

	public Long getId(){
		return id;
	}

	public  void setId(Long id){
		this.id = id;
	}

	public Long getItemid(){
		return itemid;
	}

	public  void setItemid(Long itemid){
		this.itemid = itemid;
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
