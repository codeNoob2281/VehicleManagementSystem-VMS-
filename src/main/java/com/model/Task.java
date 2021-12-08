package com.model;

import java.util.Date;
/*事故评定任务信息*/
public class Task {
    private int id;//保险事故评定id
    private int locationX;//事故地点X坐标
    private int locationY;//事故地点Y坐标
    private Date time;//事故发生时间
    private String tel;//被保人手机号
    private String process;//事故处理进度(未派车->已派车)
    private String surId;//事故查勘负责人工号

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLocationX() {
        return locationX;
    }

    public void setLocationX(int locationX) {
        this.locationX = locationX;
    }

    public int getLocationY() {
        return locationY;
    }

    public void setLocationY(int locationY) {
        this.locationY = locationY;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getProcess() {
        return process;
    }

    public void setProcess(String process) {
        this.process = process;
    }

    public String getSurId() {
        return surId;
    }

    public void setSurId(String surId) {
        this.surId = surId;
    }
}
