package com.jizan.master.entity;

public class Token {

    private Integer userId;//用户id
    
    private String token;//随机生成的uuid

    public Token(Integer userId, String token) {
        this.userId = userId;
        this.token = token;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
    
}
