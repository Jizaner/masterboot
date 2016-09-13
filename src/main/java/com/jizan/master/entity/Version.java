package com.jizan.master.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Version {

	private Integer id;
	private String version;
	private String description;
	private Integer isforced;
	private String updateurl;
	private Long createdon;
	private Long createdby;

	public Integer getId(){
		return id;
	}

	public  void setId(Integer id){
		this.id = id;
	}

	public String getVersion(){
		return version;
	}

	public  void setVersion(String version){
		this.version = version;
	}

	public String getDescription(){
		return description;
	}

	public  void setDescription(String description){
		this.description = description;
	}

	public Integer getIsforced(){
		return isforced;
	}

	public  void setIsforced(Integer isforced){
		this.isforced = isforced;
	}

	public String getUpdateurl(){
		return updateurl;
	}

	public  void setUpdateurl(String updateurl){
		this.updateurl = updateurl;
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
