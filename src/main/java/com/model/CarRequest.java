package com.model;

import java.util.Date;

//派车请求
public class CarRequest {
    private int id;//车辆id
    private int destX;//目的地x坐标
    private int destY;//目的地y坐标
    private String surveyorId;//派车请求者
    private String carNum;//申请的车牌
    private String process;//申请派车进度(未审批->已同意/不同意)
    private Date time;// 同意时间(出车时间)

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDestX() {
        return destX;
    }

    public void setDestX(int destX) {
        this.destX = destX;
    }

    public int getDestY() {
        return destY;
    }

    public void setDestY(int destY) {
        this.destY = destY;
    }

    public String getSurveyorId() {
        return surveyorId;
    }

    public void setSurveyorId(String surveyorId) {
        this.surveyorId = surveyorId;
    }

    public String getCarNum() {
        return carNum;
    }

    public void setCarNum(String carNum) {
        this.carNum = carNum;
    }

    public String getProcess() {
        return process;
    }

    public void setProcess(String process) {
        this.process = process;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
