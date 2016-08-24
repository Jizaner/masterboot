package com.jizan.master.entity;

import java.util.HashMap;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Reply {

	private Long id;
	private String content;
	private Long topicid;
	private Integer createdby;
	private Long createdon;
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

	public String getContent(){
		return content;
	}

	public  void setContent(String content){
		this.content = content;
	}

	public Long getTopicid(){
		return topicid;
	}

	public  void setTopicid(Long topicid){
		this.topicid = topicid;
	}

	public Integer getCreatedby(){
		return createdby;
	}

	public  void setCreatedby(Integer createdby){
		this.createdby = createdby;
	}

	public long getCreatedon(){
		return createdon;
	}

	public  void setCreatedon(Long createdon){
		this.createdon = createdon;
	}


}
