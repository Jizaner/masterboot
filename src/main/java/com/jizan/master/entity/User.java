package com.jizan.master.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

import io.swagger.annotations.ApiModelProperty;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class User {

	private Integer id;
	private String nickname;
	private Long mobile;
	private String password;
	private String realname;
	private String slogan;
	private Integer sex;
	private String wechat;
	private String address;
	private String email;
	private String birthday;
	private String avatar;
	private String tags;
	private String authimages;
	private String idnumber;
	private String vocation;
	private Integer experience;
	private String devicetoken;
	private Long registertime;
	private String registerlati;
	private String registerlong;
	private String appversion;
	private Long verifiedon;
	private Integer verifiedby;

	public Integer getId(){
		return id;
	}

	public  void setId(Integer id){
		this.id = id;
	}

	public Long getMobile(){
		return mobile;
	}

	public  void setMobile(Long mobile){
		this.mobile = mobile;
	}

	public String getPassword(){
		return password;
	}

	public  void setPassword(String password){
		this.password = password;
	}

	public String getRealname(){
		return realname;
	}

	public  void setRealname(String realname){
		this.realname = realname;
	}

	public String getSlogan(){
		return slogan;
	}

	public  void setSlogan(String slogan){
		this.slogan = slogan;
	}

	public Integer getSex(){
		return sex;
	}

	public  void setSex(Integer sex){
		this.sex = sex;
	}

	public String getWechat(){
		return wechat;
	}

	public  void setWechat(String wechat){
		this.wechat = wechat;
	}

	public String getAddress(){
		return address;
	}

	public  void setAddress(String address){
		this.address = address;
	}

	public String getEmail(){
		return email;
	}

	public  void setEmail(String email){
		this.email = email;
	}

	public String getBirthday(){
		return birthday;
	}

	public  void setBirthday(String birthday){
		this.birthday = birthday;
	}

	public String getAvatar(){
		return avatar;
	}

	public  void setAvatar(String avatar){
		this.avatar = avatar;
	}

	public String getTags(){
		return tags;
	}

	public  void setTags(String tags){
		this.tags = tags;
	}

	public String getAuthimages(){
		return authimages;
	}

	public  void setAuthimages(String authimages){
		this.authimages = authimages;
	}

	public String getVocation(){
		return vocation;
	}

	public  void setVocation(String vocation){
		this.vocation = vocation;
	}

	public Integer getExperience(){
		return experience;
	}

	public  void setExperience(Integer experience){
		this.experience = experience;
	}

	public String getDevicetoken(){
		return devicetoken;
	}

	public  void setDevicetoken(String devicetoken){
		this.devicetoken = devicetoken;
	}

	public Long getRegistertime(){
		return registertime;
	}

	public  void setRegistertime(Long registertime){
		this.registertime = registertime;
	}

	public String getRegisterlati(){
		return registerlati;
	}

	public  void setRegisterlati(String registerlati){
		this.registerlati = registerlati;
	}

	public String getRegisterlong(){
		return registerlong;
	}

	public  void setRegisterlong(String registerlong){
		this.registerlong = registerlong;
	}

	public String getAppversion(){
		return appversion;
	}

	public  void setAppversion(String appversion){
		this.appversion = appversion;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getIdnumber() {
		return idnumber;
	}

	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}

	public Long getVerifiedon() {
		return verifiedon;
	}

	public void setVerifiedon(Long verifiedon) {
		this.verifiedon = verifiedon;
	}

	public Integer getVerifiedby() {
		return verifiedby;
	}

	public void setVerifiedby(Integer verifiedby) {
		this.verifiedby = verifiedby;
	}


}
