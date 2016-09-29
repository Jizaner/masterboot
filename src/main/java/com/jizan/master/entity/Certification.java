package com.jizan.master.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Certification {

	private Long id;
	private String title;
	private String type;
	private String number;
	private String description;
	private String images;
	private Long createdon;
	private Integer createdby;
	private Long verifiedon;
	private Long verifiedby;

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

	public String getType(){
		return type;
	}

	public  void setType(String type){
		this.type = type;
	}

	public String getDescription(){
		return description;
	}

	public  void setDescription(String description){
		this.description = description;
	}

	public String getImages(){
		return images;
	}

	public  void setImages(String images){
		this.images = images;
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

	public  void setCreatedby(Integer userid){
		this.createdby = userid;
	}

	public Long getVerifiedon(){
		return verifiedon;
	}

	public  void setVerifiedon(Long verifiedon){
		this.verifiedon = verifiedon;
	}

	public Long getVerifiedby(){
		return verifiedby;
	}

	public  void setVerifiedby(Long verifiedby){
		this.verifiedby = verifiedby;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}


}
