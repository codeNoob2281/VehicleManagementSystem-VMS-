package com.model;

import java.util.Date;


/**
 * 车辆请求参数映射
 * @author hzf 2021/12/13
 */
public class CarRequest {
    /**
     * 车辆请求id编号
     */
    private Integer id;
    /**
     * 请求车辆车牌号
     */
    private String licencePlate;
    /**
     * 请求目的地x坐标
     */
    private Integer destX;
    /**
     * 请求目的地y坐标
     */
    private Integer destY;
    /**
     * 派车请求者
     */
    private String surveyorId;
    /**
     * 申请派车进度(未审批->已同意/不同意)
     */
    private String requestState;
    /**
     * 同意时间(出车时间)
     */
    private Date outTime;



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLicencePlate() {
        return licencePlate;
    }

    public void setLicencePlate(String licencePlate) {
        this.licencePlate = licencePlate;
    }

    public Integer getDestX() {
        return destX;
    }

    public void setDestX(Integer destX) {
        this.destX = destX;
    }

    public Integer getDestY() {
        return destY;
    }

    public void setDestY(Integer destY) {
        this.destY = destY;
    }

    public String getSurveyorId() {
        return surveyorId;
    }

    public void setSurveyorId(String surveyorId) {
        this.surveyorId = surveyorId;
    }

    public String getRequestState() {
        return requestState;
    }

    public void setRequestState(String requestState) {
        this.requestState = requestState;
    }

    public Date getOutTime() {
        return outTime;
    }

    public void setOutTime(Date outTime) {
        this.outTime = outTime;
    }
}
