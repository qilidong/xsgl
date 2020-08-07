package com.at.pojo;

import java.util.Date;

public class SysUsers {
    private Integer userId;

    private String userName;

    private String userAccount;

    private String userEmail;

    private String userPassworld;

    private String userPho;

    private Date createTime;

    private Date updateTime;

    private Integer isDelete;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserAccount() {
        return userAccount;
    }

    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount == null ? null : userAccount.trim();
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

    public String getUserPassworld() {
        return userPassworld;
    }

    public void setUserPassworld(String userPassworld) {
        this.userPassworld = userPassworld == null ? null : userPassworld.trim();
    }

    public String getUserPho() {
        return userPho;
    }

    public void setUserPho(String userPho) {
        this.userPho = userPho == null ? null : userPho.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}